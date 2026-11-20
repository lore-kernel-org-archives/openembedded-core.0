Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.524.1795195302836077830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 09:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=L6HLaSHw;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3F73C6221F
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 17:21:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 337FB601B9;
	Fri, 20 Nov 2026 17:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B217C11BC04D7;
	Fri, 20 Nov 2026 18:21:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795195295; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gFo7GcFRB80oSK8lQeHhkGGsZCLlit2uq16HXawAeqE=;
	b=L6HLaSHwjBRljXFsnT/5ffeZIMlwjnb0c2Vu86qFnrgSGLrFoAhyDqfiT4E0kPL3Ei7HbJ
	MUHIvKL0g+KlnwsQp4F/BLLMIPFR5k47+eoOv9QgiecoPMQrty/QSS31vwYo+RhZCUnxb1
	kztx8693Iq7op6k4np32uMh9J41/I5rLRobYpWlRKd5Em//RRidJjhYYd+jTM/AFSL8UgJ
	cbByMBQhmup4m8N1YRHCnckaOH9mKPl5ZqliZW0fgXrp6f92Ghkcdx2rvYTi+39+vYr+5e
	7DmpSxXJlh9nbJu0F1hdkR5j9y3+X0ZK5K9PDPHjZ9B93DWsV2t+UheIxaepgA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	bastien.jauny@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH 0/4] curl: fix High scored CVEs
Date: Fri, 20 Nov 2026 18:21:22 +0100
Message-ID: <20261120172126.3187901-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 17:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250819

Hello,

The original commits applied mostly cleanly, so there's no really
noteworthy conflict fixed for these backports.

Best regards,

Jo=C3=A3o Marcos Costa (Schneider Electric) (4):
  curl: fix CVE-2026-87865
  curl: fix CVE-2026-92386
  curl: fix CVE-2026-92391
  curl: fix CVE-2026-94266

 .../curl/curl/CVE-2026-87865.patch            | 216 +++++++++++++++++
 .../curl/curl/CVE-2026-92386.patch            |  33 +++
 .../curl/curl/CVE-2026-92391.patch            | 200 ++++++++++++++++
 .../curl/curl/CVE-2026-94266.patch            | 220 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   4 +
 5 files changed, 673 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266.patch

--=20
2.55.0

