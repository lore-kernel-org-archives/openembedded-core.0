Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93448E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 11:24:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.20297.1735212269341764016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 03:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cc/d38kV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3393240004;
	Thu, 26 Dec 2024 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735212267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtnmgqTwbYDXn7R2RQtr3Ei94DTiq8rqnfJS3oA9GMs=;
	b=cc/d38kVf4n37lZIvLdaNpT5Ygsrf2p6Wrm2h/iZckr9I4cZD52sEtY9G3kmN7SLiTiFz8
	xLs/v8SJyVKKOauYFwOaYYIQPvanr+d/zE8Yv6XLh7kB+sao+3+7qo7dtdKAN52/FHAh96
	2M1Z/2AXC9i6IqA4k0hOlNjWQWmstVfU5SDyb6DWImDI8hAqMNag1MwDhT8CqDwpJrWLi5
	zPWMPf+eBU6AWQ9yiJubVIs4RWKtyUOsC7Wirhua7vKBZqGgvMMrOrf92SONzfVscKS+jx
	zm8Zsr01Mi7V5Cfd5nCxRyjkbwGxprJTGUEjnlFdKpFxyDgZ2/wi7w9eCVx20Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 12:24:26 +0100
Message-Id: <D6LLEUFB3992.32ILPEG9SHGJ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] gettext: upgrade 0.22.5 -> 0.23
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241225103244.3514559-1-marcel@ziswiler.com>
 <D6LJ8P97UJIR.2ZV3G9G2APPTE@bootlin.com>
 <c17236c58b3d7f041746b0ede69c271d1c7f8eed.camel@ziswiler.com>
In-Reply-To: <c17236c58b3d7f041746b0ede69c271d1c7f8eed.camel@ziswiler.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Dec 2024 11:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209090

On Thu Dec 26, 2024 at 11:47 AM CET, Marcel Ziswiler wrote:
> Hi Mathieu
>
> On Thu, 2024-12-26 at 10:42 +0100, Mathieu Dubois-Briand wrote:
> > =C2=A0On Wed Dec 25, 2024 at 11:32 AM CET, Marcel Ziswiler wrote:
> > > Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> > > ---
> > >=20
> >=20
> > Hi Marcel,
> >=20
> > I'm taking this patch in my branch, but just a quick note: it looks lik=
e
> > you setup is breaking the patch format while sending it, so picking it
> > is a bit painful. Particularly, it looks like it drops spaces on line
> > ends, which do mess the changes on patches.
>
> V1 indeed had an issue but V2 I sent straight with patman which uses git =
format-patch and git send-email and
> should not mess with any such.
>
> > Can you fix this for your next patches please ?
>
> I am happy to fix anything but V2 should really apply cleanly, not?

No, I still had the issue. Either using b4 or saving the raw mail, the
patch does not apply. Running:

b4 am -s 20241225103244.3514559-1-marcel@ziswiler.com
git am v2_20241225_marcel_gettext_upgrade_0_22_5_0_23.mbx

The git am fails with:

Applying: gettext: upgrade 0.22.5 -> 0.23
error: patch failed: meta/recipes-core/gettext/gettext/0001-intl-Fix-build-=
failure-with-make-j.patch:1
error: meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-m=
ake-j.patch: patch does not apply
error: patch failed: meta/recipes-core/gettext/gettext/0001-tests-autopoint=
-3-unset-MAKEFLAGS.patch:16
error: meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEF=
LAGS.patch: patch does not apply
error: patch failed: meta/recipes-core/gettext/gettext/parallel.patch:15
error: meta/recipes-core/gettext/gettext/parallel.patch: patch does not app=
ly
error: patch failed: meta/recipes-core/gettext/gettext/serial-tests-config.=
patch:41
error: meta/recipes-core/gettext/gettext/serial-tests-config.patch: patch d=
oes not apply
error: patch failed: meta/recipes-core/gettext/gettext/use-pkgconfig.patch:=
30
error: meta/recipes-core/gettext/gettext/use-pkgconfig.patch: patch does no=
t apply
Patch failed at 0001 gettext: upgrade 0.22.5 -> 0.23

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


