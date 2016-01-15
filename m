Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24DBE6010D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 05:09:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F59EJc021681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jan 2016 21:09:14 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 21:09:13 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 15 Jan 2016 00:09:10 -0500
Message-ID: <13d1f0fbaf650975b460b42e72bcdde74e7b97a7.1452834024.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452834024.git.dengke.du@windriver.com>
References: <cover.1452834024.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] ncurses: 5.9 0 -> 6.0
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
X-List-Received-Date: Fri, 15 Jan 2016 05:09:17 -0000
Content-Type: text/plain

To be compatible with ncurses 5, add option '--with-abi-version=5' to EXTRA_OECONF

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/config.cache | 0
 .../ncurses/{ncurses-5.9 => ncurses-6.0}/tic-hang.patch            | 0
 meta/recipes-core/ncurses/ncurses.inc                              | 1 -
 meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb}       | 7 +++----
 4 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/tic-hang.patch (100%)
 rename meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb} (59%)

diff --git a/meta/recipes-core/ncurses/ncurses-5.9/config.cache b/meta/recipes-core/ncurses/ncurses-6.0/config.cache
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.9/config.cache
rename to meta/recipes-core/ncurses/ncurses-6.0/config.cache
diff --git a/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch b/meta/recipes-core/ncurses/ncurses-6.0/tic-hang.patch
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
rename to meta/recipes-core/ncurses/ncurses-6.0/tic-hang.patch
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 27815b8..fbe74d5 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
-INC_PR = "r15"
 
 BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config"
 
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_6.0.bb
similarity index 59%
rename from meta/recipes-core/ncurses/ncurses_5.9.bb
rename to meta/recipes-core/ncurses/ncurses_6.0.bb
index 22c6230..8587287 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0.bb
@@ -1,12 +1,11 @@
 require ncurses.inc
 
-REVISION = "20150329"
-
-PR = "${INC_PR}.1"
+REVISION = "20151024"
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the above listed REVISION
-SRCREV = "6286e14dac28811dbfd325b8d4c23f0d4e37eaf0"
+SRCREV = "c6b034b4d69f8c9092c2a1b5d5bb718282b2a522"
 S = "${WORKDIR}/git"
+EXTRA_OECONF += "--with-abi-version=5"
-- 
1.9.1


