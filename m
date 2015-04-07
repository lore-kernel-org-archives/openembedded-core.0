Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D16426ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 10:41:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 07 Apr 2015 03:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="676261870"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 07 Apr 2015 03:41:05 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 83A046A408D;
	Tue,  7 Apr 2015 03:40:42 -0700 (PDT)
Date: Tue, 7 Apr 2015 13:40:58 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20150407104058.GB19718@linux.intel.com>
References: <1428402119-31945-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1428402119-31945-2-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1428402119-31945-2-git-send-email-alexandre.belloni@free-electrons.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 2/2] wic: support ontrackdm6aux3 partitions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2015 10:41:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2015 at 12:21:59PM +0200, Alexandre Belloni wrote:
> ontrack dm6 aux3 is a type of partition required to be able to boot a Freescale
> mxs based platform.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  scripts/lib/wic/utils/partitionedfs.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index 162f8e1b9c6a..f394abc764c7 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -296,6 +296,8 @@ class Image:
>                  parted_fs_type = "fat32"
>              elif p['fstype'] == "msdos":
>                  parted_fs_type = "fat16"
> +            elif p['fstype'] == "ontrackdm6aux3":
> +                parted_fs_type = "ontrackdm6aux3"
>              else:
>                  # Type for ext2/ext3/ext4/btrfs
>                  parted_fs_type = "ext2"

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

--
Regards,
Ed

