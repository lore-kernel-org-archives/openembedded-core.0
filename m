Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF26D5B844
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 15:54:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52192.1765814071715604787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 07:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=VNEcx8vc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 94F344E41C1A;
	Mon, 15 Dec 2025 15:54:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A32760664;
	Mon, 15 Dec 2025 15:54:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7AC0119426CB;
	Mon, 15 Dec 2025 16:54:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765814069; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=FD7f4D2qoYrw+oPStEi/zJh0YDXT6qa7yXCGnhxKxRs=;
	b=VNEcx8vcZzjl1yFaq1yDp8v61cD7kZHZeZVtNRNVbK2lr84VHkEpxNDdc2e/EvHSTmwwUB
	IVheG9Tq7187Ys8booQyR/8mg3xR7tmwP0nKaY8FCxyHQquggU2WYuyWoQgGNMZr7Nojao
	Eyb2XjdszNFuCKVGmAad79rxisu9ZJOv9Kvk2+JxXmzWmQXXHlUgPV2FoTlGeHtCV1IfDM
	YOzGOLK0jDB+cJJg6ZK6y+41u65u9noiB1xgNYJS38JkDjuxLsSqyMMw/gI+w0ZfvLW90T
	c5yDUASuodQK1ZdCJYxl5pLf0QCqWjfHvvztIXOtGD+T5rzLxOhD848cfEBCsg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [scarthgap 0/3] Backport SPDX kernel config and PACKAGECONFIG metadata export
Date: Mon, 15 Dec 2025 16:54:21 +0100
Message-ID: <20251215155424.237662-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 15:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227743

Hello,

This series backports upstream commits that add support for exporting ker=
nel
configuration and PACKAGECONFIG features to SPDX 3.0 documents.

Upstream commits:
- 228a968e7c47 ("kernel.bbclass: Add task to export kernel configuration =
to SPDX")
- 7ec61ac40345 ("spdx30_tasks: Add support for exporting PACKAGECONFIG to=
 SPDX")
- 2f0ab110d752 ("oeqa/selftest: oe-selftest: Add SPDX tests for kernel co=
nfig and PACKAGECONFIG")

Kamel Bouhara (Schneider Electric) (3):
  kernel.bbclass: Add task to export kernel configuration to SPDX
  spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
  oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and
    PACKAGECONFIG

 meta/classes-recipe/kernel.bbclass   | 64 ++++++++++++++++++++++++++++
 meta/classes/create-spdx-3.0.bbclass | 11 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 +++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 57 +++++++++++++++++++++++++
 4 files changed, 152 insertions(+)

--
2.43.0


