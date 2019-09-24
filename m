Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id BD4177F262
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:31 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id q21so296264pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EgKpq822tcp9WZkGmxX52YmrgEX97S9x01t8W6t3EfU=;
	b=tIrTuDpLWGP7HCaciYLPedsv0HXCymu2UqR2R1rs9nRJ5WyCSgmseuKTU3MZh8007m
	SC838Iwbf5/nq+6DGjLiixMJ4zEuy5I+h3BeQNr2e330v0goA2IU+OJWLY4Vt6tMdZTt
	3K1PaG0++zJZucA1mkQVBmwHNEtqvt5WbAvxXzCSrQ6tOwr+Dziej54/+a0hxidxxG+r
	MFtBMWaIubtxm5y3ekpntPFbb7sPhCxtty3/RuFlhrVOcmsqy6/aa9iJiZg4DHM4i20a
	DDFTnKcCz/iKFXDwem/fNnPeQtN0w0lKtmjnMXiUBk2YXzFaUEYfYNksWUDYnH2onGwV
	PC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EgKpq822tcp9WZkGmxX52YmrgEX97S9x01t8W6t3EfU=;
	b=d2wcraO40nTsPU4AZUX5cXD5aN2A9EcMbOpPlLflx9dIRD7j8G9yK1BRA36YhT8Hev
	ZeGWKHMeh195pArgNluX5T3ZqjSSkt3vWp0qip3CxTtEdAH8eLdheKSpbPw1Ahpeiiqv
	Qcc7q96qm5oFyFnPIPzsMbVCKd2uNJavtStaly8sPkMf4qOIRG20Wi60eiqA98Jo8Xmx
	xbZNlqEPnMmvPw3agrLI7Q94iTavtjJVsN8LxRfEy0+KpZj1KyeHBUAu2BXw0Muio+8N
	fqyXLya9kg9IKqFUD87FaJcBYhiPHTz+YzIq2vbBu7sVhtdJpGeon/TEfY08jO8FqrbC
	cg+Q==
X-Gm-Message-State: APjAAAXDatbplQIbM906qVbArpi1JMFOGOJIDkSswMSBhdRjapX1QSp8
	IelqZ1L+gqdcZFT84DUGjax4kMol5t0=
X-Google-Smtp-Source: APXvYqwQgQSMJTbK/G/5av5bjZzAWNBmPLiNWQouXkD6cRSFY5LuA7veDewZ2nc28naSYwk2K2Nc/A==
X-Received: by 2002:a17:90a:a78d:: with SMTP id
	f13mr530715pjq.18.1569294812564; 
	Mon, 23 Sep 2019 20:13:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:05 -0700
Message-Id: <79205966072bb6179d96b3af5aabc521da83e841.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 09/24] gcc: Security fix for CVE-2019-14250
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:32 -0000

From: Armin Kuster <akuster@mvista.com>

Source: gcc.org
MR: 99120
Type: Security Fix
Disposition: Backport from https://gcc.gnu.org/viewcvs?rev=273794&root=gcc&view=rev
ChangeID: 28ab763c18f1543607181cd9657f45f7752b6fcb
Description:

Affects < 9.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


