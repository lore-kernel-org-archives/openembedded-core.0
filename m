Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 59BC67E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:14 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id t10so7009661plr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EgKpq822tcp9WZkGmxX52YmrgEX97S9x01t8W6t3EfU=;
	b=GCp+UiBBxtxV0lWYnWCav7k39kLriH/2dKoo8yQ8K1IDPywBqqVAg8LJDKBkYw/o4H
	3xm+sBtkwKr27wUwQ8QGMQCDEN71SkOrZ5pz3WddzQrfdgowAX5JN59Npzd3NcOp+Uuy
	1anKMy4LGG5QutrGr8vcet0eSFw9N/EjChzqQhNhAwVJ6oIS+nn1S86RKL1SC6HvUQHn
	QvdFSUpZFmFrq56HPsrYHfr+mSnYfdyVuPLkX/JUydvG7D7EehzPSMefBnl812DiH2pJ
	b3QKJyN+jsWKm04wUExy/GH+w7RDhkfVLmyzM0OJD+TK3WWUOwXx5/WZkrJNOw5J1Abv
	7VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EgKpq822tcp9WZkGmxX52YmrgEX97S9x01t8W6t3EfU=;
	b=mDp9lSblxPQJbbqiVFp06qd9YqfMyPPVR+dgXDAuEhjBymtib8x2hFHOuXe0I8wt2d
	BCaC4/Mv4vPLXMKtwdSh95vs/aMg3zFIs69OtkvPws+davWNPOjA00Y2wLcewWFXPgrS
	WsdW40GdXzbAo2e2mfrEScp299dxxQur996xU2BvPyvL89wTjoQWILKi+zX7XgC5uUk4
	+okarcexlhjU8cgWLgE6PtZzztgD+YtZIm1KX/rA0nn1PQS6xEFgWGRKt9QMI49dN2FG
	dhsI8t4eFvovr7dlcmk/6X5Z5yK9kPvPWYrHqB3sLyOtOMhloahFclRv9vM7B9uFOqWB
	LmZw==
X-Gm-Message-State: APjAAAXoe8eJEUExuxeZknFfzkLiYAjyJzli1ReIppHeehEwX73ApMtV
	Qv3FK8baQ3I9NOp0MD1MoDxGlw0kExE=
X-Google-Smtp-Source: APXvYqw+V6KyEJXWddENvnhl8s0Hptckv9XwjdLweYR7dqlTxsnd3/OFFYOMLKPryKcEPpbpWB/k1Q==
X-Received: by 2002:a17:902:326:: with SMTP id
	35mr30869829pld.128.1570461075320; 
	Mon, 07 Oct 2019 08:11:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:46 -0700
Message-Id: <79205966072bb6179d96b3af5aabc521da83e841.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 09/26] gcc: Security fix for CVE-2019-14250
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:16 -0000

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


