Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE02C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 15:17:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.36189.1678115833330815740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 07:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 010EF12FC;
	Mon,  6 Mar 2023 07:17:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FBF53F71A;
	Mon,  6 Mar 2023 07:17:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] shadow: ignore CVE-2016-15024
Date: Mon,  6 Mar 2023 15:17:08 +0000
Message-Id: <20230306151709.3737102-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 15:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178075

This recently got an updated CPE which matches this recipe, but the issue
is related to an entirely different shadow project so ignore it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/shadow/shadow_4.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.13.bb b/meta/recipes-e=
xtended/shadow/shadow_4.13.bb
index 40b11345c92..d1a3fd5593b 100644
--- a/meta/recipes-extended/shadow/shadow_4.13.bb
+++ b/meta/recipes-extended/shadow/shadow_4.13.bb
@@ -9,3 +9,6 @@ BBCLASSEXTEND =3D "native nativesdk"
 # Severity is low and marked as closed and won't fix.
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D884658
 CVE_CHECK_IGNORE +=3D "CVE-2013-4235"
+
+# This is an issue for a different shadow
+CVE_CHECK_IGNORE +=3D "CVE-2016-15024"
--=20
2.34.1


