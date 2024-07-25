Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AEDC49EA1
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 15:30:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39440.1721921439959138684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 08:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22FF31007
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:31:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3400B3F766
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:30:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] bmaptool: temporarily silence the pep517-backend warning
Date: Thu, 25 Jul 2024 16:30:29 +0100
Message-Id: <20240725153029.828624-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725153029.828624-1-ross.burton@arm.com>
References: <20240725153029.828624-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 15:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202510

Whilst bmaptool has a pyproject.toml that uses poetry, the setuptools
build path appears to be more complete.  Upstream has moved to hatch and
removed setup.py entirely so the next release can drop this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes=
-support/bmaptool/bmaptool_git.bb
index fd53c21c066..c38f05e1a1d 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -26,4 +26,7 @@ inherit setuptools3
 RREPLACES:${PN} =3D "bmap-tools"
 RCONFLICTS:${PN} =3D "bmap-tools"
=20
+# Poetry backend appears incomplete, upstream has moved to hatch
+INSANE_SKIP =3D "pep517-backend"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


