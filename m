Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A42D160167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 09:00:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAD90W1O000956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 01:00:32 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 13 Nov 2014 01:00:31 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Nov 2014 16:56:14 +0800
Message-ID: <73a04d5cba4461a4f064fec3e83b66b6a5a857bb.1415868922.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415868922.git.Chong.Lu@windriver.com>
References: <cover.1415868922.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tcl: Upgrade to 8.6.3
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
X-List-Received-Date: Thu, 13 Nov 2014 09:00:35 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/tcltk/{tcl_8.6.2.bb => tcl_8.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.2.bb => tcl_8.6.3.bb} (95%)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.2.bb b/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
similarity index 95%
rename from meta/recipes-devtools/tcltk/tcl_8.6.2.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.3.bb
index 75fef01..73c0d25 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "8103eaf6d71acb716a64224492f09d5f"
-SRC_URI[sha256sum] = "86f7ae5f581dd0904d04415637ab3aef5a50986c1b6d04c340e2b1b0258da9c4"
+SRC_URI[md5sum] = "db382feca91754b7f93da16dc4cdad1f"
+SRC_URI[sha256sum] = "6ce0778de0d50daaa9c345d7c1fd1288fb658f674028812e7eeee992e3051005"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
1.9.1


