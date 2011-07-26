Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qlkhk-0000nq-Ls
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:42:00 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2011 09:37:46 -0700
Received: by ywo7 with SMTP id 7so725436ywo.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 09:37:45 -0700 (PDT)
Received: by 10.68.19.163 with SMTP id g3mr161347pbe.73.1311698263832;
	Tue, 26 Jul 2011 09:37:43 -0700 (PDT)
Received: from [10.1.10.192] (c-67-170-181-205.hsd1.or.comcast.net
	[67.170.181.205])
	by mx.google.com with ESMTPS id e6sm714637pbm.71.2011.07.26.09.37.42
	(version=SSLv3 cipher=OTHER); Tue, 26 Jul 2011 09:37:43 -0700 (PDT)
Message-ID: <4E2EED55.5070104@intel.com>
Date: Tue, 26 Jul 2011 09:37:41 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311648798.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311648798.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/7] works of adding packages pam support V2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 16:42:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 08:29 PM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Hi Scott,
>
> This is the work of adding pam supports version 2.

Acked-by: Scott Garman <scott.a.garman@intel.com>

for this patch series.

Thanks Kai!

>
> Xiaofeng Yan's commits will be commited by himself, including openssh, dropbear and polkit.
>
> As Saul told,
> * update the indent
> * check the PR
> * make install configure file when pam support enabled
>
> After update libpam to 1.1.4, we enable the packages pam support. And if the pacakge
> doesn't have a pam configure file, import from Fedora.
>
>
> The following changes since commit e803c58ffb05e6d1f5938f1bfe6dfca9e3c26e02:
>
>    libiconv: Fix build failure on 1.13.1 (2011-07-21 22:50:24 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/distro
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro
>
> Kang Kai (5):
>    libpam: update to 1.1.4 and add subpackage xtests
>    cups: add pam support
>    screen: add pam support
>    sudo: add pam support
>    shadow: update pam related configure files
>
> Wenzong Fan (2):
>    cronie: enable PAM support for cronie
>    at: enable pam support
>
>   .../at/at-3.1.12/configure-add-enable-pam.patch    |   23 +++++
>   meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |   21 +++++
>   meta/recipes-extended/at/at_3.1.12.bb              |   21 ++++-
>   .../cronie/cronie/crond_pam_config.patch           |   19 ++++
>   meta/recipes-extended/cronie/cronie_1.4.7.bb       |   12 ++-
>   meta/recipes-extended/cups/cups_1.4.6.bb           |    8 +-
>   .../pam/libpam/libpam-xtests.patch                 |   35 ++++++++
>   .../pam/{libpam_1.1.3.bb =>  libpam_1.1.4.bb}       |   14 ++-
>   .../screen/screen-4.0.3/screen.pam                 |    2 +
>   meta/recipes-extended/screen/screen_4.0.3.bb       |   23 ++++-
>   .../shadow/files/shadow-update-pam-conf.patch      |   91 ++++++++++++++++++++
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
>   meta/recipes-extended/sudo/files/sudo.pam          |    6 ++
>   meta/recipes-extended/sudo/sudo_1.8.1p2.bb         |   18 +++-
>   14 files changed, 274 insertions(+), 24 deletions(-)
>   create mode 100644 meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
>   create mode 100644 meta/recipes-extended/at/at-3.1.12/pam.conf.patch
>   create mode 100644 meta/recipes-extended/cronie/cronie/crond_pam_config.patch
>   create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patch
>   rename meta/recipes-extended/pam/{libpam_1.1.3.bb =>  libpam_1.1.4.bb} (85%)
>   create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pam
>   create mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
>   create mode 100644 meta/recipes-extended/sudo/files/sudo.pam
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


