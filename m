Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8927D61037
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 06:52:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5392.1769755945973599928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 22:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F69doHPG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A4C224E42336
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 06:52:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62DCA6075A;
	Fri, 30 Jan 2026 06:52:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C8AD119A8850;
	Fri, 30 Jan 2026 07:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769755942; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q29GOujaH6PA+PuzO9e2xcnfetTDfaYDB73kTgmHhog=;
	b=F69doHPGIFyPL0FssEbiJPFF8DLtWJ8CpMXq0kFbUxmqTnUzWOvdRb6FSjXzvoTxG1o2fC
	WP1yzMQ6oJKoPQWm6iqnlCqDeO3WMvCws+isyJa1/dGgIbcmn/Hize4tlB163DDtegSWRk
	7TACN993ma7G7LutgSFww3hkhWcxRFU+gaJtndkd+ykmkJc5Rdenf02ZshToJWjqjWZ3ex
	ULElV58f+jFa8aaJ6cYwYzAEEWZ5KtVw0uUkPZ4aRxBl6wXoz9Drc73h+h/g8SNSpN9yuh
	AT8lyKHPOWBBA9fS8ZjLSWZVAsDvP0Hilphz+HviZTEuH/tywweHhzjHPRF8IA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 07:52:19 +0100
Message-Id: <DG1Q4EY7OR7K.MLWU6BOS79XI@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] python3-packaging: upgrade 25.0 -> 26.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260129031243.1180-1-wangmy@fujitsu.com>
In-Reply-To: <20260129031243.1180-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 06:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230178

On Thu Jan 29, 2026 at 4:12 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the new version.

> @@ -36,6 +36,7 @@ RDEPENDS:${PN}-ptest =3D "\
>      python3-pretend \
>      python3-pytest \
>      python3-unittest-automake-output \
> +    python3-tomli-w \

Sorry, but except if I'm missing something, the python3-tomli-w recipe
is part of meta-openmebedded: you can't just add a dependency on it in
oe-core. Either we have to find a way to make it optional or we have to
import it in oe-core.

As this is for ptest, is it used for all ptests, or just a few ones that
could be disabled?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


