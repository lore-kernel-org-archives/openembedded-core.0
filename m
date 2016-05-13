Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 047C6731E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:47:05 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gh9so8903024pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uFyO21M5eVa20JMvX5AGejB6I1s60onufa3CbX6keaw=;
	b=TmOzXSn3DyWTInrMXONnyUZar6DezJO4zSXSLMh6HmL/Ng8diH8oZQS90JdNWqMAHp
	O50Nr+z0x4VPduvnOGe28fuo9Y4gn1BVDOiVxuUQoi9RF7n0QdFcbGtnrENGg9IG07z3
	ef2L0h0/nYXUieHNycCRdRPgmZiBz5Z+iUMYd5vQluVIwWJzauxeU8FnzKuC1GmvlN5U
	KMLw8gWMp7HkWtYiKectajhQ2GQsFIxitMaNRDVV/2jRR2mLaj9ehxXyNPUSmvEj9uE6
	8XJ3p3+B9NjvFgv3ifwFbYSpf5qzg1wscHMPecJEU/ujAHOvBe2qcqit2ezZyl7OcsPT
	0Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uFyO21M5eVa20JMvX5AGejB6I1s60onufa3CbX6keaw=;
	b=CgmqcEUYhIlQG+lDrrK8F6PdwjAcjbuXfGx2F8onlj1l6KOE2RYs+o1qYBTv35D6h0
	GnExeEyQIvYAZZ8zcpzhnrxHJw45G0mLV54sH4fDUcjoSuGomoBlM8S/xgV+IUZKaHCr
	rG1OyLxP3nuYBoGWMStfURZe9R1SXBj5/wCoImtWYnp9HsZdONR+/DoRIzWjjyfyPmGU
	1GioYtq3StcNFik106TJdjnpz4xdCPHXwRG5dj+91LTb48sBW5Es0ZwohpYcxQMXHyM1
	HCGO7nKqmecNbK6yyrJQtMIr0CnwKBvI9eGRyKL8Sjsmb2K5NSW96EAXSvB8xvm6ovAn
	74Vw==
X-Gm-Message-State: AOPr4FWvcKpx2jhAPU9n03xH5s+M8ueWokq76Q2d0vf9CXiWFxWL5/WArrGr77KJEnrMsg==
X-Received: by 10.66.65.235 with SMTP id a11mr24506624pat.155.1463158026100;
	Fri, 13 May 2016 09:47:06 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uw2sm28725174pac.10.2016.05.13.09.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:47:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:46:53 -0700
Message-Id: <da884ba1e468fdb29a457beebf81f192577fa178.1463157783.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463157783.git.raj.khem@gmail.com>
References: <cover.1463157783.git.raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 5/6] linux-yocto/4.4: gcc6 build fixes (powerpc and mips)
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
X-List-Received-Date: Fri, 13 May 2016 16:47:06 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Khem provided fixes to fix gcc6 build issues, these are safe for
all gcc versions, so we integrate them directly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 5e39374..feef29f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "449fe1dca2c1f972f1ec02091a20691f3e19a28b"
-SRCREV_meta ?= "b7ce076447c0e3cc07f8d3ed4a11070fdeae41e6"
+SRCREV_machine ?= "7ef3fe56827bd9c20021e3a52bc36ebd4c6b2ce3"
+SRCREV_meta ?= "d6ee402d461048cf1afd10375fee5769c06d21d6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index abafe75..93ffe18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.10"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
-SRCREV_meta ?= "b7ce076447c0e3cc07f8d3ed4a11070fdeae41e6"
+SRCREV_machine ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
+SRCREV_meta ?= "d6ee402d461048cf1afd10375fee5769c06d21d6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index a665b5c..a98f9fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bdda97014e55200e704ecd8d112da09176dcb7dc"
-SRCREV_machine_qemuarm64 ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
-SRCREV_machine_qemumips ?= "f60887555f78ae5f5338d41181e848082109429b"
-SRCREV_machine_qemuppc ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
-SRCREV_machine_qemux86 ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
-SRCREV_machine_qemux86-64 ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
-SRCREV_machine_qemumips64 ?= "b783512062c5081fa9b01e89e811d0508e62895f"
-SRCREV_machine ?= "fe7ff38448d530db27ac31cbb086cb6fdf94bb7f"
-SRCREV_meta ?= "b7ce076447c0e3cc07f8d3ed4a11070fdeae41e6"
+SRCREV_machine_qemuarm ?= "1d343b327d97843de4a32fda9015bc87a46dea9b"
+SRCREV_machine_qemuarm64 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
+SRCREV_machine_qemumips ?= "f89dd8336dcb0b7bf0291aee7ee33531564ea3b5"
+SRCREV_machine_qemuppc ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
+SRCREV_machine_qemux86 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
+SRCREV_machine_qemux86-64 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
+SRCREV_machine_qemumips64 ?= "5faa3c8de491435842024b24b6a95fccdbe3f72a"
+SRCREV_machine ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
+SRCREV_meta ?= "d6ee402d461048cf1afd10375fee5769c06d21d6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.8.2


