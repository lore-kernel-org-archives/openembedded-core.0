Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8D5C54E41
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 20:22:54 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.81499.1709497368642107571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 12:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=TTAiT1cD;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D9DB1240101
	for <openembedded-core@lists.openembedded.org>; Sun,  3 Mar 2024 21:22:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1709497366; bh=W8UUL92uKa0NPFhdvbqJd696i+zde/oVk8rag3sN6cI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=TTAiT1cDwfnR/H3rqhZpHuEQIeFmafntK5sDoQXx9bjRt+0vztBaWKWHV/x3sIIQp
	 pHKGK75WrsvloGTgHXFXJYlbGUph0FnlQlbq9MP0kZUjLM5uHIV3GZoTqCSfCLbcee
	 aMydEwAHpNX20XJfzrcNdJs792KJPwDaupW9Kd4bHv/UsHmeWYKwOF+Rs1w5R2upTZ
	 k4m7osCF/BsDRjItHq46qKhhEN1tbSiBffQWsUs2tU/JXfG38j/mcB6C+cHg1bXUik
	 EdwbOGD+eZyTHrc35DkczD3Ky49hatXIq85HTQ3/qIj99+h2Z5y8NimTCRiBo6c3s/
	 zD4WYsI+PW8tg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TntYK6cfSz9rxB;
	Sun,  3 Mar 2024 21:22:45 +0100 (CET)
Message-ID: <539cc5c757288f472f9741c2e0c992f609c82c10.camel@posteo.net>
Subject: Re: [OE-core] does one need to "add" packages to ptest already
 under ${PTEST_PATH}?
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 03 Mar 2024 20:22:44 +0000
In-Reply-To: <517bf782-21dc-e5bb-8117-157b6f4aec4@crashcourse.ca>
References: <517bf782-21dc-e5bb-8117-157b6f4aec4@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 20:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196577

On Sun, 2024-03-03 at 14:37 -0500, Robert P. J. Day wrote:
>=20
> =C2=A0 apologies if i already asked this, i'm trying to juggle a dozen
> things at once.
>=20
> =C2=A0 here:
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/python/python3-cryptography_42.0.5.bb#n63
>=20
> what is the point of adding to FILES:${PN}-ptest something that is
> already under ${PTEST_PATH}? especially since the do_install_ptest()
> function above it installs even more but doesn't add that stuff?
>=20
> =C2=A0 obviously(?), it doesn't hurt, it's just puzzling. i can submit a
> patch to delete the extraneous stuff for clarity.
>=20
There should be no point, and you asked before if I remember correctly. I
guess it could be removed.

Cheers,
Simone
> rday
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196575):
> https://lists.openembedded.org/g/openembedded-core/message/196575
> Mute This Topic: https://lists.openembedded.org/mt/104708837/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


