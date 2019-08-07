Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 711B17F3A7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 19:11:51 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id t14so42168559plr.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 12:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EnUmWs7h2hQsD+bzFl/YHIiDb38uZch9Gd0X4FMmujc=;
	b=slp56Bm/ZNxQwqrwN3RZMC4uIJioJSfMtQoZ0rpnxmCB8wlGwb8ZT7n1DaUmky+Yni
	1KCfee/ZQ5CIustXllHxgoz/Xb0+UsB7Ic7AYh42hS1Dcxh4QYXFgVJkbM0PS+Jp5eDq
	fhhBq0IljXuNbLsmdJRPCqI+JyS+b9OQAe0GE01uRcrrG46ti28zFvWDjo3dDd91KEMh
	L0m/joxlGbOfnk1nwOqkHviseuSazziF4CNwA7InLpBFuqlKw+NIlNy8TIbHHr8euVlf
	VX6JK2nNUColUuhDjHxTQy6rEYwli5RoExVXKU+IFRcExbhelpRE1ZeCosD+FIpsvUYN
	5U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EnUmWs7h2hQsD+bzFl/YHIiDb38uZch9Gd0X4FMmujc=;
	b=BugEce6P6JKFAd7KeVEwhyumKPZVhs1Z2wcO7h0kBOh5jOwvYcLGp1SAvRXKPoQoaC
	LM7R8M2XW7frfm5vNt9sqRt/FguEupCbSF306vbnEwzIv3TXWU7Zm/l+LsFesb1NHgsu
	oAo47q08ZEWnfrPIWMgvAEuNUPEIOkjiUn3sPujtLJc/s70RQzz5viOPiFFU7/v4679W
	Xv65A7VkIhlmaTmnoi6EU9xEVz3NeAQBcJ4w4a/BCkmAOCyEMD0hhviP/nNbOelOK6gC
	nqR5jmYKj/FmeItArSvu8X1Sho+8I7Y3sf6+Uv9wgSQsa7TNJiVpst4o7S/2Y2YWmnGf
	qMqA==
X-Gm-Message-State: APjAAAWD6OYuthfkzkZka6sEv9rkMTNMghr4u/lwLX4scAIdAKhIZ61Y
	1SVsNeyF28xtWqPSrRcgzvlxd70CzQc=
X-Google-Smtp-Source: APXvYqz5hvzVxXGgNvVPTf4UiXJvT8jnyzHC/ycHG4QVjdqc7WCj3T76KZG2QkeCgmCfKu5EFIYpog==
X-Received: by 2002:a17:90a:601:: with SMTP id j1mr1383567pjj.96.1565205111708;
	Wed, 07 Aug 2019 12:11:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	125sm127926575pfg.23.2019.08.07.12.11.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 12:11:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:11:44 -0700
Message-Id: <20190807191144.14308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH V2] musl: Update to master tip
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
X-List-Received-Date: Wed, 07 Aug 2019 19:11:51 -0000
Content-Transfer-Encoding: 8bit

Fix for RISC-V build regression

64bit time syscall plumbing

select API regression fix

Changes are here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0ce49d0a301b4142741b32773492af90f66ed3ca..f522de81ac88dddb58266c15bcfaa044c4065e19

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Move to latest tip
- Add a fix to fix the ssh issue seen on AB testing

 ...regression-in-select-with-no-timeout.patch | 34 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/musl/0001-fix-regression-in-select-with-no-timeout.patch

diff --git a/meta/recipes-core/musl/musl/0001-fix-regression-in-select-with-no-timeout.patch b/meta/recipes-core/musl/musl/0001-fix-regression-in-select-with-no-timeout.patch
new file mode 100644
index 0000000000..b53236d41d
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-fix-regression-in-select-with-no-timeout.patch
@@ -0,0 +1,34 @@
+From 6528f806d290378da5103cd02a6a1a3b6109b41b Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 7 Aug 2019 10:18:18 -0700
+Subject: [PATCH] fix regression in select with no timeout
+
+commit 722a1ae3351a03ab25010dbebd492eced664853b inadvertently passed a
+copy of {s,us} to the syscall even if the timeout argument tv was
+null, thereby causing immediate timeout (polling) in place of
+unlimited timeout. only archs using SYS_select were affected.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/select/select.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/select/select.c b/src/select/select.c
+index e84c887f..8a786884 100644
+--- a/src/select/select.c
++++ b/src/select/select.c
+@@ -35,7 +35,8 @@ int select(int n, fd_set *restrict rfds, fd_set *restrict wfds, fd_set *restrict
+ 		return __syscall_ret(r);
+ #endif
+ #ifdef SYS_select
+-	return syscall_cp(SYS_select, n, rfds, wfds, efds, ((long[]){s, us}));
++	return syscall_cp(SYS_select, n, rfds, wfds, efds,
++		tv ? ((long[]){s, us}) : 0);
+ #else
+ 	return syscall_cp(SYS_pselect6, n, rfds, wfds, efds,
+ 		tv ? ((long[]){s, ns}) : 0, ((syscall_arg_t[]){ 0, _NSIG/8 }));
+-- 
+2.22.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 039932a3bc..69a007721c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0ce49d0a301b4142741b32773492af90f66ed3ca"
+SRCREV = "f522de81ac88dddb58266c15bcfaa044c4065e19"
 
 BASEVER = "1.1.23"
 
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-fix-regression-in-select-with-no-timeout.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.22.0


