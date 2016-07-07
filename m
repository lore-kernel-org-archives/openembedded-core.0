Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B2EF06013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:35:19 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id dx3so8134675pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 11:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eq7k/u+9/eoqe/QcN3PJbcKTOKGZN2wSyXKUZ4z9mt8=;
	b=oZth+aOC9bhMm3SZSQPJhUCN5FMM7Ck+tGlm+3YWSVoiXaRjLvLT+MQ1ItS2mUMm8z
	f5/JuPjoOnJ0IYi9Kc/UxVv3kFu0fQqct2QXuhI8hnk0YZS+U8yGMWAbWu4zMuVhlsS6
	uCKtY37jyUngfy+kifI3nzbmFKVmgW7V4Ar96ZxltpdM6aVreV4th4HyJKUhQQPq/gqe
	a23qYGitvxRxRxU7p+HPr/hvbgZyNYxeLeEFupbDXnw02yYAXJTHwG/hSwN4i23jfaeS
	nRqwmvCt6f0VE3N0ijeOqW3T01hbQJ5WRP0QJen63btOFE6riN9abyWWMW32TqSHvPfh
	X0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eq7k/u+9/eoqe/QcN3PJbcKTOKGZN2wSyXKUZ4z9mt8=;
	b=VRI8Yr5xyVfwzTEQhMJ28xmdJ2xhH55SSgF3UkgFBANGi/vb+T3Xih40ewaKtj7sKk
	nvC8eV571GE8YWCtRuUTSl2HEG2rfJRIuJJqpq02tn//mrkudhkb+mwiRzS5EtPLkUt7
	zXPxn1NZMkJiiB8S6t80TfYz/KlROf6L+vpYf5Y5+gqz7AS9I/AcqBe1r0CuFkrerSgD
	tyR4E/+OE60lkidGuT1MJz6eyixdW8sDvkIMFzC4c7fAnBSFICzhBYJbz3cYgFjq81qu
	isHyMcphIZTf9Idsufad6JNEZxjlEFEyu4xlpKeLo6a0HkNziRUL+Nl+jHRxI4DHB3Ke
	rHDQ==
X-Gm-Message-State: ALyK8tJCfQwnpHx4ySwkaG7/2yDlViMbF+g1GlA84vUmx0wK6XhEPXyLUjKbaigpWvRcgw==
X-Received: by 10.66.254.102 with SMTP id ah6mr2500870pad.59.1467914917516;
	Thu, 07 Jul 2016 11:08:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id j8sm6106747paj.22.2016.07.07.11.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 11:08:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:08:29 -0700
Message-Id: <9424e5bfedda5e57e8490fa1a7599fad6d806a17.1467914773.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <35285b0dd386fd16e53678361ee33e8525671a21.1467914773.git.raj.khem@gmail.com>
References: <35285b0dd386fd16e53678361ee33e8525671a21.1467914773.git.raj.khem@gmail.com>
In-Reply-To: <cover.1467914773.git.raj.khem@gmail.com>
References: <cover.1467914773.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] bunutils: Upgrade to 2.26.1
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
X-List-Received-Date: Thu, 07 Jul 2016 18:35:19 -0000

Delete upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   3 +-
 ...ISA-override-not-lifting-ABI-restrictions.patch | 273 ---------------------
 2 files changed, 1 insertion(+), 275 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index 04e0102..82cb7f5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "71fa566a9cf2597b60a58c1d7c148bab637454a6"
+SRCREV = "c29838e7f484e0b5714b02e7feb9a88d3a045dd2"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0002-configure-widen-the-regexp-for-SH-architectures.patch \
@@ -35,7 +35,6 @@ SRC_URI = "\
      file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
      file://0014-Correct-nios2-_gp-address-computation.patch \
      file://0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
