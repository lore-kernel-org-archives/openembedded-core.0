Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9A60971A62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 09:39:39 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 01:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,465,1473145200"; d="scan'208";a="29109662"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2016 01:39:41 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CF2496A4006;
	Wed,  9 Nov 2016 01:39:02 -0800 (PST)
Date: Wed, 9 Nov 2016 11:39:32 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20161109093932.GC10823@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] wic: bugfixes & --fixed-size support
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
X-List-Received-Date: Wed, 09 Nov 2016 09:39:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2016 at 04:56:06PM +0100, Maciej Borzecki wrote:
> The patch series is a follow-up after a previous attempt of adding
> --reserved-size option to wic[1].
> 
> The series introduces a number of fixes in patches 1 - 4.
> 
> The last patch in the series introduces --fixed-size option as discussed in [1].
> The patch also introduces minor refactoring to code responsible for computing
> partition size.
> 
> Aside from new option, another user-visible change is how the size rootfs
> partitions with vfat is calculated. In previous code, vfat rootfs partition size
> did not account for --extra-space nor --overhead-factor. Now, all rootfs
> partitions (except for squashfs) are subject to the same rules of partition
> sizing.
> 
Thank you for the patchset!

+1 (if my comments are taken into account)

It would be great if you add tests for this functionality to oe-selftest
wic suite.

> http://lists.openembedded.org/pipermail/openembedded-core/2016-October/127634.html
> 
> Maciej Borzecki (5):
>   wic: make sure that partition size is always an integer in internal
>     processing
>   wic: use partition size when creating empty partition files
>   wic: check that filesystem is specified for a rootfs partition
>   wic: fix function comment typos
>   wic: add --fixed-size wks option
> 
>  scripts/lib/wic/help.py                | 14 +++--
>  scripts/lib/wic/imager/direct.py       |  2 +-
>  scripts/lib/wic/ksparser.py            | 41 +++++++++++++--
>  scripts/lib/wic/partition.py           | 93 +++++++++++++++++++++-------------
>  scripts/lib/wic/utils/partitionedfs.py |  6 +--
>  5 files changed, 109 insertions(+), 47 deletions(-)
> 
> -- 
> 2.5.0
> 

-- 
--
Regards,
Ed

