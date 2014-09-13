Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 01D5065D59
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 02:49:59 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id z10so2431937pdj.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 19:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=i9gMWqmmg3pexW/m9ZyUSco+a+q0SaMhw7GN5989JSk=;
	b=CeO6aYsOSnwmREJGLbErsdMw/JKDfsOB6CPZ5sqSer9feNGKfezx2qcnC7J2ZCxkGZ
	VvOsvp4y/EXjNlsOLaBoWkcAykT9zR/bhb98kirJMkKesCirILwjvfAjSoHu2bS4FZNC
	j5LXmrNVLIntgUa7im2qngT1G0ilnD+FbBIqZpJygdW3BIrmp8YwRIwxnHboyBSkBn49
	JuzBq43iQgNC1a+TlkkIHigNZ56WKjXrVOYtkS+O6vBxzv6LjpS1xDrtPskPhh3hiDzu
	RApcUduIE7n8GfF1dpX5Pyz/ZrtiCkcvTD3n9L8swI2/qhULxsrXZV3g7cVQ3rJQY4yQ
	aJGQ==
X-Received: by 10.66.167.105 with SMTP id zn9mr17761405pab.103.1410576600483; 
	Fri, 12 Sep 2014 19:50:00 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qp9sm5138868pbc.31.2014.09.12.19.49.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Sep 2014 19:49:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Sep 2014 19:49:57 -0700
Message-Id: <1410576597-16290-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] linux-yocto: add to qemuppc64 to bb file
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
X-List-Received-Date: Sat, 13 Sep 2014 02:50:04 -0000

Not sure if this this is the correct process.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index e06b191..dfe1de0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -6,6 +6,7 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
 KBRANCH_qemumips ?= "standard/mti-malta32"
 KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemuppc64  ?= "standard/qemuppc"
 KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
@@ -13,6 +14,7 @@ KBRANCH_qemumips64 ?= "standard/mti-malta64"
 SRCREV_machine_qemuarm ?= "c32a2e1190325f685a61196f38fc03ceff2645bf"
 SRCREV_machine_qemumips ?= "1ff50c529b49ceb55a670258f7cb8233c8006c6c"
 SRCREV_machine_qemuppc ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
+SRCREV_machine_qemuppc64 ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
 SRCREV_machine_qemux86 ?= "58d49fe770ad642e2bc0616159195ba837dc513b"
 SRCREV_machine_qemux86-64 ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
 SRCREV_machine_qemumips64 ?= "dcd579737386fca4d7bcf224bc118b14eb3c1d55"
@@ -27,7 +29,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
 
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
1.9.1


