Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 569C7778D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:49:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a19so8078901qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3DDE6ssioOU+PXpZT/3Jeh8XaSMJozY2IKpdzRUz5dE=;
	b=TRzwXnzo15h5akxmETbHRqAgXItnM48k+1qnWh8TRqP7J+QGsst1K9oVCCapXK5128
	IZEZ4JtWTuaskidD6zH6vC4EfNtGcloZxtnZKh6cjrpP6SYkirTs6vQDfqxnP48f+L+z
	+6yG8ADvkneP99eG/tW9mMLpY/cqDl5tgIZ0PM/2WE98VFGZDJhqSiP7oCBKvmnqcKhR
	uVoSXaYvccb9BN9zX45lMndD2WB50YMin22JVIJxfDz/YASzWLRNnH5EruiTXN8eow11
	Ch8E5HJN0PjKYUGhu488BbRR6wLeohBb3i0zTun8wXxl/I3+K+LZrPFWiAT1ku+cSUfn
	t29g==
X-Gm-Message-State: AN3rC/7/HCOATG1VMq5yQUYusEAxyGlUa5prak4aJzGOf70Hwu1PsRfN
	nDz8o6CuUMYmLw==
X-Received: by 10.55.75.75 with SMTP id y72mr2350469qka.36.1493131741523;
	Tue, 25 Apr 2017 07:49:01 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.49.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:49:01 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:40 -0400
Message-Id: <1493131720-19456-8-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv4 7/7] bluez5: cleanup tabs and spaces
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
X-List-Received-Date: Tue, 25 Apr 2017 14:49:00 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
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


