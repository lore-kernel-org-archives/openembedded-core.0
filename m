Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm7OM-0002in-OE
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:00:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2012 10:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173041919"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2012 10:48:53 -0700
Message-ID: <4FF33085.1070703@linux.intel.com>
Date: Tue, 03 Jul 2012 10:48:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Paul Gortmaker <paul.gortmaker@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
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
X-List-Received-Date: Tue, 03 Jul 2012 18:00:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2012 10:44 PM, Paul Gortmaker wrote:
> These are the oe-core updates required so that yocto can do
> a successful build of a working u-boot image for the mpc8315
> reference BSP.
>
> In v2, I've fixed up the issue where TARGET_PREFIX accidentally became
> specific to the one single recipe.  That made the 3/3 patch in v1 no
> longer required.  However, when build testing, I noticed that we
> were needlessly clobbering PARALLEL_MAKE for u-boot, which is not
> at all required, and just slows down builds.  So a new patch is
> added to fix that, and we still have three total.
>
> I've built for the beagleboard with -j8 (twice), and the same for
> the 8315 BSP.  I've also always built u-boot with -j10 or greater
> for countless powerpc images I've made in the last 1/2 dozen years.
> Looking at the git history, it appears this just came in with some
> large import, versus being an actively chosen individual setting.
>
> The 8315 specific patch that was sent to the yocto list earlier to
> enable building it (u-boot.bin) by default is unchanged, but I can
> resend that if it helps somehow.
>
> Paul.
> ---
>
> Paul Gortmaker (3):
>    u-boot: Don't make the -Os removal part of global settings.
>    u-boot: make FILESDIR a shared setting.
>    u-boot: do not clobber PARALLEL_MAKE setting
>
Took in patches 1 & 3 into OE-Core

Looking for an update for FILESDIR -> FILESPATH as suggested by Richard.

Thanks
	Sau!


>   meta/recipes-bsp/u-boot/u-boot.inc           |    6 ++----
>   meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
>   meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
>   meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 --
>   4 files changed, 2 insertions(+), 10 deletions(-)
>


