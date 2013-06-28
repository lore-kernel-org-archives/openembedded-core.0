Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id E2FE16AF5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:45 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so2906539pab.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Vk/SuMZCMbzP6tQM2iUoFHIed+/qPj7h6eJCfKgym5M=;
	b=gwMHAcBmsSJVs7KLXe+4+NSndQ7o9JbmjyQusbt+ylaxRSTrQxOkUges3bwPeBClN/
	hLQAMgreNsZvmc1jZ3ZpUAjxmU0Byi56hqfMtXbrS3gBBljQAk1tfKhPrQdpk9IqF6x+
	+vLiFskxNiZXfI+uU1a53V3Ux+TkmyQB+kTZxfJwtGg+uewC1FrqPGG4onaJr/XyyILY
	fty2lDsZRiIvDLVklPo+QMQNOaaz8mpBsNXKbioxhcL4JEsbn8rqS6UgE2Gink9yuTxD
	iuVRWsCFY1f9WoJXSyfcEHx4l48JBSiTBKI9/FYL2CaShUt/QpZkusfKOxwxeAs0xP1o
	VDgg==
X-Received: by 10.66.163.99 with SMTP id yh3mr13504304pab.22.1372457087337;
	Fri, 28 Jun 2013 15:04:47 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.46 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:05 -0700
Message-Id: <7e2c3f69178aaa15967c5697da616e34fb575e5d.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 20/24] python3-docutils: Add recipe
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-docutils_0.10.bb                |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-docutils_0.10.bb

diff --git a/meta/recipes-devtools/python/python3-docutils_0.10.bb b/meta/recipes-devtools/python/python3-docutils_0.10.bb
new file mode 100644
index 0000000..6e48ce0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-docutils_0.10.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Python Documentation Utilities."
+HOMEPAGE = "http://docutils.sourceforge.net/"
+SECTION = "devel/python"
+LICENSE = "Python BSD GPL3"
+LIC_FILES_CHKSUM = " \
+   file://licenses/python-2-1-1.txt;md5=e698000816f962cbe2532d8f555b645d \
+   file://licenses/BSD-2-Clause.txt;md5=a8243e503f772119249d1e6a35fd9211 \
+   file://licenses/gpl-3-0.txt;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS = "python3"
+
+RDEPENDS_${PN} = " \
+                   python3-compression \
+                   python3-codecs \
+                   python3-core \
+                   python3-io \
+                   python3-netclient \
+                   python3-pickle \
+                   python3-pprint \
+                   python3-re \
+                   python3-textutils \
+                   python3-xml \
+                 "
+SRCNAME = "docutils"
+PR = "r1"
+
+SRC_URI = "\
+  http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "d8d4660c08302c791b2d71a155a2f4bc"
+SRC_URI[sha256sum] = "370624e61b6773da2f2fb17cc2a4eaea4bb596c3585d13f75ff193c1c738603e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools3
-- 
1.7.9.5


