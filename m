Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id F324978DC9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:30 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id b11-v6so1328454pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l9WJcj3HvlMMHHmChQkK1+JfmO7s/gaUu+rSO9bhIJM=;
	b=D8z3GRzUVfgLzkq5J+uihU+++CLhBHTaCCsXUXlj0Gjnjapi8z22JGJ3IHlofK+7FJ
	kmpzbm36XTvpt4r/9RgGHohUH5B1sblxoafREQWyDFmPXOG0OkZLrN8dr984860Am54+
	uOs4+P+AZ+KAYvjxgt7fqPGEPyic6PIMAXipc4dzw5VnTEKG/391yK+NheEboIO9QBay
	XuUA07zcRCbkY/dQxrzm/cSmjfnS1WjzB4QaioM+pJWVsnSGSuSdZWEn3/kA9+gA7NlR
	VP5hswc/YqGX3MC6wKiaiAaR8pXNiDg/n8sXgW0nhXo4AOisCBUHKiNMpQ90xtJGfRXh
	T2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l9WJcj3HvlMMHHmChQkK1+JfmO7s/gaUu+rSO9bhIJM=;
	b=pbgAhQrlUEITndvOFGf/zNnql6V24H6PR80//flVRmVHdypu05vNgH48kIYnjH2r1v
	T9VI5CgJ2km11YDfbaK1PujBdJKuXCIazlh3A0gxBnAyLetgPk6rZ1aENgN8XCpoO/3/
	z2mSDBnW/YKdcO5L4UG3ZXFv1MRyHmuvI9Gy2iAP8aF3dE/L7EXif52xcP9rNRhg7IJu
	Rra66zVgv3yDuv2BDIqSgCgD4t2q23IcDM6DBlXabc0Ay78nlONveZuHOqT64McDI5Zs
	Jv5UhvbmEKh9HUQfuyFhox7eUrI0zpdGw7z7VDu56KUVetiwgNkL7LuojkLfxly4luUi
	volg==
X-Gm-Message-State: AOUpUlEAAegAy8oUCmjV5luzlcAj/u/7bvP3j8vDUPALCPuudDiJtUTE
	xkKk806yp8WQhnQobdrsQ+o=
X-Google-Smtp-Source: AA+uWPzXzLL/78j/fCSnxsBeP+VxHZMa+3NipXpe6mzBzkI9ctUCN4YipmA5K8BSnNZZWnr9CCdDeg==
X-Received: by 2002:a63:9902:: with SMTP id
	d2-v6mr3041887pge.343.1533742532037; 
	Wed, 08 Aug 2018 08:35:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:03 -0700
Message-Id: <1533742522-24357-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 08/27] binutils: Security fix for CVE-2017-14940
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:31 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-14940.patch         | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14940.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index c0ad94c..45e4393 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -43,6 +43,7 @@ SRC_URI = "\
      file://CVE-2017-14934.patch \
      file://CVE-2017-14938.patch \
      file://CVE-2017-14939.patch \
+     file://CVE-2017-14940.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14940.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14940.patch
new file mode 100644
index 0000000..49b0bdc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14940.patch
@@ -0,0 +1,47 @@
+From 0d76029f92182c3682d8be2c833d45bc9a2068fe Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 24 Sep 2017 14:35:33 +0930
+Subject: [PATCH] PR22167, NULL pointer dereference in scan_unit_for_symbols
+
+	PR 22167
+	* dwarf2.c (scan_unit_for_symbols): Check u.blk->data is non-NULL.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-14940
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/dwarf2.c  | 3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -3202,7 +3202,8 @@ scan_unit_for_symbols (struct comp_unit
+ 		    case DW_FORM_block2:
+ 		    case DW_FORM_block4:
+ 		    case DW_FORM_exprloc:
+-		      if (*attr.u.blk->data == DW_OP_addr)
++		      if (attr.u.blk->data != NULL
++			  && *attr.u.blk->data == DW_OP_addr)
+ 			{
+ 			  var->stack = 0;
+ 
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,5 +1,10 @@
+ 2017-09-24  Alan Modra  <amodra@gmail.com>
+  
++       PR 22167
++       * dwarf2.c (scan_unit_for_symbols): Check u.blk->data is non-NULL.
++
++2017-09-24  Alan Modra  <amodra@gmail.com>
++ 
+        PR 22169
+        * dwarf2.c (decode_line_info): Correct .debug_line unit_length check.
+ 
-- 
2.7.4


