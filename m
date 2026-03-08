Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F44EA852E
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:51:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41438.1772985106777120282
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iWB4a+ep;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8CCEE4E425D4;
	Sun,  8 Mar 2026 15:51:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 610F15FF9D;
	Sun,  8 Mar 2026 15:51:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD84510369874;
	Sun,  8 Mar 2026 16:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772985103; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KNw8ENb8vFv0wJ4mhlg+rYilrjE6g1ngw7tJTaN8zJ0=;
	b=iWB4a+eppQz2Expxvz0Ty1pE3rkPq801Qa8Fw0ksNBq+OazE0TlgTi5W7dW0YWi1V2mAnS
	okxLf7xNrFASSP/cf7MFmRtpg0dZeJzWEPdLIKLkwjA1vWlbQw2BdRLqlVJfnSdplC23RS
	T7F8/x0BwdpKdXwpSPz8TLu9ix43l6Fse7/EYtt8NOFS4ABO34/thvoEqX+/PC5dUY7b92
	BgXOmGBcr56YGoeeqtlkoqUoxTdfl5WlkWQP2i0qg8xSVOl+mXYt0YRj+qgF1e7zBhXHmB
	H/envZeuBWH7ku8b00g9plyCyUwqgnv2mRK60sRQgxX7YXMqSjunGMK2viHnbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 16:51:34 +0100
Message-Id: <DGXIRFZ2TN10.3UAUZL2T4N0K4@bootlin.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-vaapi: remove recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260306022904.1781-1-wangmy@fujitsu.com>
In-Reply-To: <20260306022904.1781-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232661

On Fri Mar 6, 2026 at 3:29 AM CET, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> gstreamer-vappi has been removed in favour of the va plugin and is no lon=
ger
> updated going forward.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch. I note you will also need to remove the
maintainers.inc entry.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


