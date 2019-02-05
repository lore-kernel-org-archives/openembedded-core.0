Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A61937BFD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 00:01:29 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u6so670200pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 16:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=lnSGEV4pymQQ6wUDS5R41acwf8OsR91e4sVtxIeFuDA=;
	b=t5kNBI0Xy9+pv02zNA/6iJtpavZz3L+cO/5dpi0SgEcfEWmPJj2FPwgFU37+ZrxNUE
	YEMg5KqPnhizw9ThoixUEJXqVzw62Yp6Q6oJldX6zxqhR7ysXDA9/2lRCIBSsRmaeZOf
	gZXLBrY419E1zYWiwyN3l3i4j/0jeV9d3DSLz/u9w12FMumZB8wpjdhThmhjZwpJR7UP
	kJP+V3PkpzpqF3hNYsIXVFqOvQJ2yaqBrBj0nnKatIqrUUBty7r0m6UaF2CZHQW9jbiQ
	qUsrGlOQsijStxtfK+8TG4dHVLwhadn761pkLF8UJL67kdOYBDn/idKPTQOSZymim7df
	fjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lnSGEV4pymQQ6wUDS5R41acwf8OsR91e4sVtxIeFuDA=;
	b=hUFop2E7PHoce9H5glLhXxoBbjfBG6+/MPbhSTXVPquNAkWrVyAt1XaNAR6LAOKefZ
	lcLOPkOAxW7YYy7ukDar/EhRE9IxYav0Y+HMJtdvLPi/VMC/j4oE6WsBU7KsTNzifFWg
	NTx9I0NOWMsEWIj9VbNJEO4nWvAnp5PtLXFsnByDaouYU/Le87j/VxZ3+suHF9stUOsD
	qfKeaMF38ZkZ10TvMK6spNLY+7Ode88DHTDB/RLJJS3bM7Zk5irDTRcxBwbj3i8W5NF7
	55TrjEz0w4giJpb+nOPrX5VbDRF5ecsw8Ul4oWOF6kq4F+TMjORFQOFW+EUIxlcCXWVd
	Brlw==
X-Gm-Message-State: AHQUAuYu15mz7kqyW6IQr9/tikFo4xup4vOI/CHk8buJOpa2T3g5v7Zc
	AsdMpDTnZwlIRXejQeKXOkj7zTg12ss=
X-Google-Smtp-Source: AHgI3IZ5N8AKY4dujmMJ2drMXPChBYsWlQAlytpUiTpFcfAVSaSd96AmyJGH04RGiScuLt4XH7nIzQ==
X-Received: by 2002:a63:a91a:: with SMTP id u26mr1803415pge.349.1549324890411; 
	Mon, 04 Feb 2019 16:01:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ccee:beeb:3375:fc26])
	by smtp.gmail.com with ESMTPSA id
	h129sm1971712pfb.110.2019.02.04.16.01.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Feb 2019 16:01:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 16:01:27 -0800
Message-Id: <1549324887-20286-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [v2][PATCH] timezone: refactor to simplify maint
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
X-List-Received-Date: Tue, 05 Feb 2019 00:01:29 -0000

move tzcode and tzdata-native into new dir

Updates are now limited to the common include file.

[v2]
Fix UMMARY typ0 in timezone.inc

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../timezone.inc}                                   | 21 +++++----------------
 meta/recipes-extended/timezone/tzcode-native.bb     | 17 +++++++++++++++++
 .../{tzdata/tzdata_2018i.bb => timezone/tzdata.bb}  | 12 +-----------
 3 files changed, 23 insertions(+), 27 deletions(-)
 rename meta/recipes-extended/{tzcode/tzcode-native_2018i.bb => timezone/timezone.inc} (63%)
 create mode 100644 meta/recipes-extended/timezone/tzcode-native.bb
 rename meta/recipes-extended/{tzdata/tzdata_2018i.bb => timezone/tzdata.bb} (94%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb b/meta/recipes-extended/timezone/timezone.inc
similarity index 63%
rename from meta/recipes-extended/tzcode/tzcode-native_2018i.bb
rename to meta/recipes-extended/timezone/timezone.inc
index f056370..696f02d 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -1,10 +1,11 @@
-# note that we allow for us to use data later than our code version
-#
-SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+SUMMARY = "Timezone data"
+HOMEPAGE = "http://www.iana.org/time-zones"
+SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
+PV = "2018i"
+
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
            "
@@ -16,15 +17,3 @@ SRC_URI[tzcode.sha256sum] = "aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b
 SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
 SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
 
-S = "${WORKDIR}"
-
-inherit native
-
-EXTRA_OEMAKE += "cc='${CC}'"
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
new file mode 100644
index 0000000..e3582ba
--- /dev/null
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -0,0 +1,17 @@
+require timezone.inc
+
+#
+SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+
+S = "${WORKDIR}"
+
+inherit native
+
+EXTRA_OEMAKE += "cc='${CC}'"
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
diff --git a/meta/recipes-extended/tzdata/tzdata_2018i.bb b/meta/recipes-extended/timezone/tzdata.bb
similarity index 94%
rename from meta/recipes-extended/tzdata/tzdata_2018i.bb
rename to meta/recipes-extended/timezone/tzdata.bb
index 4482e89..7542ce5 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018i.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -1,17 +1,7 @@
-SUMMARY = "Timezone data"
-HOMEPAGE = "http://www.iana.org/time-zones"
-SECTION = "base"
-LICENSE = "PD & BSD & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
+require timezone.inc
 
 DEPENDS = "tzcode-native"
 
-SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
-
-SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
-SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
-
 inherit allarch
 
 RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
-- 
2.7.4


