Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 99EBC7C665
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:15:51 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y8so4890384plr.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Dbga17Km7y9+uGK9CeCSFbIBfFqBFzBCSQwOpW6rFBc=;
	b=Ggpa2WOm1TPnFeKG2ASXq1+7Xl6GUwODf6dNXmZEOo6cZXEr4GdD28Fusi5BXhwquD
	+29G+rYc6fXh56nbgyTvAh7LytJ7+ebL76cTQD1tvq7ov2cchjIqnQZPcP7MkfsTlWdW
	Jm2l7T6YExJlAYLgrLRnWMQ4JhEuH9G3h7HNoH+9zSFbB1kiZmuKBoNdGD1GKuyalIwO
	A3AFj06cdfQocmDRneBy4lTLVxu9466R1zJs7/t6MVD291IIDk9dXLsggIJ1UxWEqouB
	4bYOa0CbzTWjzDRsrb9Yqs6H2Pz+/F0Xu1dzXD643jKWTAfnpDAAIsDZi7Ro56MiqETj
	SFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dbga17Km7y9+uGK9CeCSFbIBfFqBFzBCSQwOpW6rFBc=;
	b=J0bt+Br9dUaL6j2k+kgADTkp2EBjUyd6ZsZlQ3w0skVYIi2S+sz8qUBlrNelB6ScrE
	XTXtYu2H1p2w4Yy1kPn1gNq2/aiNUXS0hUeP7sptJImndvORAh++zDEsSmOfkWGAw/h8
	2U1GBwZsAHAwuC8EY6uy17bDDji/jQDKYDygW26P7faQbWfaLKWdJlm+G+v4/w+69jCv
	TpDTuiSGjVZzEIe5cChzwYitpbizl0jTmlEGhh/DW5gTwY9rl/gmNLTmMXbItIfgTlS1
	MXbC8pLw8iFlok3QG+qA5R6vvG5yC5Cs6nF/OoC7sSKGKgHu9wUbx3oMnHjm0wkrVaOz
	4ciw==
X-Gm-Message-State: APjAAAWtMyvy6My6F+R78fASeaxbrkgqhyvZfub3+jR3Vpokf91zUNes
	59Vv7+wVFcvHPxsgLBXe+66Q6CCG
X-Google-Smtp-Source: APXvYqwT9zoAAmxLeWCn4tnSv9dj39Z/ctQNbUkva9VZYVldSui7lU1rxWgLikiaVvhaKPAbM/sHwQ==
X-Received: by 2002:a17:902:7449:: with SMTP id
	e9mr21165362plt.242.1567286152431; 
	Sat, 31 Aug 2019 14:15:52 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	o35sm8031031pgm.29.2019.08.31.14.15.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 31 Aug 2019 14:15:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:15:49 -0700
Message-Id: <20190831211549.23729-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Armin Kuster <Akuster@mvista.com>
Subject: [PATCH] gcc-9.2: Security fix for CVE-2019-14250
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
X-List-Received-Date: Sat, 31 Aug 2019 21:15:51 -0000

Affects: <= 9.2

Signed-off-by: Armin Kuster <Akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-9.2.inc         |  1 +
 .../gcc/gcc-9.2/CVE-2019-14250.patch          | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-14250.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
index 1c3e200dab..01d3bf0f32 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
@@ -64,6 +64,7 @@ SRC_URI = "\
            file://0034-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0035-Fix-for-testsuite-failure.patch \
            file://0036-Re-introduce-spe-commandline-options.patch \
+           file://CVE-2019-14250.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-14250.patch b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-14250.patch
new file mode 100644
index 0000000000..65ea34558a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-14250.patch
@@ -0,0 +1,44 @@
+From 517b211a3d78366ca8d5929f580e8ca72fd2c004 Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Jul 2019 10:46:54 +0000
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
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@273793 138bc75d-0d04-0410-961f-82ee72b054a4
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
+Index: gcc-9.2.0/libiberty/simple-object-elf.c
+===================================================================
+--- gcc-9.2.0.orig/libiberty/simple-object-elf.c
++++ gcc-9.2.0/libiberty/simple-object-elf.c
+@@ -557,6 +557,14 @@ simple_object_elf_match (unsigned char h
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
2.17.1


