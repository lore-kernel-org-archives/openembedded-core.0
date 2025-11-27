Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BFAD116EA
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 11:00:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16160.1764241225810270071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 03:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=lyqwRlr4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C2551A1DBB;
	Thu, 27 Nov 2025 11:00:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 621486068C;
	Thu, 27 Nov 2025 11:00:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73AE5102F2753;
	Thu, 27 Nov 2025 12:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764241222; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8reKqpuyK6tBjrGQvzTyZUNbHkWPKRzXEpfvxps/3yY=;
	b=lyqwRlr4LGQbojnyvjGdocO3RXUWHJM6gt1tbcZDGWCbL20zPVDP7y8KomIIQVSCEoP+H+
	CNBG+F+LekN7Degr4Qo9V/W5pZZvPNLCye+6sAGVEeQBmXv0mxHXG0Iq9JPZWQ3iHgrWpm
	OA1rXmLKb+zo6dmA/c+7FETriNBmak8Bb1ld6fuSrKT0g8Dh6IW4spvCQHSXTr4/EjjWfT
	rfyVS318HCZuYH467DN4QM7m4FWY68/rykNPIx7wQp791eV9XluIKB+GRLCg2dvxrkSCGj
	mxkumIHWB5SM6tb35EDzxLVGVqet64c+daBN/EH+gYGhq2LmeUunQUqS+32JUA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH v4 0/3] spdx3: Add optional support for exporting build-time configuration metadata
Date: Thu, 27 Nov 2025 12:00:15 +0100
Message-ID: <20251127110018.183232-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 11:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226833

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Hello,

v4 adds selftests to the spdx3 export series:

    - Tests for kernel configuration export (SPDX_INCLUDE_KERNEL_CONFIG)
    - Tests for PACKAGECONFIG feature export (SPDX_INCLUDE_PACKAGECONFIG)

For context, see:
https://lists.openembedded.org/g/openembedded-core/message/222245

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


