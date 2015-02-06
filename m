Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8705B72E45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:29:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 06 Feb 2015 08:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,529,1418112000"; d="scan'208";a="673967323"
Received: from kamaher-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.37])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2015 08:29:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Feb 2015 16:29:28 +0000
Message-ID: <6085878.mfinm5EiV2@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAP9ODKp2k4WScT76iBsF=Aq=AJGh5cXQui3-rb47uzMsPmhsKA@mail.gmail.com>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
	<1423235582.20217.16.camel@linuxfoundation.org>
	<CAP9ODKp2k4WScT76iBsF=Aq=AJGh5cXQui3-rb47uzMsPmhsKA@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 16:29:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 06 February 2015 13:53:42 Otavio Salvador wrote:
> On Fri, Feb 6, 2015 at 1:13 PM, Richard Purdie
> 
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2015-02-06 at 16:02 +0100, Martin Jansa wrote:
> >> On Fri, Feb 06, 2015 at 12:21:23PM -0200, Otavio Salvador wrote:
> >> > On Fri, Feb 6, 2015 at 12:18 PM, Burton, Ross <ross.burton@intel.com> 
wrote:
> >> > > On 6 February 2015 at 14:10, Otavio Salvador
> >> > > <otavio@ossystems.com.br>
> >> > > 
> >> > > wrote:
> >> > >> I think they should re-run. Otherwise we can end having errors and
> >> > >> QA
> >> > >> issues unnoticed until a full rebuild.
> >> > > 
> >> > > That was the state of things until my original patch last week.  The
> >> > > patch
> >> > > had the side-effect that changing QA tasks causing *everything* to
> >> > > rebuild.
> >> > > I'm really not sure that's a good solution.
> >> > 
> >> > If someone adds a QA tasks it is because it matters. In this case we
> >> > ought to have it in an immediate effect so it does makes sense to
> >> > rerun everything.
> >> > 
> >> > I know it is bad from build time point of view but predictability and
> >> > correctness is more important from my point of view.
> >> 
> >> Agreed, especially when someone decides to make something fatal it
> >> should highlight all failing recipes before it's enabled in "official"
> >> build instead of sneaking the failures one-by-one as sstate is being
> >> invalidated by other changes.
> > 
> > Thinking about this from the other angle. Should someone having a
> > different set of WARN/ERROR local settings mean they don't reuse sstate?
> 
> It should be checked against the different setting. If the price for
> it is sstate invalidness, so be it.

I honestly don't think this is right. The value of this variable does not 
belong in the signature - it does not affect the output of do_configure.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

