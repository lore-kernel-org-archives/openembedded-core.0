Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE2ECA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 11:12:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8676.1790853124408042951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 04:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=viCsZyCu;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CBF2497
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 04:12:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A8A43F86F
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790853123; bh=jPJyFAAWKCwMMokT/miP5B4AMn19IEQUoZD2O69xTbw=;
	h=From:To:Subject:Date:From;
	b=viCsZyCuA15JM8zEGhOZaM1BKlHLjWZIP36extCeOVAgLhOzHcN+HrrC7WZYyi3qT
	 8btqlQFxvR7NzlUN+tRL0LF4tFnucFAeYHVoGdMPjv/6uoUv2TkW7aSjr5mO6m8OXb
	 UerfodGgx2onPmOda6fz0CUMHX1uC+ko257EN8PU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3-babel: clean up RDEPENDS
Date: Thu,  1 Oct 2026 12:11:57 +0100
Message-ID: <20261001111159.2987565-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 11:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247026

pytz is only needed with Python 3.8 and lower, remove the dependency.

setuptools is a development dependency and not needed at runtime.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-babel_2.18.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/=
recipes-devtools/python/python3-babel_2.18.0.bb
index cf2752f6a23..969f6d711e1 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -17,8 +17,6 @@ RDEPENDS:${PN} +=3D " \
     python3-netserver \
     python3-numbers \
     python3-pickle \
-    python3-pytz \
-    python3-setuptools \
     python3-shell \
     python3-threading \
 "
--=20
2.43.0


