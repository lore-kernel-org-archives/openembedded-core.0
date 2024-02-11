Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B2BC4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 09:11:57 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.34405.1707642714391247820
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 01:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=Iag77y18;
 spf=pass (domain: posteo.net, ip: 185.67.36.65, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 36B6F240027
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 10:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1707642712; bh=aK3jkDqoTqh/0U3jFHRlRPcAjEl5ociz4bPfIyblZaE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=Iag77y18vnWVtRQ/DGRYVE600ZOKYojgei/icAxeictfhyYTGbY0ndUGzLNv86Y4n
	 apFE9odIw3bU2CQVBU88ErZDjwsYUhEy6i9QyIbFSpeNN2R6oUlqVWG5fTT+LwJMb5
	 P5faMGRMl88ZYPLJa/ivQJTfDpUs0MabcO/vS30omLWWX027pyegFsSTXx1nJ5rcAi
	 Cxxiq+PwrB9iVrG6V/GRJtieCqYVTDTP5BF0YISVjZSZ7331Z7itL+tqryrijaxnid
	 On5rJ3Ic58mLg1PMsPFoxfwp6Gym9iEwRMwjZsx1TKCrZFEx9mefzmSrOmOLkxjugx
	 eGH9onHeM0h0Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TXhft3JnFz6tvs;
	Sun, 11 Feb 2024 10:11:50 +0100 (CET)
Message-ID: <72d499aa111362ba1a5fc05311fd06030fcd6f15.camel@posteo.net>
Subject: Re: Patchtest results for [OE-Core][kirkstone][PATCH] curl: don't
 enable debug builds
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Patchtest
 <patchtest@automation.yoctoproject.org>, Trevor Gamblin
 <tgamblin@baylibre.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Feb 2024 09:05:49 +0000
In-Reply-To: <DB5PR02MB102136AE90A908156D2BE5464EF4A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
	20240210161234.12849-1-alex.kiernan@gmail.com <0101018d93dd81a4-0099bd71-a0eb-4f94-8ca3-51d9a9f2d323-000000@us-west-2.amazonses.com>
	 <DB5PR02MB102136AE90A908156D2BE5464EF4A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 09:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195283

On Sat, 2024-02-10 at 23:57 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > core@lists.openembedded.org> On Behalf Of Patchtest
> > Sent: den 10 februari 2024 17:33
> > To: Alex Kiernan <alex.kiernan@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Patchtest results for [OE-Core][kirkstone][PATCH] curl: don't
> > enable debug builds
> >=20
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >=20
> > ---
> > Testing patch /home/patchtest/share/mboxes/kirkstone-curl-don-t-
> > enable-
> > debug-builds.patch
> >=20
> > FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should
> > be
> > replaced by CVE_STATUS
> > (test_metadata.TestMetadata.test_cve_check_ignore)
>=20
> Would it be possible to disable this test for patches that are aimed for
> Kirkstone or Dunfell? They still use CVE_CHECK_IGNORE, and at least
> Kirkstone=20
> will be around for another two years...
>=20
> //Peter
>=20
>=20
We could and maybe should do it for Kirkstone, especially considering
that CVE_CHECK_IGNORE  was added for the Inclusive language
improvements in Kirkstone, so the release notes tell everyone to use
it. CVE_CHECK_IGNORE is not used in Dunfell, so should be no problem
there. I can send a patch for ignoring it in Kirkstone.

Cheers,
Simone
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195280):
> https://lists.openembedded.org/g/openembedded-core/message/195280
> Mute This Topic: https://lists.openembedded.org/mt/104280210/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-
> core/unsub=C2=A0[simone.p.weiss@posteo.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


