Return-Path: <mranostay@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3D46B53B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 14:18:33 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so1956004pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ieyKYQppNNbpkHHApXmVHpBgEqOOOMcLNkPHhGdX3kU=;
	b=LzbiAxy59DDrbCXfuJaHldyhkRUKS41EPv5TToVnO4nYd1nuNe3QglZaTWI5IdKbBx
	ykUp9zil8tZebzeY2FLdiK2lfaryhSZcggUj/yRLtqvZkPqlLdR9N2bg9csijdkXwBY/
	7hqupTjEd5yQp38yrw1v9c3H2149kB3R/rkJvKMrS1s+h5kA45fQLYTQvTcBd0LTCh8K
	iBPpnR9f/nW9RYkvabysj5YHa0Mc9P+2PSx2BVgdcn8y061V8g/bXITnwYCEsjzL+xIy
	55JC89pgnG9sWSGye3eu7cOl+gn/LFfr52Jyyw34HMUU5ylZPXScI2nRURAmHqv45+wV
	eZMQ==
X-Received: by 10.67.1.203 with SMTP id bi11mr832002pad.137.1375885113946;
	Wed, 07 Aug 2013 07:18:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-105-193-198.hsd1.or.comcast.net.
	[76.105.193.198])
	by mx.google.com with ESMTPSA id ht5sm8501396pbb.29.2013.08.07.07.18.32
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 07:18:33 -0700 (PDT)
From: Matt Ranostay <mranostay@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 14:17:55 +0000
Message-Id: <1375885075-13410-1-git-send-email-mranostay@gmail.com>
X-Mailer: git-send-email 1.8.2.rc3.6.g407929c
Subject: [PATCH] acpica: Add ACPICA package
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
X-List-Received-Date: Wed, 07 Aug 2013 14:18:33 -0000

Added ACPICA package which enables viewing/editing/compiling
of ACPI tables.

Signed-off-by: Matt Ranostay <mranostay@gmail.com>
---
 meta/recipes-extended/acpica/acpica_20130725.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/acpica/acpica_20130725.bb

diff --git a/meta/recipes-extended/acpica/acpica_20130725.bb b/meta/recipes-extended/acpica/acpica_20130725.bb
new file mode 100644
index 0000000..6fa183c
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpica_20130725.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "ACPI Component Architecture (ACPICA) project"
+LICENSE = "BSD | GPLv2"
+HOMEPAGE = "http://www.acpica.org"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://${S}/source/include/aclocal.h;endline=42;md5=07fbd4e514c75e140a19e3ab508f763d"
+
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ef854d8c97f04795d6ac958cb8898e7e"
+SRC_URI[sha256sum] = "f31ad702a17f9dd03907693120267216d1a797625d123a38f3064fbafe141d8a"
+
+S = "${WORKDIR}/acpica-unix2-${PV}"
+
+inherit autotools
+
+do_compile() {
+    oe_runmake CC="${CC}"
+}
+
+do_install() {
+    oe_runmake INSTALLFLAGS="-m 555"
+}
-- 
1.8.2.rc3.6.g407929c


