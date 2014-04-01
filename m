Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0596EF89;
	Tue,  1 Apr 2014 11:21:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31BLQ91017296; Tue, 1 Apr 2014 12:21:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Gdj7CR13myjm; Tue,  1 Apr 2014 12:21:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31BLNq9017270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 12:21:25 +0100
Message-ID: <1396351278.2910.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Tue, 01 Apr 2014 12:21:18 +0100
In-Reply-To: <5337ACBB.4040804@linaro.org>
References: <20140330013103.GD2428@jama> <5337ACBB.4040804@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Quality of meta-oe metadata
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
X-List-Received-Date: Tue, 01 Apr 2014 11:21:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-03-30 at 02:33 -0400, Trevor Woerner wrote:
> Hello Martin,
> 
> Excellent, excellent post!
> 
> On 03/29/14 21:31, Martin Jansa wrote:
> > 2) There are a lot of changes and component upgrades in oe-core which
> >    sometimes aren't very straight-forward to adapt to and issues stay in
> >    meta-oe for months.
> 
> Critical bugfixes aside, I think the current system of unrestrained,
> perpetual package bumps is an issue. If dylan uses version 1 of package
> XYZ and dora uses version 5, is there any need for the 3 intervening
> package bumps which occurred between the release of dylan and dora?

To put the other side of the argument to this, if you leave things and
just update once, you bring in more change and it usually ends up being
progressively harder to debug any issues since more things changed and
you don't know which change caused which problem.

OE-Core has there fore gone for the "update regularly" philospohy where
we can. This means we get to know about issues earlier and have more
time to fix them, they're also less likely to get confused with other
bugs.

> If nothing else, these "irrelevant updates" increase the chance of
> causing problems ;-)

I'd disagree :)

> > 3) OE releases work great and don't invalidate sstate signatures so often, so my
> >    feeling is that most developers and projects are just using releases and
> >    less and less people do CI.
> 
> Would users prefer a better-tested more-likely-to-work release
> containing package versions which were several months old, or is staying
> on the bleeding edge more important? There is always exponentially more
> work/cost required to be an early adopter.

At least for OE-Core, there is a strong pressure to try and keep up to
date. The stability is found in the release branches one a set of
versions are locked in.

If we run into problems and talk to upstreams, the invariable question
was "does this reproduce with the last release (or head of SCM)?". If
we're up to date, it makes it easier for us to talk to upstreams in that
regard too.

Cheers,

Richard






