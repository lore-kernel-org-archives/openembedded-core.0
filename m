Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C530478E39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:29 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a26-v6so1326526pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8sNDhKk5IVkhEhk/2I8ssKM2jlo5rTHmXG/0HFJuYpk=;
	b=gAYuyoMtWEqwAVmrUnDs85m46TcAbm7p+APBTmnI5VALMxz+/a+w9dhaJOdAg7kFLe
	36cl0W0uUH/LqHSWjKIRSvwXNXPvFyhvyLTQxFCu4LMa4JfB+pMNEqHbAH9sdAOx0t1r
	uExyORx2D8pPFtLhof2VcoGnRHkkPBh171IqzFhw/xx+8ZSJajQMuNSdJVzvcnFnH66A
	0fr5Cbo7k2wsKmQJRtRLp5s1NhYPzxR+q+AQN0NNe2E5miXq02FoKJ1/Aw2S7QJSPQLe
	nMSeHt9SIv/DtacXYWSoezd/zGCYszj7Ft8CPIiOmV9Wk//xv9mEQQSPZdu5TRB9lDY+
	JV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8sNDhKk5IVkhEhk/2I8ssKM2jlo5rTHmXG/0HFJuYpk=;
	b=kiUuT+r8Xk3bVcRQFPVe2Ef90dBVfABBtd+1pJXq6NYk+wBrYsP5AdkQIPNdwE9CYP
	VGVmzwD8MO6XfW/udNG/UVJUs6qginytw48tSNsNSazDG8UPDgyPi6rU3p3h0Be1YsZ8
	z+XG3oGvxgOf9se9bySNjs2ftV6BnblJ4epSyBv5jWKaousOPfH0UtAxgVHaK6Tt5jq6
	SSzO5JZYXtsbTCNuwCZLVprbLa7bKi79QvQxyeb3D7sHN010GVbHsA7s8fmuK8BE30fT
	AetP82jUvTorMip2hpD2RorcZjjew0NZleuXGy6NaAaJ4ZEdkaytUJnZQSgRMvITpMai
	GBCQ==
X-Gm-Message-State: AOUpUlGrlcT/RWbeGXEUMoIDV63Jkcmmk1+vE1caxQHJG/wzRFps7DXM
	5hZAWS+w04M3qx0qP5kn58sR4XqS
X-Google-Smtp-Source: AA+uWPy6KdslRdb5DPn+UsT7vCpdIWs2GcHNUH6hlP8vu21UEwbdPVzjtQMcrVzvUohFJc0T5hm8GQ==
X-Received: by 2002:a62:1449:: with SMTP id
	70-v6mr3535859pfu.222.1533742531038; 
	Wed, 08 Aug 2018 08:35:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:02 -0700
Message-Id: <1533742522-24357-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 07/27] binutls: Security fix for CVE-2017-14939
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:30 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-14939.patch         | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14939.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 8e92b92..c0ad94c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -42,6 +42,7 @@ SRC_URI = "\
      file://CVE-2017-14933_p2.patch \
      file://CVE-2017-14934.patch \
      file://CVE-2017-14938.patch \
+     file://CVE-2017-14939.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14939.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14939.patch
new file mode 100644
index 0000000..d1e4c3e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14939.patch
@@ -0,0 +1,56 @@
+From 515f23e63c0074ab531bc954f84ca40c6281a724 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 24 Sep 2017 14:36:16 +0930
+Subject: [PATCH] PR22169, heap-based buffer overflow in read_1_byte
+
+The .debug_line header length field doesn't include the length field
+itself, ie. it's the size of the rest of .debug_line.
+
+	PR 22169
+	* dwarf2.c (decode_line_info): Correct .debug_line unit_length check.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-14939
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/dwarf2.c  | 7 ++++---
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -2084,12 +2084,13 @@ decode_line_info (struct comp_unit *unit
+       offset_size = 8;
+     }
+ 
+-  if (unit->line_offset + lh.total_length > stash->dwarf_line_size)
++  if (lh.total_length > (size_t) (line_end - line_ptr))
+     {
+       _bfd_error_handler
+ 	/* xgettext: c-format */
+-	(_("Dwarf Error: Line info data is bigger (%#Lx) than the space remaining in the section (%#Lx)"),
+-	 lh.total_length, stash->dwarf_line_size - unit->line_offset);
++	(_("Dwarf Error: Line info data is bigger (%#Lx)"
++	   " than the space remaining in the section (%#lx)"),
++	 lh.total_length, (unsigned long) (line_end - line_ptr));
+       bfd_set_error (bfd_error_bad_value);
+       return NULL;
+     }
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,4 +1,9 @@
+ 2017-09-24  Alan Modra  <amodra@gmail.com>
++ 
++       PR 22169
++       * dwarf2.c (decode_line_info): Correct .debug_line unit_length check.
++
++2017-09-24  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22166
+        * elf.c (_bfd_elf_slurp_version_tables): Test sh_info on
-- 
2.7.4


