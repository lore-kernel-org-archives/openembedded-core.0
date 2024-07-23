Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3345C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45844.1721746309873095267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1369F1480
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 436593F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/37] python3-jinja2: remove obsolete python3-toml dependency
Date: Tue, 23 Jul 2024 15:51:14 +0100
Message-Id: <20240723145137.74198-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202381

As we have Python 3.11+, tomllib will be used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-jinja2_3.1.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/=
recipes-devtools/python/python3-jinja2_3.1.4.bb
index 2c020370113..9ea6a0cf4ec 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -26,7 +26,6 @@ do_install_ptest() {
 RDEPENDS:${PN}-ptest +=3D " \
     python3-pytest \
     python3-unittest-automake-output \
-    python3-toml \
     python3-unixadmin \
 "
=20
--=20
2.34.1


