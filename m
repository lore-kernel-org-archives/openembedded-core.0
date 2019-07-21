Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 819447EE94
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:50 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id r7so16132735pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=p0xGBKYDi2sL6xw2d8WZWfj9XeIWO0vyqDzdFAdmIDk=;
	b=CqCuWJoPzl0v/5sYmzZ5dbNzhkOZe2vp9veJsxvoeaFvyl7AeC2fqfhUkMRAnzrqUJ
	fQ7V8SH7niLraqEywWhE9sFDVMTwOzAB+KM9/wic8YZ8Xl+ndLcoP9XpOpQ7P0QVClcw
	SE5ZVmPO2WKehWpjj0avRYSgdofixivtIYDf2vcyKuerm0wFAGscvJ1DA0S35rvzyG65
	dGysN6JUcUvCBIwjLUsXDudyCzyCNAo6ojL8lgTYTh/10PqSM/lfUdx42zbZ1pNQi2yM
	Sv9knoyFSr4f4RRAABwqaVpgvRXgxTfcmFDRzmZpYLWhWUQ9nuV99WSRgEDCd92MGro1
	ZFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=p0xGBKYDi2sL6xw2d8WZWfj9XeIWO0vyqDzdFAdmIDk=;
	b=PhQtuzrrN6mbeEde0JPpaNZx8PodvtatY7kKxW2kOZvsvDX5iB3vJXjkcZaSYojhfz
	kJ2QIAuSOsIwV+Bthe7oa6JvNpLEW/yHJeAVRFo/FhrVjmi6gngTUwpbizrY5n2Xk0OL
	YunB9zII0n6vmBHfgV9UvizhJvf3UrdECL3kpBAbHQmZX/xVESCUXUPGlbUNyqkA618e
	/Hpp8KjakSrKkLIOk08BSGnEwqiJ5bTL2jDT3BOzm7wHJr6Kgn5kgABQoPuAoWCmfVZP
	j0fhhqkFR/T6CKX3fSW0Yy22SSuCAXrntSlBfRxmlZKnYlElMCyV5ysmC77bH7QPzo4a
	ojPA==
X-Gm-Message-State: APjAAAWpt8O9Cnjx6FPSIQeFY7AkB+WqoiNDdCZYp1K8+ByLF5t+xoLO
	BI38A0qc+7hmVsvv82hilnbM1mAv
X-Google-Smtp-Source: APXvYqweihr+Q86f8vhvRtVvnUnsPuBv5EnCiR9P06+0pfdz0GPs/6RzHDEoJEnCT52pYQcWUj1HjA==
X-Received: by 2002:a17:90a:cb12:: with SMTP id
	z18mr68582336pjt.82.1563719151275; 
	Sun, 21 Jul 2019 07:25:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:17 -0700
Message-Id: <5c45cd09fb29d4a1ebda6153a25f16e312049c44.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 28/30] qemu: Security fixes CVE-2018-20815 CVE-2019-9824
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 98623
Type: Security Fix
Disposition: Backport from qemu.org
ChangeID: 03b3f28e5860ef1cb9f58dce89f252bd7ed59f37
Description:

Fixes both CVE-2018-20815 and CVE-2019-9824

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../qemu/qemu/CVE-2018-20815_p1.patch              | 42 +++++++++++++++++
 .../qemu/qemu/CVE-2018-20815_p2.patch              | 52 ++++++++++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2019-9824.patch | 47 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  3 ++
 4 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch
