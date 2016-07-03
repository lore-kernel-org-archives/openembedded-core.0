Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 64C9160111
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 18:16:12 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id lm4so2740174pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2016 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XJ3BqDYmE3Z4PicjBFvLFS5+E6+UjIqOM1i8tEjU/mA=;
	b=pzKS0Xg27hhZJam83JdS2DY4txhE6FrG1Yy58DpjY+e83FUMGQSiebzVXOAym36jJ7
	1KqIcBp9wmsP3fzgAf6+Tl7Uq+O37PXnCRNJpYgZ+ebwG14z+jvdAmQ7cBlBZ0kYX+WR
	6fViA9rw0MCOa8A1cz1TMzo5iYZHXaEZ1uq+fp78ZKbW770oB7qcyhqi2bTm3Q7V+i6+
	waTjDhZb1DiOQOsj1rmmKA6RWo4AKnDy2MVBkxEb+DKfvWpXi2mhDk6tUCJFrYJdgc1J
	VNHdTfTRKuoBF8fjaM4nrmC3UKv3FcQF6OXV3hoEn36IzffwHYGvyx2ctIxXZv3ryY9K
	iNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XJ3BqDYmE3Z4PicjBFvLFS5+E6+UjIqOM1i8tEjU/mA=;
	b=j1sHtsAqDCxCW/xMYHKUc0j9I4RBpwS1aH7LqgpFoHv8HJY4r3pbKgZoZXjMsC7vCe
	XlNw9fGCC5Bm9bGRGktSHAMT/fRmtODKIHzPfKbERwZJJ+1YY0pIykTZBs4vyj6cO294
	rlEYs3m2aD/MKR/V+/jzolJ56Y0npwOwBhP/Ad+7ySKKPiurjr/BjZqht9xwe8qnqy4p
	hyEzzbR/cRbqvcsnZNGymTx9L+5qrMcpr/IdD/94yAb2pnVGUZthngfVTCZzfAp0rWe6
	dQVlv0G50OTHe6tN+NvESsT/s+ytgjiI1V615SBJOFl8KXL09tA4fzgA21RA3ekCqDg8
	F2kg==
X-Gm-Message-State: ALyK8tLxhuuXE+pkd5P9pfKV/nf7k+CvlY7AxVkixsqVDg9dIEGQMP6JTsa9nl+HQO7dcg==
X-Received: by 10.66.51.131 with SMTP id k3mr15732657pao.49.1467569773388;
	Sun, 03 Jul 2016 11:16:13 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 77sm4822770pfp.66.2016.07.03.11.16.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jul 2016 11:16:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun,  3 Jul 2016 11:15:45 -0700
Message-Id: <96ad77ae6044cd3e8462cbfa645164ca4a898e16.1467569369.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
Subject: [PATCH 2/5] linux-yocto: add qemuppc64 kernel support
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
X-List-Received-Date: Sun, 03 Jul 2016 18:16:13 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb | 4 +++-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b2cbc60..9175223 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -7,6 +7,7 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
 KBRANCH_qemuarm64 ?= "standard/qemuarm64"
 KBRANCH_qemumips ?= "standard/mti-malta32"
 KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemuppc64  ?= "standard/qemuppc"
 KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
@@ -15,6 +16,7 @@ SRCREV_machine_qemuarm ?= "df8f2bd306f5e22590991faee46e28f671fa19b3"
 SRCREV_machine_qemuarm64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
 SRCREV_machine_qemumips ?= "1bb60e693b913dacad698bec1cc08b350785e3d1"
 SRCREV_machine_qemuppc ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
+SRCREV_machine_qemuppc64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
 SRCREV_machine_qemux86 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
 SRCREV_machine_qemux86-64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
 SRCREV_machine_qemumips64 ?= "b0e7bb69566a922a661c4902e496dce98cefeab9"
@@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 49ffd8d..218d214 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -7,6 +7,7 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
 KBRANCH_qemuarm64 ?= "standard/qemuarm64"
 KBRANCH_qemumips ?= "standard/mti-malta32"
 KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemuppc64  ?= "standard/qemuppc"
 KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
@@ -15,6 +16,7 @@ SRCREV_machine_qemuarm ?= "6f2317f8a00a3eb6a2b28ca51f336f61eb6fe160"
 SRCREV_machine_qemuarm64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_machine_qemumips ?= "9fc8fc49e5065f1ee76e964a4c0257291ab3e62a"
 SRCREV_machine_qemuppc ?= "13852755ecbf491848afbe40e66fc152bc70915b"
+SRCREV_machine_qemuppc64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_machine_qemux86 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_machine_qemux86-64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_machine_qemumips64 ?= "d1c1f36412d196b560ed9f19392e291b5492b94c"
@@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
1.9.1


