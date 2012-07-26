Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTiA-0008Jg-25
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:27:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 12:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127289737"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 12:15:28 -0700
Message-ID: <50119750.7080109@linux.intel.com>
Date: Thu, 26 Jul 2012 12:15:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343142062.git.raj.khem@gmail.com>
In-Reply-To: <cover.1343142062.git.raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/5] toolchain bootstrap fixes and kernel.bbclass integration
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
X-List-Received-Date: Thu, 26 Jul 2012 19:27:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2012 08:03 AM, Khem Raj wrote:
> This patchset fixes isssue with compiling toolchain's bootstrap elements
> added changes from kernel.bbclass from meta-oe
> Fixes eglibc when certain options are disabled (seen on poky-tiny)
>
> The following changes since commit 4148bc80c008d25c8a536c7c7dfdeac1669a6662:
>
>    libgcc: Add missing dependency on libc:do_package (2012-07-24 10:12:08 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=master
>
> Denis Carikli (1):
>    kernel.bbclass: fix external module building
>
I held back this one as I think there is still some discussion on it.

> Khem Raj (3):
>    eglibc-initial: Fix build failure due to missing limits.h
>    gcc-cross-initial: Stage self sufficient fixed limits.h
>    eglibc: Fix build when OPTION_POSIX_WIDE_CHAR_DEVICE_IO is not set
>
> Koen Kooi (1):
>    kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"
>
Merged the above 4 patches into OE-Core

Thanks	
	Sau!
>   meta/classes/kernel.bbclass                        |    5 +-
>   meta/conf/distro/include/default-distrovars.inc    |    1 +
>   .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |   48 ++++++++++++++------
>   .../eglibc-2.16/fileops-without-wchar-io.patch     |   22 +++++++++
>   meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
>   meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    9 ++--
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
>   meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   10 ++++
>   9 files changed, 82 insertions(+), 19 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch
>



