Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rnx17-0004dV-PN
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 19:47:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Jan 2012 10:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="58095058"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Jan 2012 10:39:40 -0800
Message-ID: <4F18636C.8030407@linux.intel.com>
Date: Thu, 19 Jan 2012 10:39:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326834014.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326834014.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCHv2 0/6] resend with typo fixes & distro tracking data
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
X-List-Received-Date: Thu, 19 Jan 2012 18:47:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 01:03 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> This is same as last pull requests + typo fixes + a commit for adding distro
> tracking information for the new recipes.
>
> Thanks,
> Nitin
>
> The following changes since commit 5724ee9c3a99519fea96446638910b727b89898d:
>
>    package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:54 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Nitin A Kamble (6):
>    bdwgc: new recipe for autogen
>    libunistring: new recipe for autogen
>    guile: new recipe for autogen
>    autogen-native: new recipe for grub-efi-native
>    grub-efi-native: fix errors with automake 1.11.2
>    distro-tracking: add data for newer recipes
>
>   .../conf/distro/include/distro_tracking_fields.inc |   21 +
>   .../files/grub-1.99_fix_for_automake_1.11.2.patch  | 5808 --------------------
>   meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    4 +-
>   .../autogen/autogen-native_5.12.bb                 |   24 +
>   ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 +
>   ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 +
>   ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 +
>   .../guile/files/opensuse/guile-64bit.patch         |   38 +
>   .../files/opensuse/guile-turn-off-gc-test.patch    |   48 +
>   meta/recipes-devtools/guile/guile_2.0.3.bb         |   42 +
>   meta/recipes-support/bdwgc/bdwgc_20110107.bb       |   38 +
>   .../libunistring/libunistring_0.9.3.bb             |   27 +
>   12 files changed, 324 insertions(+), 5810 deletions(-)
>   create mode 100644 meta/recipes-devtools/autogen/autogen-native_5.12.bb
>   create mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
>   create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
>   create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
>   create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
>   create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
>   create mode 100644 meta/recipes-devtools/guile/guile_2.0.3.bb
>   create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
>   create mode 100644 meta/recipes-support/libunistring/libunistring_0.9.3.bb
>

Merged into OE-Core

Thanks
	Sau!


