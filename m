Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5B4E7ECC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:31:43 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c34so43306289otb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a/6BCIGi+/rhG7CYybspv+6W75Rs07faoCuhl54HMNs=;
	b=atoTjEeZx0qmNZPT0kwVvfcrfh5Bu691XiR/qKG342lABW+pIh6wADOGH653Yy0/eJ
	SOorQPt1FvXhoZHW9qVb1U/q+32OmJanJTMDmwAEgnDgaa8VYTqLE2tRhP7dP2pDls22
	+4pACCVxHNa2az44fOsVevhWfKrDokR26SF/dXGReYIJp2eTS7vYZudAKZvb23sV2yPk
	ilgndClla74tqWhhlio9D4T6lNiWl6KsxlTA6VDPRLOSFXIdegkY5YkypL+rC4qmnGFq
	Y59/Gq0sXBQ7fEkkqeJg1AfByNssOmeWau66vZm7Wnff/QmY6XYyKq5L9mBNJrvB3ZFu
	IOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a/6BCIGi+/rhG7CYybspv+6W75Rs07faoCuhl54HMNs=;
	b=XXdVW+LauY+9qoz/ek4ammNuYZBkbds5I4tSzDzkQES1CX3WMbFCrbuIRro+YKKgda
	vCS1Z+iT2HsPSIWjEDvUcXJPdWwqhLNN3a0QNpMmhLWZP72Q/sbIZETsiTtgsY/lIieo
	s2Z256OrGLKx1K/2xAS0oI6sSzrOVsTIcB6Z/pRAwCfV5T+C/cQrcZdgKlUZF853Rkl3
	T29/qJ3/gmAO/co448wek5hoptXXBcgFma9kkkla07APgLgFgZDhxa3oumAk06IUvCzm
	e6o+Ir2u2hYk1T04vazoqQxviPCLFWFMuNmc3DbZYyzy5W2vJ3u7JOy8eY+NBDv7P5f6
	v7cQ==
X-Gm-Message-State: APjAAAWX+3NAmhQMCKCsxj5yUocXrgEc1qdoufKv4VrFgxPFgtwX75cQ
	BqnE64sTYWXmKWKJeOZ8av2QZhpXWhxLIg==
X-Google-Smtp-Source: APXvYqzXpQQkeNzUmgI0Qp+BvcdYndT+5oCfXnEN8ImogE8hsRSiciKUaVcOOev6i/wLIFrVwvzTog==
X-Received: by 2002:a6b:5901:: with SMTP id n1mr481555iob.179.1565796704672;
	Wed, 14 Aug 2019 08:31:44 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id 8sm224570ion.26.2019.08.14.08.31.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:31:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Aug 2019 11:31:32 -0400
Message-Id: <35564bd8d7b6a02a0489f45fedcbc4007e5fc3ff.1565796002.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1565796002.git.bruce.ashfield@gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] kernel-yocto: import security fragments from meta-security
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
X-List-Received-Date: Wed, 14 Aug 2019 15:31:44 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding the following fragments from meta-security to make them
centrally available and easier to maintain:

   283939d5c9e kernel-cache: add yama security fragments
   0b86f3fa241 kernel-cache: add ima fragments
   731b466654d kernel-cache: add smack
   813afe8ff47 kernel-cache: add apparmor fragments

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 4013a0c2d0..52deb3fc86 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ca2e3322f4c5678eaef6434c808d0842c805d74d"
-SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
+SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index f66ee6f4ad..b214ee0a0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e6cb812b5532630b6fc6dfd7778d57a4907d3180"
-SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
+SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 4759d80438..be25d075de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b5a2efa31290f31384971494031285d394635938"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
+SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 42e0dcd603..33672c6d49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b9001287984b0066814c8739f38d629de73739b7"
 SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
+SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index cee8af7c99..7704bd3e55 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemux86-64 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemumips64 ?= "ca47368b698795cd5cada84dbfcceda1f47da1aa"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
+SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index ea4b6f5b33..898f824d48 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
 SRCREV_machine_qemux86-64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
 SRCREV_machine_qemumips64 ?= "9d4105b32cf123a861bc754377d2f2e156278a7e"
 SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
+SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


