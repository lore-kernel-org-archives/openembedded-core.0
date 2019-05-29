Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 70A547E28F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 19:40:31 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j2so2291063pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4W/dgH9TUhS2p5zkq+1y0epxHXk75IU4QQerKuIKFrI=;
	b=MMlzIeOGh+lONoL53PhtyCAbwwppFQhhViFk/2GDXKAGDQ6szTxDWqifSypHeTrkdS
	1dUEAqo6Ki1wqHub1LFvRPuZpq7e2NGAyxWkEtqnrbWlbHNNOR8EwHwTJ9732ZECJkEy
	7ImahjZ0HScZSpX+UixVk8XNRUhb3CxB5b8m2TnWc7vuN865gdY+0BcZmH5WE7T0GttM
	J1oghj29M0NRmzJ4mE6G6Wi+vowwzkr/gT2FfUHvfODET0po7iYO5FJHsvo8l0R7pBd8
	gqWCNHVy4dKp8aV8nrm4VW3eL07jZ5sSAyL2/V4fUI64wgaTi8YNFJoD3qm3AiIaGA6U
	94aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4W/dgH9TUhS2p5zkq+1y0epxHXk75IU4QQerKuIKFrI=;
	b=k6zwN4U5wojVkYecp0DtMFujHEhr9twGgz/1zjp9l7o61wX1h5bpkOF5YpVC/Hqnna
	ahPKa5FkkOm4NhYBzdqmAE2l7kBCbCDb3KmL+31kWvR60EMx/9uc0fWOZiQPxAs6I4pT
	mzu2LNAlJob913SY8MvoJ7HrQXuWenqi4eO0G/GSDvCUMJFWk68CiuK4qY1uq+s0yTQT
	fBtg2S/9ZEdg0VsxZSV6TujxW2cV5uJsCYTqnCsQ5Lxx6uLnUHY58+BNIUGXzggz0mVt
	X0IJVnsNsuEDF3bytOurjy8x55/u1N+w/pp7SasoPCWSGDcbjInngC6CNuPeVyThVmT6
	zRLQ==
X-Gm-Message-State: APjAAAWJhJmOqaB4WMLj5jfAxgQguATcWmF4B373im6veUYLZ7aLsSsG
	Z9/3qNTTU/RC00/OImBKATJ++NOV
X-Google-Smtp-Source: APXvYqw+rLpsMvOZiVcSVckBxjB9E+N/kr0cK7MaavaYvzl6vxyMwf0saW7dG2qnPgujxpK6qJEmlw==
X-Received: by 2002:a65:620d:: with SMTP id d13mr10846305pgv.109.1559158832125;
	Wed, 29 May 2019 12:40:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id f186sm471794pfb.5.2019.05.29.12.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 12:40:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 12:40:29 -0700
Message-Id: <1559158829-28132-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] qemu: Security fix for CVE-2018-19489
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
X-List-Received-Date: Wed, 29 May 2019 19:40:31 -0000

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


