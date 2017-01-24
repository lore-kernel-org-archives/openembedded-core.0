Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 125B877202
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:16:36 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 24 Jan 2017 02:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="51873009"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 24 Jan 2017 02:16:36 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id DC35E6A4006;
	Tue, 24 Jan 2017 02:15:38 -0800 (PST)
Date: Tue, 24 Jan 2017 11:54:12 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20170124095412.GA18502@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <CAPLgG=muXdcmCcFCC7NY8Zk9ANH5yf616T5b9Bc31OCJq=AD3w@mail.gmail.com>
	<20170123103403.GA15174@linux.intel.com>
	<25cca98b-9e19-36b7-c53f-5ed79eeb5a91@topic.nl>
MIME-Version: 1.0
In-Reply-To: <25cca98b-9e19-36b7-c53f-5ed79eeb5a91@topic.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to use WIC to generate raw flash images
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
X-List-Received-Date: Tue, 24 Jan 2017 10:16:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 24, 2017 at 09:56:17AM +0100, Mike Looijmans wrote:
> ﻿On 23-01-17 11:34, Ed Bartosh wrote:
> ...
> >>- How do I set padding to be 0xFF instead of 0x00?
> >The same thing here. Currently wic images are sparse files created by
> >os.ftruncate, but it's not a big deal to fill them with 0xFF
> 
> Correct me if I'm wrong here...
> - All flash media (NOR, NAND) prefers padding with 0xFF because
> that's equal to an erased sector.
> - Other media (magnetic disks) don't care about what they're padded with.
> 
> So I'd say it makes sense to make 0xFF the default padding for exerything?

That would break image sparseness.

--
Regards,
Ed

