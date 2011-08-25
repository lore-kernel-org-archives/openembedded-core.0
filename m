Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwOlZ-0002Kc-EU for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 03:29:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P1P9HL025717;
	Thu, 25 Aug 2011 02:25:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25638-01; Thu, 25 Aug 2011 02:25:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P1Ow5O025698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 25 Aug 2011 02:25:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANnGQBOwNVNRsgkH6akPrk9Sa_BoCsFtFBwTak9oRKfuPQ@mail.gmail.com>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<201108221401.15860.paul.eggleton@linux.intel.com>
	<CABcZANnHKrkmjODWStf3CyBEMBZRpkcVTZZ5dmVo-bkUn9Ybdw@mail.gmail.com>
	<201108250116.08019.paul.eggleton@linux.intel.com>
	<CABcZANnGQBOwNVNRsgkH6akPrk9Sa_BoCsFtFBwTak9oRKfuPQ@mail.gmail.com>
Date: Wed, 24 Aug 2011 18:24:57 -0700
Message-ID: <1314235497.5939.166.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2011 01:29:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 17:20 -0700, Chris Larson wrote:
> On Wed, Aug 24, 2011 at 5:16 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Thursday 25 August 2011 00:16:40 Chris Larson wrote:
> >> I strongly disagree with this. The fact is, we almost never go back
> >> and "clean these up later", so crap accrues.
> >
> > We're talking about the difference between:
> >
> > if a = "":
> >
> > and
> >
> > if a:
> >
> > This is not crap, it's a triviality (for the case where the functional
> > difference is not important anyway). If you care then by all means submit a
> > patch to change it.
> 
> Yes, this example is trivial, but its just one of many instances of
> this sort of code going in. I'd rather get the code clean to begin
> with, rather than letting crap pile up and never do anything about it.
> But I realize I care more about code quality than most of the people
> in this project.

I'm not sure that is true, I think many people care about the code
quality of OE. Quality means different things to different people. We
also all have different priorities. It would be nice in many ways if our
biggest worry was these sorts of issues but it isn't.

Also, we have a lot of new people looking at the project and starting to
contribute. People are learning a lot and becoming very skilled
developers, its exiting to watch some of their skill sets grow. Taking
an all or nothing approach to accepting patches tends to be
counterproductive. Educating people over time tends to work well.

I think these things will get addressed and get better in general over
time (and by many measures quality is improving already).

Cheers,

Richard



