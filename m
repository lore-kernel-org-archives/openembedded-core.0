Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DEDAC770B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91LGg6t008123; Thu, 1 Oct 2015 22:16:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nQnAbjwEiAIB; Thu,  1 Oct 2015 22:16:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91LGUcZ008110
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 1 Oct 2015 22:16:41 +0100
Message-ID: <1443734190.14733.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 01 Oct 2015 22:16:30 +0100
In-Reply-To: <CAP9ODKp2of3-766hOc_=Naqsa12uk5FntfgeHXwPcxnrQR+u6Q@mail.gmail.com>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<1443713835.14733.13.camel@linuxfoundation.org>
	<3712B443-8857-41CB-87F9-DFFC12FE69E9@gmail.com>
	<1443731146.14733.30.camel@linuxfoundation.org>
	<CAP9ODKp2of3-766hOc_=Naqsa12uk5FntfgeHXwPcxnrQR+u6Q@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 21:16:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-01 at 17:30 -0300, Otavio Salvador wrote:
> I think what Khem means is that any time is time to discuss the
> release process as this is a community driven project and we must to
> be open for feedback and revisit our previous concepts.

There is a time and a place for such discussions. I think its clear that
right now, I'm personally finding the situation we're in rather
stressful and even getting the release into a shape where it can ship is
proving difficult.

The last thing I need right now is to go through this discussion again.
Particularly when people have not gone and read the things I wrote up
last time this was discussed. I could ask why not, the answer is
probably because its easier just to ask questions and be unhappy with
what we have.

I appreciate that what we have today does cause some issues. I also
realised a while ago that regardless of what solution we pick, there are
people who are not going to like it. I've talked about that in previous
mailing list posts to try and explain why we end up where we are today.
I also don't believe anything has materially changed since we last
discussed this, some people are just still unhappy. Some people will be
unhappy regardless.

I'm actually at a pretty low point with OE and Yocto in general. It eats
up a huge amount of my time, both work and personally and I have started
wondering what I actually get out of it other than a shortened life
expectancy. On the most part I see a lot of complaints about things and
continual questioning of "why we do X and wouldn't Y be better". I do my
best to deal with this patiently and each time try and explain why and
then re-evaluate if a change makes sense or not. When the same things
repeat time and again, my patience can wear thin though.

Now, I do realise that there probably are some happy users out there and
that happier users tend to be quieter than the unhappy ones, at least I
certainly hope so. As such, I tend to see the worst side of the projects
all the time. Equally, it can get to you after a while.

So, yes, I do believe there is a time and place for discussions and not
everything should be questioned and discussed at any time. That doesn't
mean its not a community driven project.

Anyhow, I can't stop any discussion, however my point is I'd much prefer
to spend my time trying to sort out the release. If others feel
differently, I will indeed have to spend more time on this instead. I do
also believe it is too late to change things for this release[1].

[1] Since I will no doubt get asked to explain that, the consequences
are quite significant when you consider bugzilla version fields,
autobuilder scripts, release scripts, my own branching scripts and so
on. The things I haven't thought of worry me even more. Yes, we can in
theory change anything and we could change this, but its probably a week
of work shaking out just those changes. Do I want to do that now? No, I
don't. For example I'm attending ELC-E next week. Do we want me talking
to people or sitting in a corner trying to un-break such a change?

Cheers,

Richard



