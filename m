Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E2CC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 07:57:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7264.1788335865126238307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 00:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UOkj5mML;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7DE301A1955
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 07:57:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51D476053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 07:57:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34DE411C78CB6;
	Wed,  2 Sep 2026 09:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788335862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kKqYe84xqi0nSLGj4UuUaNKqxV/UbqCyQZNlPtrn9w0=;
	b=UOkj5mML4NiEE+Mm05GNiEiwFF3FNTTdazFTWZoads56LyWC45p4iWnuUxgYX2CZ1cw/TT
	zWMNOyD2peEr1sbcFlxgwosOzHXEjKcqye7gDWyWvOaXI6Vr808EW0ggpSOSBDvAVhZvuq
	hbLxk5gVjwuEHNuRlmhO2k99V9FZbcZWAEmpAo+KP9pUFsBrZKYGqkEmCn2wzDZ4RCi/fx
	Dz5+IFiXBxoOVYvq84MfMOdRidLg6C/rcYmT9dCxMaDVs+QKSl5NwRIpBNmUzMQsTnS3+a
	K7Pvqh8xlAvD7N0zVpn3yUgXxifPWIHxxsEBLSGDQSsKHp7xnKONbStSFP29GQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 09:57:39 +0200
Message-Id: <DL4O5K8UGHR2.31BMPT5KEGYRU@bootlin.com>
Subject: Re: [PATCH 1/2] libfaketime: Import recipe from meta-oe
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com> <20260901-mathieu-reproducible-faketime-v1-1-eac182548422@bootlin.com>
In-Reply-To: <20260901-mathieu-reproducible-faketime-v1-1-eac182548422@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 07:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244899

On Tue Sep 1, 2026 at 7:41 PM CEST, Mathieu Dubois-Briand wrote:
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  meta/conf/distro/include/maintainers.inc           |  1 +
>  ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 34 ++++++++++++++++=
++++++
>  .../libfaketime/libfaketime_0.9.12.bb              | 31 ++++++++++++++++=
++++
>  3 files changed, 66 insertions(+)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 2966cddc0569..fc57eb1395a1 100644

This is failing on some platforms:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4571
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4571
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4571

I will have a look at that.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


