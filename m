Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 07FB57F2AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 20:38:00 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d3so6962329plr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 13:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xdtr+QIWv/So0yu4kjrEvZkS2nb07vW/113MrKZpLi0=;
	b=dyoT/kLLxhbd0VSH4I2xCfa2YfUPchQxQwLPSl2ejdQxE5KN46qqxgP/ReMrCsVLQz
	RIIzL4d/GHLL7HGgGz8fW1JRiQtFNXFiHvrBxjEz4QDwrSf3D8QGCnSAX63Klt45U5vT
	IMeUAeMY9MYJemJMa1kkJMhfbbgLeEulCl9KuxFNt9jiyGwbZEBP/L16dr31SO99pzb5
	y0gUrkK4FbSINgTqfFByjew5uKvfqLQzXlu1wMMnO2n04bZWEdm5PbbZAxlrKOl2abzw
	+AEbQW0+n6H/hwY9K29LM++ZSEc3Wi25HTOkpVnKsp0noZtZgl1M5Gvl/rPAHrrcRyN1
	051g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xdtr+QIWv/So0yu4kjrEvZkS2nb07vW/113MrKZpLi0=;
	b=R6U4XC9f8bTecSQkw8/F0LQDVXhlW6HhLuWe0jMr5tjzzywFVK26paWv/eCh+X2bSc
	y5bTtB2/xvTqMPDaFi4uR/RprBnxNsVa12D0DfdJDOTLqWqPaZ5MRYdDBs/3kS3H4Wh9
	RinXkzNezvOP15UX04E6ITYtZZfrQewrprMtGX9WqkI1AB5TP78Ob7SvkS8M6dqqLdgT
	F66IGqZuOAXsmFbLQeP4Vcz43fCv4c99ifKCkYT4t7VaJIkq5kJZTTfPnqwuLVC0ZAeC
	zgwO7RKap05O3HIhLEc9dTQR3OOgHr5tl4uZNlftuu5mgaptov0mGyjdcRmJS7bNISS6
	o5FA==
X-Gm-Message-State: APjAAAVJh/O9/oiddPAjX+lU1mWUS463X92P6OsfvZM8UfP4rVb1iFsy
	cMqmoO1P0eXMXb9pNCQXJvmyRsQl
X-Google-Smtp-Source: APXvYqx/bRUIaASLj+KjLx0UxMYeU8ZrnoGE6Lfhx6hIU/AySF8AnalqNwOu6j3yNYS2sO0q6foAuw==
X-Received: by 2002:a17:902:aa02:: with SMTP id
	be2mr6162269plb.172.1567456681065; 
	Mon, 02 Sep 2019 13:38:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	h22sm13193472pfo.8.2019.09.02.13.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Sep 2019 13:38:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2019 13:37:59 -0700
Message-Id: <1567456679-2385-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] gcc-8.3: Security fix for CVE-2019-14250
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
X-List-Received-Date: Mon, 02 Sep 2019 20:38:01 -0000

From: Armin Kuster <akuster@mvista.com>

Affects < 9.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc              |  1 +
 .../gcc/gcc-8.3/CVE-2019-14250.patch               | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index 1781ff5..4b0d6f2 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -73,6 +73,7 @@ SRC_URI = "\
            file://0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch \
            file://0042-PR-debug-86964.patch \
            file://0043-PR85434-Prevent-spilling-of-stack-protector-guard-s-.patch \
+           file://CVE-2019-14250.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
new file mode 100644
index 0000000..e327684
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
@@ -0,0 +1,44 @@
+From a4f1b58eb48b349a5f353bc69c30be553506d33b Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Jul 2019 10:48:26 +0000
+Subject: [PATCH] 2019-07-25  Richard Biener  <rguenther@suse.de>
+
+	PR lto/90924
+	Backport from mainline
+	2019-07-12  Ren Kimura  <rkx1209dev@gmail.com>
+
+	* simple-object-elf.c (simple_object_elf_match): Check zero value
+	shstrndx.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@273794 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Affectes: <  9.2
+CVE: CVE-2019-14250
+Dropped changelog
+Signed-off-by: Armin Kuster <Akustre@mvista.com>
+
+---
+ libiberty/simple-object-elf.c | 8 ++++++++
+ 2 files changed, 17 insertions(+)
+
+Index: gcc-8.2.0/libiberty/simple-object-elf.c
+===================================================================
+--- gcc-8.2.0.orig/libiberty/simple-object-elf.c
++++ gcc-8.2.0/libiberty/simple-object-elf.c
+@@ -549,6 +549,14 @@ simple_object_elf_match (unsigned char h
+       return NULL;
+     }
+ 
++  if (eor->shstrndx == 0)
++    {
++      *errmsg = "invalid ELF shstrndx == 0";
++      *err = 0;
++      XDELETE (eor);
++      return NULL;
++    }
++
+   return (void *) eor;
+ }
+ 
-- 
2.7.4


