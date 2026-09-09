Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637C7C79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 06:23:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5633.1788935016377628582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 23:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kOQruq23;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1C1701A1A74
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 06:23:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC3A260448;
	Wed,  9 Sep 2026 06:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95C1911C7AF25;
	Wed,  9 Sep 2026 08:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788935013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QqAZALiWbNla9Qji0UpW9V5hnS6TIAETZoTqyiU8i0E=;
	b=kOQruq23E1ouJ//mnR863/ZAO+c9w3pQlpJNZzr8eJpqeQtPmVj4XidIvW9+LcXlIZR3qg
	1QOw0C8iEZFtRj5iHQx6mRNMY2W2kdYM8w/TfuYBR5Z6Cf1amT5SpQsoSSSlu1QT42lGbu
	QAH+4Urrg0f446sRHHtjqkwjY63xcbsvCqoZfnBGwzn/DYO3YS1bdXw6e5pGmawHBQXwg9
	mEo5upqAp8HjtuKLI5lF/Si3g5eFDTqJsmUzEtrAUunCLrjiG4nCEuBOGCFh00copIhN79
	ugbw9Z5NHLssArQHfaaKp1LBRqpBdKAm46U5DFCGSeNNkxEnjt1JpRTbLcYUCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 08:23:31 +0200
Message-Id: <DLAKJAXKRIBT.3LH9O2N8G34TD@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/4] libfaketime: Import recipe from
 meta-oe
Cc: <openembedded-core@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-mathieu-reproducible-faketime-v3-0-03a856c33239@bootlin.com> <20260908-mathieu-reproducible-faketime-v3-1-03a856c33239@bootlin.com> <CAMKF1spk2s1h7yA5F8YfDQpKn_ho_cDgPj0cM2E49Q__0A2yyw@mail.gmail.com>
In-Reply-To: <CAMKF1spk2s1h7yA5F8YfDQpKn_ho_cDgPj0cM2E49Q__0A2yyw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 06:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245406

On Tue Sep 8, 2026 at 7:14 PM CEST, Khem Raj wrote:
> I have sent another patch to meta-oe to upgrade and also fix the build wi=
th
> clang23, please consider the change in that as well before you bring
> this to core.
>

Thanks, I will make sure to import the patch.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


