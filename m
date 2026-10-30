Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10523.1793364235217029539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 05:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mHgifgSq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68EA4C49F4C
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:44:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 84E19603C2;
	Fri, 30 Oct 2026 12:43:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1B2610329127;
	Fri, 30 Oct 2026 13:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793364228; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vQoz8LouurN19BcBSsA8Oh8mcRx7t87sSC8cipTCW+Y=;
	b=mHgifgSqHG9cDc3MxU/xflgioxbjz1UrWesm+V61+TQC+z0+IKWp8bc+tL5F0aWpiHnjwW
	Yl6lpVuOVPqdORh4NFZKlaeqCePw+hKFtiNXuGmTtidyVoFIIekuv5wLaMceXwvuyVfK/2
	Y6zTSEwYwbT8gMn+92gefmkUAwsS95E9z9rbiQrO28a+XFUfO1EeOg8rUXLHq6urRvc25Y
	fWFOsH08PyQQxk7eUcTPaL2OBQv2Fw6TDnUNs+hsmJYTLWA6tkI0SFtNru68VlSlmjkzgq
	ByMiD+ZzrsEF6ci4XsdyNdDA92wgGcQN01cY2ybD+toxX3BvqaSjAQKCELHZSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 13:43:46 +0100
Message-Id: <DMI6K7XT8EM0.ZJ1W9A7KKD24@bootlin.com>
Subject: Re: [OE-core] [PATCH scarthgap] b4-config: Add configuration for
 scarthgap
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
References: <20261023-b4-scarthgap-v1-1-6a85c3fec09e@pbarker.dev>
In-Reply-To: <20261023-b4-scarthgap-v1-1-6a85c3fec09e@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249033

On Fri Oct 23, 2026 at 12:41 PM CEST, Paul Barker wrote:
> This should simplify sending patches for scarthgap using `b4`.
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  .b4-config | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 000000000000..5876a9f2691d
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,4 @@
> +[b4]
> +  send-series-to =3D openembedded-core@lists.openembedded.org
> +  prep-pre-flight-checks =3D disable-needs-auto-to-cc, disable-needs-che=
cking
> +  send-prefixes =3D scarthgap

There's also send-presubject added in v0.16 in case we want to set [scarthg=
ap]
before [PATCH]. Not that it matters much though.

Antonin
