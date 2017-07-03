Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 606D371999
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 09:36:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v639auIm008615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jul 2017 02:36:56 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Jul 2017 02:36:55 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 3 Jul 2017 05:36:52 -0400
Message-ID: <f725d1fd970a67cfcf634d4c022e61813e762a89.1499074437.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1499074437.git.dengke.du@windriver.com>
References: <cover.1499074437.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 1/1] expat: upgrade to 2.2.1
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
X-List-Received-Date: Mon, 03 Jul 2017 09:36:56 -0000
Content-Type: text/plain

The COPYING file in expat has the following changes:

    2001-20016 to 2001-2017

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/expat/expat_2.2.0.bb | 5 -----
 meta/recipes-core/expat/expat_2.2.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.1.bb

diff --git a/meta/recipes-core/expat/expat_2.2.0.bb b/meta/recipes-core/expat/expat_2.2.0.bb
deleted file mode 100644
index ef21a11..0000000
--- a/meta/recipes-core/expat/expat_2.2.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c3ee559c6f9dcee1043ead112139f4f"
-
-SRC_URI[md5sum] = "2f47841c829facb346eb6e3fab5212e2"
-SRC_URI[sha256sum] = "d9e50ff2d19b3538bd2127902a89987474e1a4db8e43a66a4d1a712ab9a504ff"
diff --git a/meta/recipes-core/expat/expat_2.2.1.bb b/meta/recipes-core/expat/expat_2.2.1.bb
new file mode 100644
index 0000000..47827c5
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.2.1.bb
@@ -0,0 +1,5 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+
+SRC_URI[md5sum] = "d9c3baeab58774cefc2f04faf29f2cf8"
+SRC_URI[sha256sum] = "1868cadae4c82a018e361e2b2091de103cd820aaacb0d6cfa49bd2cd83978885"
-- 
2.8.1


