Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id D5C81788F0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:43:01 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id n12so1163526wra.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=87QczNRTCOSxPcZpv1aGTwcpIZpmqJCSrmGhiQ1AX1c=;
	b=CCG3GJTmJsk9XvgvS7r5WLQ1DLp4ZiNEqrH5Ufk/IT6VKy4kdLBYH9+N5o1bYwp4Nr
	qlpA/RjESe16oZlswO3ut3qmoUcP+18tLXrKB1/ZfUY8EosIiLBJAxklkL/emJ1Wpx77
	oybgbHlK+AGFK2NwctBBHdYgCP7GKldnK4r2FuUkqV9SDr8WpO1GnzMGdnaRbbFlj6fr
	WOjIxm5t2j829Qk9okjU8IfLM8r44I/KgM3lH9ngBLaqliyrw1VIWZ2GMKTT00lDu48v
	lizq0H+ct1YB3DPhaTqfSlmEfWquoP9OPhbf7WuRicghDbiUohLh3VDym0yH2Mt3VbJq
	NC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=87QczNRTCOSxPcZpv1aGTwcpIZpmqJCSrmGhiQ1AX1c=;
	b=KW005HEBjEFJIdEMgraCWeRpqsobb/Qc6F/sxFWYzAx5qSsUfGdgBOrI+zfIibWzU1
	i5GMcj+flfSZVLt8CRRy1PZiT+q8TWO1A9wvWGCdr0q29yrNAYJGWam07LlUkU84zyDW
	kM6KvJFUaN2pMXuHWu38DSVpFhlbEN6Pp3QFmN5Uprm/0/F2bKyOQyhEI+P2LmE1/oRD
	ibMhdPVF+n1mBpyW3Jnkp97yPrBrO9oE8Q2HUg8SUHaFePy7Q/t2ILFWJamrQr5/HKsi
	80lKpYb1QNa+W+9fsCHXBDsry2QE4UCsMyygwxg7VeB63lgLVP07yKHgP9xrsgQ3xEpa
	gcCw==
X-Gm-Message-State: AElRT7FbCK7XfbHI+1U/lVTIEWRUs5qzHi3SKJ4V1nk0y/xekgtlmpQr
	DhJUOfz7ko4iSAxH+sIxP2SnqQ==
X-Google-Smtp-Source: AG47ELv/bq4/906jwjcHumjdhLDkCPV0kzq1OWcR9QDAzN0PaJ+gVUq5H5Ifa/Lj8oLMos6ZyNrMYA==
X-Received: by 10.223.134.99 with SMTP id 32mr2351069wrw.153.1520728982740;
	Sat, 10 Mar 2018 16:43:02 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 4sm1966861wmz.31.2018.03.10.16.43.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:43:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:53 +0000
Message-Id: <e58a1b3f0edce84103529b6761fc323be301ba07.1520728803.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728803.git.Martin.Jansa@gmail.com>
References: <cover.1520728803.git.Martin.Jansa@gmail.com>
Subject: [pyro][PATCH 2/6] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Sun, 11 Mar 2018 00:43:02 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes
internal compiler error: Max. number of generated reload insns per insn is achieved (90)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 ...-relax-the-restriction-on-subreg-reload-f.patch | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 5c81a33af0..7b409f119b 100644
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


