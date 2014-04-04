Return-Path: <richard.purdie@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C0E2E6B6BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 15:17:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2014 08:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,795,1389772800"; d="scan'208";a="487347691"
Received: from paulonei-mobl.ger.corp.intel.com (HELO [10.252.120.17])
	([10.252.120.17])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2014 08:17:41 -0700
Message-ID: <1396624660.13862.14.camel@ted>
From: Richard Purdie <richard.purdie@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 04 Apr 2014 16:17:40 +0100
In-Reply-To: <533ECC17.8090502@windriver.com>
References: <1396602904-14596-1-git-send-email-koen.kooi@linaro.org>
	<465539862.Xb3zOTJjse@peggleto-mobl5.ger.corp.intel.com>
	<533E91BD.8000107@linaro.org> <533ECC17.8090502@windriver.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [Dora][PATCH] buildhistory-diff: add ability to report version changes
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
X-List-Received-Date: Fri, 04 Apr 2014 15:17:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-04 at 23:13 +0800, Robert Yang wrote:
> 
> On 04/04/2014 07:04 PM, Koen Kooi wrote:
> > On 04/04/2014 01:00 PM, Paul Eggleton wrote:
> >> On Friday 04 April 2014 11:15:04 Koen Kooi wrote:
> >>> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>>
> >>> Add a -v/--report-ver option to report changes in PKGE/PKGV/PKGR even
> >>> if the value is the same as the default from PE/PV/PR.
> >>>
> >>> Also add a -a/--report-all option to report all changes instead of just
> >>> the default significant ones.
> >>
> >> Hmm, looking at this I'm not sure that this is the right fix for a stable
> >> branch - ideally we should just fix the error rather than backporting the
> >> feature IMO.
> >
> > I'm fine with either, this was the easiest for me, a single cherrypick.
> >
> 
> I'm very sorry to say that we need to revert the following commit from
> dora, we don't need it on dora, it's my fault, I need to be more careful
> when backport the patches:
> 
> commit 5b616aa7b618f6ed221d6fa9738220a2c2349f7d
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Sun Nov 17 12:28:19 2013 +0000
> 
>      buildhistory_analysis: fix error when comparing image contents
> 
> RP, would you please help to revert it from dora ?

Done.

Cheers,

Richard


