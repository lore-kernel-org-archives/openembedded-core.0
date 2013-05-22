Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 653A361AD0;
	Wed, 22 May 2013 15:11:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 22 May 2013 08:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,721,1363158000"; d="scan'208";a="338255205"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by fmsmga001.fm.intel.com with ESMTP; 22 May 2013 08:11:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 May 2013 16:11:02 +0100
Message-ID: <3795534.7yd4ZVD7nC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130522144925.GJ32431@jama>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<519CCFFF.2060506@windriver.com> <20130522144925.GJ32431@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 15:11:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 May 2013 16:49:25 Martin Jansa wrote:
> Using combination of tabs and spaces in the same file (and even on the
> same lines) is quite bad, because it looks different based on tab length
> and can show wrong indentation in case like 8 spaces and 2
> 4-character-wide tabs on next line (where author was seeing 18 spaces on
> 2nd line)
> 
> It was acked by 2 TSC members:
> Koen:
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/09016
> 2.html Khem:
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/09020
> 3.html
> 
> 3rd member of TSC and maintainer of some meta-oe layers, was aware of this
> change and wasn't complaining:
> Paul:
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/09018
> 4.html

I didn't feel like I had good reason to object other than what had already 
been discussed. That should not be construed as me supporting the move. I now 
regret not commenting further at the time.

The problem is we now have a split between how shell function indentation is 
done in OE-Core and how it is done elsewhere, which as I'm sure you can 
understand is also a suboptimal situation.
 
> When this was discussed about a year ago in TSC, the most important
> reason was complicating backports, you can read something about it my RFC:
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/090135
> .html Now close to creating dylan branch for meta-openembedded is imho best
> time to do this, not many changes from released dylan will be backported to
> danny, because people will start moving to newer release instead of
> backporting more and more stuff to old one (also resolving possible
> whitespace merge conflict it not hard).  Causing conflicts for merge was
> IIRC most important reason why my proposal was rejected for oe-core.

We've been through this with OE-Core. We do do a significant number of 
backports and it has been painful when whitespace has changed. The TSC 
decision was taken in order to avoid this.

> And TSC minutes which discussed it say:
> Reluctant conclusion: tabs for shell, 4 spaces for python.
> 
> So please stop trying to show it as action of one maintainer who
> decided to go against TSC decision and to scr3w everybody.

The problem with this is that you've effectively added pressure on Richard to 
change the the policy in OE-Core despite the explicit decision not to make 
this change there.

This kind of overall policy change *must* be done everywhere and not just in 
one place or even the majority of places. We shouldn't ever need to be in a 
position where OE-Core says you must do one thing and meta-oe and other layers 
say you must do the opposite.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

