Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFzpo-0007KS-4H
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:27:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 20:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85936260"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 20:18:22 -0700
Message-ID: <4F7E607E.9050101@linux.intel.com>
Date: Thu, 05 Apr 2012 20:18:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
In-Reply-To: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
Subject: Re: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Fri, 06 Apr 2012 03:27:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
>   meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
>   meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 700d5d3..0445c34 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?= "all"
>   # deploy directory.  For those versions they can set the following variables
>   # to allow packaging the SPL.
>   SPL_BINARY ?= ""
> -SPL_IMAGE ?= "${SPL_BINARY}-${PV}-${PR}"
> +SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
>   SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
>
>   do_compile () {
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> index 1ebdbea..e99bc2c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> @@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>   SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
>
>   PV = "v2011.03+git${SRCPV}"
> -PR = "r5"
> +PR = "r6"
>
>   SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> index 8ebdbff..680401f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> @@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>   SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
>
>   PV = "v2011.06+git${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>

Merged into OE-Core

Thanks
	Sau!



