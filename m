Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.15782.1588625876902394116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 13:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1462520B717B
	for <openembedded-core@lists.openembedded.org>; Mon,  4 May 2020 13:57:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1462520B717B
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] newlib: Upgrade to latest yearly release 3.3.0
Date: Mon,  4 May 2020 13:57:51 -0700
Message-Id: <20200504205751.40338-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

Upgrade to the latest snapshot, also drop md5sum while were at it.

Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb}            | 0
 meta/recipes-core/newlib/newlib.inc                            | 3 +--
 meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb}  | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb} (100%)
 rename meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb} (100%)

diff --git a/meta/recipes-core/newlib/libgloss_3.2.0.bb b/meta/recipes-core/newlib/libgloss_3.3.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/libgloss_3.2.0.bb
rename to meta/recipes-core/newlib/libgloss_3.3.0.bb
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 5edea8aba1..96e230f985 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -16,8 +16,7 @@ LIC_FILES_CHKSUM = " \
 		"
 
 SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
-SRC_URI[md5sum] = "afb3a01c8c82b6717ea55659a4de30ec"
-SRC_URI[sha256sum] = "f7b2322964a1e3b37bec0768da20f50dfb62247d729110974dd95756a53bb6d4"
+SRC_URI[sha256sum] = "58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc"
diff --git a/meta/recipes-core/newlib/newlib_3.2.0.bb b/meta/recipes-core/newlib/newlib_3.3.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/newlib_3.2.0.bb
rename to meta/recipes-core/newlib/newlib_3.3.0.bb
-- 
2.17.1