new file mode 100644
index 0000000..c3a5981
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch
@@ -0,0 +1,42 @@
+From da885fe1ee8b4589047484bd7fa05a4905b52b17 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Fri, 14 Dec 2018 13:30:52 +0000
+Subject: [PATCH] device_tree.c: Don't use load_image()
+
+The load_image() function is deprecated, as it does not let the
+caller specify how large the buffer to read the file into is.
+Instead use load_image_size().
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Message-id: 20181130151712.2312-9-peter.maydell@linaro.org
+
+Upstream-Status: Backport
+CVE: CVE-2018-20815
+affects <= 3.0.1
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ device_tree.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/device_tree.c b/device_tree.c
+index 6d9c972..296278e 100644
+--- a/device_tree.c
++++ b/device_tree.c
+@@ -91,7 +91,7 @@ void *load_device_tree(const char *filename_path, int *sizep)
+     /* First allocate space in qemu for device tree */
+     fdt = g_malloc0(dt_size);
+ 
+-    dt_file_load_size = load_image(filename_path, fdt);
++    dt_file_load_size = load_image_size(filename_path, fdt, dt_size);
+     if (dt_file_load_size < 0) {
+         error_report("Unable to open device tree file '%s'",
+                      filename_path);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch
new file mode 100644
index 0000000..d01e874
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch
@@ -0,0 +1,52 @@
+From 065e6298a75164b4347682b63381dbe752c2b156 Mon Sep 17 00:00:00 2001
+From: Markus Armbruster <armbru@redhat.com>
+Date: Tue, 9 Apr 2019 19:40:18 +0200
+Subject: [PATCH] device_tree: Fix integer overflowing in load_device_tree()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the value of get_image_size() exceeds INT_MAX / 2 - 10000, the
+computation of @dt_size overflows to a negative number, which then
+gets converted to a very large size_t for g_malloc0() and
+load_image_size().  In the (fortunately improbable) case g_malloc0()
+succeeds and load_image_size() survives, we'd assign the negative
+number to *sizep.  What that would do to the callers I can't say, but
+it's unlikely to be good.
+
+Fix by rejecting images whose size would overflow.
+
+Reported-by: Kurtis Miller <kurtis.miller@nccgroup.com>
+Signed-off-by: Markus Armbruster <armbru@redhat.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Message-Id: <20190409174018.25798-1-armbru@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2018-20815
+affects <= 3.0.1
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ device_tree.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/device_tree.c b/device_tree.c
+index 296278e..f8b46b3 100644
+--- a/device_tree.c
++++ b/device_tree.c
+@@ -84,6 +84,10 @@ void *load_device_tree(const char *filename_path, int *sizep)
+                      filename_path);
+         goto fail;
+     }
++    if (dt_size > INT_MAX / 2 - 10000) {
++        error_report("Device tree file '%s' is too large", filename_path);
++        goto fail;
++    }
+ 
+     /* Expand to 2x size to give enough room for manipulation.  */
+     dt_size += 10000;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch
new file mode 100644
index 0000000..7f83006
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch
@@ -0,0 +1,47 @@
+From d3222975c7d6cda9e25809dea05241188457b113 Mon Sep 17 00:00:00 2001
+From: William Bowling <will@wbowling.info>
+Date: Fri, 1 Mar 2019 21:45:56 +0000
+Subject: [PATCH 1/1] slirp: check sscanf result when emulating ident
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+When emulating ident in tcp_emu, if the strchr checks passed but the
+sscanf check failed, two uninitialized variables would be copied and
+sent in the reply, so move this code inside the if(sscanf()) clause.
+
+Signed-off-by: William Bowling <will@wbowling.info>
+Cc: qemu-stable@nongnu.org
+Cc: secalert@redhat.com
+Message-Id: <1551476756-25749-1-git-send-email-will@wbowling.info>
+Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+Reviewed-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+
+Upstream-Status: Backport
+https://git.qemu.org/?p=qemu.git;a=commitdiff;h=d3222975c7d6cda9e25809dea05241188457b113;hp=6c419a1e06c21c4568d5a12a9c5cafcdb00f6aa8
+CVE: CVE-2019-9824
+affects < 4.0.0
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: qemu-3.0.0/slirp/tcp_subr.c
+===================================================================
+--- qemu-3.0.0.orig/slirp/tcp_subr.c
++++ qemu-3.0.0/slirp/tcp_subr.c
+@@ -662,12 +662,12 @@ tcp_emu(struct socket *so, struct mbuf *
+ 							break;
+ 						}
+ 					}
++                so_rcv->sb_cc = snprintf(so_rcv->sb_data, 
++                                         so_rcv->sb_datalen,
++                                         "%d,%d\r\n", n1, n2);
++                so_rcv->sb_rptr = so_rcv->sb_data;
++                so_rcv->sb_wptr = so_rcv->sb_data + so_rcv->sb_cc;
+ 				}
+-                                so_rcv->sb_cc = snprintf(so_rcv->sb_data,
+-                                                         so_rcv->sb_datalen,
+-                                                         "%d,%d\r\n", n1, n2);
+-				so_rcv->sb_rptr = so_rcv->sb_data;
+-				so_rcv->sb_wptr = so_rcv->sb_data + so_rcv->sb_cc;
+ 			}
+ 			m_free(m);
+ 			return 0;
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 63a6468..b591cc24 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -32,6 +32,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-19364_p2.patch \
            file://CVE-2018-19489.patch \
            file://CVE-2019-12155.patch \
+           file://CVE-2018-20815_p1.patch \
+           file://CVE-2018-20815_p2.patch \
+           file://CVE-2019-9824.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


