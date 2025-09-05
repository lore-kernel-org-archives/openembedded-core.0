Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4936CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 17:12:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.596.1757092320040916854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 10:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TUPIQROn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0350443AC;
	Fri,  5 Sep 2025 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1757092318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ygR6LPwcyWEjnvbUWH4Ls8y2ZFe4gEcAInznL1Zr65Y=;
	b=TUPIQROnA0yW4PFiJIwrcpP/ALf7c1Tlo7OWGLR/i73qZ0x9DyO17hoBrn+6dSYVgV5wd+
	/t9sz5lS4NUpWygAtLFiSHuwXMSdOv2b64z4OoRmdtuoE0TKXYgt10g2MkAZ6Uj/C6q2y3
	sW9dTqZoNyMR0HiGQM5NrCY2+Ponu78jK0Igxzi7OaPLOG8ipmc62ZP6u/1KrV6cvXbVwP
	iIl8q0P11hvn4JjALRrKHsWvgqeDGHx22fYhbBpeJ1Nze88tuQwfR/ei4813ltmB+Pi4eK
	i5RzlYFsiKDAmo0vJIYyuXhdrNAW+kmxJaXzP0Ucy1v9mRGg54CYn8HXQ6DKsg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 0/6] backport: SPDX 3.0 support to Scarthgap
Date: Fri,  5 Sep 2025 19:11:48 +0200
Message-ID: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffveduffejheeltdffheevgfefveeuledugeejvdfffffhuddutdekuddutdeinecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepm
 hgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprghstggrlhdrvggsvghrhhgrrhgusehsvgdrtghomhdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 17:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223025

Hello,

This series backports SPDX 3.0 support from the upstream Walnascar
branch to Scarthgap, along with a few additional local fixes to ensure
correct integration.

The primary motivation for this series is to bring full SPDX 3.0 support
to the latest Yocto Project LTS release, Scarthgap, which will continue
to receive maintenance updates until 2028.

This ensures that long-term supported releases can benefit from the
latest SPDX standard for license and compliance tracking.

These changes are also in line with discussions at the Yocto Project
Summit in Amsterdam, where the need for up-to-date SPDX support in LTS
releases was highlighted.

The backport introduces SPDX 3.0 document support, SDK and image
integration, and related helpers. It also brings over tasks, classes,
and library code from upstream.

Feedback is particularly welcome on:
  - The correctness and completeness of the backport
  - Whether the local fixes should be adjusted or further refined

Greetings.

Kamel

Joshua Watt (4):
  classes-global/license: Move functions to library code
  lib/license: Move package license skip to library
  lib: oe: license: Add missing import
  classes-recipe/image: Add image file manifest

Kamel Bouhara (Schneider Electric) (2):
  backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
  spdx30_tasks: fix FetchData attribute in add_download_files

 meta/classes-global/base.bbclass              |   41 +-
 meta/classes-global/license.bbclass           |  165 -
 .../create-spdx-image-3.0.bbclass             |   85 +
 .../create-spdx-sdk-3.0.bbclass               |   74 +
 meta/classes-recipe/image.bbclass             |   58 +
 meta/classes-recipe/license_image.bbclass     |   14 +-
 meta/classes-recipe/nospdx.bbclass            |   13 +
 meta/classes/create-spdx-3.0.bbclass          |  200 +
 meta/classes/spdx-common.bbclass              |   99 +
 meta/lib/oe/__init__.py                       |    2 +-
 meta/lib/oe/license.py                        |  203 +
 meta/lib/oe/sbom30.py                         | 1096 ++++
 meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
 meta/lib/oe/spdx30_tasks.py                   | 1348 ++++
 meta/lib/oe/spdx_common.py                    |  244 +
 15 files changed, 9028 insertions(+), 207 deletions(-)
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


