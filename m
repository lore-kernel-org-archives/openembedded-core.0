Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9281.1795676447496452094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 23:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O8gHAriX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B63404E41775;
	Thu, 26 Nov 2026 07:00:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8390860237;
	Thu, 26 Nov 2026 07:00:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF3EA11E6B295;
	Thu, 26 Nov 2026 08:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795676445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sGVJLtmOMDaH5zeQzgwYrXvH4E8eGpKEgdBDdq3gztQ=;
	b=O8gHAriXQ4uUbc+Y5JYwIs8VxdirnBMIAamb/egUaJd6e2a0JZREO83hnX+E3QQTGCJng0
	Mw5/1QJACCEv+CSA1TXvbjBlTgdtfFTctGAzPKWokb+OjVzIt3j3RlLto9KeN9qmfeK7nC
	LC7DJV2t9NMgoeDu/VnU/hYwdLew4hrmfzyhuChjqeEb6LUMEf7do32DqrLe0HEt6pTTwB
	W0/5UDoa2s9wL50RlbWpNmtjPiLMj3Kvlls9eFhVX3H9T4DOcLlo1NW2Y3zZiUg750KSIT
	GMCgSEAjF3i1lSHOUWONaPUAsbYyOngzmAHUmICJkeFRrD3HR3NsJadGl3AtCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 08:00:41 +0100
Message-Id: <DN4Y68XZKURY.32DWV83QF4P1W@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] gawk: Fix intformat ptest failure with
 clang
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261125165405.2553247-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261125165405.2553247-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 07:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251282

On Wed Nov 25, 2026 at 5:54 PM CET, Khem Raj via openembedded-core wrote:
> format_int() relies on undefined behavior when converting out of range
> doubles to integers, which clang optimizes in a way that makes the
> intformat test fail. Add a patch to range check before converting.
>
> AI-Generated: Uses Claude Code
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

Sorry, it looks like the v1 was merged. Can you send a patch update
instead?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

