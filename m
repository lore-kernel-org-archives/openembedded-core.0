Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45855.1795624776830480269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=kqc0tKdK;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E822F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EDF673F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624776; bh=s4g/uyiaIdBEbowaXAEE01j0PZaLk9rurL8kW33PHmM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kqc0tKdKakAJ7WuI/7In161V4iptTp5YUjMU2PZNhryQPvyOIQI5c6f2joLcGXkIL
	 YwSfXFNFxXoCQt4g2L1Mo9WkWJhfkqOuGBZZ65J+m/puTjW1qjvG+Q3FxaJrGUaRqV
	 3TO8nYglsrEcdV4X46d7sZf1tOoVU3yz2wGwrEg0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/18] python3: add test files from -misc to -tests
Date: Wed, 25 Nov 2026 16:39:17 +0000
Message-ID: <20261125163927.1835785-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251219
Content-Type: text/plain; charset="utf-8"

These parts of the test suite were in -misc, package them in -tests
where they belong.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index fb21c493f2f..9550cc61c14 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -98,7 +98,13 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/*/test",
             "${libdir}/python${PYTHON_MAJMIN}/*/tests",
+            "${libdir}/python${PYTHON_MAJMIN}/__hello__.py",
+            "${libdir}/python${PYTHON_MAJMIN}/__phello__/",
+            "${libdir}/python${PYTHON_MAJMIN}/antigravity.py",
             "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test/",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_test*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_xx*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xx*.so",
             "${libdir}/python${PYTHON_MAJMIN}/test"
         ]
     },
--=20
2.43.0

