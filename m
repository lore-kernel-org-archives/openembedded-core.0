Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B06C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 07:16:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9365.1789543011318472500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 00:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wTI5LtMf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0EF951A0792;
	Wed, 16 Sep 2026 07:16:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D643660337;
	Wed, 16 Sep 2026 07:16:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B95411C7AFE2;
	Wed, 16 Sep 2026 09:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789543008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yWxJ/Bdzun6rnF3+VWSWd93oINpHVUL6n+G+D8DtRlg=;
	b=wTI5LtMfYVeEjlbPUL8gHrBCt5BnlHrmz9MBy0V7dYfn9Ih1PvRZJtfKQyS5W34Ra3ddd0
	QI6fIF38pJQIPL6kFc23vvn1pH41Q0W2cYykHa/YPwvXQTLWp655EJjBZBmla225X9VLEi
	+CXU6JGNpmRhY5uFIwNpGbPrI78v7ja/an6N4y/6FVnsmeoqkjIsn+ERQgp5+EnnCk04R0
	hliItqZvcE7hEjD3JQNxFQ0ss9wJsx+dAcpVEdF6zZL8wznLdShxKELabBCmlx64VraZjR
	LsRy1hRg/GBuvFOVGeokMwvHIHEw3rH58FFy7ejgwDRizxeYy6xAcONM7OSG8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 09:16:46 +0200
Message-Id: <DLGK1VZBV39U.7XRHLEI6RC90@bootlin.com>
Cc: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mikko.rapeli@linaro.org>, <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [meta][PATCH 01/02] linux-yocto/6.18: update to
 v6.18.50
References: <18D59CE1160E5503.1924412@lists.openembedded.org>
 <CADkTA4PK+tZuCHuBR4ZPahYUYy4QmYEoz85Vv1q34AT70c8mMg@mail.gmail.com>
 <aqo4hfLnicviWL3O@nuoska>
In-Reply-To: <aqo4hfLnicviWL3O@nuoska>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245932

On Wed Sep 16, 2026 at 8:34 AM CEST, Mikko Rapeli via lists.openembedded.or=
g wrote:
> Hi Bruce,
>
> On Tue, Sep 15, 2026 at 05:50:36PM -0400, Bruce Ashfield via lists.openem=
bedded.org wrote:
>> There's no second patch coming, it went to the yocto list for BSPs!
>
> I don't see the yocto-bsp side patch in https://lists.yoctoproject.org/g/=
poky/messages list
> archives. Same was with previous kernel update series.
>
> Maybe they just went to Richard directly?

It was sent the yocto list:
https://lore.kernel.org/r/20260915214911.1095011-1-bruce.ashfield@gmail.com

Antonin

