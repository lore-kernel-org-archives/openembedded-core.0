Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B17ED6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:31 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v75so19367853qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zrflklL4T1gAHGBj7kUn9RHQ6/e6XUM47NU0OtnRmP4=;
	b=oXkHzl6taCxZEFU3OIuAsCSxXzGzT+mVCY7TTVxZvTSYDbvOieqkoH7u3scTr0OfYp
	hU59FBXkSvET8jE/LyIIX0t50/z53T7NNtVKQMXX04VkzJMesgkMccuhtJsfX7JZcUl4
	sRd0y68CP2Ak3HVYgrl6gtdhYRL0TpGrhTEdrJkfW+PnTelme8CRfwU/sXiaENh6sVtE
	cWgZhMOp9QutO0/O9FuEU926RHGrPE8KB0NLxduKl7It0ex67WloUTNW7anMSgvRLs23
	aHOQjSNR/MDTMjykMXjPO8h7xXiEJzPGrlTJZ6SSoJXb++jhLKeDgjvjgN2q5hfllY27
	SMMw==
X-Gm-Message-State: AN3rC/4vMl20m7VEAhgb1LVUngYt0OE2VCWQz3s4VXJm6s1P3e1r0ccj
	k84UCirayckE1A==
X-Received: by 10.55.65.65 with SMTP id o62mr9701661qka.52.1492436372552;
	Mon, 17 Apr 2017 06:39:32 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:32 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:57 -0400
Message-Id: <1492436338-32048-8-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 7/8] bluez5: cleanup tabs and spaces
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
X-List-Received-Date: Mon, 17 Apr 2017 13:39:31 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 56 ++++++++++++++---------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 47d8f22..98fb9b3 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,29 +52,29 @@ NOINST_TOOLS = " \
 "
 
 do_install_append() {
-	install -d ${D}${INIT_D_DIR}
-	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
-
-	install -d ${D}${sysconfdir}/bluetooth/
-	if [ -f ${S}/profiles/network/network.conf ]; then
-	    install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
-	fi
-	if [ -f ${S}/profiles/input/input.conf ]; then
-	    install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
-	fi
-
-  if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
-    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
-  fi
-
-	# Install desired tools that upstream leaves in build area
-        for f in ${NOINST_TOOLS} ; do
-	    install -m 755 ${B}/$f ${D}/${bindir}
-	done
-
-        # Patch python tools to use Python 3; they should be source compatible, but
-        # still refer to Python 2 in the shebang
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
+    install -d ${D}${INIT_D_DIR}
+    install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
+
+    install -d ${D}${sysconfdir}/bluetooth/
+    if [ -f ${S}/profiles/network/network.conf ]; then
+        install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
+    fi
+    if [ -f ${S}/profiles/input/input.conf ]; then
+        install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
+    fi
+
+    if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
+        sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
+    fi
+
+    # Install desired tools that upstream leaves in build area
+    for f in ${NOINST_TOOLS} ; do
+        install -m 755 ${B}/$f ${D}/${bindir}
+    done
+
+    # Patch python tools to use Python 3; they should be source compatible, but
+    # still refer to Python 2 in the shebang
+    sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
 }
 
 PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
@@ -84,8 +84,8 @@ FILES_${PN} += " \
     ${systemd_unitdir}/ ${datadir}/dbus-1 \
     ${libdir}/cups \
 "
-FILES_${PN}-dev += "\
-  ${libdir}/bluetooth/plugins/*.la \
+FILES_${PN}-dev += " \
+    ${libdir}/bluetooth/plugins/*.la \
 "
 
 FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
@@ -115,10 +115,10 @@ INITSCRIPT_NAME_${PN} = "bluetooth"
 EXCLUDE_FROM_WORLD = "1"
 
 do_compile_ptest() {
-        oe_runmake buildtests
+    oe_runmake buildtests
 }
 
 do_install_ptest() {
-        cp -r ${B}/unit/ ${D}${PTEST_PATH}
-        rm -f ${D}${PTEST_PATH}/unit/*.o
+    cp -r ${B}/unit/ ${D}${PTEST_PATH}
+    rm -f ${D}${PTEST_PATH}/unit/*.o
 }
-- 
2.7.4


