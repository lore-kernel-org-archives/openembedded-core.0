Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9758.1794998006429305135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 02:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MPqz1iMV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C23DDC4CBEA
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:33:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04A3F5FE9B;
	Wed, 18 Nov 2026 10:33:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41AAE11BC1067;
	Wed, 18 Nov 2026 11:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RaD4Hy80AH0VcbHwZcRKmyhc0U0xKC4bA7pV8ARE0Lg=;
	b=MPqz1iMV+7XfNAGYQyXBOljMmuqPbzWxKDJGTSD/YKqdCHAYYZpNNAUB4kk0meiRXRqk06
	uNkbL/gN78kQyfGuftbEblN0deEAogn+o1sKyzLbVz5IcVUBtWcH6w+n5uts3birfI3wE3
	ZJqWrGGNIP06QQ82aa3hRzHHDaIR7VhzpU6ia7ShpxbLyKcOPMaok1hs9bm6SuYbUecQp6
	RKJbirIsjbnnLgiavdYUu2HH1xix417eQjtJCSSov5rxUm/MalR1QNPcZtKEp54wDtTS42
	pRxl3B+SvlEt2IUnhcPncN1JIh0B/tZVKysoyokFo/Xs401Tgz9er+SbqTILqQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	bastien.jauny@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH 0/2] expat: fix High scored CVEs
Date: Wed, 18 Nov 2026 11:30:40 +0100
Message-ID: <20261118103042.1825679-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250534

Hello,

I previously sent these backports to scarthgap, in two separate mails,
and now I am sending them once again but for blacksail, in a single patch
series.

I tested them with the current latest revision of blacksail ("5b458838c12=
"), building for qemuarm64.

Best regards,

Jo=C3=A3o Marcos Costa (Schneider Electric) (2):
  expat: fix CVE-2026-118370
  expat: fix CVE-2026-117610

 .../expat/expat/CVE-2026-117610.patch         | 30 ++++++++++
 .../expat/expat/CVE-2026-118370-01.patch      | 58 +++++++++++++++++++
 .../expat/expat/CVE-2026-118370-02.patch      | 29 ++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |  3 +
 4 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-01.patc=
h
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-02.patc=
h

--=20
2.55.0

