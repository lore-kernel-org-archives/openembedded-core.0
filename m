Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmELe-0005mw-EL
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:21:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2011 17:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="35301965"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2011 17:16:54 -0700
Message-ID: <4E30AA76.7080302@linux.intel.com>
Date: Wed, 27 Jul 2011 17:16:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311648798.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311648798.git.kai.kang@windriver.com>
Cc: scott.a.garman@intel.com
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
X-List-Received-Date: Thu, 28 Jul 2011 00:21:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 08:29 PM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Hi Scott,
>
> This is the work of adding pam supports version 2.
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

Merged into OE-Core

Thanks
	Sau!



