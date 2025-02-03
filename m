Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960D5C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 22:30:03 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.101815.1738621797251819935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 14:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=KHkl1aCU;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 25F6F240027
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Feb 2025 23:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1738621795; bh=/i35YJ3g14f2Eb+b9nxV04sgsVPP1fiQZp8rreLitw0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=KHkl1aCU4iJMURq65f3uyDWK7defpqVYQ7XT04buwu+hBfFmW+xH0yxIHBdnLASDE
	 DtCe/UJ7nLvok+GsU/TMLI44qJRgHeK15P5fRpDPAZ+tXBMkjJl1LAlfxyCHYoZ+XY
	 58WiWs1REOUBE48tzTn7FD73jORPReCvH6CZPqWzG4FP9WvEmgSH58quW3kxwr9NJG
	 7Q6zSjcoHmNFcn9kiw4NA2cLwrNhZXVBM4NP836cUTdZ2tAxovGcVZTYgOcu+AmOdX
	 dZLlvYlCBT6FFs20np9Jl4rr/mhS3feU7FtnlqYiMvUh28IeoKKSlS3XyqFsX9sV0A
	 prhUbSWs5vqxg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yn1QT62BZz6twv;
	Mon,  3 Feb 2025 23:29:53 +0100 (CET)
Message-ID: <7ac5db25a31b3e9ed24a8f772e630a765b02ccf1.camel@posteo.net>
Subject: Re: [OE-core] [AUH] libadwaita: upgrading to 1.6.4 FAILED
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: alex.kanavin@gmail.com, simone.p.weiss@posteo.com
Cc: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Mon, 03 Feb 2025 22:29:53 +0000
In-Reply-To: <CANNYZj8XCuKWDytbAjHS+eJxE3Gwm_2op-ozCdWLGe-NyDbUkg@mail.gmail.com>
References: 
	<01010194c1abfff4-e55a6603-ee24-4bd2-b9ab-6d041246d254-000000@us-west-2.amazonses.com>
	 <cfabe20bdd59186d8e4987ad4446493322dadb1c.camel@posteo.net>
	 <CANNYZj8XCuKWDytbAjHS+eJxE3Gwm_2op-ozCdWLGe-NyDbUkg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 22:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210740

On Mon, 2025-02-03 at 21:12 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Mon, 3 Feb 2025 at 21:06, Simone Wei=C3=9F via lists.openembedded.org
> <simone.p.weiss=3Dposteo.com@lists.openembedded.org> wrote:
> > Hi, looked into the compile issue, it is coming down to this issue
> >=20
> > > Program sassc found: NO
> >=20
> > Which now occurs because in [1] the handling wrt to pre build
> > artifacts
> > changes. One could fix this issue by depending on sassc, which is in
> > meta-oe only though. I want to ask to move it if ok.
>=20
> Yes, I guess we have to do it even if the only libadwaita consumer in
> core is epiphany.
I'll try and will sent corresponding patches.

