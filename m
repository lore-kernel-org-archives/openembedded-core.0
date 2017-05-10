Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE4E71AB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 10:55:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 03:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="1146111875"
Received: from nmaideen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.191.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2017 03:55:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 10 May 2017 22:55:45 +1200
Message-ID: <2037301.7Ncc1v2UnL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <37bc3fea-105c-a22f-9386-0b0f440bd118@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
	<37bc3fea-105c-a22f-9386-0b0f440bd118@linux.intel.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Wed, 10 May 2017 10:55:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 10 May 2017 9:31:10 PM NZST Alexander Kanavin wrote:
> On 05/10/2017 12:03 AM, Paul Eggleton wrote:
> > Your opinion is noted. My opinion is that we ought to be providing a good
> > reference that can be used as a basis for real products (regardless of
> > whether whatever direction we choose to go is Qt-based or not) - the rest
> > of our stack *is* used that way, after all. We regularly get comments
> > about how Sato isn't suitable as such a basis, so the expectation is
> > there. I don't think adding Wayland support alone will answer that.
> 
> Paul, I do believe specifics matter, and I'm not seeing much of that in 
> this discussion :-(

Well, we don't have the specifics yet. Discussion about what to do about a 
reference UI has come up a number of times over the last few years (e.g. at OE 
developer meetings) but it hasn't really gone anywhere, because nobody pushed 
it.

I make no secret of it - I am a Qt supporter. I'm willing to be convinced 
that's not the right answer, though, if there are solid arguments. However, if 
you'll excuse my paraphrasing, "it's not in OE-Core and can't be, therefore we 
should just ignore it" isn't a case against it, it's a logistical issue. We 
could easily get past that by bringing meta-qt5 into poky as we do with OE-
Core, or even just adding it to the build configuration as needed.

> No one has yet provided any idea what this reference UI would try to 
> achieve other than it 'being a basis for real products'. This is far too 
> vague. Is it a tablet style UI with app launcher, and status bar, 
> similar to Sato? Or is it a collection of mutually exclusive fullscreen 
> apps that somehow showcase common embedded use cases? Please help me 
> understand this.

So to my mind I think we ought to be doing two things:

1) Have a reference stack that (a) we test regularly and (b) has a reasonable 
expectation of people being able to practically pick it up and build upon it.

2) Show that stack doing something "useful". Tablet-style UIs are interesting 
but you could spend a whole bunch of work building and maintaining that and 
get very little in return - none of our userbase is going to take such a thing 
and use it. On the other hand, a "common embedded use cases" demo set is at 
least theoretically closer to what someone might be doing with the stack in 
production and it's not hard to imagine you could throw a few of those 
together in a fairly short space of time. We may even find people willing to 
contribute something they've already built.

> Then there's the question of who's going to do the heavy lifting.
> Are we writing, testing and maintaining our own, and if so, who has time 
> for it? Or is there some off-the-shelf thing that would fit, and that 
> has miraculously escaped our attention until now?

So, I don't have all the answers - I actually have relatively few of them. The 
main reason I spoke up is I think we need to work through this and figure it 
out rather than shutting down discussion. If we keep Sato effectively on life 
support as we have done up until now, then it'll never get solved, and in the 
mean time we are presenting something that is frankly woefully outdated which 
we have to maintain entirely by ourselves.

(FWIW, I don't think this is something we need to solve in the upcoming 2.4 
development cycle, but I think we ought to be planning to resolve it in 2.5 / 
2.6.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

