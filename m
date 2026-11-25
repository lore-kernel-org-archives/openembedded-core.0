Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43408.1795618514281581919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 06:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=d1pVonYc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C940D4E4177F;
	Wed, 25 Nov 2026 14:55:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9048E60480;
	Wed, 25 Nov 2026 14:55:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10B5C11E697F2;
	Wed, 25 Nov 2026 15:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795618507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sT7nxxyA8cKbu9sH4V/1Gwc37CpuIGkNChsBbLMrJiU=;
	b=d1pVonYcCU6Psj1FXT94BDe0fKQo0cI9/PmOt8yElFjfoNka9+K45iyW3j3wzIkIF6m1DG
	mfwl2sNm39Scbcz6qrsufqqllPU+wVLzGNRu7kBZ0/jZWKVOcGZbaB6it5yq7//em/n2Np
	qwPfaCnEk4SsGvLvXz7wb/X58WgYId/ss6hWtvp/AJY1KSqmN9WR4wpm618qc98cm7KfWp
	mBSsNF84/LplwF7KXUys7uFLtO0nAknymYscmWw9z8Y1iBXOCfVQ1h0yy0+w1QE63Wb3a1
	ULDZFTSUqRNSt/KrrV080/QTPKkHe6JL6GZXrUP1krRdwRCySR4tlXlDvbqXfg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH v2 0/3] sqlite3: fix multiple High scored CVEs
Date: Wed, 25 Nov 2026 15:52:36 +0100
Message-ID: <20261125145239.4173659-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 14:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251191

Hello,

These backports focus on the actual fix, ported from the original file
(e.g. ext/session/sqlite3session.c) to sqlite3.c respecting the amalgamat=
ed SQLite layout,
and do not include the changes in files such as 'manifest' and 'manifest.=
uuid'.

Best regards,

Changes since v1:
- split the previous CVE-2026-119374-pre.patch into two patches (thus
  pre1 and pre2) as the original content comes from 2 different commits.

Jo=C3=A3o Marcos Costa (Schneider Electric) (3):
  sqlite3: fix CVE-2026-119373
  sqlite3: fix CVE-2026-119374
  sqlite3: fix CVE-2026-119379

 .../sqlite/sqlite3/CVE-2026-119373.patch      | 48 +++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374-pre1.patch | 48 +++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374-pre2.patch | 63 +++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 67 ++++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  7 +-
 6 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.p=
atch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-p=
re1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-p=
re2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.p=
atch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.p=
atch

--=20
2.55.0

