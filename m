Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAAC6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 16:17:18 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id a67so3224347pfa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=ZUaQ93pJ+aknMkudO9DkqaCjLr9E47OUqJu/O/bhC/BruLK7Sx5RoGBdSd3raLvwLn
	ScDDBGCoCkwUba7/jQ/ZcM8soMUKRgxZWkaZnMpsvQfX9B9Iwdm6DB3n19DJ8rwKkYX/
	dUpj1J+3L1salS98tVOn+DKtQ168NGILFYs1LWk2yqAMJAFy1DCCwPADnrzAXsiyKknR
	ZqBXrsZJD7861wlrTBmkdIa5KQHMadh/Vd4tH7OvZYQKx51fcm3GYTdxSQWb/qzs1ecP
	6aLQ9bZL3Ol0+lx4jkI9e+/5fOddbLlr2V0Iod7hOWdeMZVjBbYmw8hYqLcPJBlqYvdQ
	2vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=GeazjOersWnPWyg4ls7ViLVo4Jgil8WYSEA7AQBwPLTr4v1YvnoX4Ss8vL3oFOf3AE
	TgZZIGotESNxBcIwsCN8VoVil3bwgIlPsBkZT5yHXaG9ECrZi2l1TSQwGvock51cQdGc
	SuoDiCi8/EkhwrDYuFoN9hD/bIuZpP83KiMXPGPDptoru7nKd5n7HNZO1A8mT+/z8T1M
	/AJod6HpOS8hxW5rsa8HZ9X/gYT7f7KNOj4IPF9/jgyCm+2Ahpe+e2IITDUW/Hc2GOgj
	/WwQBI5j1AtcfWJ/pAp0ZJzGLHzZ1SNjbhiM88et256+kWN+qM/aO/DNJex4ajF6eGDb
	PhtQ==
X-Gm-Message-State: APjAAAX7/yh/8z2HYrxs1Du7KBe+j2Gyjg1Oiix/YKh5THBll6YP1yGF
	UNTKpaQ/2aCIjLsgHZcez4mHajH+
X-Google-Smtp-Source: APXvYqw9H2iCp1oLHXFkPsdKG5m9TWC/zJgl4/hUHjKBqeL0a62B2frn1u/NIsjzjXQXoSMUzp66GA==
X-Received: by 2002:aa7:8a47:: with SMTP id n7mr26307749pfa.182.1567268239064; 
	Sat, 31 Aug 2019 09:17:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	z28sm12021533pfj.74.2019.08.31.09.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 09:17:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2019 09:17:16 -0700
Message-Id: <1567268236-19739-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [warrior][PATCH] gcc-8.3: Security fix for CVE-2019-14250
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
X-List-Received-Date: Sat, 31 Aug 2019 16:17:19 -0000

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


