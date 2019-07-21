Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 30D5F7EE9C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:44 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id m30so16138290pff.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZPk2rsi+Mdhy8RG34Du3JY3lUMBek6ype5Yb63gu39E=;
	b=NP5QZwOETSpChOiA4mjxEwflxrUspun0PsGzsvvUTDuoBwsYqxYnyD+M6tU9skk7Hx
	DOykul8PxEC5o94+6iViU7opFtEr400P/zSnu9lSRkMePioQ3avoho5oPjyMKKY5yHSN
	TaL5Ec4FoVSRJ8RJCSPsEAf6MzkzpALT1qpE0F9KdReyu48hMk3hqn+ZLU19hb/Gwu7N
	LuEcBLmY6Kl5MqB025q1Vb7N10tW64m+PF9pmyb/NgDVl9HDYelCTT3w8VXUTdJxd408
	L7TmsPEgaPdfg2dIMU+Pu7JpBL+RASgqUB0ImcpLjz1oTKbe9GnnDsrRa507PxGPQSKq
	u8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZPk2rsi+Mdhy8RG34Du3JY3lUMBek6ype5Yb63gu39E=;
	b=GnC1xURytfNbFnZ/bbi/0pTMUX5VL1z/BnFr+CYmsYu6tjBZVyhvR3S+9GP5SRX39x
	II+xcusiPKcdGzCt15g4tb6jYemI70OpEWxKsZH84lM2I8g5hQk4TXP71sHyTjlQR65o
	bOO8phJuBgYLx5JuhLCTTnkjkuCwTqS+PKAjvrk2HPZBGZKSDE/DOaBVM2Jo9pfo1l3R
	8Se3GH/QJBdL2XFU2/8Bk6MdIPdSmY1zXwjsjvq0y9092rHvRwM894hL2WkAiB1g6OkJ
	HVSBjFHNaDrl9B79zvWWCTWlA4N/mM0K8w5jQxPgkzPFhr6GBazZOA6CY7p+N9HJSPTM
	Alog==
X-Gm-Message-State: APjAAAWM40DhG4BVpufFrrXibTPE3jQkyh04ySMtpsm4FiEZcA6XTVmQ
	GrXb4GQ4h4wlOhYhzSylxD6Cq93g
X-Google-Smtp-Source: APXvYqxuRxKON+9hxxhzR2UJ3B8uXxy+cBG3ykceIp/WYNMNRHk1J4JiUY8fg/hiOyS8LSGbykDvIA==
X-Received: by 2002:a63:4e60:: with SMTP id o32mr67880544pgl.68.1563719145154; 
	Sun, 21 Jul 2019 07:25:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:11 -0700
Message-Id: <6045c57895cad301c5e3a94de740427343a08065.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 22/30] qemu: Security fix for CVE-2019-12155
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:44 -0000

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 98382
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=d52680fc932efb8a2f334cc6993e705ed1e31e99
ChangeID: e4e5983ec1fa489eb8a0db08d1afa0606e59dde3
Description:

Fixes CVE-2019-12155
Affects: <= 4.0.0
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../qemu/qemu/CVE-2019-12155.patch                 | 38 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
new file mode 100644
index 0000000..8a5ece5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
@@ -0,0 +1,38 @@
+From d52680fc932efb8a2f334cc6993e705ed1e31e99 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 25 Apr 2019 12:05:34 +0530
+Subject: [PATCH] qxl: check release info object
+
+When releasing spice resources in release_resource() routine,
+if release info object 'ext.info' is null, it leads to null
+pointer dereference. Add check to avoid it.
+
+Reported-by: Bugs SysSec <bugs-syssec@rub.de>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20190425063534.32747-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+https://git.qemu.org/?p=qemu.git;a=commit;h=d52680fc932efb8a2f334cc6993e705ed1e31e99
+
+CVE: CVE-2019-12155
+Affects: <= 4.0.0
+Signed-off-by: Armin Kuster <akuster@mvistra.com>
+---
+ hw/display/qxl.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: qemu-3.0.0/hw/display/qxl.c
+===================================================================
+--- qemu-3.0.0.orig/hw/display/qxl.c
++++ qemu-3.0.0/hw/display/qxl.c
+@@ -764,6 +764,9 @@ static void interface_release_resource(Q
+     QXLReleaseRing *ring;
+     uint64_t *item, id;
+ 
++    if (!ext.info) {
++        return;
++    }
+     if (ext.group_id == MEMSLOT_GROUP_HOST) {
+         /* host group -> vga mode update request */
+         QXLCommandExt *cmdext = (void *)(intptr_t)(ext.info->id);
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 992cf7b..63a6468 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-19364_p1.patch \
            file://CVE-2018-19364_p2.patch \
            file://CVE-2018-19489.patch \
+           file://CVE-2019-12155.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


