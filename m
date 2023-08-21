Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD59EE49AE
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:32:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11068.1692624742936338774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 06:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6CCA2F4;
	Mon, 21 Aug 2023 06:33:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AB893F740;
	Mon, 21 Aug 2023 06:32:21 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] python3: ignore disputed CVE-2023-36632
Date: Mon, 21 Aug 2023 14:32:18 +0100
Message-Id: <20230821133219.213978-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 13:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186441

From: Ross Burton <ross.burton@arm.com>

For some reason in the migration of CVE_CHECK_IGNORE to CVE_STATUS[1], th=
is
CVE was commented out.

[1] oe-core 1634ed40

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipe=
s-devtools/python/python3_3.11.4.bb
index b3534ad678e..8fd1382caa4 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -53,7 +53,7 @@ CVE_STATUS[CVE-2020-15523] =3D "not-applicable-platform=
: Issue only applies on Win
 CVE_STATUS[CVE-2022-26488] =3D "not-applicable-platform: Issue only appl=
ies on Windows"
 # The module will be removed in the future and flaws documented.
 CVE_STATUS[CVE-2015-20107] =3D "upstream-wontfix: The mailcap module is =
insecure by design, so this can't be fixed in a meaningful way"
-# CVE_STATUS[CVE-2023-36632] =3D "disputed: Not an issue, in fact expect=
ed behaviour"
+CVE_STATUS[CVE-2023-36632] =3D "disputed: Not an issue, in fact expected=
 behaviour"
=20
 PYTHON_MAJMIN =3D "3.11"
=20
--=20
2.34.1


