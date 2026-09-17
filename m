Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4439C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 14:37:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41329.1789655840679077342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 07:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IHO4oeMO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B2B91A0936
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F55A5FAA3;
	Thu, 17 Sep 2026 14:37:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D120311C7B064;
	Thu, 17 Sep 2026 16:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789655837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IJI4ZRMwYg3wOclsnSegjIu+OdjFCibxp5JvsRIGPUo=;
	b=IHO4oeMORDlKs1CQlGQjqlZ4Tx3Pjq6+Bkew5dQul5YITGO1zulWsBHAjSzJ66bG+8g1oS
	Wdn/OyVpD6ehPtf+LTisouDx5hrUi6Xtn0BV93JntpU+UmCYw1b3CkyvcvrUUpBfPEwQzn
	CEVBZh1S2HC0sq9h+gUC41UsJ65w81ZwWUSGZukRkAJaZtje+aCWjxib4ZW2nDzzQ0n86l
	/iN3iXhwf6235e4F2D6MRhLNftqJ+XdbRyHv+/wP0Y/V5MB/+8GwAqk0z57EXqZwXnRMhy
	csLUKrWSdT55GuJDsQD+b8SBFFoAi44EXEV9NAe5euwDW4bY7xOA9NImQ8H/wA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 16:37:16 +0200
Message-Id: <DLHO1P7BT6HO.339WDP5TPGJBK@bootlin.com>
Subject: Re: [OE-core] [meta][PATCH 03/06] linux-yocto/7.2: update to v7.2.6
Cc: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
References: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
 <20260917051340.1472139-4-bruce.ashfield@gmail.com>
 <DLHND5FZBEYT.3LPLI9L0JOBP5@bootlin.com>
 <CADkTA4MFxHuCVX-WNcma1Q7AzUwupf73MZTb76+W4kvZ3BQtEA@mail.gmail.com>
In-Reply-To: <CADkTA4MFxHuCVX-WNcma1Q7AzUwupf73MZTb76+W4kvZ3BQtEA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246071

On Thu Sep 17, 2026 at 4:13 PM CEST, Bruce Ashfield wrote:
> On Thu, Sep 17, 2026 at 10:05=E2=80=AFAM Antonin Godard <antonin.godard@b=
ootlin.com>
> wrote:
>
>> Hi,
>>
>> Am I missing something or this series is missing a patch to meta-yocto-b=
sp
>> to
>> update SRCREV_machine:genericarm64 to 7.2.6?
>>
>
> yup. I didn't the bump, but in my rush to generate the series, I didn't
> send it out.
>
> It'll arrive shortly, I just rebased and re-generated it.

Great thanks, received :)

Antonin

