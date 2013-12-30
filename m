Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 077476B5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:00:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU20SH7017612
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 18:00:28 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 29 Dec 2013 18:00:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 18:02:30 +0800
Message-ID: <009c822c3e560a9931aeb487e4702457f8aa6f73.1388397582.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388397582.git.liezhi.yang@windriver.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] git: upgrade to 1.8.5.2
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
X-List-Received-Date: Mon, 30 Dec 2013 02:00:28 -0000
Content-Type: text/plain

* Upgrade to 1.8.5.2
* Remove the SRC_URI from the git.inc since we use the one in
  git_1.8.5.2.bb

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc                            | 1 -
 meta/recipes-devtools/git/{git_1.8.4.4.bb => git_1.8.5.2.bb} | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.4.4.bb => git_1.8.5.2.bb} (67%)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index f33069c..7791a7c 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -5,7 +5,6 @@ DEPENDS = "openssl curl zlib expat"
 
 PROVIDES_append_class-native = " git-replacement-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 "
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
diff --git a/meta/recipes-devtools/git/git_1.8.4.4.bb b/meta/recipes-devtools/git/git_1.8.5.2.bb
similarity index 67%
rename from meta/recipes-devtools/git/git_1.8.4.4.bb
rename to meta/recipes-devtools/git/git_1.8.5.2.bb
index cdcd894..4777c46 100644
--- a/meta/recipes-devtools/git/git_1.8.4.4.bb
+++ b/meta/recipes-devtools/git/git_1.8.5.2.bb
@@ -1,8 +1,9 @@
 require git.inc
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "c07ea15d5d0c31544de265f567d6e5ef"
-SRC_URI[sha256sum] = "44392f5bfcb17aa943338469ddafd94a9091f8b33eb5d3a2abb60f2bb61d1a73"
+
+SRC_URI[md5sum] = "df8519044f9880f3687d863d99245282"
+SRC_URI[sha256sum] = "024694524b8be91fe29afca65bc3a9e40de1322dd5ef2b2c0babb6849c913e8a"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.8.3.1


