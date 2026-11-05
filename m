Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35392.1793888325248048487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ShJE4WhY;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 13899C69159;
	Thu,  5 Nov 2026 14:18:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF16D5FF85;
	Thu,  5 Nov 2026 14:18:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5B1410329258;
	Thu,  5 Nov 2026 15:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793888322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CyFnPUqrWYIXx03yqB65QRfuY0kafkjIJDaruFF9dis=;
	b=ShJE4WhYM1DEiqKjiGx4gU05kxcLryRCVFRqcWSizj3PTBnCXgCg0qSUNSsWG0xvbW4uqC
	bFO91YlqXtzFvqoaQgr9yEyzfiO04+pKw8wMzzzHqqUILXc7f4KQ2fwNDybLEk08TOs46H
	8wX+Ht4f3k+QMiVwKiv2DSO+F/sv9vyll0oNvhZhi0dfOE18xUGaUaBpu6FiFvdeI1yCQ0
	xSu+BEnDycpIRpoKoxJpZPLdfAHHzGZLFea6QzVAq/CexTLqxpenECNgwUw2kw7+1EPnak
	I323gYM85V6nfYa6EUgus5t+lrZ7je30wn5KJR3BJADw2AFyLHKIVc91MuMdKQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 0/3] sqlite3: fix multiple High scored CVEs
Date: Thu,  5 Nov 2026 15:18:24 +0100
Message-ID: <20261105141827.2142719-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249553

Hello,

These backports focus on the actual fix, ported from the original file
(e.g. ext/session/sqlite3session.c) to sqlite3.c respecting the amalgamat=
ed SQLite layout,
and do not include the changes in files such as 'manifest' and 'manifest.=
uuid'.

Best regards,

Jo=C3=A3o Marcos Costa (Schneider Electric) (3):
  sqlite3: fix CVE-2026-119373
  sqlite3: fix CVE-2026-119374
  sqlite3: fix CVE-2026-119379

 .../sqlite/sqlite3/CVE-2026-119373.patch      | 48 ++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374-pre.patch  | 73 +++++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 67 +++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 70 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  6 +-
 5 files changed, 263 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.p=
atch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-p=
re.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.p=
atch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.p=
atch

--=20
2.55.0

