Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BACE77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 10:48:01 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web10.19984.1735210074432501898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 02:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=Gc3cLb6l;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.194, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1735210072; x=1735814872; i=marcel@ziswiler.com;
	bh=0YNDVsk/1VtItjqeYCsrt8Xzd+nv4G0EaXl2tw7FaQU=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Gc3cLb6lEhAcD9vVgX8FZXTabxkGBoac8iV9fVdH1RvbneF3eynXgklPfIqkMS2e
	 lP8rwZMZb2H3wZ/TYvjT25X/zHPqVcBjr8G+LzgLiXOuoNB7rTH0tVpq91TCqaXmD
	 ALxirVYD5TRTLFncMYUol3jd4wSa2ypmPlMZZfThbrwm2xb5b/I3BckkgA4G/psZE
	 OGGnYNRIpH7KXqeU7S0y8gr973eORzDyDFP7qRXB65H+qR/CtfoV5pP+IlNOVap3Y
	 ArctWrNB+vYB0XWBhXwgUFpvZi5eJpdVRGoPtPgZl6S8isRAdUQ9QV2qAlG15JLET
	 AlGyP/hM9OZ9R9nHAg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.10.1.166] ([194.230.241.203]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0M87fT-1tmg4P12Jt-00yXXC;
 Thu, 26 Dec 2024 11:47:52 +0100
Message-ID: <c17236c58b3d7f041746b0ede69c271d1c7f8eed.camel@ziswiler.com>
Subject: Re: [OE-core] [PATCH v2] gettext: upgrade 0.22.5 -> 0.23
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Dec 2024 11:47:49 +0100
In-Reply-To: <D6LJ8P97UJIR.2ZV3G9G2APPTE@bootlin.com>
References: <20241225103244.3514559-1-marcel@ziswiler.com>
	 <D6LJ8P97UJIR.2ZV3G9G2APPTE@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:A7V3EhXFctb3uGbitFab3ae0eb4ESnf1N/k5TK0zweZpj4MSOpi
 XLHMx6M96K6N4ON3UNXE/25FcV7utx0Zt6G/XylCT95mKBq4c7x/mlCY4kKVT+JrGAfVxrq
 xBSmEpgqbxAozzecfcVK5lvhDwSTnvO2+D2ik0+QXUsKkkPi1MMLyRYfXdYZWwRD9mvGgE+
 kgl4ZSDKmi8QL9aryJvyg==
UI-OutboundReport: notjunk:1;M01:P0:d821/jO9SQA=;GkMwJDpK7umzLwuqUSOh7YwS4jt
 Af8YLabd2k+o0ZDSRru22GnIJD/kssxylP3gDI375vggE75OcSgJcFx9vxgmGouNeHBs3QwEb
 EwaI8yGePpNclUVDjxzyxXXw+m0RoYy1JFvVI5szDs0JF2OK7E6ifopHmevzJQYUFeX5tz8Ym
 OIzlRjBXdDrTfa6w6zuUl5QfKio9mdLQUZ5Qw4j0yMQ7smxgc2jIar2ZQ6bQDJCn2nbt8ZgrE
 4atkoLdoyJVAPp4AWyOkb4Cr6rAdud8kEFtUsfZWvtbQza4m0SRxVyePjZERtEV65qtT7x421
 Md0l+4fk6DcryqzSzh4vUk0Nx+erd2yoUuPrVLYt5pTEwZ4OtFLgm05kgpSLKF2RQ32bA6ObX
 Ub0Iij51/14AInt/B+JgewUvbTEnJ2yG8Nd64LS5FleBpFD3xa3AiRxrN9/XLeWX7myq7/c4V
 Lk5VC0c9cQCnybykS1EsXO5ZK564o0GrguEdkPPDt3hXtTKLHBFMdPHHQAvJqqQ4gX5CIujEk
 A9lFKw6t+BqOY0kJQh3KsAQtQqHfQ/69WEXuqZSCCsLGdbFpB1/GrHKPdtgwMYfKd8n5y2rrF
 L4Bfsd1dAG6xIJrnhaMpeTpc16nb7XkXhre5xwxFX25+9SMJNrgrxE0RMSOpNxnIMACw1gTyS
 EA4BTEZEoIZel/WLR5F7kfvA23nB61lJtrPwuqOEhCgNIvzDO9N5+GbOhFU+UWoWOnuTyyJEn
 t4/wGg5hFBP2rZc0kZFahef+6tpyC8SOb2JdClhQ6tFKu1ha4iFDPJlnYpc8JoW5BqKbp+i/Y
 RkEwluKWoyeewpQES70fdS1XbVS06yagXMwxrblESCGxAGdDP/g0+tGUxHdkG6K09vHA/A4Cb
 DCdehsskDMG1icgn0AIZrnrHdLdxXPKWe68FWl5QWaNIsZxH91z1xWcDSRL0b8WPLKoLpP3dv
 V1ggehF1NBNSKM9UuQGn4agEomrMs/FGkar1bpiUhUWxsC95PvxGBHhATOeWRbvSlsBio2i5y
 txTJoSjedR+7UJuJaqqWp6l2W3WrHQAzTeAkPIp
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Dec 2024 10:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209089

Hi Mathieu

On Thu, 2024-12-26 at 10:42 +0100, Mathieu Dubois-Briand wrote:
> =C2=A0On Wed Dec 25, 2024 at 11:32 AM CET, Marcel Ziswiler wrote:
> > Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> > ---
> >=20
>=20
> Hi Marcel,
>=20
> I'm taking this patch in my branch, but just a quick note: it looks like
> you setup is breaking the patch format while sending it, so picking it
> is a bit painful. Particularly, it looks like it drops spaces on line
> ends, which do mess the changes on patches.

V1 indeed had an issue but V2 I sent straight with patman which uses git fo=
rmat-patch and git send-email and
should not mess with any such.

> Can you fix this for your next patches please ?

I am happy to fix anything but V2 should really apply cleanly, not?

