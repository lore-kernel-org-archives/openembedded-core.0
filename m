Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C372EC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 07:35:11 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.81039.1718696102149718685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 00:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=vJ9FUglL;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KJfEOGrYV6NFcydwZwGeMafGJJmKA46TP/FoU6RjdqE=; b=vJ9FUglLKKxIwyHaNMTF5sieor
	WPfrQKzld+5M6G3aGuCufQ8GU+b7GP4rrukb6/fezuq16JEPdPYsfQEgi8qfGy6bpDkOzsAOaeKB9
	S4csvJ/1Oxh4EWT0ESzsBxKwn/qkYa+TqRAQWQr0gVz5Uv2dwyUzy3Rnue9H8JCHN0aphIQ4jIQBv
	WKTRJjP0nWXuJshc28XvcFnxaCJ7Lt/dTVCP/APFRqsBW9Bu7Ug5S1X8j6/SzqEyv8o7JRNx1ymbz
	qTc0ktQHY0FqBRC93yVDh0McXt2waAcmpgnLeI6IJVUKBhBZuPxFa27LLV2JChBq8tyhyzsqot0qg
	YYGTKZvA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sJTMe-000J3v-Ui; Tue, 18 Jun 2024 09:34:45 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sJTMb-000PJG-1f;
	Tue, 18 Jun 2024 09:34:45 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2 3/3] ofono: add ptests
Date: Tue, 18 Jun 2024 09:34:37 +0200
Message-ID: <20240618073439.2068944-3-martin@geanix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618073439.2068944-1-martin@geanix.com>
References: <20240618073439.2068944-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27309/Mon Jun 17 10:30:25 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 07:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200861

Install and run the unit tests already provided by ofono. Test execution
time is about a second.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Change since v1:
 * add missing run-ptest file

 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-connectivity/ofono/ofono/run-ptest | 14 ++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.8.bb    | 12 +++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index c60575a45cc2..60cbea0f19e9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -53,6 +53,7 @@ PTESTS_FAST = "\
     lzo \
     m4 \
     nettle \
+    ofono \
     opkg \
     pango \
     popt \
diff --git a/meta/recipes-connectivity/ofono/ofono/run-ptest b/meta/recipes-connectivity/ofono/ofono/run-ptest
new file mode 100644
index 000000000000..ba0f66ee4170
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+ret_val=0
+
+for test in test-*; do
+    if "./$test" >> ofono_test.log 2>&1; then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+        ret_val=1
+    fi
+done
+
+exit $ret_val
diff --git a/meta/recipes-connectivity/ofono/ofono_2.8.bb b/meta/recipes-connectivity/ofono/ofono_2.8.bb
index 809485d42178..f54367848f05 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.8.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
@@ -10,10 +10,11 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
+    file://run-ptest \
 "
 SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
 
-inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
+inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data ptest
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
@@ -28,11 +29,20 @@ PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
 
 EXTRA_OECONF += "--enable-test --enable-external-ell"
 
+do_compile_ptest() {
+    oe_runmake buildtest-TESTS
+}
+
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${UNPACKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
 }
 
+do_install_ptest() {
+    install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/unit -executable -type f)
+    install -m644 -Dt ${D}${PTEST_PATH}/unit ${B}/unit/test-provision.db
+}
+
 PACKAGES =+ "${PN}-tests"
 
 FILES:${PN} += "${systemd_unitdir}"
-- 
2.45.2


