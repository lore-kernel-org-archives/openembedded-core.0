Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87450C25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 17:46:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.127604.1698083183708382113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 10:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 778332F4;
	Mon, 23 Oct 2023 10:47:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D68543F762;
	Mon, 23 Oct 2023 10:46:22 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][master nanbield] pixman: ignore CVE-2023-37769
Date: Mon, 23 Oct 2023 18:46:21 +0100
Message-Id: <20231023174621.3479973-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 17:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189630

From: Ross Burton <ross.burton@arm.com>

This issue relates to a floating point exception in stress-test, which
is an unlikely security exploit at the best of times, but the test is
not installed so isn't relevant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
index 98df6dab217..8a93f8c0fe3 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -41,3 +41,5 @@ EXTRA_OEMESON:append:armv7a =3D "${@bb.utils.contains("=
TUNE_FEATURES","neon","","
 EXTRA_OEMESON:append:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","=
neon",""," -Dneon=3Ddisabled",d)}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_STATUS[CVE-2023-37769] =3D "not-applicable-config: stress-test is an=
 uninstalled test"
--=20
2.34.1


