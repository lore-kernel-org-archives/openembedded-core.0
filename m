Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DC8C87FD4
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 08:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2683.1753779582858073572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 01:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55C681A32
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E08093F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/7] setuptools3_legacy: ensure ${B} is clean
Date: Tue, 29 Jul 2025 09:59:30 +0100
Message-ID: <20250729085935.1290438-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729085935.1290438-1-ross.burton@arm.com>
References: <20250729085935.1290438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 08:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221038

We do builds in a separate directory in this class, so add it to cleandir=
s
to ensure that it is empty.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3_legacy.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classe=
s-recipe/setuptools3_legacy.bbclass
index 166808a695d..8197f443c91 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -17,6 +17,7 @@
 inherit setuptools3-base
=20
 B =3D "${WORKDIR}/build"
+do_configure[cleandirs] =3D "${B}"
=20
 SETUPTOOLS_BUILD_ARGS ?=3D ""
 SETUPTOOLS_INSTALL_ARGS ?=3D "--root=3D${D} \
--=20
2.43.0


