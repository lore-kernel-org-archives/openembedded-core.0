Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id C01767EE74
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:39 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id t14so17862665plr.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Yjk2iCSMd0qW6ItDElCjR/NGiM5KsZVMd2S/mXDKsOM=;
	b=c8zR1UF/E2TCQC9tfd1VO+twvTj5hQ4/y00Wdc0W8MDM36HkKCj8cNL4fYHj7fTQc0
	SlfQczi9Nrh7pzRhMRwu+2fRFyJvRG2gS8V0RTQWr895ONZyCuZHS065sxa8NFiyowYD
	ham2d9dGcHdYbhAwvX1ih+oqHPWB1uF/KFNV+wUeZJm0c8MTfFb1PXsEwYCk+9+1r+Iv
	3aSe8k6J6b+JaBHwgWRfM2QkTp41sTcJ41NruzMIAWfi509RckWDmi2hWW9FvQyq7j8R
	vAmhzl1WEcafJPmtqPIFYMEIkhwzP/MDLsn3c2tR5PgCGLZCHrG2dDRTZwpuMFyvbGKZ
	SnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Yjk2iCSMd0qW6ItDElCjR/NGiM5KsZVMd2S/mXDKsOM=;
	b=IQ8PvxTT7ggvIrnV6xO6Br3ozvsVmNrenhh/ImsTfMdnDaEX2D1JzmcvBys9tP217K
	YL1taInm5Jd0cQzPrLIoW1FBJDTQgUGfc104/Ibkz+a3Qh0e/F2A3rXnK4seUhKHrmdo
	q9pIbdWsayO4bjX3dx54pRQkfVRZFiKpesN3aUAVCcL7y6/gpBypJsVLzYPV7ub0DWKt
	GFbvkBPXxQiJG3lY5uqT/ls9HoQkI4/+H6y+C5rX6i2lz+qjLqUQIs93fDYAB3+WxrhD
	FtAg4528lwT6HInwMOnq8vXzbndZN1HUhPPJ1lyR/H2tRkoqY2oiECa0fiiGFsCNBBkZ
	ZOgA==
X-Gm-Message-State: APjAAAX8zv45/Y0M5buXTp/W9T6lmihuQQivBt4myshsPBYwmQw0VCg6
	ohHht2OxpXcCg01M/U/tCzanCv2+
X-Google-Smtp-Source: APXvYqwbQiVyXgXbFnmGXCd3Z6SJ088TdKggG5ukjrxbM33lzfCNk1U0A4Gq4CLIXJQ3S04htoSrpw==
X-Received: by 2002:a17:902:2d01:: with SMTP id
	o1mr71712007plb.105.1563719140923; 
	Sun, 21 Jul 2019 07:25:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:06 -0700
Message-Id: <249447828cd1ed13f9faf19793208b503acf0d30.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 17/30] qemu: Security fix for CVE-2018-19489
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:39 -0000

From: Armin Kuster <akuster@mvista.com>

Source: Qemu.org
MR: 97453
Type: Security Fix
Disposition: Backport from git.qemu.org/gemu.git

ChangeID: a06fcb432d447cec2ed1caf112822dd1b4831ace
Description:

In the spirt of YP Compatible, sending change upstream.

fixes CVE CVE-2018-19489

Affect < = 4.0.0

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../qemu/qemu/CVE-2018-19489.patch                 | 83 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-19489.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-19489.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-19489.patch
new file mode 100644
index 0000000..7619e2a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-19489.patch
@@ -0,0 +1,83 @@
+From 1d20398694a3b67a388d955b7a945ba4aa90a8a8 Mon Sep 17 00:00:00 2001
+From: Greg Kurz <groug@kaod.org>
+Date: Fri, 23 Nov 2018 13:28:03 +0100
+Subject: [PATCH] 9p: fix QEMU crash when renaming files
+
+When using the 9P2000.u version of the protocol, the following shell
+command line in the guest can cause QEMU to crash:
+
+    while true; do rm -rf aa; mkdir -p a/b & touch a/b/c & mv a aa; done
+
+With 9P2000.u, file renaming is handled by the WSTAT command. The
+v9fs_wstat() function calls v9fs_complete_rename(), which calls
+v9fs_fix_path() for every fid whose path is affected by the change.
+The involved calls to v9fs_path_copy() may race with any other access
+to the fid path performed by some worker thread, causing a crash like
+shown below:
+
+Thread 12 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
+0x0000555555a25da2 in local_open_nofollow (fs_ctx=0x555557d958b8, path=0x0,
+ flags=65536, mode=0) at hw/9pfs/9p-local.c:59
+59          while (*path && fd != -1) {
+(gdb) bt
+#0  0x0000555555a25da2 in local_open_nofollow (fs_ctx=0x555557d958b8,
+ path=0x0, flags=65536, mode=0) at hw/9pfs/9p-local.c:59
+#1  0x0000555555a25e0c in local_opendir_nofollow (fs_ctx=0x555557d958b8,
+ path=0x0) at hw/9pfs/9p-local.c:92
+#2  0x0000555555a261b8 in local_lstat (fs_ctx=0x555557d958b8,
+ fs_path=0x555556b56858, stbuf=0x7fff84830ef0) at hw/9pfs/9p-local.c:185
+#3  0x0000555555a2b367 in v9fs_co_lstat (pdu=0x555557d97498,
+ path=0x555556b56858, stbuf=0x7fff84830ef0) at hw/9pfs/cofile.c:53
+#4  0x0000555555a1e9e2 in v9fs_stat (opaque=0x555557d97498)
+ at hw/9pfs/9p.c:1083
+#5  0x0000555555e060a2 in coroutine_trampoline (i0=-669165424, i1=32767)
+ at util/coroutine-ucontext.c:116
+#6  0x00007fffef4f5600 in __start_context () at /lib64/libc.so.6
+#7  0x0000000000000000 in  ()
+(gdb)
+
+The fix is to take the path write lock when calling v9fs_complete_rename(),
+like in v9fs_rename().
+
+Impact:  DoS triggered by unprivileged guest users.
+
+Fixes: CVE-2018-19489
+Cc: P J P <ppandit@redhat.com>
+Reported-by: zhibin hu <noirfate@gmail.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Greg Kurz <groug@kaod.org>
+
+Upstream-Status: Backport
+Affects: < 4.0.0
+CVE: CVE-2018-19489
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/9pfs/9p.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
+index 267a255..bdf7919 100644
+--- a/hw/9pfs/9p.c
++++ b/hw/9pfs/9p.c
+@@ -2855,6 +2855,7 @@ static void coroutine_fn v9fs_wstat(void *opaque)
+     struct stat stbuf;
+     V9fsFidState *fidp;
+     V9fsPDU *pdu = opaque;
++    V9fsState *s = pdu->s;
+ 
+     v9fs_stat_init(&v9stat);
+     err = pdu_unmarshal(pdu, offset, "dwS", &fid, &unused, &v9stat);
+@@ -2920,7 +2921,9 @@ static void coroutine_fn v9fs_wstat(void *opaque)
+         }
+     }
+     if (v9stat.name.size != 0) {
++        v9fs_path_write_lock(s);
+         err = v9fs_complete_rename(pdu, fidp, -1, &v9stat.name);
++        v9fs_path_unlock(s);
+         if (err < 0) {
+             goto out;
+         }
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 59cfc38..992cf7b 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-18849.patch \
            file://CVE-2018-19364_p1.patch \
            file://CVE-2018-19364_p2.patch \
+           file://CVE-2018-19489.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


