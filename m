Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id B255F6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 21:43:35 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id j92so6227398qgj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=3tgO/P5AOC3Rf1iVgySo1lTNDlJVsnUcnn+QVqiZWWM=;
	b=yOIMU1ItQYNH5SGjea/I0LQsKYLfQEZE+mILfrCsSkdmU2hbozlp34bctH3tG9chg3
	P0xuti28iYafOIDH0xqJ/hBP0HFLDsLrDqNB2Bd8c8L1dtiDTLx5u/aeQooR7bRhDWfp
	6l1uw84cn8h8N12Zvbt7MHj9V4G4GzaINTHJ8wGnNgoQzwEWoxPfKuCQoZUnL/zdkrzw
	Q5HNlCeorY627VvlMXYPzLyiC2trQN5QrAyHSZefwCoMN5RcBOqsg3p+/BhPBE5BDaFg
	rKt4cwC1eCofVLicet676w5ggP+HqLjoLLh03Xj48T+MuPB51TRZcYDMIAE7REoj7iEL
	+FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3tgO/P5AOC3Rf1iVgySo1lTNDlJVsnUcnn+QVqiZWWM=;
	b=LXI1tdKufAZ/yV9lNECQmvzaRRJOL2UIs0gEhvs+XNygsT6UrmO217wftkO/jFNFqJ
	W8wnm56qdfaEsW2H12fhEOBT80HFFzu8yjSOnCaMen6sI9JBoG0Ky4xu9VXLpBWLUUmQ
	NfRwFKVDF4wHckjPrHN+0HOrkV89zMPhKFpBQkXfqHzhV7f7fvjsfqUKa57VARFb+ziJ
	P0jVcF6tw+BnozXuom6uNaaIyE6Bke+DCl7ue1eG8MHaPWMK4mbPXPb7xRGCQcagkj4P
	VufnEzO/dQJdbQWsXdODnp76IGWEAQM9acsdnLx84nUGeq93ev00kX97wNWCYchbG9rG
	ZB+Q==
X-Gm-Message-State: AD7BkJIw4ndTwOa8XeC9zF7JLcnKJ/lkl11rITeh9w9fw1KDiJCFnM94YknFrtJbdMJb3A==
X-Received: by 10.140.148.134 with SMTP id 128mr26584313qhu.98.1458337415805; 
	Fri, 18 Mar 2016 14:43:35 -0700 (PDT)
Received: from localhost.localdomain ([151.124.160.55])
	by smtp.gmail.com with ESMTPSA id
	s77sm6871630qkl.29.2016.03.18.14.43.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 14:43:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2016 14:43:17 -0700
Message-Id: <1458337398-1462-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] tzcode: update to 2016b
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
X-List-Received-Date: Fri, 18 Mar 2016 21:43:35 -0000

change SRC_URI http seems more reliable

Changes to code

     tzselect's diagnostics and checking, and checktab.awk's checking,
     have been improved.  (Thanks to J William Piggott.)

     tzcode now builds under MinGW.  (Thanks to Ian Abbott and Esben Haabendal.)

     tzselect now tests Julian-date TZ settings more accurately.
     (Thanks to J William Piggott.)

Changes to commentary

     Comments in zone tables have been improved.  (Thanks to J William Piggott.)

     tzselect again limits its menu comments so that menus fit on a
     24x80 alphanumeric display.

     A new web page tz-how-to.html.  (Thanks to Bill Seymour.)

     In the Theory file, the description of possible time zone abbreviations in
     tzdata has been cleaned up, as the old description was unclear and
     inconsistent.  (Thanks to Alain Mouette for reporting the problem.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/tzcode/tzcode-native_2016a.bb | 25 ----------------------
 .../recipes-extended/tzcode/tzcode-native_2016b.bb | 25 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2016a.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2016b.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016a.bb b/meta/recipes-extended/tzcode/tzcode-native_2016a.bb
deleted file mode 100644
index 76f97f0..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2016a.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD & BSD & BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
-
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "f5e0299925631da7cf82d8ce1205111d"
-SRC_URI[tzcode.sha256sum] = "11ae66d59b844e8c6c81914c9dd73b666627bd7792855ba9de195eee4520c28d"
-SRC_URI[tzdata.md5sum] = "0d3123eb1b453ec0620822bd65be4c42"
-SRC_URI[tzdata.sha256sum] = "5efa6b324e64ef921ef700ac3273a51895f672684a30e342f68e47871c6a8cd1"
-
-S = "${WORKDIR}"
-
-inherit native
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016b.bb b/meta/recipes-extended/tzcode/tzcode-native_2016b.bb
new file mode 100644
index 0000000..3a7dbf5
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016b.bb
@@ -0,0 +1,25 @@
+# note that we allow for us to use data later than our code version
+#
+SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD & BSD & BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
+
+SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
+           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "527e73bc90c70746799d61006bcf038e"
+SRC_URI[tzcode.sha256sum] = "e935c4fe78b5c5da3791f58f3ab7f07fb059a7c71d6b62b69ef345211ae5dfa7"
+SRC_URI[tzdata.md5sum] = "f638ec0d4d7a17f001ce475860255c85"
+SRC_URI[tzdata.sha256sum] = "6392091d92556a32de488ea06a055c51bc46b7d8046c8a677f0ccfe286b3dbdc"
+
+S = "${WORKDIR}"
+
+inherit native
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
-- 
1.9.1


