Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8410.1794990690374645927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 00:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AZZZ/vio;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E40074E4160A;
	Wed, 18 Nov 2026 08:31:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B313C5FE9B;
	Wed, 18 Nov 2026 08:31:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCAFA11BC0840;
	Wed, 18 Nov 2026 09:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794990686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3kvzt2uwQgGiC35EKbFQ7o8kXdRgx5GbfokE38ePSLA=;
	b=AZZZ/vioeRJR+1bwG8Yg+CA4J+fY2VeZulnPLaXV49Ys2VHIuT2xyOzNlMScvO5bYr/lpC
	oLDK8SnstQ+v7zk3XGw5kHgP4Zb1+BcO3E6tVyMo+J2SACfrYMxeSinXKnLj0jXdMxY5Tn
	Qq9Nv9EhRAifQWX0gEmA3G+WhHMttGTCbfk6Q0bkyMYXbSgWztU8a/xMYGeSAP1DdeqvLe
	fOHdCSZlpKkIKHysoYGZPayc0Cfzp7mE5snQrpN2otySPggx3p2qIksWGnl6UkBavs7KuW
	hUq3MBVM094PGR53PVSuimRelCgKfkBQeviUHhklQ91y2PLdfJjpQ7TwngnqYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 09:31:24 +0100
Message-Id: <DMY73CFR1R67.2FQZ0MVR8OBQO@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] grub: update upstream-check
Cc: "Jon Mason" <jon.mason@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Ross Burton"
 <ross.burton@arm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261116224959.197150-1-peter.marko@siemens.com>
 <DMXPGW66H9CP.1ATNO2XD1FDS3@bootlin.com>
 <AS8PR10MB5073C3B1CE0C6A89575674ECFD7B2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM> <AS8PR10MB50736BF5EC4386E69FCA7B2DFD7B2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50736BF5EC4386E69FCA7B2DFD7B2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 08:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250523

On Tue Nov 17, 2026 at 10:14 PM CET, Peter Marko wrote:
> OK, the commit was already reverted meanwhile
> https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/711110daccaf15df695=
b270d13f76b5bc84a64dd
> https://gitlab.freedesktop.org/gnu-grub/grub/-/merge_requests/274
>
> I'll send a v2 with this commit picked.
>

Thanks! I saw the v2, I will grab it a bit later today.

