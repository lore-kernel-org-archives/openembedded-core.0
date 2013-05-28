Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 79E2B6A49D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 17:36:33 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4SHeGU1026756; Tue, 28 May 2013 18:40:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tsia6cScp116; Tue, 28 May 2013 18:40:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4SHe9Pf026752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 28 May 2013 18:40:10 +0100
Message-ID: <1369762549.14887.191.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, yocto
	<yocto@yoctoproject.org>
Date: Tue, 28 May 2013 18:35:49 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
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
X-List-Received-Date: Tue, 28 May 2013 17:36:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its been a few weeks since I sent one of these out, mainly as I've not
had much to report.

Pending Patches
===============

Patches have been steadily getting reviewed and merged. Some things took
a little longer than is ideal due to travel on Saul and my part. I know
Saul is still travelling.

Autobuilder status is much improved compared to where its been the past
couple of weeks. We added a number of new sanity tests, they found
issues, we've now got many of them fixed. The nightly-qa test is still
problematic, the fsl-ppc machines are continuing to fail and have been
failing for a while now :(.

Automated QA
============

Architecture/planning wise, there is a big shakeup of the automated QA
tests coming down the pipeline for 1.5. The current shell script based
system isn't scaling so we're looking at moving to python unittest.

Why is this important? Manual QA currently uses a lot of or QA resources
and means releases take longer than we'd like, we also have issues if we
ever try two in parallel (e.g. a point release). I want to see this
problem removed and automation looks like the best way to achieve it. It
means the QA teams can then focus on more automation and writing new
test cases for new features and so on.

Once the initial conversion happens, we're looking to convert many of
the currently manual tests over to become automated and hence improve
the speed we can put releases through the QA process amongst other
things.

This is all still being planned, further discussion will no doubt happen
as soon as there is a plan to propose/discuss. There are a variety of
open bugs in the bugzilla and people interested in what is going on can
look at those and see the rough plans for 1.5.

I can quickly summarise that:

a) this work is focused on testing with qemu, not target hardware.
Nothing done in this work would be incompatible with real hardware, its
just not a focus right now (maybe 1.6?)

b) We plan to leverage existing tests where we can, e.g. "make check" on
target using ptest packages

c) initially the plan is to cover the runtime qemu tests

d) we're also looking at some kind of oe-selftest, a bit like
bitbake-selftest which would run "bitbake X, change Y, bitbake X, check
something" type scenarios.

e) extensions to the package QA tests (insane.bbclass) are being
considered

f) a new level of QA tests against rootfs after they're generated will
likely be created

The plan is to establish the new python unittest code using a small
team, then open things up for more contributions of test cases since
this part of the process can be parallelised.

1.3.2
=====

It shipped! Thanks Ross! :)

Hopefully this should round out the bulk of the 1.3 issues people were
running into. There is no 1.3.3 planned at this point.

1.4.1
=====

A number of fixes were merged for this. I know there are a small number
of patches still to come in but we'll need to start putting this through
the release process shortly so please get any requests for bugs fixes
for 1.4.x to Paul ASAP.

Bitbake
=======

I've been spending quite a bit of time reviewing and also writing some
changes to the core of bitbake, splitting up cooker. These changes set
the scene for webhob and the memory resident bitbake concept as well as
removal of the double bitbake execution. There will be more changes in
this area landing and there may be some further mild instability whilst
we work though any issues.

There have also been some patches which remove the "global method scope"
we had in bitbake. Those patches merged, I've not heard of anyone with
issues due to them yet (the parallel parsing already half broke the
global scope anyway).

Cheers,

Richard




