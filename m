Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B191A6018C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:14:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 26 Jan 2016 08:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,350,1449561600"; d="scan'208";a="641689197"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2016 08:13:54 -0800
Date: Tue, 26 Jan 2016 18:16:12 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20160126161611.GA29735@mbabyjoh-mobl.fi.intel.com>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<CAJTo0LbSM2W2ZW_T69tSBWVR3Kg_TQXu7W6TqoG6=DivrU4C4A@mail.gmail.com>
	<20160126142023.GE1652@denix.org>
	<CAP9ODKos_BfpAQtmccMcFFrZ6jUvBU_knzwNuzTymFCQvHregg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKos_BfpAQtmccMcFFrZ6jUvBU_knzwNuzTymFCQvHregg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 16:14:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Otavio,

On Tue, Jan 26, 2016 at 02:02:26PM -0200, Otavio Salvador wrote:
> On Tue, Jan 26, 2016 at 12:20 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, Jan 26, 2016 at 11:24:43AM +0000, Burton, Ross wrote:
> >> On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> > A clean room re-implementation and extension of the original stress tool.
> >> >
> >>
> >> What's the rationale for adding this to oe-core over another layer?
> >
> > None, besides the original stress is in oe-core. What other layer would you
> > suggest?
> 
> I think meta-oe is better; in fact the 'stress' package could go there as well.

"stress" package was moved from meta-linaro to oe-core as a dependency for rt-tests ptest.

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

Best Regards,
Maxin

