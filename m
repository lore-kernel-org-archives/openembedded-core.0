Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41716.1795613241319674260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 05:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=lHKwA7Ip;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 002601A17EE
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1C8860480;
	Wed, 25 Nov 2026 13:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EC8911E68463;
	Wed, 25 Nov 2026 14:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795613234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=VjH/u21o2jbkVfsIiqJCHGy3gBCkXitH3of/QjubTqs=;
	b=lHKwA7Ipze2QKoNNGjWYI1lnZOpx4ZgsuTST9hiQ1Ug9dihgqno6nRi2VeMjcOEmOL+q4S
	qjqwl9GATT9bzv4sd8wDG093MpxPJqOwS/Yw+KfhhJwVE2KkzpGgaJNs5hjTTmTH7FRE6G
	4Wp+ZzE90vb5wK7aJ+1NTicEgoNVMXByQz+bln0V6/NNzBYK9DUh4TlnyaumKS6M7VVO8+
	uSwj6KselKseQyAP7an92cxkCdf9pSBsH9neNk+o9a9+m9droII2gwS+klMXjq8ldL9Ekp
	XwgebhcwnQwSk3Mlc+vGcHJawThlc0eGQPMq35p7GPCrJCQ8ZW6tUPQ4OZS2aA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH v2 0/4] curl: fix High scored CVEs
Date: Wed, 25 Nov 2026 14:26:15 +0100
Message-ID: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251183

Hello,

The original commits applied mostly cleanly, so there's no really
noteworthy conflict fixed for these backports.

Best regards,

Changes since v1:
- fixed the erroneous removal of lib500{0,4}.c at CVE-2026-92391.patch

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

