Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EE5CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 10:10:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12107.1781691000213205623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 03:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CVbnMac3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E070A1A394D;
	Wed, 17 Jun 2026 10:09:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB5BF601AA;
	Wed, 17 Jun 2026 10:09:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67C0F106C8F96;
	Wed, 17 Jun 2026 12:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781690997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UnN1NkPSppBjy+q6TsDXf3TTmUh6z1VnrpJ8X7vMCFE=;
	b=CVbnMac3ROzPtk066OAqeGH8ErcGS0P/GxbH4PUncOVFxbF2K6W/3SuPJPApa6AhzPbOqq
	SjGeRd4s/dp2fihsgkltOUGOJaOM6Dy1II+mm03U23d93hSIApvAu+SeeBSyWIkvIitNAb
	Zha3TjTMSjkF0swCvIS9UrN9bRSBOHccw0qRHH/au98THlGIqEEdCaq1tmrXS0yFltqQIM
	VGJoZPRD3No5nXezMtk17k968n+MQ6GO4iBXuHzqj2xWH7dyNZadB/lqWLfhD7oKLfNfyv
	hL+VAKH0bWvXVweBFjbLqcZnKJFDliNWvAO8MUjSWCPdHrzv3AAGUgfofcVEzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 12:09:49 +0200
Message-Id: <DJB8QT5HS9IM.PKY4DYL0A5XC@bootlin.com>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade GCC to 15.3 release
Cc: <Sundeep.Kokkonda@windriver.com>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260617054716.1343535-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260617054716.1343535-1-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 10:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239028

On Wed Jun 17, 2026 at 7:47 AM CEST, Hemanth Kumar M D via lists.openembedd=
ed.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> - Added support for AVR32EB14/20/28/32, AVR16LA14/20/28/32, and
>   AVR32LA14/20/28/32 devices
> - Added IEEE double functions sincos and sincosl support
>
> * Drop backports available in this release.
>
> Release notes: https://gcc.gnu.org/gcc-15/changes.html
> Docs: https://gcc.gnu.org/onlinedocs/15.3.0/
> Bug fixes: https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED=
&list_id=3D522382&resolution=3DFIXED&target_milestone=3D15.3
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---

Hi Hemanth,

I believe we are using gcc 16.1 in master. Is that a patch for wrynose?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


