Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 66B607E6C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id a93so1758620pla.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZPk2rsi+Mdhy8RG34Du3JY3lUMBek6ype5Yb63gu39E=;
	b=C8E+kpI4dqKZ2bhJTjXm3+7t13iyYYkknOYTeJ7YaKm2QI/NqEORwfNtkGRK9YyeyA
	bhc+kwTncnOm6v8AU49SfKQ2WyuTn+s6MumUB7MJS9TURlMZ4CjPgUrM8YSNX0eIC7N5
	OdFWiTiok2O/3Abbt54d8Aa/EmA6vYyN7wmuQ1XUf8rrBcYuVGwvXPSpeJzaBggKLOtK
	/MCfMlE059uyfifDgkOCaj25N+98S6MhuXBMg1SCWomBp3MSUWJgw72VoT2voTVteEUk
	XJC7C5hBxcE5VMNUKuw2xWJK0fyXm7p9WkDJSQGmx9sfIBBwPnIcUiW8oubYSB27pNok
	Soiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZPk2rsi+Mdhy8RG34Du3JY3lUMBek6ype5Yb63gu39E=;
	b=HwfRTtetWZC1kPsJxhybUTNjnMp+lxxGwpqdlgylqUk2Pa/CGY+ctSEC2X6Emx4Yw0
	F7yeuG3ia0X3hC0cSGkmQ1TOwP2U3mwRLqoAaNBpYQLumkE96sHP2yEBst6dqGo/P7t9
	3Gkb7hJV8JxzVZsej/uQ1WuIYBHKrx9uX0ZM03xF5g2B0GrQuWayQIANSs4z6UuHuojw
	E4WxiDKGfeHA1dgIQZjtl/zU7Bv6N0xfONRC9NYzmNYbqqXNs8CYouN7ZWxZpOCz94Cg
	plD2N/pIxmNT19tfpx99OynDPMLoiTt4AfpvGETfeIVPqFWS/4BagIHMNbdGg5IHz+B3
	zkrA==
X-Gm-Message-State: APjAAAXzUSn7r2yNrEDApuMkEqVZZ+DBJbj9FXY927H+91gRLZMYyVJf
	KcrXRF4wmQeWScawiNLy5ruc8vdp1jE=
X-Google-Smtp-Source: APXvYqzC2mSJzQ5CxYbemf3/sJYpllgbxcefTnKa9x57M7OxJ6mFbAV1+xzZ1FTIVix4QPDqTMIANQ==
X-Received: by 2002:a17:902:b608:: with SMTP id
	b8mr6616870pls.303.1561568037379; 
	Wed, 26 Jun 2019 09:53:57 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:23 -0700
Message-Id: <6045c57895cad301c5e3a94de740427343a08065.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 22/25] qemu: Security fix for CVE-2019-12155
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:56 -0000

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


