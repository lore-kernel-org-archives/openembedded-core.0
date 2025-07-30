Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C8BC87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:03:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39268.1753891429283549111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4E3B1E5E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D23A3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/13] classes/python_maturin: don't pull in setuptools
Date: Wed, 30 Jul 2025 17:03:32 +0100
Message-ID: <20250730160343.4053614-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221123

There's no need to pull in python_setuptools_build_meta as maturin is a
build system of its own.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_maturin.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_maturin.bbclass b/meta/classes-re=
cipe/python_maturin.bbclass
index c39d6c6e37d..5892bf5ecd1 100644
--- a/meta/classes-recipe/python_maturin.bbclass
+++ b/meta/classes-recipe/python_maturin.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit python_pyo3 python_setuptools_build_meta
+inherit python_pyo3 python_pep517
=20
 DEPENDS +=3D "python3-maturin-native"
=20
--=20
2.43.0


