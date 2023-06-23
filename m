Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4331AC001DF
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 12:33:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40880.1687523577046638365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 05:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 902D61063;
	Fri, 23 Jun 2023 05:33:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25C093F59C;
	Fri, 23 Jun 2023 05:32:56 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com
Subject: [PATCH 2/4] ghostscript: remove CVE_CHECK_IGNORE for CVE-2013-6629
Date: Fri, 23 Jun 2023 13:32:48 +0100
Message-Id: <20230623123250.726731-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623123250.726731-1-ross.burton@arm.com>
References: <20230623123250.726731-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 12:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183326

From: Ross Burton <ross.burton@arm.com>

This CVE now has a version range, indicating that this Ghostscript
release isn't vulnerable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
index f03ebf44789..0d41242bc2c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
@@ -18,9 +18,6 @@ DEPENDS =3D "tiff jpeg fontconfig cups libpng freetype =
zlib"
 UPSTREAM_CHECK_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-down=
loads/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.tar"
=20
-# We use a system libjpeg-turbo which has this fix
-CVE_CHECK_IGNORE +=3D "CVE-2013-6629"
-
 def gs_verdir(v):
     return "".join(v.split("."))
=20
--=20
2.34.1


