Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF1B60673
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 21:26:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Oct 2014 14:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,771,1406617200"; d="scan'208";a="618772224"
Received: from lgardun1-mobl.amr.corp.intel.com ([10.254.7.179])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2014 14:26:44 -0700
Message-ID: <54482114.40108@linux.intel.com>
Date: Wed, 22 Oct 2014 14:26:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Drew Moseley <drew_moseley@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1413554888-31319-1-git-send-email-drew_moseley@mentor.com>
In-Reply-To: <1413554888-31319-1-git-send-email-drew_moseley@mentor.com>
Cc: arindam.nath@amd.com, Ravikiran_Polepalli@mentor.com
Subject: Re: [PATCH] poky: daisy: grub: add cmdpath to grub configuration file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Oct 2014 21:26:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 10/17/14 7:08, Drew Moseley wrote:
> From: Arindam Nath <arindam.nath@amd.com>
> 
> An issue was found where when yocto is installed to a hard disk
> from a live USB key, no matter what boot order was selected in
> the BIOS menu, the grub menu of the USB key would always show
> up. The issue was narrowed down to the way grub configuration
> file gets embedded into the standalone bootx64.efi image.
> 
> The commit prepends ($cmdpath) to the search path for grub.cfg,
> thus making sure the UEFI environment itself sets this to the
> correct device path. This in-turn lets the grub.cfg of the boot
> device to be loaded.
> 
> Signed-off-by: Arindam Nath <arindam.nath@amd.com>
> Reviewed-by: Drew Moseley <drew_moseley@mentor.com>
> Tested-by: Ravikiran Polepalli <Ravikiran_Polepalli@mentor.com>

This looks appropriate to me, and solves a problem I've heard echo'd
elsewhere. Thanks!

Acked-by: Darren Hart <dvhart@linux.intel.com>


> ---
>  meta/recipes-bsp/grub/files/cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/files/cfg
> index ffffe47..8ca53d2 100644
> --- a/meta/recipes-bsp/grub/files/cfg
> +++ b/meta/recipes-bsp/grub/files/cfg
> @@ -1,2 +1,2 @@
> -search.file /EFI/BOOT/grub.cfg root
> +search.file ($cmdpath)/EFI/BOOT/grub.cfg root
>  set prefix=($root)/EFI/BOOT
> 

-- 
Darren Hart
Intel Open Source Technology Center

