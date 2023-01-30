Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0257C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 12:07:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39343.1675080433934217131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 04:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 168701758;
	Mon, 30 Jan 2023 04:07:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9982B3F71E;
	Mon, 30 Jan 2023 04:07:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] git: ignore CVE-2022-41953
Date: Mon, 30 Jan 2023 12:07:08 +0000
Message-Id: <20230130120709.2079554-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130120709.2079554-1-ross.burton@arm.com>
References: <20230130120709.2079554-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176487

This is specific to Git-for-Windows.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/git/git_2.39.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.39.1.bb b/meta/recipes-devto=
ols/git/git_2.39.1.bb
index 8577d86eac8..d8137df5612 100644
--- a/meta/recipes-devtools/git/git_2.39.1.bb
+++ b/meta/recipes-devtools/git/git_2.39.1.bb
@@ -31,6 +31,8 @@ CVE_PRODUCT =3D "git-scm:git"
 # in mirrored git repos. Most OE users wouldn't build the docs and
 # we don't see this as a major issue for our general users/usecases.
 CVE_CHECK_IGNORE +=3D "CVE-2022-24975"
+# This is specific to Git-for-Windows
+CVE_CHECK_IGNORE +=3D "CVE-2022-41953"
=20
 PACKAGECONFIG ??=3D "expat curl"
 PACKAGECONFIG[cvsserver] =3D ""
--=20
2.34.1


