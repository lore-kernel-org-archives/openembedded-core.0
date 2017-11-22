Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BA03B78711
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 09:52:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 01:52:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; 
   d="scan'208";a="5709554"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2017 01:52:18 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 00C85580329;
	Wed, 22 Nov 2017 01:52:17 -0800 (PST)
Date: Wed, 22 Nov 2017 10:39:06 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20171122083906.gph76do4d7meusfe@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1510934900-22044-1-git-send-email-trini@konsulko.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/4] wic: Further enhance UUID / fstab support
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
X-List-Received-Date: Wed, 22 Nov 2017 09:52:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

Thank you for the great patchset!

+1

On Fri, Nov 17, 2017 at 11:08:16AM -0500, Tom Rini wrote:
> Hey all,
> 
> So, per Ed's feedback on my first series, I went and spent some time
> trying to figure out how to have wic know what the UUID would be when
> updating the fstab.  It turns out the easiest answer here is to have WIC
> make the UUID.  Per Otavio's concern last time, I also make sure that
> the filesystem UUID can be passed in, for reproducibility.  One thing to
> keep in mind here is that FAT filesystem UUIDs are a bit funny to deal
> with as mkfs.vfat / mkdosfs / etc want to be given a 32bit hexadecimal
> value.  But when we talk mount, it must be split and it must be in
> uppercase.  To make the rest of the code easier I'm encoding the '0x'
> portion into part.fsuuid rather than doing "-i 0x%s" in a bunch of
> places.
> 
> While preparing all of this, I found a few minor things such as we did
> not test for squashfs and --use-uuid (not supported) and an incorrect
> comment around the btrfs support.
> 
> Since v1, I've added a testcase into wic.Wic.test_qemu for a UUID mount
> and the UUID that we've given. I think this is cleaner than adding a
> python function to make a wks file just for this task.
> 
> --
> Tom

-- 
--
Regards,
Ed

