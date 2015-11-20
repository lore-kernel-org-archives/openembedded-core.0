Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 69F1860112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 21:29:01 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so127668766pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 13:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kp1osui0IXayblCp9M4Pd3Zj3JFlpuF32tk04lXfZYY=;
	b=sPruO/fCuJjVbUOIJJgoMIoPhLPg13hP+E+/mRlOx12l/599Dj7WrcODzJPJbTRVeE
	rW7dayEALPR4WY6+v/qR7cR8REbO40bkrqYVq3Y1dbh7RyBLaYL31EazQs0PrJNVs4pl
	PLxBWy3vD6Dkc5IkOq4GYFeGypMsGWLL0dpinVkXpdWlHEq8lqb6Ar7APWF/E98WpL1f
	XguPMz00PSTTccl5H2jnTPJbMEmrzgxMpBK1E9yARlmpEiksEpg9d1dsgoDGpuk0lzUp
	blDWYbf4sTMXBSgRZiBwimO7fXrjX4FJ+92lO8nk+XEO5l1/DAyjqWU2JIsraSHqnF/m
	kkRg==
X-Received: by 10.98.44.193 with SMTP id s184mr1913600pfs.8.1448054942574;
	Fri, 20 Nov 2015 13:29:02 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id c1sm928087pas.1.2015.11.20.13.29.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 13:29:01 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 13:28:56 -0800
Message-Id: <1448054936-30631-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] sqlite3: update 3.9.0 -> 3.9.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Nov 2015 21:29:07 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb} (81%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.9.0.bb b/meta/recipes-support/sqlite/sqlite3_3.9.2.bb
similarity index 81%
rename from meta/recipes-support/sqlite/sqlite3_3.9.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.9.2.bb
index 50531ba..83685e0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.9.2.bb
@@ -12,12 +12,11 @@ PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
 SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
-SRC_URI[md5sum] = "cd0f883b2ddfc29e8e1bbbbd8e85f555"
-SRC_URI[sha256sum] = "a324143f4cc35cd7e9605a0a8dec9f9e4861d0be8305f3642e7d05008b77e60d"
+SRC_URI[md5sum] = "bc4eb5b3fc5cfcb6e059794306cac1ca"
+SRC_URI[sha256sum] = "064c0abe9c9177534d4c770bca7a5902f9924b629ac886b4c08956be6dfbc36b"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
 # Provide column meta-data API
 BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
 TARGET_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-
-- 
1.9.1


