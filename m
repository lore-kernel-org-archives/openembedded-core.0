Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 64B2578987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:42:46 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id d1so1439314pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4ZHCIS5KPjWja6pkqtZvbiHukmJvGYn2f396Qlj85GQ=;
	b=dj/oIDYBYGa8RjulNXjm4NZM7YAVftxjzaqqcxxF83QeYIGPyz/hVsDJVYbj8SHxV0
	R8XQ4cE95zB8Zn2qLzJY4ru8/TCflYtlMn4/qs8j5MF1+nqXC3HTf3ig09nJoch0IBFj
	ArwNleBdpOiYJHAh1+c5Bn1GZZV5NQMSl3fIWlNnmvHO5Kwn/AXc4tQoMYg7E4vj+fE1
	wJnXW5i7NzEI1+S5slJrKoyT2N8El1IppXnMQ9ohjuQ+9FY6gH5tlFLABASeBRKZ1xOo
	h5py3e+CJUL2RzEfuBhn9F2h0iezCJMpfCSOGFKpZyx5olk5OyO7Tb3UE2Ft0Bzy4UDE
	9Bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4ZHCIS5KPjWja6pkqtZvbiHukmJvGYn2f396Qlj85GQ=;
	b=lk2vAU5Qn/+3A7zM0FwNrGm8/x58vr8A8rT+tLutzWuHeKnyY3KgJ3BzClOwRIErne
	LLT4rIfY/03os0iguPlvx2tyFJLcUP1y4C9iz0TthpgVzNkhgnnmAoItjJaNYihgAeqj
	LVuuxF2uNuseJRLegeh4Zl+aXMtT2KcTgMjvPVphSHJ54z0tViHg3neL8noHIulO+8yO
	KjGyGRlhry5ROOY/VRBnerjWAAS3mgOVXPFLUnEY4MA284hBhnIECKJbH0yqKdL45GhV
	lLiAdS6ox+XSpuuhUR1pn1coUTLe3dpGaAdWiyODlnFKoWqFsUCwLP2BD07t+heTRhoR
	L7qg==
X-Gm-Message-State: AElRT7EdFODhFfUf/l1djIQ/qugSXmr1fJn8nRBxWftcQqfdhWZNbffB
	3QPpJJZfa8KoFU9UgY0lxEjPQA==
X-Google-Smtp-Source: AG47ELtrg4VCIgKKnXYDPli+mWGoBJTF4HGMB8DC3yS3Be0GI8BOL+WNygNP2eWBEE6JVucf4ND1Zw==
X-Received: by 10.99.190.5 with SMTP id l5mr12243413pgf.25.1521600168153;
	Tue, 20 Mar 2018 19:42:48 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	12sm6172559pfr.108.2018.03.20.19.42.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 19:42:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:42:28 -0700
Message-Id: <1521600149-3894-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 5/6] binutils: fix build with gcc 5
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
X-List-Received-Date: Wed, 21 Mar 2018 02:42:47 -0000

Patch backported from upstream:

  https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=ac4eb736520174305bf6e691827f7473b858cff1

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.24.inc   |  1 +
 ...86.c-Werror-logical-not-parentheses-error.patch | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
index 63c9287..02d7ed7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -40,6 +40,7 @@ SRC_URI = "\
      file://binutils_CVE-2014-8503.patch \
      file://binutils_CVE-2014-8504.patch \
      file://binutils_CVE-2014-8737.patch \
+     file://0001-Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch \
      "
 
 SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch b/meta/recipes-devtools/binutils/binutils/0001-Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch
new file mode 100644
index 0000000..8e8ae06
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch
@@ -0,0 +1,61 @@
+From 552b22a97e552a43a0e751e48e86db47168b2068 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 12 Sep 2014 09:46:30 +0930
+Subject: [PATCH] Fix tc-i386.c -Werror=logical-not-parentheses error
+
+	* config/tc-i386.c (match_template): Remove redundant "!!" testing
+	single-bit bitfields.
+	(build_modrm_byte): Don't compare single-bit bitfields to "1".
+
+Fix for build issues with gcc 5
+
+Upstream-Status: Backport
+
+  https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=ac4eb736520174305bf6e691827f7473b858cff1
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gas/config/tc-i386.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gas/config/tc-i386.c b/gas/config/tc-i386.c
+index 3c423da..4464091 100644
+--- a/gas/config/tc-i386.c
++++ b/gas/config/tc-i386.c
+@@ -4672,9 +4672,9 @@ match_template (void)
+ 	       && !operand_types[0].bitfield.regymm
+ 	       && !operand_types[0].bitfield.regzmm)
+ 	      || (!operand_types[t->operands > 1].bitfield.regmmx
+-		  && !!operand_types[t->operands > 1].bitfield.regxmm
+-		  && !!operand_types[t->operands > 1].bitfield.regymm
+-		  && !!operand_types[t->operands > 1].bitfield.regzmm))
++		  && operand_types[t->operands > 1].bitfield.regxmm
++		  && operand_types[t->operands > 1].bitfield.regymm
++		  && operand_types[t->operands > 1].bitfield.regzmm))
+ 	  && (t->base_opcode != 0x0fc7
+ 	      || t->extension_opcode != 1 /* cmpxchg8b */))
+ 	continue;
+@@ -4689,7 +4689,7 @@ match_template (void)
+ 	       && ((!operand_types[0].bitfield.regmmx
+ 		    && !operand_types[0].bitfield.regxmm)
+ 		   || (!operand_types[t->operands > 1].bitfield.regmmx
+-		       && !!operand_types[t->operands > 1].bitfield.regxmm)))
++		       && operand_types[t->operands > 1].bitfield.regxmm)))
+ 	continue;
+ 
+       /* Do not verify operands when there are none.  */
+@@ -6139,8 +6139,8 @@ build_modrm_byte (void)
+ 	      op = i.tm.operand_types[vvvv];
+ 	      op.bitfield.regmem = 0;
+ 	      if ((dest + 1) >= i.operands
+-		  || (op.bitfield.reg32 != 1
+-		      && !op.bitfield.reg64 != 1
++		  || (!op.bitfield.reg32
++		      && op.bitfield.reg64
+ 		      && !operand_type_equal (&op, &regxmm)
+ 		      && !operand_type_equal (&op, &regymm)
+ 		      && !operand_type_equal (&op, &regzmm)
+-- 
+1.9.1
+
+
-- 
1.9.1


