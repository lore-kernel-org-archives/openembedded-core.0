Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63185CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 11:24:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.20296.1758108289540013166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 04:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nSs8yutq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE1764E40CAB;
	Wed, 17 Sep 2025 11:24:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 942F56063E;
	Wed, 17 Sep 2025 11:24:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7450B102F1A4E;
	Wed, 17 Sep 2025 13:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758108286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9z7DZ2XcvxTYcOnBHHoSmf5gYuLXpv0+Tq1XvzSd1j8=;
	b=nSs8yutqkPoWiHCaYjzWYgRzVVpxiMjuhvkFL1npkjNlvK4X5SsEKhbnAu+1vF3qqdP6bX
	NYbEqGJsCIvB7IbdiGXiQ4HI+vpyaBsMk3Xoa0gUL5Vkdg+nKnuq3pPvnkBZxHnqsIR4zQ
	WI6eR6UK4F42kAyXj8A4jUv3ht2R0K2XcsAPtmbVwSedF+zBC3Qqirrcj3zLfzLvnNal+t
	jgAvisc4YNBRY8s70bF+Cb2eD/iSlPlwO/xbmING6+2KxSyYpQdenyrkakUD6x0BxZSEvS
	iphbbOB7x0RgWSHUJHN7Jm/27oSNaT/ufk9kADHKWEbfbuZ2k/sUpXmp+g4qCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Sep 2025 13:24:42 +0200
Message-Id: <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/8] debug_build.inc: collect debug build
 tuning configuration
Cc: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
 <20250916040927.103722-4-hongxu.jia@windriver.com>
In-Reply-To: <20250916040927.103722-4-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 11:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223592

On Tue Sep 16, 2025 at 6:09 AM CEST, hongxu via lists.openembedded.org wrot=
e:
> The modern compilers and code seem to require extra steps to avoid DEBUG =
errors,
> Move debug tuning configuration from recipes to an include file to addres=
s these
> errors.
>
> Introduce separate variables to avoid the :remove operations, such DEBUG_=
OPTLEVEL,
> BUILD_OPTLEVEL and OECMAKE_WEBKIT_NO_INLINE_HINTS
>
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Just a note about this patches: I had perf reproducibility issues [1][2]
after taking this series and I believe this is linked with this patch. I
suspect this is not directly related with it, but more with the issue we
have had with perf reproducibility last week.

So I dropped this patch for now, but I will take it a bit later this
week and try to go further. I still wanted to provide some feedback
here. Also, if anyone believes this issue IS related with this series,
please share your thoughts.

[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2505
[2] http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss72v=
ce/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


