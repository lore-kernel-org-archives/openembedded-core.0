Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id C09307F291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:08 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id q21so260133pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b3tXmkp17R3LNThBymIjT+VYu/509/T1bQEmGi2mgtI=;
	b=QFb+SjKbJInlRB9CjtfCJ5HeD6B7vwfN8I5h/sMmPPKaD+prYnmH+Uhtfyv+gQysCH
	R2ZfiesO9Qnkw6ckFTjt5JOz4rBpIXuhR6OOZ0bggcVLuf69K53vBYTJSG0eJLOgapjh
	Wjd8mdPaCg1NgoGFOxV/DTPvA5I0WVcaUmZzadlWsb8r+aa6zH3nTOt+b50+LeZH+Zb8
	H0RCmH34J0M8iRO+ulIUPRqMaruyTME2nXSh1QNCUyGKt9lIyaQmaKvoNIgvKyEYERag
	imsU1znMyqrNGmpmqbrdzA3pbjWedrYZsc1DjKc1+oFrEbFeyH1A5o1iqqo3ve425U9o
	PvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b3tXmkp17R3LNThBymIjT+VYu/509/T1bQEmGi2mgtI=;
	b=aivNZT+S5MhvSJFg3Q2EXCGXV/xEpkpqVa078sgrIlZt3Phe2uyJjKFAnBWP4ytOF0
	nRe0skzaR0hwNHx9pdlDKF0HMOKc/BKqyjeNoKbCF6nO2tk2VGhUeUhP3WxB/AtvuGH4
	QG58pOPVO0I83lOmEKE5/qubteYTbYg7JTTqAoybfFku6fkReKO3mqQGYjti555VrPwi
	r/xWk2ysfjZx1clXz97E6r5s9rMH+Z8qKQuI5jX0QojVKtwGUNGIDEJUjpNjp6kqQZp/
	9WkNeafdn6vFaRlpnQsJU/N6VDVBk5ZX6XFLwarULnDn/c0VYVFI6eDh/dQ/HzLmjYfM
	KBYQ==
X-Gm-Message-State: APjAAAW3GRKtNOa89LD9eIihPo/52zAGJcZc3BJ4IYJic+YchJoW0mXp
	n7VcHA7FLshhk/uCxa8irFwxngESubM=
X-Google-Smtp-Source: APXvYqzZFYiy+BXsNmYYFY8ONMqL+4WJJl8Pa3xa28VsOxCv8qH88o+881hZ9mJ06KDxNrTW7Tir/w==
X-Received: by 2002:a62:1511:: with SMTP id 17mr669390pfv.119.1569293409701;
	Mon, 23 Sep 2019 19:50:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:16 -0700
Message-Id: <630a455f83940d66b9dc01682955748998e98dfc.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 36/50] gcc: reduce the variables in symtab
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:09 -0000

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the patch from upstream:
https://github.com/gcc-mirror/gcc.git [commit beb921e]
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=269925

Add the premark_used_variables function, meanwhile do not mark
not premarked external variables in prune_unused_types_walk.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc              |  1 +
 .../gcc/gcc-8.3/0042-PR-debug-86964.patch          | 94 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index a64f48a..7925337 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0039-riscv-Disable-multilib-for-OE.patch \
            file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
            file://0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch \
+           file://0042-PR-debug-86964.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch b/meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch
new file mode 100644
index 0000000..d9b5d39
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch
@@ -0,0 +1,94 @@
+From beb921e1106b5bcbb0c6e2be84b241327e2ffc51 Mon Sep 17 00:00:00 2001
+From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 25 Mar 2019 21:19:09 +0000
+Subject: [PATCH] 	PR debug/86964 	* dwarf2out.c
+ (premark_used_variables): New function. 	(prune_unused_types_walk): Do
+ not mark not premarked external 	variables. 	(prune_unused_types):
+ Call premark_used_variables.
+
+	* gcc.dg/debug/dwarf2/pr86964.c: New testcase.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@269925 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ gcc/ChangeLog                               |  8 ++++++
+ gcc/dwarf2out.c                             | 32 +++++++++++++++++++++
+ 2 files changed, 40 insertions(+)
+
+diff --git a/gcc/ChangeLog b/gcc/ChangeLog
+index 2075480ca2b..cdce539ac6f 100644
+--- a/gcc/ChangeLog
++++ b/gcc/ChangeLog
+@@ -1,3 +1,11 @@
++2019-03-25  Johan Karlsson <johan.karlsson@enea.com>
++
++	PR debug/86964
++	* dwarf2out.c (premark_used_variables): New function.
++	(prune_unused_types_walk): Do not mark not premarked external
++	variables.
++	(prune_unused_types): Call premark_used_variables.
++
+ 2019-02-22  Release Manager
+ 
+ 	* GCC 8.3.0 released.
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index ae8bdee9981..b9a624e1ac7 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -22658,6 +22658,21 @@ premark_types_used_by_global_vars (void)
+       ->traverse<void *, premark_types_used_by_global_vars_helper> (NULL);
+ }
+ 
++/* Mark all variables used by the symtab as perennial.  */
++
++static void
++premark_used_variables (void)
++{
++  /* Mark DIEs in the symtab as used.  */
++  varpool_node *var;
++  FOR_EACH_VARIABLE (var)
++    {
++      dw_die_ref die = lookup_decl_die (var->decl);
++      if (die)
++	die->die_perennial_p = 1;
++    }
++}
++
+ /* Generate a DW_TAG_call_site DIE in function DECL under SUBR_DIE
+    for CA_LOC call arg loc node.  */
+ 
+@@ -29264,6 +29279,19 @@ prune_unused_types_walk (dw_die_ref die)
+ 
+       return;
+ 
++    case DW_TAG_variable:
++      if (flag_debug_only_used_symbols)
++	{
++	  if (die->die_perennial_p)
++	    break;
++
++	  /* premark_used_variables marks external variables --- don't mark
++	     them here.  */
++	  if (get_AT (die, DW_AT_external))
++	    return;
++	}
++      /* FALLTHROUGH */
++
+     default:
+       /* Mark everything else.  */
+       break;
+@@ -29390,6 +29418,10 @@ prune_unused_types (void)
+   /* Mark types that are used in global variables.  */
+   premark_types_used_by_global_vars ();
+ 
++  /* Mark variables used in the symtab.  */
++  if (flag_debug_only_used_symbols)
++    premark_used_variables ();
++
+   /* Set the mark on nodes that are actually used.  */
+   prune_unused_types_walk (comp_unit_die ());
+   for (node = limbo_die_list; node; node = node->next)
+-- 
+2.21.0
-- 
2.7.4


