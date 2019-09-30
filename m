Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCCC7F318
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:35 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id a2so4853414pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=lntGBqqhhwdee8nWMOvWBLWp3IV5t8AhSXnYRvp59MNCr/tNISZsxH+EIJkU5r6byv
	E41Wt+JwgOKOFiCRoLMW/bjnGtzBpBQgCzPvkiBMw2JJzlw/me8z95390CUBNs1p5xCx
	dQCGRvzz3quon5EtXop6QVDsczYh5DzYjpAmPrxp2p6AFGefnfrv2PEsDSL2bpruAzvB
	kxybk7QSZ39ZJPAO6Ictpu7euo1E5LCqLK4CYOGWoNpl/YIpcWX48ikneoa/pvbyHuKV
	zWZVhGWhGl9kd+o1EECpzaYXT8A4olt86sInUlgipgGgHPjk5ZRIaCdvTlU+qMdsZKUM
	Xj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=Z5pc7GuOpI1NvsPetE4cMniyqj/bYwCUEz64HRwcA6AyMcQMW8sVkucsE1DKdrCA7b
	FCHKnwE+TRSl62N2RfcqpsjxbUWiOI2Zk5lTZLVCpuxTBREtQgXSQ2jUsSEErZ3z71fK
	bmJUJIBbTMy2n3JjpHUzTxkI9BNTaD/ADaujGzsH1uMXdk2rxujCQKbOmiwvKNTDL+sT
	OkzhkhKNKE5oNccQDF++IZScnrNWaI3cKqeS6ovTBZbuROIISsCuIf9qgr75gcWq6Rf4
	2i78LZX9uGfQsb0s0hbwQ/SGHAilLmyPztNJscp446pUd/lJHjXZK6bLJpAw5EbIhvY6
	P9KA==
X-Gm-Message-State: APjAAAVKREdftM36jjyVW1sMwF8UUxbbhqY+xZwKHiitiIZR9GOKUaQE
	+ZuYqBUKtqLHnXPkmk3tuU97qj3PYig=
X-Google-Smtp-Source: APXvYqzewl2Jb3N+jF0qLlPI6eCUKJOkdpdD2jkfLQ+CS+N0ALKoIj9/5ARSptRRFkQFOmIwqRwrQg==
X-Received: by 2002:a62:2ccf:: with SMTP id
	s198mr19541940pfs.216.1569818917036; 
	Sun, 29 Sep 2019 21:48:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:37 -0700
Message-Id: <125c77be468adf8b3be8d00f99d80bd77f7d2e1e.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 42/54] gcc-8.3: Security fix for CVE-2019-14250
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:36 -0000

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
index dce85a2..80f716a 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
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