-     file://MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch b/meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch
deleted file mode 100644
index b8c65be..0000000
--- a/meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-From 22522f880a8e17a17c4f195796ec89caece7652b Mon Sep 17 00:00:00 2001
-From: Maciej W. Rozycki <macro@imgtec.com>
-Date: Fri, 22 Apr 2016 01:04:52 +0100
-Subject: [PATCH] MIPS/GAS: Fix an ISA override not lifting ABI restrictions
-
-Correct a regression introduced with commit 919731affbef ("Add MIPS
-.module directive") causing code like:
-
-	.set	mips3
-	dli	$2, 0x9000000080000000
-
-to fail assembly with the following error message produced:
-
-Error: number (0x9000000080000000) larger than 32 bits
-
-if built with `mips3' selected as the global ISA (e.g. `-march=mips3').
-This is because a `.set' directive doing an ISA override does not lift
-the ABI restriction on register sizes if the ISA remains unchanged.
-Previously the directive always set register sizes from the ISA chosen,
-which is what some code expects.  Restore the old semantics then.
-
-	gas/
-	* config/tc-mips.c (code_option_type): New enum.
-	(parse_code_option): Return status indicating option type.
-	(s_mipsset): Update `parse_code_option' call site accordingly.
-	Always set register sizes from the ISA with ISA overrides.
-	(s_module): Update `parse_code_option' call site.
-	* testsuite/gas/mips/isa-override-1.d: New test.
-	* testsuite/gas/mips/micromips@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips1@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips2@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips32@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips32r2@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips32r3@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips32r5@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips32r6@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips64r2@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips64r3@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips64r5@isa-override-1.d: New test.
-	* testsuite/gas/mips/mips64r6@isa-override-1.d: New test.
-	* testsuite/gas/mips/r3000@isa-override-1.d: New test.
-	* testsuite/gas/mips/r3900@isa-override-1.d: New test.
-	* testsuite/gas/mips/r5900@isa-override-1.d: New test.
-	* testsuite/gas/mips/octeon@isa-override-1.d: New test.
-	* testsuite/gas/mips/octeon3@isa-override-1.d: New test.
-	* testsuite/gas/mips/isa-override-2.l: New list test.
-	* testsuite/gas/mips/mips1@isa-override-2.l: New list test.
-	* testsuite/gas/mips/mips2@isa-override-2.l: New list test.
-	* testsuite/gas/mips/mips32@isa-override-2.l: New list test.
-	* testsuite/gas/mips/mips32r2@isa-override-2.l: New list test.
-	* testsuite/gas/mips/mips32r3@isa-override-2.l: New list test.
-	* testsuite/gas/mips/mips32r5@isa-override-2.l: New list test.
-	* testsuite/gas/mips/mips32r6@isa-override-2.l: New list test.
-	* testsuite/gas/mips/r3000@isa-override-2.l: New list test.
-	* testsuite/gas/mips/r3900@isa-override-2.l: New list test.
-	* testsuite/gas/mips/octeon3@isa-override-2.l: New list test.
-	* testsuite/gas/mips/octeon3@isa-override-1.l: New stderr
-	output.
-	* testsuite/gas/mips/isa-override-1.s: New test source.
-	* testsuite/gas/mips/r5900@isa-override-1.s: New test source.
-	* testsuite/gas/mips/isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips1@isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips2@isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips32@isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips32r2@isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips32r3@isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips32r5@isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips32r6@isa-override-2.s: New test source.
-	* testsuite/gas/mips/r3000@isa-override-2.s: New test source.
-	* testsuite/gas/mips/r3900@isa-override-2.s: New test source.
-	* testsuite/gas/mips/octeon3@isa-override-2.s: New test source.
-	* testsuite/gas/mips/mips.exp: Run the new tests.
----
-Upstream-Status: Backport
-http://www.serverphorums.com/read.php?12,1466357
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=22522f880a8e17a17c4f195796ec89caece7652b
-
- gas/ChangeLog                                     |   53 +++++++++++++++++++++
- gas/config/tc-mips.c                              |   42 +++++++++++++---
- gas/testsuite/gas/mips/isa-override-1.d           |   49 +++++++++++++++++++
- gas/testsuite/gas/mips/isa-override-1.s           |   31 ++++++++++++
- gas/testsuite/gas/mips/isa-override-2.l           |    4 ++
- gas/testsuite/gas/mips/isa-override-2.s           |   18 +++++++
- gas/testsuite/gas/mips/micromips@isa-override-1.d |   50 +++++++++++++++++++
- gas/testsuite/gas/mips/mips.exp                   |    3 +
- gas/testsuite/gas/mips/mips1@isa-override-1.d     |   53 +++++++++++++++++++++
- gas/testsuite/gas/mips/mips1@isa-override-2.l     |    4 ++
- gas/testsuite/gas/mips/mips1@isa-override-2.s     |   18 +++++++
- gas/testsuite/gas/mips/mips2@isa-override-1.d     |   50 +++++++++++++++++++
- gas/testsuite/gas/mips/mips2@isa-override-2.l     |    4 ++
- gas/testsuite/gas/mips/mips2@isa-override-2.s     |   18 +++++++
- gas/testsuite/gas/mips/mips32@isa-override-1.d    |    5 ++
- gas/testsuite/gas/mips/mips32@isa-override-2.l    |    4 ++
- gas/testsuite/gas/mips/mips32@isa-override-2.s    |   18 +++++++
- gas/testsuite/gas/mips/mips32r2@isa-override-1.d  |   50 +++++++++++++++++++
- gas/testsuite/gas/mips/mips32r2@isa-override-2.l  |    4 ++
- gas/testsuite/gas/mips/mips32r2@isa-override-2.s  |   18 +++++++
- gas/testsuite/gas/mips/mips32r3@isa-override-1.d  |    5 ++
- gas/testsuite/gas/mips/mips32r3@isa-override-2.l  |    4 ++
- gas/testsuite/gas/mips/mips32r3@isa-override-2.s  |   18 +++++++
- gas/testsuite/gas/mips/mips32r5@isa-override-1.d  |    5 ++
- gas/testsuite/gas/mips/mips32r5@isa-override-2.l  |    4 ++
- gas/testsuite/gas/mips/mips32r5@isa-override-2.s  |   18 +++++++
- gas/testsuite/gas/mips/mips32r6@isa-override-1.d  |    5 ++
- gas/testsuite/gas/mips/mips32r6@isa-override-2.l  |    4 ++
- gas/testsuite/gas/mips/mips32r6@isa-override-2.s  |   18 +++++++
- gas/testsuite/gas/mips/mips64r2@isa-override-1.d  |   50 +++++++++++++++++++
- gas/testsuite/gas/mips/mips64r3@isa-override-1.d  |    5 ++
- gas/testsuite/gas/mips/mips64r5@isa-override-1.d  |    5 ++
- gas/testsuite/gas/mips/mips64r6@isa-override-1.d  |    5 ++
- gas/testsuite/gas/mips/octeon3@isa-override-1.d   |    6 ++
- gas/testsuite/gas/mips/octeon3@isa-override-1.l   |    2 +
- gas/testsuite/gas/mips/octeon3@isa-override-2.l   |    5 ++
- gas/testsuite/gas/mips/octeon3@isa-override-2.s   |   18 +++++++
- gas/testsuite/gas/mips/octeon@isa-override-1.d    |    5 ++
- gas/testsuite/gas/mips/r3000@isa-override-1.d     |    5 ++
- gas/testsuite/gas/mips/r3000@isa-override-2.l     |    4 ++
- gas/testsuite/gas/mips/r3000@isa-override-2.s     |   18 +++++++
- gas/testsuite/gas/mips/r3900@isa-override-1.d     |    5 ++
- gas/testsuite/gas/mips/r3900@isa-override-2.l     |    4 ++
- gas/testsuite/gas/mips/r3900@isa-override-2.s     |   18 +++++++
- gas/testsuite/gas/mips/r5900@isa-override-1.d     |   28 +++++++++++
- gas/testsuite/gas/mips/r5900@isa-override-1.s     |   23 +++++++++
- 46 files changed, 775 insertions(+), 8 deletions(-)
- create mode 100644 gas/testsuite/gas/mips/isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/isa-override-1.s
- create mode 100644 gas/testsuite/gas/mips/isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/micromips@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips1@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips1@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/mips1@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/mips2@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips2@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/mips2@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/mips32@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips32@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/mips32@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/mips32r2@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips32r2@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/mips32r2@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/mips32r3@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips32r3@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/mips32r3@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/mips32r5@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips32r5@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/mips32r5@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/mips32r6@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips32r6@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/mips32r6@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/mips64r2@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips64r3@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips64r5@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/mips64r6@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-1.l
- create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/octeon@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/r3000@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/r3000@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/r3000@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/r3900@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/r3900@isa-override-2.l
- create mode 100644 gas/testsuite/gas/mips/r3900@isa-override-2.s
- create mode 100644 gas/testsuite/gas/mips/r5900@isa-override-1.d
- create mode 100644 gas/testsuite/gas/mips/r5900@isa-override-1.s
-
-diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index bfc639e..daceef1 100644
---- a/gas/config/tc-mips.c
-+++ b/gas/config/tc-mips.c
-@@ -15513,10 +15513,29 @@ struct mips_option_stack
- 
- static struct mips_option_stack *mips_opts_stack;
- 
--static bfd_boolean
-+/* Return status for .set/.module option handling.  */
-+
-+enum code_option_type
-+{
-+  /* Unrecognized option.  */
-+  OPTION_TYPE_BAD = -1,
-+
-+  /* Ordinary option.  */
-+  OPTION_TYPE_NORMAL,
-+
-+  /* ISA changing option.  */
-+  OPTION_TYPE_ISA
-+};
-+
-+/* Handle common .set/.module options.  Return status indicating option
-+   type.  */
-+
-+static enum code_option_type
- parse_code_option (char * name)
- {
-+  bfd_boolean isa_set = FALSE;
-   const struct mips_ase *ase;
-+
-   if (strncmp (name, "at=", 3) == 0)
-     {
-       char *s = name + 3;
-@@ -15589,6 +15608,7 @@ parse_code_option (char * name)
- 	    {
- 	      mips_opts.arch = p->cpu;
- 	      mips_opts.isa = p->isa;
-+	      isa_set = TRUE;
- 	    }
- 	}
-       else if (strncmp (name, "mips", 4) == 0)
-@@ -15602,6 +15622,7 @@ parse_code_option (char * name)
- 	    {
- 	      mips_opts.arch = p->cpu;
- 	      mips_opts.isa = p->isa;
-+	      isa_set = TRUE;
- 	    }
- 	}
-       else
-@@ -15620,8 +15641,9 @@ parse_code_option (char * name)
-   else if (strcmp (name, "nosym32") == 0)
-     mips_opts.sym32 = FALSE;
-   else
--    return FALSE;
--  return TRUE;
-+    return OPTION_TYPE_BAD;
-+
-+  return isa_set ? OPTION_TYPE_ISA : OPTION_TYPE_NORMAL;
- }
- 
- /* Handle the .set pseudo-op.  */
-@@ -15629,8 +15651,8 @@ parse_code_option (char * name)
- static void
- s_mipsset (int x ATTRIBUTE_UNUSED)
- {
-+  enum code_option_type type = OPTION_TYPE_NORMAL;
-   char *name = input_line_pointer, ch;
--  int prev_isa = mips_opts.isa;
- 
-   file_mips_check_options ();
- 
-@@ -15707,12 +15729,16 @@ s_mipsset (int x ATTRIBUTE_UNUSED)
- 	  free (s);
- 	}
-     }
--  else if (!parse_code_option (name))
--    as_warn (_("tried to set unrecognized symbol: %s\n"), name);
-+  else
-+    {
-+      type = parse_code_option (name);
-+      if (type == OPTION_TYPE_BAD)
-+	as_warn (_("tried to set unrecognized symbol: %s\n"), name);
-+    }
- 
-   /* The use of .set [arch|cpu]= historically 'fixes' the width of gp and fp
-      registers based on what is supported by the arch/cpu.  */
--  if (mips_opts.isa != prev_isa)
-+  if (type == OPTION_TYPE_ISA)
-     {
-       switch (mips_opts.isa)
- 	{
-@@ -15779,7 +15805,7 @@ s_module (int ignore ATTRIBUTE_UNUSED)
- 
-   if (!file_mips_opts_checked)
-     {
--      if (!parse_code_option (name))
-+      if (parse_code_option (name) == OPTION_TYPE_BAD)
- 	as_bad (_(".module used with unrecognized symbol: %s\n"), name);
- 
-       /* Update module level settings from mips_opts.  */
--- 
-1.7.1
-
-- 
2.9.0


