Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 38AF960C22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 23:07:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2013 15:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,570,1384329600"; d="scan'208";a="451218323"
Received: from unknown (HELO helios.localnet) ([10.252.122.104])
	by fmsmga001.fm.intel.com with ESMTP; 29 Dec 2013 15:07:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Sun, 29 Dec 2013 23:07:22 +0000
Message-ID: <1580581.nepEx93iJD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52C0A856.7050603@linaro.org>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0A856.7050603@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/38] Cleanup series
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
X-List-Received-Date: Sun, 29 Dec 2013 23:07:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Sunday 29 December 2013 17:55:18 Trevor Woerner wrote:
> On 12/28/13 17:28, Paul Eggleton wrote:
> > I got a bit tired of seeing poor SUMMARY and DESCRIPTION values in our
> > recipes, so I went on a bit of a quest to clean them up, and ended up
> > tidying up a few other things in the process.
> 
> This might be a good time to remind people of the
> 
>     meta-openembedded/contrib/oe-stylize.py
> 
> script (which was recently pointed out to me). 

Indeed, thanks for the reminder. Last I heard (from Koen recently IIRC) this 
script still had some shortcomings though; I have to admit that I haven't used 
it for years however - I tend to do this kind of thing by hand.

> Unfortunately the style guide to which it points
> 
>     http://openembedded.org/wiki/StyleGuide
> 
> doesn't appear to exist anymore.

The actual page appears to be named "Styleguide". For convenience though I've 
just added a redirect so the above link now works.

I think there are one or two conventions we've established in recent years 
that aren't covered by that page however (some of which may be covered in my 
migration document [1]); we also do not need a separate slightly different 
version on the Yocto Project wiki - I think this was noted some time ago at a 
previous OE TSC meeting in fact. If I get some time and nobody else gets to it 
first I'll try to rectify these issues.

Cheers,
Paul

[1] http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

-- 

Paul Eggleton
Intel Open Source Technology Centre

