Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4105C5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:53:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28043.1786362787564927813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QQWrn5JB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3878214BF
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D29EE3F632
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786362787; bh=QNSc0YZKpqSIuIif+0p4d7jQPFn86G7iOzAqaNKeZLg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QQWrn5JBDSz/uUT7s+ht8tah9DWLTLbjrHtXG2AeMOOvwobfFJo8M8RPInf1S8xWP
	 hcfZfZSxjBKoYsB+tBWDuUXfd8fooclwrTArSaYJge27d5Mjgqv7nsjNuDJLYS5FF+
	 qvyGOEC7bqg3h2zvtf9KMfGCDTMB1LU4OUmhchyo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] classes/python_pbr: add class for Python Build Reasonableness backend
Date: Mon, 10 Aug 2026 12:53:03 +0100
Message-ID: <20260810115304.562663-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810115304.562663-1-ross.burton@arm.com>
References: <20260810115304.562663-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243128

We have a recipe in core for this build backend, so add a class.

Note that we have no users of pbr in core, so there's an argument to be
had over what build backends live in oe-core vs meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_pbr.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/classes-recipe/python_pbr.bbclass

diff --git a/meta/classes-recipe/python_pbr.bbclass b/meta/classes-recipe=
/python_pbr.bbclass
new file mode 100644
index 00000000000..5dc25a4c7f8
--- /dev/null
+++ b/meta/classes-recipe/python_pbr.bbclass
@@ -0,0 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit python_pep517
+
+DEPENDS +=3D "python3-pbr-native"
--=20
2.43.0


