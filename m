Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2E2FEEF32
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 12:52:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80425.1775566359141206593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 05:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1tgcQeZ2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 236AA1A31CB;
	Tue,  7 Apr 2026 12:52:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7FBB603C7;
	Tue,  7 Apr 2026 12:52:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3799104500CD;
	Tue,  7 Apr 2026 14:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775566356; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dhjxTjeQiEEatYUuSXek/9B4i1Ax36Z77M1UvvVvckU=;
	b=1tgcQeZ2Juktw4BVh9Li2BtrIEnNDIMB2Zl2jj6dKQ08Gh/81petEYC8AQOXOGTyoubHgM
	cyQQ65pU9fxV5yNArvzGPzEhmCbPPX6nfunjfdvzzqnFemn50ZvQXOS5exFldKRGdWqqaL
	YReFb/6GY0vLXGZWxEmrE1cT4wBBNCj7XUuG4Y/3WWjXXMLw41EqnUp8/l0a870WsIWwRG
	fzYgscAI/dEC7wbdhsDH0Qo2itKAPwHbmx5HqjIo905Bp7vSGC4FMqrE0smHURpBzOeK3/
	B4h5jTZJkYzoVz5Tln0KHR/GMQEaT1r48ZRECW9UpMMVQ7LmryHl5Q1HE2rVfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 14:52:35 +0200
Message-Id: <DHMXQQX9N8S2.2XR0GJ6ALH1O3@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/4] package_pkgdata: fix typo to stop
 calling undefined function
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.blank.g@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
 <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
 <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com>
 <CAFAffzx7EdXXEudpQGCgSA-1M7aDDwMuRLW+Dta5urcmVx_yWg@mail.gmail.com>
 <DHJHIMYYUTH6.16YUU1V7MJZY@bootlin.com>
 <CAFAffzzW9r43AE5hKbXihkXqZTWeO=sQGctTkmL4Eg+U9X31AA@mail.gmail.com>
In-Reply-To: <CAFAffzzW9r43AE5hKbXihkXqZTWeO=sQGctTkmL4Eg+U9X31AA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 12:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234731

On Sat Apr 4, 2026 at 7:14 PM CEST, Adam Blank via lists.openembedded.org w=
rote:
> On Fri, 3 Apr 2026 at 13:31, Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Fri Apr 3, 2026 at 12:32 PM CEST, Adam Blank wrote:
>> > Hmmm, can't see any connection between those tests and this particular
>> > patch...
>> > The thing is, that since the patch fixes a call to an undefined functi=
on,
>> > there could not have been a test covering this case in the first place
>> ;-)
>> > In addition, the function call takes place only in the 'bitbake -b'
>> case...
>> >
>> > Where can it be found, which other changes took place in those builds?
>> >
>> > On Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand <
>> > mathieu.dubois-briand@bootlin.com> wrote:
>> >
>>
>> The tested branch can be found here:
>>
>> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder=
.yoctoproject.org/valkyrie/a-full-3579
>>
>> But I confirm git bisect points to this commit, and the error is gone
>> after a revert. You can easily reproduce the issue on your side:
>> oe-selftest -r sstatetests.SStateHashSameSigs2.test_sstate_allarch_sames=
igs
>>
>>
> I've run this test with my change cherry-picked onto the master, and have
> got some inconclusive, partially random results... Here's what I did:
> - the test started FAILING (as in the autobuilder)
> - I replaced the corrected function invocation with an exception throw an=
d
> nothing changed (this proves, that this branch does not take part in this
> test)
> - I limited the packages built during the test to only some of the ones
> failing - the test started PASSING
> - I started restoring the original package list, and finally restored its
> original state - the test kept PASSING
> - I restored the original state of the workspace - master + my commit (th=
e
> exact same configuration that I started with) and the test kept PASSING
> - I rerun the test a few times, each time in a new, fresh build, and afte=
r
> about 3 FAILING runs it suddenly PASSED 2 times, before it started FAILIN=
G
> again - all the time in the same state of the workspace
>
> I did confirm, that the signatures differed indeed in the failing runs. I
> chased it for a while, looked here and there (e.g. found it suspicious th=
at
> native, nativesdk, cross-canadian, etc. clear
> out do_packagedata[stamp-extra-info] and allarch does not) but I cannot
> even dream of the type of free time I'd need to familiarise myself
> sufficiently with BitBake's hashing machinery.
>
> I think the way to go now is to file a bug - what do you think?
>
> Thanks,
> Adam
>

Thanks for taking the time to make these tests.

I am not familiar either with these bitbake parts, so yes, except if
someone else comes with an explanation, opening a bug entry is probably
the best move here.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


