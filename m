Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25150CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11161.1762521308832832664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=sHF3RrFP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ABCEE1A1921;
	Fri,  7 Nov 2025 13:15:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81680606A6;
	Fri,  7 Nov 2025 13:15:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C499411851D00;
	Fri,  7 Nov 2025 14:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521305; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=JymAE4UZFwfEE2VocIDwpxAi098hyKM8DAOpX3IpKSQ=;
	b=sHF3RrFPs01C+Obhs0ddj7wKe59GqfaZ6WEc1IuGqGPV8JuE0aG6Z9k2n+XmlTUPhJJJGa
	Y38ghn0rAPUP2GPIYphiYKqd5h3r4xC1V/CfrhqxYphDU1uqmlwOfYLfqtMXNoelZYmt05
	wnHYqD/0yMcZCs+gliCfwzAOfs1lEgXXVCetpVX16RcePF2kDa6Ip2Mp4kTs+lpYuMuOik
	K4JQSlBC/5SLrNAcB87vwulTit0uD3DTcNfTew1Egya7Anz6x0DlEYpxTXH4rmd9AvB+b9
	7CJbcEC/x7nNjaKwrHJmlf06GdjxMmosOtHwgYS+3aFCKFqvJ9RdIaGLu2imTg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [scarthgap v4 00/17] backport: SPDX 3.0 support to Scarthgap
Date: Fri,  7 Nov 2025 14:14:34 +0100
Message-ID: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226036

Hello,

This is the v4 series to backport SPDX 3.0 support from upstream
Walnascar to Scarthgap (Yocto Project 5.0 LTS).

Changes since v2:
-----------------
Cherry-picked commits:

    c5b5136bf8: Exclude do_create_spdx from automatic sysroot extension.

    03c6ace6c6: Fix SPDX_VERSION handling in selftests.

    7be5a6e699: Add tar test for SPDX 2.2.

Local fix:

    7e14a5b966: Align DEPLOY_DIR_SPDX in create-spdx-2.2.bbclass with
       ${SPDX_VERSION} layout, restoring successful SPDX 2.2 selftests.

Changes since v3:
-----------------
Cherry-picked commits:

     29d3f8ad4: classes/create-spdx-2.2: Handle empty packages

Greetings,
Kamel

Hongxu Jia (1):
  oeqa/selftest: Add SPDX 3.0 include source case for work-share

Joshua Watt (11):
  classes-global/license: Move functions to library code
  classes-global/staging: Exclude do_create_spdx from automatic sysroot
    extension
  lib/license: Move package license skip to library
  lib: oe: license: Add missing import
  classes-recipe/image: Add image file manifest
  classes-recipe/baremetal-image: Add image file manifest
  selftest: spdx: Add SPDX 3.0 test cases
  lib: oeqa: spdx: Add tests for extra options
  spdx 3.0: Rework how SPDX aliases are linked
  oeqa: spdx: Add tar test for SPDX 2.2
  classes/create-spdx-2.2: Handle empty packages

Kamel Bouhara (Schneider Electric) (4):
  backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
  spdx30_tasks: fix FetchData attribute in add_download_files
  classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSION
    layout
  spdx30_tasks: adapt CVE handling to new cve-check API

Richard Purdie (1):
  selftest/spdx: Fix for SPDX_VERSION addition

 meta/classes-global/base.bbclass              |   41 +-
 meta/classes-global/license.bbclass           |  165 -
 meta/classes-global/staging.bbclass           |    9 +-
 meta/classes-recipe/baremetal-image.bbclass   |   32 +-
 .../create-spdx-image-3.0.bbclass             |   85 +
 .../create-spdx-sdk-3.0.bbclass               |   74 +
 meta/classes-recipe/image.bbclass             |   58 +
 meta/classes-recipe/license_image.bbclass     |   14 +-
 meta/classes-recipe/nospdx.bbclass            |   13 +
 meta/classes/create-spdx-2.2.bbclass          |   85 +-
 meta/classes/create-spdx-3.0.bbclass          |  200 +
 meta/classes/spdx-common.bbclass              |   99 +
 meta/lib/oe/__init__.py                       |    2 +-
 meta/lib/oe/license.py                        |  203 +
 meta/lib/oe/sbom30.py                         | 1096 ++++
 meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
 meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
 meta/lib/oe/spdx_common.py                    |  244 +
 meta/lib/oeqa/selftest/cases/spdx.py          |  256 +-
 19 files changed, 9348 insertions(+), 264 deletions(-)
 create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
 create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
 create mode 100644 meta/classes-recipe/nospdx.bbclass
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/spdx-common.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py
 create mode 100644 meta/lib/oe/spdx30_tasks.py
 create mode 100644 meta/lib/oe/spdx_common.py

--
2.43.0


