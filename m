Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id EFDE2746F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599833"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:11 +0300
Message-Id: <20180404111321.10824-12-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/22] epiphany: update to 3.28.0.1
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:07 -0000

Rebase 0002-help-meson.build-disable-the-use-of-yelp.patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{epiphany_3.26.6.bb => epiphany_3.28.0.1.bb}     |  6 +++---
 ...02-help-meson.build-disable-the-use-of-yelp.patch | 20 ++++++++------------
 2 files changed, 11 insertions(+), 15 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.26.6.bb => epiphany_3.28.0.1.bb} (81%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.26.6.bb b/meta/recipes-gnome/epiphany/epiphany_3.28.0.1.bb
similarity index 81%
rename from meta/recipes-gnome/epiphany/epiphany_3.26.6.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.28.0.1.bb
index e250f76ed1e..c878ee3229a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.26.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.28.0.1.bb
@@ -13,10 +13,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "8449968366a6f9aaff3ac228ddfc7c66"
-SRC_URI[archive.sha256sum] = "01b16aa55d312ae0f17d3136f90d8c68ac748715f119412fb1917023c6f630a8"
+SRC_URI[archive.md5sum] = "3e127d843d3f255f426ab34804f29163"
+SRC_URI[archive.sha256sum] = "7154b06837655771f2240bf378fb8ba2315ae07dbc6f45d160ca29cd6d377808"
 
 EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
-FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
+FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 249517d8f90..d4f3cc1d35f 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,34 +1,30 @@
-From fc314fc3a66c92fe73e1a0cea4f49d11b29e1f45 Mon Sep 17 00:00:00 2001
+From 0048ae2d225d25cc58f378718ca6f9ddb1a228f9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
-Subject: [PATCH 2/2] help/meson.build: disable the use of yelp
+Subject: [PATCH] help/meson.build: disable the use of yelp
 
 In particular this avoids calling itstool which oe-core doesn't provide.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- help/meson.build | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ help/meson.build | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/help/meson.build b/help/meson.build
-index f720add..cbfeb1e 100644
+index fddcf4c..f7d76c6 100644
 --- a/help/meson.build
 +++ b/help/meson.build
-@@ -46,8 +46,8 @@ help_linguas = [
-   'sv'
+@@ -32,7 +32,7 @@ help_media = [
+   'media/web-browser.png'
  ]
  
 -gnome.yelp(meson.project_name(),
 -  sources: help_files,
 -  media: help_media,
--  languages: help_linguas,
 -)
 +#gnome.yelp(meson.project_name(),
 +#  sources: help_files,
 +#  media: help_media,
-+#  languages: help_linguas,
 +#)
--- 
-2.15.1
-
-- 
2.16.1


