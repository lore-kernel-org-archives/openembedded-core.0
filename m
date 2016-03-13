Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 645EE7316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n205so11550251wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HvH9iz9ulKc2y9GV2cMObM+SnEjHDlqc5fMAAwySyvU=;
	b=COqvkE/KxpCoBAfpj/B3sDmuUoJJJzNHM6qbLwxl2rdxMEIgEUQyY1UUIIC8fi393z
	7Y/kXUJUcXhhh5wT+H2pEMmU9cyUWQjV4RLIl7qKvBoC/h10hH9qlbl1ocnCcAyx+gcB
	HvvYqlGES0va1rpsuYuSZ7TF21bEltcNJ3BVy6RfFJGPiCQSq8dHtSUB5+atSwKGvZXG
	Xw9sp6QMYKHGpaqLc3PVBPVd6SHVQXTze9u8otoDQLjcGzWHmAEtJ3KAQBt7kZ4hnGZ6
	GfXhF28EoXUmxblYO/k8EnR3jlVnUUsEJ49iY+O9OzNgJ4yHlcx1IAIENmcz6reo9cpG
	k1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HvH9iz9ulKc2y9GV2cMObM+SnEjHDlqc5fMAAwySyvU=;
	b=LWpTV+1T3I9/ZSMQ/gvw37AZXuQBTXU9bagHMyMM2mU2iSjsofbpiMICA3HlbRB0Sw
	9ng48pYuTID71D2/ce8Q/g6kJOdOCpIaC/E7ReZU6z2HwMySnKHaBOLg3mK4/mvBEd0M
	6AaTto7bFDNZMAni/qvuweZsFIOtebIYHOgS61QIHOD8i1XRCFO2ZGg2VCxfYkpE0+1J
	2fgPgDv4Zf1t7w3dkk3Z0hZFnwkj7bQ1epGq4gEPf/XhnLuNpm0Eg2YcG6sqhY8YpdIE
	f3nxGZfnewBLTVYVSXt8trb28LCets43nIiQMZjs5DzcZvx20uIbc7dI9IVZGgXb3jrL
	CbKw==
X-Gm-Message-State: AD7BkJLNEJAZNlUWC6ZMF2EG7HFZFwq6DbAcTYvB4rBEJ2QakiLFm9EACxPZHDeBy3EInA==
X-Received: by 10.194.83.101 with SMTP id p5mr20414998wjy.141.1457896503004;
	Sun, 13 Mar 2016 12:15:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:02 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:20 +0100
Message-Id: <e0a2ddf28cb8ee669b80b40b7ba561b735629998.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 22/42] distcc: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:02 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index f8879c8..e7b9e26 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -48,9 +48,9 @@ do_install_append() {
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/distcc.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distcc.service
+    install -d ${D}${systemd_system_unitdir}/
+    install -m 0644 ${WORKDIR}/distcc.service ${D}${systemd_system_unitdir}
+    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/distcc.service
     ${DESKTOPINSTALL}
 }
 DESKTOPINSTALL = ""
@@ -65,7 +65,7 @@ FILES_${PN} = " ${sysconfdir} \
     ${bindir}/lsdistcc \
 		${bindir}/distccd \
 		${bindir}/distccmon-text \
-		${systemd_unitdir}/system/distcc.service"
+		${systemd_system_unitdir}/distcc.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
 
-- 
2.7.1


