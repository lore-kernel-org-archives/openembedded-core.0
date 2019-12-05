Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 922F17F883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f4so7638124wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9YLPKrTfmZqHORP/l+qEXgdUZwMpex79C4RJjh/nyRg=;
	b=sOTjvAV244iBdKFI2NTNXZ+GgZVi8pgH71EpXnwtrUqgw8+ZZ3qM2vCI81Z69hdSkP
	R+IqSmCxa9BZO3CHoeFuleNaiSgiQ3zQsSoCuwdaBHRC2rf7jZSf6GL4l1BI+DHgDyyZ
	8Ls3tckztY6niAEIo+lVk2nE6r1nyfDRWrMH2h9MOdrGfss9YVAvzrAYFg53QKdmPZMn
	Yxln+WfLWyRtGNTlOL/Rwl2+DbAnhLopK/iNFv8fLxrpzV7urFk5/SIl45pFck0C8Sk/
	IuaKn2Tk0f6W4L/j4lxEMEF0+84hZkhAzRxm8poZFFNM3THWKo8NDGWz/BAMfu9U1qa7
	F9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9YLPKrTfmZqHORP/l+qEXgdUZwMpex79C4RJjh/nyRg=;
	b=JBL4TTrSToVRq2iQU7TnVZ/YfQB2+8uau9E4NaMVV3qrP5k77waWaE1xrTv21Ds8Cz
	r03xIKo4AF74NeF9QdM5w8LpPc+Tqgo0MBDK7/6gAocr7PAldrE44KhGG5lZWCIyBxuo
	FBvm3nPBF6XuevNeu2wQTurgVgRlEvlcvBJ+q6L/oEowZbj48E4VBo7FrbYCP3hi9KeH
	WFSjFUbw6qxkfhIuFusoduFNKOltn251lJoboajbsfiPphCrFarRTVjG8X7puJrgD55S
	touOHX4BZ3akZHGw6lqr/QA60746btnYyZ0XHmjY/ySZFlpmpRKl32iDqNGsaTcp8DBT
	okHQ==
X-Gm-Message-State: APjAAAWAtH+C2s65G3w2lZ/IUZ3hXxqCLgOfbfQNx1JYMGwLTEF7OxMd
	zcHyKHvI0dXnPADjDujoCn6McZ7J
X-Google-Smtp-Source: APXvYqwP7vIzt0xqov+4NtKxBpxiE6Hnaf0bPnHcgvgH/kYUXTzIrfLci2JQsZ+0GDuWPyHv/RJtAg==
X-Received: by 2002:a1c:6255:: with SMTP id w82mr6249538wmb.20.1575560659118; 
	Thu, 05 Dec 2019 07:44:19 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:51 +0100
Message-Id: <20191205154357.121346-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/24] sysstat: update to 12.2.0
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:18 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...orruption-bug-due-to-Integer-Overflo.patch | 46 -------------------
 .../sysstat/sysstat_12.1.6.bb                 | 11 -----
 .../sysstat/sysstat_12.2.0.bb                 | 10 ++++
 3 files changed, 10 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_12.1.6.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_12.2.0.bb

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch b/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
deleted file mode 100644
index 46b111806c4..00000000000
--- a/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 603ae4ed8cd65abf0776ef7f68354a5c24a3411c Mon Sep 17 00:00:00 2001
-From: Sebastien GODARD <sysstat@users.noreply.github.com>
-Date: Tue, 15 Oct 2019 14:39:33 +0800
-Subject: [PATCH] Fix #232: Memory corruption bug due to Integer Overflow in
- remap_struct()
-
-Try to avoid integer overflow when reading a corrupted binary datafile
-with sadf.
-
-Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/83fad9c895d1ac13f76af5883b7451b3302beef5]
-CVE: CVE-2019-16167
-
-Signed-off-by: Sebastien GODARD <sysstat@users.noreply.github.com>
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- sa_common.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/sa_common.c b/sa_common.c
-index 395c11c..cfa9007 100644
---- a/sa_common.c
-+++ b/sa_common.c
-@@ -1336,7 +1336,8 @@ int remap_struct(unsigned int gtypes_nr[], unsigned int ftypes_nr[],
- 	/* Remap [unsigned] int fields */
- 	d = gtypes_nr[1] - ftypes_nr[1];
- 	if (d) {
--		if (ftypes_nr[1] * UL_ALIGNMENT_WIDTH < ftypes_nr[1])
-+		if (gtypes_nr[0] * ULL_ALIGNMENT_WIDTH +
-+		    ftypes_nr[1] * UL_ALIGNMENT_WIDTH < ftypes_nr[1])
- 			/* Overflow */
- 			return -1;
- 
-@@ -1365,7 +1366,9 @@ int remap_struct(unsigned int gtypes_nr[], unsigned int ftypes_nr[],
- 	/* Remap possible fields (like strings of chars) following int fields */
- 	d = gtypes_nr[2] - ftypes_nr[2];
- 	if (d) {
--		if (ftypes_nr[2] * U_ALIGNMENT_WIDTH < ftypes_nr[2])
-+		if (gtypes_nr[0] * ULL_ALIGNMENT_WIDTH +
-+		    gtypes_nr[1] * UL_ALIGNMENT_WIDTH +
-+		    ftypes_nr[2] * U_ALIGNMENT_WIDTH < ftypes_nr[2])
- 			/* Overflow */
- 			return -1;
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
deleted file mode 100644
index 83bb45ea258..00000000000
--- a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sysstat.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
-
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
-	    file://0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch \
-	    file://0001-configure.in-remove-check-for-chkconfig.patch \
-"
-
-SRC_URI[md5sum] = "d8e3bbb9c873dd370f6d33664e326570"
-SRC_URI[sha256sum] = "f752f3c406153a6fc446496f1102872505ace3f0931d975c1d664c81ec09f129"
diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.0.bb b/meta/recipes-extended/sysstat/sysstat_12.2.0.bb
new file mode 100644
index 00000000000..e3ae3dd51cd
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat_12.2.0.bb
@@ -0,0 +1,10 @@
+require sysstat.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
+
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
+            file://0001-configure.in-remove-check-for-chkconfig.patch \
+"
+
+SRC_URI[md5sum] = "7deffb18e7f32a0b74ab81f1f75de9ee"
+SRC_URI[sha256sum] = "61aa98eb8b38542eb97defcc2472adee1a24df8252f41b96e20d64c6064a8375"
-- 
2.17.1


