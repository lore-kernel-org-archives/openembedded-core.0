Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /Xq+w9kNxebyogtUbgY1jaYpI6MlC1cnwnm/eAX6/aCtvjrxlu4U7uywm8GzZyunpWm3imKHXl
 PMTX0XMKflMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699657"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699657"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:42 -0700
IronPort-SDR: uwo1yiCZn2BGKriYDt63PzCxwG6/BXFYx1avw9FGMwtILOS6nW/RsAy2EtrsxHydDJcoR2TIeb
 2ma4coHav2hQ==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245706"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 03/32] gcr: depends on gnupg-native
Date: Tue, 28 Jul 2020 16:51:04 +0800
Message-Id: <034f09ebd90a03a2775b44750951ce7a22e00564.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It fails to build gcr if no commmand gpg on build host:

| meson.build:44:0: ERROR: Program(s) ['gpg2', 'gpg'] not found or not executable

Add dependency gnupg-native to fix the error.

(From OE-Core rev: da7360247995d7c8e79dfcaa0c0761952a9013f1)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
(cherry picked from commit e4a6eda4c246b2bca059defed796bdab19a7ab5f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.28.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
index 2299199c31..64b0569f04 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
+DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
 inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
-- 
2.25.4

