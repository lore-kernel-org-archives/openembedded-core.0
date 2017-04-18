Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8135571A3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:31 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id o22so68830688iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CzpByfGEvShQGRYvX2iWXQqpW+EG5tNG0Iu8MkzBqpc=;
	b=Xy3cfFNTkWykGrcfXApLnEkkT5H1kagUysUg3+ieVECREnzZVbGHwKNRAAsacm88HI
	cQJN5JTAiw4uqzt5UxXZfk36Zk7tCaVbEyPzgJoVwrINL+5nXgqd2R0ID46qAsVu+Kw1
	BGHdEDKmcg1q9cat4YV14NrIuro8QgNJmuUTptutXYcTPwgBfQPSmgYOmnKpw+7nNzT+
	fmoEA3KVxgghVqf6nzVGcRgClkRrup+oQAtmoKCRUK8T1mA+cmKIbTbPAmmuJ7YTrj52
	Qh+RNsYVncJkdSoB0q6gDOO9Wgacg/TlFIPBKYnjca0l+uoGW4vctWoDptWxGH1RcdGQ
	qevg==
X-Gm-Message-State: AN3rC/72LTvnhrGBDT8wRsUKpLmkRUUWIdPR1EMrM/PswvrFyy0Ta/pG
	B8BHAekEWRavag==
X-Received: by 10.36.91.67 with SMTP id g64mr13778272itb.20.1492521632324;
	Tue, 18 Apr 2017 06:20:32 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:31 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:08 -0400
Message-Id: <1492521609-26624-8-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv3 7/8] bluez5: cleanup tabs and spaces
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:31 -0000

---
 meta/recipes-connectivity/bluez5/bluez5.inc | 30 ++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 47d8f22..01ade7d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -57,24 +57,24 @@ do_install_append() {
 
 	install -d ${D}${sysconfdir}/bluetooth/
 	if [ -f ${S}/profiles/network/network.conf ]; then
-	    install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
+		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
 	fi
 	if [ -f ${S}/profiles/input/input.conf ]; then
-	    install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
+		install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
 	fi
 
-  if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
-    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
-  fi
+	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
+		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
+	fi
 
 	# Install desired tools that upstream leaves in build area
-        for f in ${NOINST_TOOLS} ; do
-	    install -m 755 ${B}/$f ${D}/${bindir}
+	for f in ${NOINST_TOOLS} ; do
+		install -m 755 ${B}/$f ${D}/${bindir}
 	done
 
-        # Patch python tools to use Python 3; they should be source compatible, but
-        # still refer to Python 2 in the shebang
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
+	# Patch python tools to use Python 3; they should be source compatible, but
+	# still refer to Python 2 in the shebang
+	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
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
+	oe_runmake buildtests
 }
 
 do_install_ptest() {
-        cp -r ${B}/unit/ ${D}${PTEST_PATH}
-        rm -f ${D}${PTEST_PATH}/unit/*.o
+	cp -r ${B}/unit/ ${D}${PTEST_PATH}
+	rm -f ${D}${PTEST_PATH}/unit/*.o
 }
-- 
2.7.4


