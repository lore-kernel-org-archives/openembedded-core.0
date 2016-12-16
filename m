Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B6C68773FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 17:14:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 16 Dec 2016 09:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="1072872445"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2016 09:14:44 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A2C7A6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 09:13:56 -0800 (PST)
Date: Fri, 16 Dec 2016 19:14:11 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20161216171411.GA21082@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1481907914-22383-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1481907914-22383-1-git-send-email-ed.bartosh@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [wic][PATCH] meta-yocto-bsp: add kickstart file for MPC8315
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
X-List-Received-Date: Fri, 16 Dec 2016 17:14:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, wrong commit subject line.
Please, ignore.

On Fri, Dec 16, 2016 at 07:05:14PM +0200, Ed Bartosh wrote:
> Added kickstart file to produce partitioned image for
> MPC8315 reference hardware.
> 
> [YOCTO #8719]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/canned-wks/mpc8315e-rdb.wks | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
> 
> diff --git a/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks b/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
> new file mode 100644
> index 0000000..af587b2
> --- /dev/null
> +++ b/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
> @@ -0,0 +1,6 @@
> +# short-description: Create SD card image with a boot partition
> +# long-description: Creates a partitioned SD card image. Boot files
> +# are located in the first partition.
> +
> +part /boot --source bootimg-partition --ondisk sdb --fstype=ext3 --label boot
> +part / --source rootfs --ondisk sdb --fstype=ext3 --label root
> -- 
> 2.1.4
> 

-- 
--
Regards,
Ed

