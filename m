Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 59D0C77160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:35:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 65so4245116pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=pV5ZsBHcqegTYGhwjxMt4NM1SoRzrTE00tXiwgNuNqE=;
	b=bOb2keIbH9eJvfn7nUqSNBBFR445C31JRUTwH646Y7HDZFZU9DD6W9OTlvY54D72pt
	hqtkhMbZBdoKa8JJwDP7+6nahfq/y4YLmk97myjbKJEHctgUS19dkazcdb7PpKgjjgBL
	QLkUqFfdzWCr0EJHppowlzvM8XNKlqBjkCBhjSrFqbHSQrwVnKcOjCckdZ6BmTwpST6r
	o9SsEFqMwsrVg3BoteZAYmfGhvHYFY5ibn/3IGFB4xgQPsgeBBwhgeEcd7sGXOe8s9Eb
	WAeOiZDzGw7kFjGxGgeKCeAcJfjGHqyyHwUvjVWIcWWdyOT6j22LCpTw2L03wv+dlGaw
	ojQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=pV5ZsBHcqegTYGhwjxMt4NM1SoRzrTE00tXiwgNuNqE=;
	b=cBSDZpq7xtQZCkJC581EQmerGFh3d79r/thPzb1G+35eFnpRAk0TLosEY2YLp4OTt+
	mw3+Ox7uf080iCojh0/oCK7eLHmkvgHIFPbrPJH3FzqX5ym/yuE/v2b62e23J+GYbVww
	qHOp1OFaaHgVBPKaxLx2RqdbquXR+aQ6tZ6eHKZSrceZDlF9XcpAPGy57RCdHXgmZsh+
	Ed2nthYHLmOLDgyJF01h9PeglrUSsbHCQOusW0gUpkhiCyfuY/4mbroPxWRj49CBQFEK
	yl3XmdmriEo8EgYPx3WWgDcyOkATgMglQOj2dGj1acThph9woLFU6WLSz6zCUFCrqVsv
	Lkhg==
X-Gm-Message-State: AG10YOTX/NHSCyuxhmFsKkgecwQyDoASWZHRUUTlJVsXcTIq4Wb8pbFhu+wo8fBHFHxkSA==
X-Received: by 10.98.79.140 with SMTP id f12mr16627438pfj.102.1454099733564;
	Fri, 29 Jan 2016 12:35:33 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r80sm858016pfi.9.2016.01.29.12.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:35:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 12:35:19 -0800
Message-Id: <3b82a3de498b2ea3ab7bb09b4505b705a7f11796.1454099596.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
Subject: [PATCH 4/6] qemu: Security fix CVE-2015-8345
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
X-List-Received-Date: Fri, 29 Jan 2016 20:35:34 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8345 Qemu: net: eepro100: infinite loop in processing command block list

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-8345.patch | 73 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch
new file mode 100644
index 0000000..310b458
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch
@@ -0,0 +1,73 @@
+From 00837731d254908a841d69298a4f9f077babaf24 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 20 Nov 2015 08:42:33 +0100
+Subject: [PATCH] eepro100: Prevent two endless loops
+
+http://lists.nongnu.org/archive/html/qemu-devel/2015-11/msg04592.html
+shows an example how an endless loop in function action_command can
+be achieved.
+
+During my code review, I noticed a 2nd case which can result in an
+endless loop.
+
+Reported-by: Qinghao Tang <luodalongde@gmail.com>
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=00837731d254908a841d69298a4f9f077babaf24
+
+CVE: CVE-2015-8345
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/net/eepro100.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
+index 60333b7..685a478 100644
+--- a/hw/net/eepro100.c
++++ b/hw/net/eepro100.c
+@@ -774,6 +774,11 @@ static void tx_command(EEPRO100State *s)
+ #if 0
+         uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6);
+ #endif
++        if (tx_buffer_size == 0) {
++            /* Prevent an endless loop. */
++            logout("loop in %s:%u\n", __FILE__, __LINE__);
++            break;
++        }
+         tbd_address += 8;
+         TRACE(RXTX, logout
+             ("TBD (simplified mode): buffer address 0x%08x, size 0x%04x\n",
+@@ -855,6 +860,10 @@ static void set_multicast_list(EEPRO100State *s)
+ 
+ static void action_command(EEPRO100State *s)
+ {
++    /* The loop below won't stop if it gets special handcrafted data.
++       Therefore we limit the number of iterations. */
++    unsigned max_loop_count = 16;
++
+     for (;;) {
+         bool bit_el;
+         bool bit_s;
+@@ -870,6 +879,13 @@ static void action_command(EEPRO100State *s)
+ #if 0
+         bool bit_sf = ((s->tx.command & COMMAND_SF) != 0);
+ #endif
++
++        if (max_loop_count-- == 0) {
++            /* Prevent an endless loop. */
++            logout("loop in %s:%u\n", __FILE__, __LINE__);
++            break;
++        }
++
+         s->cu_offset = s->tx.link;
+         TRACE(OTHER,
+               logout("val=(cu start), status=0x%04x, command=0x%04x, link=0x%08x\n",
+-- 
+2.3.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index b5c717c..6c12bee 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2015-8504.patch \
             file://CVE-2015-7504.patch \
             file://CVE-2015-7512.patch \
+            file://CVE-2015-8345.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.3.5


