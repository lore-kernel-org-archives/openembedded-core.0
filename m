Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F035D5D674
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78026.1731000250735172167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0622497
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B9AE3F6A8
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/8] python3-setuptools: add more comments to a patch
Date: Thu,  7 Nov 2024 17:23:57 +0000
Message-Id: <20241107172404.4017047-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206842

Add more explanatory comments, including when we can drop the patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-conditionally-do-not-fetch-code-by-easy_install.patch | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditi=
onally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/py=
thon/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_inst=
all.patch
index e227c2889cf..16b316e9cc2 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-=
do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-=
do-not-fetch-code-by-easy_install.patch
@@ -3,11 +3,13 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
=20
-If var-NO_FETCH_BUILD is set, do not allow to fetch code from
-internet by easy_install.
+If NO_FETCH_BUILD is set, do not fetch code in easy_install. This avoids=
 setup.py
+trying to fetch missing dependencies at build time.
=20
-Upstream-Status: Inappropriate [oe specific]
+This is only used by the deprecated codepath as implemented by setuptool=
s3.bbclass, so
+when that ever gets removed this patch can also be deleted.
=20
+Upstream-Status: Denied [https://github.com/pypa/setuptools/issues/4735]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  setuptools/command/easy_install.py | 5 +++++
--=20
2.34.1


