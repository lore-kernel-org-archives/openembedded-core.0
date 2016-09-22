Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0826C71990
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 06:53:54 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 21 Sep 2016 23:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,378,1470726000"; d="scan'208";a="11934091"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2016 23:53:56 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6450F6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 23:53:30 -0700 (PDT)
Date: Thu, 22 Sep 2016 09:43:05 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160922064305.GB7406@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1474471092-4321-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1474471092-4321-1-git-send-email-ed.bartosh@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [wic][PATCH] wic: add beaglebone.wks
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
X-List-Received-Date: Thu, 22 Sep 2016 06:53:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please, ignore this patch. It's not needed as fully functional image
can be built using existing wks file sdimage-bootpart.wks

On Wed, Sep 21, 2016 at 06:18:12PM +0300, Ed Bartosh wrote:
> Added wks to make an image for Beaglebone board.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/canned-wks/beaglebone.wks | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 scripts/lib/wic/canned-wks/beaglebone.wks
> 
> diff --git a/scripts/lib/wic/canned-wks/beaglebone.wks b/scripts/lib/wic/canned-wks/beaglebone.wks
> new file mode 100644
> index 0000000..753418e
> --- /dev/null
> +++ b/scripts/lib/wic/canned-wks/beaglebone.wks
> @@ -0,0 +1,7 @@
> +# short-description: Create Beaglebone disk image
> +# long-description: Creates a partitioned disk image for Beaglebone board
> +# which can be directly copied to SD card.
> +
> +part /boot --ondisk mmcblk0 --label boot --fstype vfat --source bootimg-partition --align 1024 --active
> +part /     --ondisk mmcblk0 --label root --fstype ext4 --source rootfs --align 1024
> +
> -- 
> 2.1.4
> 

-- 
--
Regards,
Ed

