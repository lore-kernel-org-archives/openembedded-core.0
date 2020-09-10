Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1352.1599771858698844023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 14:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1D5611B3
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:17 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9632A3F73C
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:17 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] cve-update-db-native: remove unused import
Date: Thu, 10 Sep 2020 22:04:11 +0100
Message-Id: <20200910210413.926242-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910210413.926242-1-ross.burton@arm.com>
References: <20200910210413.926242-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This import isn't used anymore, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index 328f6ab364..94367f9a94 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -30,7 +30,7 @@ python do_populate_cve_db() {
     """
     import bb.utils
     import bb.progress
-    import sqlite3, urllib, urllib.parse, shutil, gzip
+    import sqlite3, urllib, urllib.parse, gzip
     from datetime import date
=20
     bb.utils.export_proxies(d)
--=20
2.28.0

