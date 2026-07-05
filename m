Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C097C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 08:24:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128145.1783239839329068351
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 01:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vVOcPdZA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9FFAE4E40C98
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Jul 2026 08:23:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60424601A2;
	Sun,  5 Jul 2026 08:23:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E49B411BB921F;
	Sun,  5 Jul 2026 10:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783239836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ebncAQ2zHBn5AkQ/w9BelnApBjejzcxEXrRdkcn8M30=;
	b=vVOcPdZAidcEtIHHo65uucUFHiZIkx1k1HZej/L2Mf9uo7pqJpLY3UVoEcDvZmyfF+3FjB
	wrliv8+mkyvtW20KsHkqMR+tJDEfTeEarqI508HWwOfF593VotUeMbaT4tRcl9paqGAB1F
	hL1Ti2aQ2A94FUOUSVaGQnkS/1BcVE6WgOxhqOTVneXfHXgdogjG0Ts/7nzOXvXafLcYB4
	CYRoBi8G1Bn7apm9aCdYeiqPkAbXzYo6Isj4LJpdpUImmsBsT3PTpfKev3W75HoZf6CO64
	ReOqCxfCa1+6ZIqxW+evlETvZEtUHNEN5ddjeGiw5UPJ8YNtHZ+y62y/+UakGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jul 2026 10:23:55 +0200
Message-Id: <DJQHRJ8J3RC1.Q0KLD14LY2ZA@bootlin.com>
To: <alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/15] mesa/mesa-tools-native: Upgrade 26.1.2
 -> 26.1.4
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
 <20260703082955.1585712-5-richard.purdie@linuxfoundation.org>
 <CANNYZj-7NkZiXow508-rdrovftFp6S6yuGKVDYMHBPp7MR440w@mail.gmail.com>
In-Reply-To: <CANNYZj-7NkZiXow508-rdrovftFp6S6yuGKVDYMHBPp7MR440w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 08:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240142

On Fri Jul 3, 2026 at 11:36 PM CEST, Alexander Kanavin via lists.openembedd=
ed.org wrote:
> On Fri, 3 Jul 2026 at 10:30, Richard Purdie via lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>> -SRC_URI[sha256sum] =3D "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf=
914edd85962babdf0"
>> -PV =3D "26.1.2"
>> +SRC_URI[sha256sum] =3D "072705caa9adf4740f1489194b13e278ad959166863b527=
1fe423a86353c9ab6"
>> +PV =3D "26.1.4"
>
> This will probably fail to build for qemuarmv5, for that I have a patch:
> https://git.openembedded.org/openembedded-core-contrib/tree/meta/recipes-=
graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-=
if.patch?h=3Dakanavin/package-version-updates
>
> Alex

Just to confirm, we indeed have this error: https://autobuilder.yoctoprojec=
t.org/valkyrie/#/builders/59/builds/4097

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


