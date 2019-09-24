Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5907E713
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:15 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d22so291534pls.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=sXg7/kxmx2AZ7mgK3Eb0LV7zEDm9O1itI+S4HjjX/nTHA9QVQud4xzQwfhyLiIK6lw
	fZ+1OPj24Sq6RoiTXPZXeH/nClSXtj87qGR4l3sJ1A5HF7gWS9lHSlPvPlY+1ZJviHJB
	zM63o6pXqDcLscBvrjrYJpiixoGO0FIWrheemce3SJIGthCjY3jgux227LkSzymg35Rl
	E5ie4M7XEeXPU8eOib+tsdWbs28kGEq0Jbm5kvZXXn38lsF+KKZqABP8RvjKEAJedR76
	wy/+1G9Mk0s6hWUKG0/8GDAgWal/yApjZ8WaAOhlK39r/QhQaulgJU/g3VtxgqGu8Otf
	R1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qTeGTUYJFAxnTEn35ceW/LtkqKkiVHdbomGRuRV+ofA=;
	b=jcue/YqZEyVS8t2dQH3f4JRWn3+N3uOLm/GyttsoqGkmGPdvr8Hu9azE64X88YQPm8
	4HifssFCVchNWu8NymFyw2BT1zjqUArbOfk+PsvQBP8GXfQ8IaFMlc9QevzX2fv5PWJb
	f1K3urzY67igv8vAnz3Ut/7wsivL50btsTp9ghKpvzMK/exh8DAhludKEDEEvjso9Z2j
	RDdRhN4g3Xu+hzJjE1mcN49J1S3K8yd2d0fSy8xGl/YvWaikp/CIRYLIvARc4n4nzHVJ
	1gZ9Q6eU3zulnB70EK87sYaA2tdOFXZ1Q/SpGjO5SGMBELY8HUQ8bbAwjryG6xrIkM8H
	tSWg==
X-Gm-Message-State: APjAAAUMtvLVCghMDhMZQlllbJoowILWV34OPwrKMHlBmA62yXvctZpn
	p56Mn1jRI4dq90CkOHR1CjBbdrbZt0Q=
X-Google-Smtp-Source: APXvYqw9snPbX/RL1CGqbYoiDT05WBPzm++cnl6frbgbvr4qteKouW7x/O60BLp9NFhpB524gsTZDg==
X-Received: by 2002:a17:902:7c94:: with SMTP id
	y20mr440099pll.229.1569293416960; 
	Mon, 23 Sep 2019 19:50:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:23 -0700
Message-Id: <c9eb2ed8d37be4fd4f06edc54a4845a908f72166.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 43/50] gcc-8.3: Security fix for CVE-2019-14250
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:16 -0000

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


