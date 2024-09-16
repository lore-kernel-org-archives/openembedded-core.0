Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE64C3ABB2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 21:30:53 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.6852.1726522243214023646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 14:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=pfCGirKK;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id CA9E9240103
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 23:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1726522240; bh=sCj7BqNfj1ptuZ9J/FGXxFdBhmq0WI+FdQ+N5cC/AYI=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=pfCGirKKg1qmnax8ezHGeEuVc+OrA5iVQ7PBH9GOsQ5C/SVc9NtUZHKeoXfG3+AMf
	 mR0oipFjg3D+GD7EcqUJIVxo66fECIfCiXd/1tJDtD+OnJV9mDMqlsoTlG1QyPtkoU
	 e+JWg1rdKUumNfv19EQNAX8sePfROwrPGUPL4hnMker6Z7jm2yxKMOBf4bnrS4yoPT
	 WqP0yMvLmNT3yWDTx2P35g3sMHPM2mLvzdH4GaCF3KDitZXB7piRhtdPxLpa/BXoJP
	 x1vBSH6nXNatiayTSSOL3uJym+0Qurh2QD/Zqt73WE/Ha/Lblf8pRCXLx1Be60i1zL
	 QsrrpFRfoZm/w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4X6ykl5DKcz9rxF;
	Mon, 16 Sep 2024 23:30:39 +0200 (CEST)
Message-ID: <39bef9ebf32e7f38b88ddc68095c1543e98ec6bc.camel@posteo.net>
Subject: Re: [OE-core] [AUH] gnutls: upgrading to 3.8.7.1 FAILED
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2024 21:30:39 +0000
In-Reply-To: <01010191f61ade2d-97c5199c-2106-43da-9e43-90c50a8a408f-000000@us-west-2.amazonses.com>
References: 
	<01010191f61ade2d-97c5199c-2106-43da-9e43-90c50a8a408f-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 21:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204612

On Sun, 2024-09-15 at 14:34 +0000, Auto Upgrade Helper wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *gnutls* to
> *3.8.7.1* has Failed(do_compile).
>=20
> Detailed error information:
>=20
> do_compile failed

Issue is caused by this
commit:https://gitlab.com/gnutls/gnutls/-/commit/3e5be1315a15ac6e1e33e08f28=
030b8215b6d234

Will look for a solution

