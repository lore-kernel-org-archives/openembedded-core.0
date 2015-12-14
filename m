Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9F36E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 17:48:00 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p66so55559885wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=eixD+f5LibRdpc+tGUxGsbqg8/v1UX9LHGyiw/wX76U=;
	b=SImouMfQCX6WLkPIBIvxBhVqzH3ESVyED84K8VGVP/xkTWGv4NdGmUikoxoTAOeHp4
	MAmdbGhiv89Rcw3LCp2DJ25bf5xsN1xfk6WXEn8Ks2Z5uZGopmZVM/zNA6GWGKswOdLs
	pGqzQhggMSKW82TSm1hPI2dxxrt1bth0+uBn4wULPG8tztq7Re8LrHOY16aqVgnL2KbI
	RmLIkxa0UGgc0LrL3oveM28VIgrbETIf8VzgbxMGsksQM5x/VigUUegKk2BPUd/yMNrx
	+xa8CyJn16hx6bCs+F2Lfm168PHfrzi1xhXWjN+niKvl+lhLPldY/S98BW98OV07fmCE
	rB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eixD+f5LibRdpc+tGUxGsbqg8/v1UX9LHGyiw/wX76U=;
	b=DFuHAIgvmmr90fCqnyW1Dwib0N4I0KBy6gTW8yY71ZzeCZ6FdcFcUZim5WJPQW6sBm
	L1lmb4uR7Dzm62jG6R4i26BqNL3MY/4QlqBgPahQNK6KB2z0EPFW+cWn+UHCFmy0xwk4
	anoWvznNphWafZoyxgIO8OU8smgbR1zAcJnnFaRizCvDPchoq21NGwUjwf3UUOtPusBo
	zNoZcWJ3fvAMLwM4PAprYqVUXxV1rkNzl1wlE+DRzFodmuW7G9//9X6A3BKXt5kAK8J5
	xKpGZXeR1+rceiY3IwYSdpN/0NQ/40cJBd+jgRgEjSF4fNYlD6WvGqBdDzPOooKQFOhN
	9zvA==
X-Gm-Message-State: ALoCoQm/TuriisinvOvvq0GdkbJbeEf+zILkEsmUMpiFdasFYsUldu5KPkmATBgRi2xcdmpy/sBvaoqMKr/v4E/b9ydgN8wirg==
X-Received: by 10.28.179.68 with SMTP id c65mr24995301wmf.81.1450115280469;
	Mon, 14 Dec 2015 09:48:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u139sm17106190wmu.22.2015.12.14.09.47.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Dec 2015 09:47:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:47:57 +0000
Message-Id: <1450115277-23685-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] unifdef: upgrade to 2.11
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
X-List-Received-Date: Mon, 14 Dec 2015 17:48:01 -0000

Add COPYING to the license checksums, and update the checksum for unifdef.c as
the copyright dates changed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/unifdef/unifdef_2.10.bb | 15 ---------------
 meta/recipes-devtools/unifdef/unifdef_2.11.bb | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/unifdef/unifdef_2.10.bb
 create mode 100644 meta/recipes-devtools/unifdef/unifdef_2.11.bb

diff --git a/meta/recipes-devtools/unifdef/unifdef_2.10.bb b/meta/recipes-devtools/unifdef/unifdef_2.10.bb
deleted file mode 100644
index b8a0079..0000000
--- a/meta/recipes-devtools/unifdef/unifdef_2.10.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Selectively remove #ifdef statements from sources"
-SECTION = "devel"
-LICENSE = "BSD-2-Clause"
-
-LIC_FILES_CHKSUM = "file://unifdef.c;endline=32;md5=2cc23f0382a6f560f6a9ecf4e040c0da"
-
-SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "bb5d895e5ebbba5c5cc0c2771cf97ebe"
-SRC_URI[sha256sum] = "3b9b2b6b1952e9b9c1b9f734edec270689a35bdbf33ae66b50e19b2ed0d2df06"
-
-do_install() {
-	oe_runmake install DESTDIR=${D} prefix=${prefix}
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/unifdef/unifdef_2.11.bb b/meta/recipes-devtools/unifdef/unifdef_2.11.bb
new file mode 100644
index 0000000..1d13b9a
--- /dev/null
+++ b/meta/recipes-devtools/unifdef/unifdef_2.11.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Selectively remove #ifdef statements from sources"
+SECTION = "devel"
+LICENSE = "BSD-2-Clause"
+HOMEPAGE = "http://dotat.at/prog/unifdef/"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=78fc6c2c1dc4f18c891ed5b7a469fe32 \
+                    file://unifdef.c;endline=32;md5=aaec84d8b68d8b6dea71f45e9949ebfe"
+
+SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "337053fd8a7d9ab3adf5e50f88af95b7"
+SRC_URI[sha256sum] = "828ffc270ac262b88fe011136acef2780c05b0dc3c5435d005651740788d4537"
+
+do_install() {
+	oe_runmake install DESTDIR=${D} prefix=${prefix}
+}
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


