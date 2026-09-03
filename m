Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A154EC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 07:13:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2264.1788419595231239637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 00:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=m8ZcTpmF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8BEB1A1973;
	Thu,  3 Sep 2026 07:13:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7436602B8;
	Thu,  3 Sep 2026 07:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 574F011C79881;
	Thu,  3 Sep 2026 09:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788419592; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2GIwnapoN96PRzrzs+woiwXc991TFKv+r93jtncbEKk=;
	b=m8ZcTpmF1V5YsOUl89cm3U6brHzRU4RtWX3IVkYJIIbhI5/zlpif5weugdeclfNv4ifFH+
	iGR6mCLKI1QbCePBtQvQevVFE07r6ik3ws4IBBK/3LfLlrvaD/x6MFELcnytlXgyPgVCe6
	iCtjkz0J0UeC75LdJXEBPd+Spkk9iq/n2HGEA/yQfv47MfqmQV3bjN8BivvGLeGj6wY/z9
	2RU/pkzu2UlVykLMX4Uc94D3btZe7iyKOzchqHtd7MolssF/Ko9rEofvi0C9U2VT3DHeFu
	hApOXu8MZF5wJAqve55DN+C8Wc3UcqmqDubdUly4KPKIINhdg5gOYZGCv+uVmA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 09:13:10 +0200
Message-Id: <DL5HU1HRCYK4.1FCQM3U3M7VIB@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] openssl: use nonarch_libdir for openssldir
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jaeyoon.jung@lge.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260902100013.2136263-1-jaeyoon.jung@lge.com>
In-Reply-To: <20260902100013.2136263-1-jaeyoon.jung@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 07:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245011

On Wed Sep 2, 2026 at 12:00 PM CEST, Jaeyoon Jung (LGE) via lists.openembed=
ded.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> Set openssldir to ${nonarch_libdir}/ssl-3 instead of ${libdir}/ssl-3
> as the contents of this directory do not vary between non-multilib and
> multilib builds.
>
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---

Hi Jaeyoon,

Thanks for the new version. It is conflicting with 4.0 upgrade of
openssl, can you rebase on today master branch and send a new version if
it's still needed?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


