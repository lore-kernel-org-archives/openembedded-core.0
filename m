Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102q-0001XI-0L
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:20 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:24 -0700
Received: by weyt11 with SMTP id t11so2404972wey.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=6ZG0txLd8dX+sr6qfpPl/5Pc2FkzzqROQJXPKAPqBtg=;
	b=JM1drj4njNYvcCZGqILidEDxznlN+RhZrzUJes0h28VZyVcjCH04Nh4NZz5xCrplGj
	3+yXeMnUJrHf+HeNtc6sAksqf+MY/auNwwn/05LpRWzCSfexuAeZ1YyAH77uiKhFxKUx
	lN9qvFMKaEQGRkl4L6Z8OAH9dtSoWeESmp0FoRltG8VCrExSvVqcjNpFjqb+v5XgexNq
	xJcJ+cDT6Guh9nBvK7yiFbtStr333ldh4hMa9S3VZlyVECs5wuqHc4Db6mwLAWQQ5ftG
	Il6svUlSgHA2RLXL5Q8bKRPE1qbrwu2UakbiTPVUnr4Q3cOjGU9ZcCOpelzX9scPderX
	ZZjA==
Received: by 10.217.3.7 with SMTP id q7mr7339766wes.47.1344884362338;
	Mon, 13 Aug 2012 11:59:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:42 +0100
Message-Id: <00170828443823b0f79988640a23740ec34f4caf.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQklFGzjtUQSN+5SMTgToJ6GNJ5VcCcnmyC8N5KqchlrrQVR4mWwUdtsd7WPDAK4gI349UuF
Subject: [PATCH 3/8] mesa: Add a mesa-dri-glsl-native_git recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2012 19:11:20 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

If you have both a fixed version of mesa and a git version of mesa, you
also need the mesa-dri-glsl-native recipe for each versions. The code
generation that happens natively has to be done with the tool extracted
from the version you are compiling.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/mesa/mesa-dri-glsl-native.inc |    7 ++++++
 .../mesa/mesa-dri-glsl-native_8.0.4.bb             |    9 ++------
 .../mesa/mesa-dri-glsl-native_git.bb               |   23 ++++++++++++++++++++
 3 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb

diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc b/meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
new file mode 100644
index 0000000..c8b80e8
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
@@ -0,0 +1,7 @@
+DESCRIPTION = "gl shader language specific build from mesa-dri"
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "GPLv3+"
+
+DEPENDS = "makedepend-native"
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
index a81fb6d..d551598 100644
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
@@ -1,11 +1,6 @@
-DESCRIPTION = "gl shader language specific build from mesa-dri"
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
+require mesa-dri-glsl-native.inc
 
-DEPENDS = "makedepend-native"
+LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
new file mode 100644
index 0000000..4611f80
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
@@ -0,0 +1,23 @@
+require mesa-dri-glsl-native.inc
+
+LIC_FILES_CHKSUM = "file://../../docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
+
+SRCREV = "c1f4867c89adb1a6b19d66ec8ad146115909f0a7"
+PV = "8.0.4+git${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git"
+S = "${WORKDIR}/git/src/glsl"
+
+inherit native
+
+# use default config for native build
+do_configure_prepend() {
+	ln -sf ${S}/../../configs/default ${S}/../../configs/current
+}
+
+do_install() {
+	install -d ${D}/${bindir}/glsl
+	install -m 755 ${S}/builtin_compiler ${D}/${bindir}/glsl/builtin_compiler
+	install -m 755 ${S}/glsl_compiler ${D}/${bindir}/glsl/glsl_compiler
+}
-- 
1.7.10



