Return-Path: <sujith.h@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 58D0065CA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 09:08:47 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so12165594pdi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 02:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zZb0/HRRHEia/Mj3c3/TyxND8exS6kFRg4W7H0h1ahc=;
	b=QuaNKziVbsGbssD+5FUlBZ/BsOA3rSJX61shtU+iQiuwron+OU3X/yYURkAXQ2nmn9
	Ua8aw6QwTFX8OaT/EwSoJSOy+vNvCkla+keefgEo528pDJA2ZPPMXWYHyF2yorCngTAj
	WEoteXc/BPJvwTRy+8SiolvYRijR+TbwoUxaA5S4U0HjzPgrZsJnC23z4Jjfnc+jGzZJ
	g18xpxxz4bIXOqAQMJmbvm7FIUCcfwLKYMROvh7+DMW+fIG9xPhxuV/897hkgRgzuKd3
	SdTJS76SjJc6VYwIM6waYlOYSMpCjuOz+pHiapll/G8ERoKIKdfXSKQjvnYvAYWFEBjN
	sycA==
X-Received: by 10.70.36.33 with SMTP id n1mr3233379pdj.26.1407834528688;
	Tue, 12 Aug 2014 02:08:48 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	do10sm21230091pdb.83.2014.08.12.02.08.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 02:08:47 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:34:20 +0530
Message-Id: <1407834260-22021-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] pyparted: Add recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 09:08:48 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This recipe will provide a set of Python modules that
provide Python programmers an interface to libparted,
the GNU parted library for disk partitioning and filesystem
manipulation.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-extended/pyparted/pyparted_3.9.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-extended/pyparted/pyparted_3.9.bb

diff --git a/meta/recipes-extended/pyparted/pyparted_3.9.bb b/meta/recipes-extended/pyparted/pyparted_3.9.bb
new file mode 100644
index 0000000..7b284cc
--- /dev/null
+++ b/meta/recipes-extended/pyparted/pyparted_3.9.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
+an interface to libparted, the GNU parted library for disk partitioning and \
+filesystem manipulation."
+SUMMARY = "Python bindings for libparted"
+HOMEPAGE = "https://fedorahosted.org/pyparted/"
+SCM_URI = "git://git.fedorahosted.org/pyparted.git"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+    file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46 \
+"
+DEPENDS += "parted"
+PR = "r0"
+
+SRC_URI = "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
+SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
+SRC_URI[sha256sum] = "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
+
+inherit distutils
+
+BBCLASSEXTEND += "native"
-- 
1.8.4


