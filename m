Return-Path: <akuster808@gmail.com>
Received: from mail-pb0-f48.google.com (unknown [209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id DDBFC6FA2F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 21:21:45 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rr13so11823836pbb.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SEYrQzxB0SBt8w5HR+2h7nT5bdVzGYGTOmxbv+D96d4=;
	b=TY794b9ikcjCqq2lKgJFu9fB0ELxw4DCf038dJEcYGUGcd312u9cEHogG35dVtinOw
	NBde9LkUPh1FnPiibbpIPW4w9JkfyliYEfL7jakYxV/BxdFT5MawHg2UmPoB7WHW0gX9
	/nRAJsjQyCeLsxWJn9niwCCLx+d6DHTzMNikE2ZMXy6Nfu1RgVdpHvWfE8kBS+8sj8zt
	aNbsTdgeCF4IPzM3KNuggvfY07ZSpqyCRL0b1YdrCiNIazw6ZTaZ71OWWNXA08cHK3DQ
	Nh91B7UVFk0Q9fV9nvARXnPOAe2z+uMG0HlSnKfC9ylv1+Dqk6gAxjiIQ/BdgV8KMALM
	W2Dw==
X-Received: by 10.68.138.227 with SMTP id qt3mr3203807pbb.6.1401312106735;
	Wed, 28 May 2014 14:21:46 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	ie9sm93807694pad.29.2014.05.28.14.21.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 14:21:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 14:21:39 -0700
Message-Id: <1401312099-4247-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401312099-4247-1-git-send-email-akuster@mvista.com>
References: <1401312099-4247-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 2/2 V2] Update tzcode to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 21:21:46 -0000

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
index 0000000..65a31ae
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014c.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD & BSD"
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


