Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B19BC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:08:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.1685.1652342900011673449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 01:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V6II5Cra;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8FC491C0009;
	Thu, 12 May 2022 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652342898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MDfJoGTV7RM7BcFZFtcOnlba31x+IaEpHte1prhtI1c=;
	b=V6II5CraOUIajm+2XhrvsphHVldfe63cY5IdxUckFGuGDSb8iTvRrcMnjT48c8kxE587DO
	qGRolKm6e2twoUZzLTcRN6OqVScVWJhJEXW0xxQrtY/dRd/Bc76WiU5SJSLHmpUTuvj4HI
	UTlVEjqhseidE/2UDdBzEDzu2KL4DmqkBlZLOrgjqXeX76THtwKrKuhdjy35YgGYuY4ZYi
	b5nvYE7JmWcM16l8Y4hl8/9dmku9eYhAWm/POVIr3+4r8R+HYRqKJn4OidCbbl1zAxVzR7
	TuLD8HwGXt6kPlJyJbrtjQFDBvOtkH2DlCkVWN9Lh1UVJ916Xsme7pZfli5eow==
Date: Thu, 12 May 2022 10:08:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jonas via lists.openembedded.org"
 <jonas.hoeppner=garz-fricke.com@lists.openembedded.org>
Cc: jonas.hoeppner@garz-fricke.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes/kernel.bbclass: allow disabling
 symlink creation also for pkg_postinst
Message-ID: <20220512100816.69dec8be@melee>
In-Reply-To: <ccb29f6aba164c4fa6ff8a1ae4718c91@garz-fricke.com>
References: <ccb29f6aba164c4fa6ff8a1ae4718c91@garz-fricke.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 08:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165536

Hi Jonas,

Il giorno Wed, 11 May 2022 16:05:39 +0000
"Jonas via lists.openembedded.org"
<jonas.hoeppner=3Dgarz-fricke.com@lists.openembedded.org> ha scritto:

> The commit d7341f1f22c32ff6cc95d7127f26f87d7fc9c6bd has introduced a
> variable to disable the symlink creation for kernel images.
> kernel.bbclass contains code to generate a pkg_posinst step for the
> kernel-image package which will generate a symlink after installation
> on target/during rootfs creation. This part didn't checked the
> KERNEL_IMAGETYPE_SYMLINK variable.
>=20
>=20
> This patch adds this check, so that it is possible to disable this
> symlink also.
>=20
>=20
> Signed-off-by: Jonas H=C3=B6ppner <jonas.hoeppner@garz-fricke.com>

This patch does not apply, apparently because it is not properly
text-encoded. Did you use git send-email to send it?

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

