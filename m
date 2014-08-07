Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF5A60169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 20:10:47 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Aug 2014 13:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,819,1400050800"; d="scan'208";a="466223735"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by azsmga001.ch.intel.com with ESMTP; 07 Aug 2014 13:10:29 -0700
Message-ID: <53E3DD34.4000100@linux.intel.com>
Date: Thu, 07 Aug 2014 13:10:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>, 
 openembedded-core@lists.openembedded.org
References: <1407424632-32649-1-git-send-email-marex@denx.de>
In-Reply-To: <1407424632-32649-1-git-send-email-marex@denx.de>
Subject: Re: [PATCH 0/5] Add initial fitImage support
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
X-List-Received-Date: Thu, 07 Aug 2014 20:10:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2014 08:17 AM, Marek Vasut wrote:
> The fitImage is a successor of the U-Boot uImage format, which is considered
> legacy for years now. The fitImage allows packing multiple kernel images,
> DTBs and other artifacts into a single image, which can then be protected
> by SHA checksums and does even support signing the images for verified boot.
>
> This patchset is the first stab at adding the new image format into Yocto.
>
> Marek Vasut (5):
>    Yocto: kernel: Rework do_uboot_mkimage
>    Yocto: kernel: Pull out the linux.bin generation
>    Yocto: kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
>    Yocto: kernel: Build DTBs early
>    Yocto: kernel: Add basic fitImage support
>
>   meta/classes/kernel.bbclass             | 229 +++++++++++++++++++++++++++++---
>   meta/recipes-kernel/linux/linux-dtb.inc |  14 +-
>   2 files changed, 226 insertions(+), 17 deletions(-)
>
Hi Marek,

I am going to make a general request, can you please review the Commit 
Guildlines Wiki for Openembedded:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

We appreciate your patches, but the commit messages need to be formatted 
correctly.  The Yocto: tag is not needed and you could clearly include 
which recipe, bbclass, file or subsystem (if across multiple files) so 
in the above it would be kernel.bbclass: ...

If you could please resubmit your changes with the correct commit 
summary for this series and your other patches that would be greatly 
appreciated.

Myself and others may have further feedback on your patches.

Thanks
    Sau!


