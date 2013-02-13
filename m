Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5XIO-00016o-NM
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 09:02:48 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so435724daj.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 23:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ohRfuCLIbE3YXQDiusqzsbLfS4nnM/IUxpZ6ld5GgH8=;
	b=UNODSOgfErYZrDW3VCSRAxfcD7OOTI0ADHsz0HrH/QD40VtL3w5MB9LowXluCZITSg
	UERGZfh0O4Z0yaftJusN4BTFsG0OBButSV38VSK3ewTzKuE1GPj1V0NHmNmNesV3V+he
	VEyKys/AnSBT371eInBO0/h04kZPCDbowE93LjUyR9lq3q2O1oHv+lPez+PZ90XlaOk0
	+T/dfv4RB6ULKGa82wC33mdY+F0ZHP/kWBWo/+ykhn38Who4y9QcKpxKC1wjnkzwgORr
	+eQkh/mhUm5kSn/gboedFxfsCV7tkJVMnm4c4rzpavCAqBM3hJwq2641as2IYukahGk/
	n1+A==
X-Received: by 10.66.79.97 with SMTP id i1mr61213100pax.47.1360741583397;
	Tue, 12 Feb 2013 23:46:23 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id a4sm81409989paw.21.2013.02.12.23.46.21
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 23:46:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 23:46:09 -0800
Message-Id: <1360741570-11148-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemu: Upgrade to 1.3.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000

qemu on target,qemu-native and nativesdk versions built
and worked fine

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_1.3.0.bb |   10 ----------
 meta/recipes-devtools/qemu/qemu_1.3.1.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu_1.3.0.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_1.3.1.bb

diff --git a/meta/recipes-devtools/qemu/qemu_1.3.0.bb b/meta/recipes-devtools/qemu/qemu_1.3.0.bb
deleted file mode 100644
index 7d007ea..0000000
--- a/meta/recipes-devtools/qemu/qemu_1.3.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require qemu.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "a4030ddd2ba324152a97d65d3c0b247d"
-SRC_URI[sha256sum] = "878055ec05bc28fecfe2da97eb8bc992e8635575b67cebdfc5ca1ede171140a8"
-
-PR = "r0"
diff --git a/meta/recipes-devtools/qemu/qemu_1.3.1.bb b/meta/recipes-devtools/qemu/qemu_1.3.1.bb
new file mode 100644
index 0000000..9ac7027
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu_1.3.1.bb
@@ -0,0 +1,9 @@
+require qemu.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+
+SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
+SRC_URI[md5sum] = "5dbc6c22f47efca71dfaae0dd80dcf9e"
+SRC_URI[sha256sum] = "3772e7ef0c9b4178195edcf90e711f12ba123f465fcf09fb43b56bdacaca0eaf"
+
-- 
1.7.9.5



