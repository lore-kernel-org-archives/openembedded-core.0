Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF18F6FF76
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C2Kh5O008564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:21:00 +0800
Message-ID: <ec4210eff0edd1c67c0d9456b1bb0d1ad88b34aa.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465697985.git.Qi.Chen@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] sysstat: upgrade to 11.3.4
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:42 -0000
Content-Type: text/plain

The license checksum is changed but the license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat_11.2.0.bb | 8 --------
 meta/recipes-extended/sysstat/sysstat_11.3.4.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_11.2.0.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_11.3.4.bb

diff --git a/meta/recipes-extended/sysstat/sysstat_11.2.0.bb b/meta/recipes-extended/sysstat/sysstat_11.2.0.bb
deleted file mode 100644
index 7a8eb96..0000000
--- a/meta/recipes-extended/sysstat/sysstat_11.2.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require sysstat.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
-
-SRC_URI[md5sum] = "e8b615775ad98780e3f0675b91eddb19"
-SRC_URI[sha256sum] = "9806b9a662568796d3fb93ecd01ecea10d815e668337a646494953bff4bc4155"
diff --git a/meta/recipes-extended/sysstat/sysstat_11.3.4.bb b/meta/recipes-extended/sysstat/sysstat_11.3.4.bb
new file mode 100644
index 0000000..45cc0bd
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat_11.3.4.bb
@@ -0,0 +1,8 @@
+require sysstat.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
+
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
+
+SRC_URI[md5sum] = "b92ea90a60eda2b16e2667e6237402b1"
+SRC_URI[sha256sum] = "84231474b243eaffaf4b83e5a801085144361a1c8a50e9ea8a5d52ad269d20b1"
-- 
1.9.1


