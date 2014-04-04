Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 229BF6B720
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 15:17:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2014 08:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,795,1389772800"; d="scan'208";a="487347510"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2014 08:17:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 04 Apr 2014 16:16:58 +0100
Message-ID: <1606933.jKn4h42Xkg@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.7-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <533ECC17.8090502@windriver.com>
References: <1396602904-14596-1-git-send-email-koen.kooi@linaro.org>
	<533E91BD.8000107@linaro.org> <533ECC17.8090502@windriver.com>
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
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
X-List-Received-Date: Fri, 04 Apr 2014 15:17:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 04 April 2014 23:13:27 Robert Yang wrote:
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

FWIW I was going to send a revert in a series of other dora backports that I 
have.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

