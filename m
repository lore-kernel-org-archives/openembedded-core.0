Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 02AB778470
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 08:22:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 31 Jul 2017 01:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,441,1496127600"; d="scan'208";a="117592443"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2017 01:22:45 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id DFFDE5803BE;
	Mon, 31 Jul 2017 01:22:43 -0700 (PDT)
Date: Mon, 31 Jul 2017 10:59:51 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20170731075951.GA32738@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170728144527.24322-1-net147@gmail.com>
	<20170730100236.GA28203@linux.intel.com>
	<CANwerB3-Vz2MDKyFTu0kfdA7z2Mgg+y4QtJZ4ZpZZgTABnBCAA@mail.gmail.com>
	<20170731072822.GA32659@linux.intel.com>
	<CANwerB1dx__iGC0ogooc1B3WSbQUv5C9SjKeg6h0ppvNBjQL0w@mail.gmail.com>
	<CANwerB1xu8rYM3q8cUaFP-kxNm7M3sBLswz7939u=6mtWkst3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANwerB1xu8rYM3q8cUaFP-kxNm7M3sBLswz7939u=6mtWkst3g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] wic: ensure generated disk system identifier is non-zero
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
X-List-Received-Date: Mon, 31 Jul 2017 08:22:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2017 at 06:04:47PM +1000, Jonathan Liu wrote:
> >
> > How about random.SystemRandom().randrange(1, 0xffffffff) ?
> >
> 
> random.SystemRandom().randint(1, 0xffffffff) actually
> 

This looks ok to me. Thanks.

--
Regards,
Ed

