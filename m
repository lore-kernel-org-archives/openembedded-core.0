Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853D9C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:00:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.8916.1661331649519486484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V9QD96VX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D634AE000B;
	Wed, 24 Aug 2022 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661331647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpmqQXH0n3MF0zySKRV9Y4j0VXjG5uv14lnOH3a/ORs=;
	b=V9QD96VX+0MFsZ8g3bYZvxXokon2ts4qzTothTWv373UQNmmP4QFYwYKsrigywrX/OEPLn
	D12whRla6WyhSsZPlq3P3MA/4J11ZaY76SwX6wvaTLQW4NQc0q91XgBeQfDCuSCi6E11P1
	lRAVTMPrw8XBq26ClI/djMBujOPZ5fX8xZXtddoStcumaEjD+JRV4k1ZKL9gF0P65UAS+c
	p6UIDGhP0yxJ7Kw6q3S9eWra6cK8UW3M+m3FoPzPpwKdMQJ3g38Scyf8uS4gqtFr/IROb3
	jSQaZ85lrBFizZRXCsxBw1Z81/lxsDvvWPc+SI/+lylNTOZvJYh9Pi0FvB4NjA==
Date: Wed, 24 Aug 2022 11:00:43 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Bernhard =?UTF-8?Q?Rosenkr=C3=A4nzer?= via lists.openembedded.org"
 <bernhard.rosenkraenzer.ext=huawei.com@lists.openembedded.org>
Cc: bernhard.rosenkraenzer.ext@huawei.com,
 openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Update to 12.2
Message-ID: <20220824110043.06f45941@booty>
In-Reply-To: <20220823173616.2561114-1-bernhard.rosenkraenzer.ext@huawei.com>
References: <20220823173616.2561114-1-bernhard.rosenkraenzer.ext@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:00:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169799

Hello Bernhard,

On Tue, 23 Aug 2022 19:36:16 +0200
Bernhard Rosenkr=C3=A4nzer via lists.openembedded.org
<bernhard.rosenkraenzer.ext=3Dhuawei.com@lists.openembedded.org> wrote:

> Update gcc to 12.2, drop
> 0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
> (which is already in 12.2)
>=20
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@hua=
wei.com>

Khem Raj sent another patch that looks identical (except for updating
maintainers.inc as well) and triggered some failures. You might want to
see that thread any maybe sync with Khem to avoid duplicate work:

https://lists.openembedded.org/g/openembedded-core/message/169651

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

