Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6284.1793344308477143558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1UjxGVQh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B3BF44E4139A;
	Fri, 30 Oct 2026 07:11:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78A47603C2;
	Fri, 30 Oct 2026 07:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7D26103287DA;
	Fri, 30 Oct 2026 08:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793344305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yj/RmdyfkPXQ02FhNnsgBFELsgJgEqfI2qL8Hf6yhJU=;
	b=1UjxGVQhZJwKZhZMSjiVGqjvssPPZ3/ItMstZzRjRGYV3QVaA/1Poj7tj3/tZ2MyknpTKi
	TsszKYonJkHEEp1IaUaMDWr/8aDMC8mus9FvwLtzB3KndwTnHHbe+x3fEm5irBWiK6+8Qt
	x0gjR2ExMtgLirTc5faaSX0C2jCtTZ6MEXW5fxeyl/QNsBbTw6PqUry9OK1kyIqiA9RyJP
	erL3DNJoV/rc96qOcEC2mHJQcqJEK5lgwbfONo4VYsGJYTvIpGIWse+n3WuPGWuc4ORZpb
	e9zaI7zpb9UjqTAMgo7AOBb9mCE3Ymkv3IUaHTGW0Nc0RnJfWPHZlDo+q9Cfmw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 08:11:41 +0100
Message-Id: <DMHZHYL1PXD1.KB99W7BEUE3U@bootlin.com>
Cc: "stondo@gmail.com" <stondo@gmail.com>, "JPEWhacker@gmail.com"
 <JPEWhacker@gmail.com>, "Paul Barker" <paul@pbarker.dev>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <kazuyoshi_akiyama@jp.honda>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] spdx30_tasks: Fix duplicated revision in Git
 PURLs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <TYYP301MB1158B7A88A133C646658C16AEBAF2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM> <CAJdd5GZSuNS-ykMbZQc82aAqSmnGdv6-q0r7qfLUpjr_tBLiAA@mail.gmail.com> <TYYP301MB11587036529EF529116C88DDEB6D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <TYYP301MB11587036529EF529116C88DDEB6D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248992

On Fri Oct 30, 2026 at 1:09 AM CET, KAZUYOSHI AKIYAMA via openembedded-core=
 wrote:
> Hi,
>
> A gentle ping on this patch.
>
> Joshua reviewed it with "LGTM" and a Reviewed-by tag, but it still
> appears to be waiting for merge.
>
> Would it be possible to pick this up for master when you have a chance?
>

Hi,

I believe your patch already landed into master:
https://git.openembedded.org/openembedded-core/commit/?id=3De31479ddbaf5

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

