Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.142.1589922592462285845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 14:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04JL9pFW020751
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 14:09:51 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 19 May 2020
 14:09:47 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/3] squashfs-tools: gcc-10
Date: Tue, 19 May 2020 14:09:27 -0700
Message-ID: <20200519210928.1995-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519210928.1995-1-joe.slater@windriver.com>
References: <20200519210928.1995-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Add -fcommon to CFLAGS to avoid multiple definition errors for uninitialized variables.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 9bcf026ce2..d3f42a84fe 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
 
 S = "${WORKDIR}/git/squashfs-tools"
 
+CFLAGS_append = " -fcommon"
+
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
 
 PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr reproducible"
-- 
2.26.2

