Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnENT-0001Pd-L8
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:07:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 10:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97520365"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 10:59:49 -0800
Message-ID: <4F15C525.6070303@linux.intel.com>
Date: Tue, 17 Jan 2012 10:59:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326248768.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326248768.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/6] Misc recipe fixes & upgrades
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
X-List-Received-Date: Tue, 17 Jan 2012 19:07:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 06:27 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
>
> Thanks,
> Nitin
>
> The following changes since commit 4a8a3c503fd896593b787c26edbe46a7324e494e:
>
>    Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-01-10 18:33:25 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Nitin A Kamble (6):
>    locale: fix package's "provides" tag
>    diffstat: upgrade from 1.54 to 1.55
>    insane.bbclass: fix elf.arch not matching error for x32 kernel
>    libpcre: upgrade from 8.20 to 8.21
>    btrfs-tools: upgrade to newer git commit
>    distro_tracking: update manual_check_date fields
>
>   meta/classes/insane.bbclass                        |    3 +-
>   meta/classes/libc-package.bbclass                  |    3 --
>   .../conf/distro/include/distro_tracking_fields.inc |   36 +++++++++++---------
>   meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
>   .../btrfs-tools/btrfs-tools_git.bb                 |    4 +-
>   .../{diffstat_1.54.bb =>  diffstat_1.55.bb}         |    6 ++--
>   .../libpcre/{libpcre_8.20.bb =>  libpcre_8.21.bb}   |    5 ++-
>   7 files changed, 31 insertions(+), 28 deletions(-)
>   rename meta/recipes-devtools/diffstat/{diffstat_1.54.bb =>  diffstat_1.55.bb} (82%)
>   rename meta/recipes-support/libpcre/{libpcre_8.20.bb =>  libpcre_8.21.bb} (93%)
>
Merged into OE-Core

Thanks
	Sau!


