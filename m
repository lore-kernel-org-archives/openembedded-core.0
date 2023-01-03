Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE3AC54EBF
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.63875.1672753627462587247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 05:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C41141570;
	Tue,  3 Jan 2023 05:47:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A82C13F587;
	Tue,  3 Jan 2023 05:47:06 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/5] python3-hatch-vcs: upgrade 0.2.0 -> 0.3.0
Date: Tue,  3 Jan 2023 13:46:58 +0000
Message-Id: <20230103134700.2649683-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103134700.2649683-1-ross.burton@arm.com>
References: <20230103134700.2649683-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175347

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python3-hatch-vcs_0.2.0.bb =3D> python3-hatch-vcs_0.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-vcs_0.2.0.bb =3D> pyt=
hon3-hatch-vcs_0.3.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb b/me=
ta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
rename to meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
index cca2c49d2b7..b4db10e767a 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
=20
 PYPI_PACKAGE =3D "hatch_vcs"
=20
-SRC_URI[sha256sum] =3D "9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce64=
3c36d09ca908abff"
+SRC_URI[sha256sum] =3D "cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14a=
d317bbee5a153fee"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.34.1


