Return-Path: <akuster808@gmail.com>
Received: from mail-pb0-f53.google.com (unknown [209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C31E60E23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 21:13:49 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id md12so8071176pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=223lPfsGg+ErD+ub6qh8lm2SH/9T09BSwz3hb5PXPL4=;
	b=b81bLdBIeELIdWx/nuGPzLR/M+xTXH6+pLmhHICVimHJjM4tW1O87ypETuSXBaGZvC
	3TqZD0AE6FF77ztWMJH/Iu6qPQ1cuGA6+pYO76EjTk2H0ZGkdIPZi/4jJztx72GN1U/w
	+/OGZgSCg39qmqVTT6WYT9rlFXclZ5u4/eLatDS/MUCNep/PKV3Nd+kKZYfvpEH8J5gv
	NFdVbhL1NljHNqWTO4UKQSX4ZxBG+saTiAy0XwOwXO6j0rBciiD1kgkbSs0IWOwYXJdZ
	abk5acNpUgCJfLXOYvEJ1Bj8SMtkrnGnI5d6EVvX2BJQPAy04fGzIARlUwjkY0mNzYmC
	LVow==
X-Received: by 10.69.19.225 with SMTP id gx1mr30874100pbd.34.1401138342008;
	Mon, 26 May 2014 14:05:42 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	wg7sm19729596pbc.73.2014.05.26.14.05.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 May 2014 14:05:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 May 2014 14:05:31 -0700
Message-Id: <1401138331-31087-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401138331-31087-1-git-send-email-akuster@mvista.com>
References: <1401138331-31087-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 2/2] Update tzcode to 2014c
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
X-List-Received-Date: Mon, 26 May 2014 21:13:52 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-extended/tzcode/tzcode-native_2013i.bb | 26 ----------------------
 .../recipes-extended/tzcode/tzcode-native_2014c.bb | 25 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2013i.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014c.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013i.bb b/meta/recipes-extended/tzcode/tzcode-native_2013i.bb
deleted file mode 100644
index cfedc5b..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2013i.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Timezone zoneinfo utils (zic, zdump, tzselect)"
-LICENSE = "PD & BSD"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8f"
-
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2013i.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "86154c8b0cfb47f4e2027ecaa2ec547a"
-SRC_URI[tzcode.sha256sum] = "63bba6790afc1cb2ea0af2b998a35fc237e247608140dbe4e08b4216a8c31358"
-
-SRC_URI[tzdata.md5sum] = "8bc69eb75bea496ebe1d5a9ab576702d"
-SRC_URI[tzdata.sha256sum] = "1cd56a6ee964143ef0c65229968a5093988335b95e9115235b5e7b7e45e67dda"
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
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014c.bb b/meta/recipes-extended/tzcode/tzcode-native_2014c.bb
new file mode 100644
index 0000000..4139825
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014c.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8f"
+
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014c.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "657636f201ae8b561225afde49d274af"
+SRC_URI[tzcode.sha256sum] = "1461e6f6973797ccf516421b272a28082fe26754e8ae94967d8f931a4c8f011b"
+SRC_URI[tzdata.md5sum] = "fa7f3dc1c6f6238253a6f2b850467e2e"
+SRC_URI[tzdata.sha256sum] = "aa2924e012644de3a6cc3160ffff690cb3afecf350af435daefa43bb669fb8f1"
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


