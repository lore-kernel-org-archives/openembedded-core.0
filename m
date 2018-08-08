Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA3E278E4A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:33 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id ba4-v6so1183502plb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nliUDTlB5S7f2Bs9gSbHFBftvTpJ+wfhZZJUOCwRfFg=;
	b=ZEdCQ1rqpZXfeEw954VmI/JMPHNqAH52Xr3l5lZpwvmLjnUWudMWnaaC8BKTAK8I3M
	Qf03dEl6vnYGhzdm97joD7LoKw7+IMpo2R3zpfxdR1thCpJ24maxR0tVRZHojb8uBtwf
	GjxLhCHBZJAUJ54g4/EwyuyNQYElCTl7qo6fvpk+fKt4RxfU6pm84Jogwi6ZnYh94ZMV
	goJvPXUm0NBtH41xGyCjdaBreOtdzvBIdc9YTrZs3MUpipKpdl1fIcOU2LSt3reCDzsk
	XlSrlx6Tk0oWPjq28ZqkjHp8oJPQmFJF6PaJchIuFYmFC852i3XwB9z9mpFxynqZYtLK
	wBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nliUDTlB5S7f2Bs9gSbHFBftvTpJ+wfhZZJUOCwRfFg=;
	b=m/u4THyMIPSWIWvjAoxtAsVdvkF6UfWeY1o8K/XdJsrXG261sXIsl6HNdSekvUb6YI
	TpTYX3M4vc8s0oVetIQdLXHJY++f+uYrxFexVwX6+BR7TcQuIF7xVu2G0pN4ZZSIQrv4
	x4ygS7+i4wQV7qPX+roLSu98yHuRX0/c9nqTch9/KP5e1igPSJfoIE5aIjtPiOJMIEl2
	NUn8FUcS76v8uTAUe/FR2bKq1PcWIO6Z0PXWZ5ucm+8gSMSYyf9ihCLARf0yM44t4iuR
	Q7LHQ6SDFxte0IAtYZpwD56UHpkd2JNqzeN98bSDh2tVsLGiPmM1ArjAsrXM+oR/KfSH
	NsxA==
X-Gm-Message-State: AOUpUlFTHQvy6Aw9Aq/s7SS+3ddbTtWh0vULYYMUEnOEXFQggyKR6VXd
	M9H+DV7AjmwCQoELjEI3ZeM=
X-Google-Smtp-Source: AA+uWPxW5/XvULi+36+e4NzJySzcLCkKvra6HdKfR9PMFlTAFOEcArLICd7kNuer5QgK6ej6kRNS4A==
X-Received: by 2002:a17:902:143:: with SMTP id
	61-v6mr3023960plb.171.1533742534699; 
	Wed, 08 Aug 2018 08:35:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:06 -0700
Message-Id: <1533742522-24357-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 11/27] binutls: Security fix for CVE-2017-15023
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:33 -0000

From: Armin Kuster <akuster@mvista.com>

affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-15023.patch         | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15023.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 05b7f22..08b233f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -46,6 +46,7 @@ SRC_URI = "\
      file://CVE-2017-14940.patch \
      file://CVE-2017-15021.patch \
      file://CVE-2017-15022.patch \
+     file://CVE-2017-15023.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15023.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15023.patch
new file mode 100644
index 0000000..9439b7b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15023.patch
@@ -0,0 +1,52 @@
+From c361faae8d964db951b7100cada4dcdc983df1bf Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 25 Sep 2017 19:03:46 +0930
+Subject: [PATCH] PR22200, DWARF5 .debug_line sanity check
+
+The format_count entry can't be zero unless the count is also zero.
+
+	PR 22200
+	* dwarf2.c (read_formatted_entries): Error on format_count zero.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15023
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/dwarf2.c  | 7 +++++++
+ 2 files changed, 12 insertions(+)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -1934,6 +1934,13 @@ read_formatted_entries (struct comp_unit
+   data_count = _bfd_safe_read_leb128 (abfd, buf, &bytes_read, FALSE, buf_end);
+   buf += bytes_read;
+ 
++  if (format_count == 0 && data_count != 0)
++    {
++      _bfd_error_handler (_("Dwarf Error: Zero format count."));
++      bfd_set_error (bfd_error_bad_value);
++      return FALSE;
++    }
++
+   /* PR 22210.  Paranoia check.  Don't bother running the loop
+      if we know that we are going to run out of buffer.  */
+   if (data_count > (bfd_vma) (buf_end - buf))
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,4 +1,9 @@
+ 2017-09-25  Alan Modra  <amodra@gmail.com>
++
++       PR 22200
++       * dwarf2.c (read_formatted_entries): Error on format_count zero.
++
++2017-09-25  Alan Modra  <amodra@gmail.com>
+  
+        PR 22201
+        * dwarf2.c (scan_unit_for_symbols): Ignore DW_AT_name unless it
-- 
2.7.4


