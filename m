Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 451877804A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 07:38:18 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2017 00:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,451,1498546800"; d="scan'208";a="146601122"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2017 00:38:20 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 4D3AA58035C;
	Thu, 31 Aug 2017 00:38:19 -0700 (PDT)
Date: Thu, 31 Aug 2017 10:38:10 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20170831073810.5jc5zzhikh25fa75@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <b9a6e5be-2625-f863-ce71-f949cef1cae3@topic.nl>
MIME-Version: 1.0
In-Reply-To: <b9a6e5be-2625-f863-ce71-f949cef1cae3@topic.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Running wic on target?
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
X-List-Received-Date: Thu, 31 Aug 2017 07:38:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 31, 2017 at 09:17:03AM +0200, Mike Looijmans wrote:
> ﻿I noticed that the "wic" recipes appear to focus on the host only.
> 
> Would it be possible to run "wic" on target?
> 
> For example, it would be really convenient to be able to program the eMMC
> using wic and auto-expanding the root or data partition to cover the whole
> device.
> 

Wic depends on too many things that are not present on target image.
pseudo and bitbake are two hardest cases. Making wic less dependent on
them would end up in much more complex code than wic has currently.

However, 'wic write [--expand]' functionality can be copied to simple script
relatively easy as it only depends on bunch of tools like parted, sfdisk,
resize2fs etc. I'd suggest to keep this functionality in wic as it's
handy to use wic to flash target media. This would create a bit of
overlap in functionality but it worth it from my point of view.

--
Regards,
Ed

