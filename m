Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id A55B7788CE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:43 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id m12so12286644wrm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=octpf6+20RGVY7kpo8jV5KTxGscfSgYA7n+lNlk7Fs4=;
	b=jAMqXR+0LxDE7unBa2dSnFu0aW3u8Zj4cnUjSWamqIodVz1styrE98xJzMgtiIYOf7
	EJLBzkrnfAoRz/9PKdOAiclWYXwDjcBwoVAdfQHryJYAATZj1N59paF5XazMHjIf5Mo6
	ZO+W//DTJEsusyCEkPf1vojPqIZ6tBRSleZsRYRMVXtDDj0ItbT43KdyxZNQ4KFzVRWs
	pOMu+brc8PpZAFdNpolzqLjYXN6KyUBTIrJuxLG7a32LbfdMg7i1eUvMx9i+3IqJPcNt
	T/7M8+J0e/AL5jxejuqmlHPLav/w/R6Vefc68CdoL3BhuQTxojsJa0kaApMGM+dQxA0x
	iuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=octpf6+20RGVY7kpo8jV5KTxGscfSgYA7n+lNlk7Fs4=;
	b=hWbkxzV52qrSIxZ4BzCQK+U/r29i7USEVMEhZVhI4Q8z41FKiCb2hFy5QVTNhqL+s/
	/awSTy8gM+jrTzeDhGK/cO6GOLrFoNRuvaJyUKyf5Ce/E8FpGXsDm6oTjDW8KlgQpCRm
	CQkWVAuUzWm1qxZ9VFf+L3029iehNSQvrqhyVTPftAsfOv/ur0iYMAh+h2TMbJOGtDM7
	TyNqvzeJWr+Eks01D90rCPqb9L9Q/jG6sc6sXgA5vnhJnI7EmLn0RSObv21ClQUtNIm4
	F6epLVw+eE3xqsuecgLkePxGAyCEpLujOvCWGMleizZS7vTicam4N9Mntf9x4DB4wesf
	wl+w==
X-Gm-Message-State: AElRT7EaXYw+DnaYVY0wKbfjPJGDCyRdbv2UzZJQPYhoLncKURMNXAfP
	mi46xfeJsaCspdJRKyFAOW0fAA==
X-Google-Smtp-Source: AG47ELt1/NjXdAy3tqqdZAqeWnwLBvY4fwBDkUdAEleJYXyJETf14/SuY63j+2HIrQJkKvrEeV4Azw==
X-Received: by 10.223.132.103 with SMTP id 94mr2464949wrf.275.1520728964408;
	Sat, 10 Mar 2018 16:42:44 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j137sm3505236wmd.17.2018.03.10.16.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:21 +0000
Message-Id: <7f5485d2b8f978964f1f932fd328c98d0a1872c0.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 09/16] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:44 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes
internal compiler error: Max. number of generated reload insns per insn is achieved (90)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2631f45a057c53797b7ba657662f35f66a2b04e)
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 ...-relax-the-restriction-on-subreg-reload-f.patch | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index d74f12c466..0d98be3861 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -81,6 +81,7 @@ SRC_URI = "\
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
            file://0055-unwind_h-glibc26.patch \
+           file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch b/meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
new file mode 100644
index 0000000000..231f147619
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
@@ -0,0 +1,51 @@
+From a582b0a53d1dc8604a201348b99ca8de48784e7e Mon Sep 17 00:00:00 2001
+From: jiwang <jiwang@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 12 May 2016 17:00:52 +0000
+Subject: [PATCH] [LRA] PR70904, relax the restriction on subreg reload for
+ wide mode
+
+2016-05-12  Jiong Wang  <jiong.wang@arm.com>
+
+gcc/
+  PR rtl-optimization/70904
+  * lra-constraint.c (process_addr_reg): Relax the restriction on
+  subreg reload for wide mode.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@236181 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/lra-constraints.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index f96fd458e23..73fb72a2ea5 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -1326,7 +1326,21 @@ process_addr_reg (rtx *loc, bool check_only_p, rtx_insn **before, rtx_insn **aft
+ 
+   subreg_p = GET_CODE (*loc) == SUBREG;
+   if (subreg_p)
+-    loc = &SUBREG_REG (*loc);
++    {
++      reg = SUBREG_REG (*loc);
++      mode = GET_MODE (reg);
++
++      /* For mode with size bigger than ptr_mode, there unlikely to be "mov"
++	 between two registers with different classes, but there normally will
++	 be "mov" which transfers element of vector register into the general
++	 register, and this normally will be a subreg which should be reloaded
++	 as a whole.  This is particularly likely to be triggered when
++	 -fno-split-wide-types specified.  */
++      if (in_class_p (reg, cl, &new_class)
++	  || GET_MODE_SIZE (mode) <= GET_MODE_SIZE (ptr_mode))
++       loc = &SUBREG_REG (*loc);
++    }
++
+   reg = *loc;
+   mode = GET_MODE (reg);
+   if (! REG_P (reg))
+-- 
+2.14.2
+
-- 
2.15.1


