Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 74B6F7ED17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 15:41:52 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 205so4008413pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 08:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QZCaTLtJJhKw/ZxIMaayFYYNgGp1Q2QPehtEUfk+wzI=;
	b=cPCUnmP5Jc4bo64W0ucPfeuENCojgIzSnz+Mx3dRUWUUpw0cqkJz1xyaFKE6+n90fu
	C1VQ5eFxQghMvqGytzW0SCB5NPTx3LMF8heoLVU6jQuCrgUAu+rcEvpXP9vDOWd2mrFJ
	pyPO3ZbogjKcOLnpRJj/UNywE+f/cO6is/LcSg5xpGX11dzw6bw3jc2PGj2geNatTnGQ
	ZTQmxM9LeIEhGtaMjceNUdJ8iyc/TKcKuucoE7ORv2kC+J7lf35tqlvO0tLBARmM+y6c
	3gzewsh2KD/8yZibjKLYIsaDC8h+sk+gHxRgcoqGUQ7bNTf9RBNaGKA5BtFlHZtLffU1
	Swaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QZCaTLtJJhKw/ZxIMaayFYYNgGp1Q2QPehtEUfk+wzI=;
	b=PVjdhG5XGni6sBKp8lND5rcuPAWxYiL+Q96GG/C1ZeCUj+qGy4wvDcXAP+nbAV4n9a
	I+oo/ZOOoGOM+9v/FqhwQfD1/EXXkFNce1SU4otquWGazfSduTyfcpSp7/4etjDJxmV4
	bVzAQG9sQRaHisTV29bTHvaNvjPA/psQ+lvlI1XVUjrO0NyRGeat59JyQSZ+sk+DmzU+
	vToelMjsvuRZamk68BKH8wsPH5tQpdZ9FQICHsxUs2iMCd70iqaNltrvYz0hbfbtUnYz
	GUdJ8F1/BPfN5NLtWOOBWq2zpWdSJGGG6+z8lLRmd3DgV0U3MpmTVMpajmdWYrYkwm40
	PdoQ==
X-Gm-Message-State: APjAAAUEMv8/xbIBci7Sduh1GMxrXhhbAauswrJoOFvgpMweVFll2C9P
	GebtkfS1pw0MLvhJiDqZmT7oXDUP
X-Google-Smtp-Source: APXvYqw1XBbdsBxmpmSXTB5etJocFQUBOpLLzkNrTejQ0DpP7xs1dLBm9A1h/ScTHw9ZpuNXMwL+YA==
X-Received: by 2002:a17:90a:a6e:: with SMTP id
	o101mr4557324pjo.71.1567266112969; 
	Sat, 31 Aug 2019 08:41:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id d3sm7315429pjz.31.2019.08.31.08.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 08:41:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2019 08:41:49 -0700
Message-Id: <1567266109-31426-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] gcc: Security fix for CVE-2019-14250
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
X-List-Received-Date: Sat, 31 Aug 2019 15:41:52 -0000

From: Armin Kuster <akuster@mvista.com>

Source: gcc.org
MR: 99120
Type: Security Fix
Disposition: Backport from https://gcc.gnu.org/viewcvs?rev=273794&root=gcc&view=rev
ChangeID: 28ab763c18f1543607181cd9657f45f7752b6fcb
Description:

Affects < 9.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc              |  1 +
 .../gcc/gcc-8.2/CVE-2019-14250.patch               | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-14250.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 866a775..bd95ccd 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -73,6 +73,7 @@ SRC_URI = "\
            ${BACKPORTS} \
 "
 BACKPORTS = "\
+           file://CVE-2019-14250.patch \
 "
 SRC_URI[md5sum] = "4ab282f414676496483b3e1793d07862"
 SRC_URI[sha256sum] = "196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080"
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-14250.patch b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-14250.patch
new file mode 100644
index 0000000..e327684
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-14250.patch
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


