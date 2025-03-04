Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF846C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:22:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20418.1741090917808155427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E60EFEC
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 04:22:11 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E82413F5A1
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 04:21:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] puzzles: ignore three new CVEs for a different puzzles
Date: Tue,  4 Mar 2025 12:21:46 +0000
Message-ID: <20250304122146.2425356-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212280

As we just match on product by default, ignore three CVEs which are
for the "Puzzles" WordPress theme by ThemeREX (CPE themerex:puzzles).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato=
/puzzles/puzzles_git.bb
index 677a9e291e0..2df512a5cda 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -47,3 +47,6 @@ STOP
     done
 }
=20
+CVE_STATUS[CVE-2024-13769] =3D "cpe-incorrect: issue in ThemeREX's Wordp=
ress theme Puzzles"
+CVE_STATUS[CVE-2024-13770] =3D "cpe-incorrect: issue in ThemeREX's Wordp=
ress theme Puzzles"
+CVE_STATUS[CVE-2025-0837] =3D "cpe-incorrect: issue in ThemeREX's Wordpr=
ess theme Puzzles"
--=20
2.43.0


