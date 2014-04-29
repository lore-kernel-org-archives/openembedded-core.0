Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A1C4960E24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:50:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3T8nqxv001146; Tue, 29 Apr 2014 09:49:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Vg4nxv9BMDsE; Tue, 29 Apr 2014 09:49:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3T8njbY001120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 29 Apr 2014 09:49:47 +0100
Message-ID: <1398761378.16672.363.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Apr 2014 09:49:38 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Status Update
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
X-List-Received-Date: Tue, 29 Apr 2014 08:50:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Executive Summary
=================

The -rc4 build of 1.6 was ready for release with some last minute fixes
for the beaglebone issues (thanks!). Its great to finally get that out
there.

I've started merging changes into master. I've put various gcc changes
forward that I've had a few moments to work on. There was also an issue
I found in bitbake which gives about a 7% build speed improvement on our
standard image test and I found some versions of git are rather slow at
operations which should be fast.

I've not travelled to ELC/OEDAM due to being unwell and worn out :(

1.6 Release
===========

I believe this is ready for release. There are a variety of patches
which did not make it in and we will queue those for a point release.
The timing on the point release will depend on the kind of issues we
find in 1.6.

Master
======

I've started merging patches in so this has opened for changes. Of note
so far:

GCC - I did find a few moments to write most of the patches needed to
rework our parts of our gcc recipes and continue to improve the
toolchain which will be valuable as we more forward. The first part of
these has merged. The second part is out there for review and there are
some bugs there I need to fix before it merges (meta-ide-support in
particular). There is a third set of patches I've not cleaned up and
sent out yet which standardise the toolchain hashes.

Bitbake - The task scheduling algorithm has a couple of bugs in it which
I found after noticing some strange behaviour with low numbers of
threads. This was worth a 7% speedup of our benchmark image build test.
Unfortunately it was too late to get that into 1.6 but it may make the
next point release. I also found that git 1.8 is slow for some
operations and we really want to use 1.9+ (worth around 1 minute on
linux-yocto kernel build time). Chris has also found what looks like a
nasty bug in the codeparser cache which is a good thing to find.

ELC/OEDAM
=========

I've not travelled to ELC/OEDAM as planned. I was already worn out with
previous travel and a variety of other things, then I've come down with
a bug which I held off over the weekend but has caught up with me
now :(. The flights and so on don't agree with me at the best of times
and I'd lost my voice before even leaving so I decided to rest instead.
It wouldn't have been fair to potentially spread the bug around either.

Its the first trip I've ever cancelled and I'm sad not to be at OEDAM in
particular but if I had travelled I doubt I would have been in any state
to participate. Sorry if that causes difficulties for anyone.

I'm aiming to write a separate email about where I think we need to
focus with the project going forward.

Given the situation, I'm going to try rest this week and take a bit of a
break from things. This may slow down patch merging and so on.


Cheers,

Richard





