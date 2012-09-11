Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBI-0001jA-E7
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:32 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:18:59 -0700
Received: by wgbdr1 with SMTP id dr1so617826wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=qyu7OlKo2s+LaDmTZHBXqPnv9+pFuxvXfM8GoYN8MCA=;
	b=CEoBJfAoglolJI+EBtUjv5ox6P1PEAlj3emzmKAwRytFDSXIOsFUqwd5e5pzezpxMH
	YrOZhrmwrofoUyz7zkmdLz8qSuGxTh5rs8rD37egW4J1/+Gy1LMn40oNbhK95M5kO6uO
	NadECeA2iQ3OO0qe8+qmVh1fj92SQqsE8a4iVcuNe3EgWEeNRL6WdO/w90Gdw2LstNHU
	ROg4/RppJ0AmHvgji+DZxnvovzb6WXl9bIaS+Z9A9ur+ec8Thck6ja/FSwL+SLAgD783
	dHL/BwrrskYAXyeQFJNXltLFsp9NwEe9wJhoQWiRzIYTf3XhvDsUK0Zoq6um30Dc3Vjz
	wCtQ==
Received: by 10.180.82.230 with SMTP id l6mr27103843wiy.21.1347391137221;
	Tue, 11 Sep 2012 12:18:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.18.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:18:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:51 +0100
Message-Id: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnkBiHLT1oA27M7VQmcudfqDttqdHar506Au9j9GfJq/fV33Im/v7afXRD1j79o5l9Ye1ND
Subject: [RFC 01/18] libx11: use INC_PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:31:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc           |    1 +
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb      |    2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 7d4facd..ed5a890 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -5,7 +5,7 @@ this version."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index 3d5a306..e8661f3 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION += " Support for XCMS is disabled in this version."
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 592f116..9e8c863 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -9,6 +9,7 @@ require xorg-lib-common.inc
 inherit siteinfo
 
 PE = "1"
+INC_PR = "r1"
 
 PROVIDES = "virtual/libx11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index a65ab1f..2e47899 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -1,7 +1,7 @@
 require libx11.inc
 inherit gettext
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.10



