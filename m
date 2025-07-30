Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECA8C87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:03:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39269.1753891429915433855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75F831BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DA513F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/13] classes/python_pdm: add PEP517 build class for PDM
Date: Wed, 30 Jul 2025 17:03:33 +0100
Message-ID: <20250730160343.4053614-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221124

PDM[1] is yet another build/package manager for Python that is fairly
common now, so add a class for it.

Signed-off-by: Ross Burton <ross.burton@arm.com>

[1] https://pdm-project.org/
---
 meta/classes-recipe/python_pdm.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/classes-recipe/python_pdm.bbclass

diff --git a/meta/classes-recipe/python_pdm.bbclass b/meta/classes-recipe=
/python_pdm.bbclass
new file mode 100644
index 00000000000..9a34d984227
--- /dev/null
+++ b/meta/classes-recipe/python_pdm.bbclass
@@ -0,0 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit python_pep517
+
+DEPENDS +=3D "python3-pdm-backend-native"
--=20
2.43.0


