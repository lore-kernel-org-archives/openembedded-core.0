Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45860.1795624780454877287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CANVxz+X;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B4F52F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF6D63F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624780; bh=QmbSVcWK0gzR6Ubop6Y4Vf1yyrPhIT63KwvBGWZaQPU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CANVxz+XjjUCN9x2hC/Ih9FTs7GF4nHaCWv4ncwUzB+oJBDzUbjOUUJnQZb8pMjM+
	 0MApD00qy2tRl78aZsXf6UKTZD2isq9Xg3sPsCVOceK2fInR20Iyv0AHdx1yReWI/u
	 DtjzAAfM/zXnQaDRkx3JC5Ie9JEWV291oLC00TdA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/18] python3: add wsgiref to -netserver
Date: Wed, 25 Nov 2026 16:39:23 +0000
Message-ID: <20261125163927.1835785-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251225
Content-Type: text/plain; charset="utf-8"

This was previously in -misc, but it's very related to network servers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index aee6fbe6432..e49216beefd 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -696,7 +696,8 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
+            "${libdir}/python${PYTHON_MAJMIN}/socketserver.py",
+            "${libdir}/python${PYTHON_MAJMIN}/wsgiref/"
         ]
     },
     "pickle": {
--=20
2.43.0

