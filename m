Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.4438.1620272788867813991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 20:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 53D5EFF804;
	Thu,  6 May 2021 03:46:25 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] liberation-fonts: Update to 2.1.4
Date: Wed,  5 May 2021 20:45:47 -0700
Message-Id: <20210506034547.2117847-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update HOMEPAGE and SRC_URI since development moved to GitHub.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 ...fonts_2.00.1.bb => liberation-fonts_2.1.4.bb} | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/ttf-fonts/{liberation-fonts_2.00.1.bb => liberation-fonts_2.1.4.bb} (69%)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
similarity index 69%
rename from meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
rename to meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
index abc216f434..53f4252814 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Liberation(tm) Fonts"
 DESCRIPTION = "The Liberation(tm) Fonts is a font family originally \
 created by Ascender(c) which aims at metric compatibility with \
 Arial, Times New Roman, Courier New."
-HOMEPAGE = "https://releases.pagure.org/liberation-fonts/"
+HOMEPAGE = "https://github.com/liberationfonts/liberation-fonts"
 BUGTRACKER = "https://bugzilla.redhat.com/"
 
 SECTION = "x11/fonts"
@@ -10,21 +10,13 @@ LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f96db970a9a46c5369142b99f530366b"
 PE = "1"
 
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".2"
-
-inherit allarch fontcache
-
-FONT_PACKAGES = "${PN}"
-
-SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
+SRC_URI = "https://github.com/liberationfonts/liberation-fonts/files/6418984/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
+SRC_URI[sha256sum] = "26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef"
 
 S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
 
-SRC_URI[md5sum] = "5c781723a0d9ed6188960defba8e91cf"
-SRC_URI[sha256sum] = "7890278a6cd17873c57d9cd785c2d230d9abdea837e96516019c5885dd271504"
+inherit allarch fontcache
 
 do_install () {
 	install -d ${D}${datadir}/fonts/ttf/
-- 
2.26.3

