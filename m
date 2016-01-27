Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6346B77180
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 19:37:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jan 2016 11:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,356,1449561600"; d="scan'208";a="902391307"
Received: from vrouyare-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.153.89])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2016 11:37:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jan 2016 08:37:20 +1300
Message-ID: <8263236.qlFRBBJkri@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-301.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <C4EFBCA2-18D0-4FB2-BA45-FB21E83A3189@gmail.com>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<20160127191614.GH1652@denix.org>
	<C4EFBCA2-18D0-4FB2-BA45-FB21E83A3189@gmail.com>
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 27 Jan 2016 19:37:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 27 Jan 2016 14:28:47 Khem Raj wrote:
> > On Jan 27, 2016, at 2:16 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > On Tue, Jan 26, 2016 at 09:20:23AM -0500, Denys Dmytriyenko wrote:
> >> On Tue, Jan 26, 2016 at 11:24:43AM +0000, Burton, Ross wrote:
> >>> On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> wrote:
> >>>> A clean room re-implementation and extension of the original stress
> >>>> tool.
> >>> 
> >>> What's the rationale for adding this to oe-core over another layer?
> >> 
> >> None, besides the original stress is in oe-core. What other layer would
> >> you
> >> suggest?
> > 
> > Ross,
> > 
> > Care do make your own suggestion? Do you think meta-oe would be a better
> > fit? Are there any other considerations, since stress-ng is a replacement
> > of the original stress and it was added to oe-core? Thanks.
> 
> IIRC we had meta-benchmarking. They all should go there.

I guess you mean meta-oe/recipes-benchmark (though an actual separate layer 
might be interesting.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

