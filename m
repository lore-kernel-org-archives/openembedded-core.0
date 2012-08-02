Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymK-0006JJ-6z
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:40 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:49:58 -0700
Received: by wibhm11 with SMTP id hm11so4187436wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=PtM01V+dT1uUOGNDhLGAAcC2/4+GHuKdLt4OEPEvo+c=;
	b=ATfFaBPAddr2S2i2NJEtiYe5boPJk0/AP8RY8R2IwugfNLYS9lWO6IXKKYPDWfnLer
	rxU24on+95sjrooyrCLJLGRSWdEoy8Q/62/iOSLxuZWrKZYQy+XuWK5h4NUyaiVLUWiQ
	8pVhXiwG1kYZHsG0iyGuvwGoHsLvUUqzyqyCh5WXXyZLs2keHOBu6axMu0r+oGSZU7CN
	figkTYHs+AoQpqoxVMQHaKkP6hCqNHLDcQEqmvsruk+pgQJnpg4mTJ1NSq1MrmdZTTXF
	cTRmbfDtvzJ/lU8yqC9JF5FYFD0nhCy5xYxQekFT6eHa/wjArg+uqMv/0olV92yzXnIC
	1fcA==
Received: by 10.180.96.3 with SMTP id do3mr6215035wib.5.1343926197406;
	Thu, 02 Aug 2012 09:49:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:48:59 +0100
Message-Id: <285c8bc84ac7535e61a20b9511ff74047bffa50c.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnuZ//QWQpjGLeTXrxG5KQGG2XKUbZFjgwpYb0PrptRNEiETvxJ9GKTOFOL3lcS9uYxz9qX
Subject: [PATCH V3 05/11] mesa: enable the Graphic Buffer Manager library
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    5 ++++-
 meta/recipes-graphics/mesa/mesa-dri.inc    |    6 ++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 6582bcf..ff9f882 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r17"
+INC_PR = "r18"
 PE = "2"
 
 
@@ -45,15 +45,18 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
              libosmesa libosmesa-dev \
              libgl libgl-dev \
              libglapi libglapi-dev \
+             libgbm libgbm-dev \
             "
 
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 6bf2503..f8f1fff 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -1,5 +1,5 @@
 PROTO_DEPS += "dri2proto"
-LIB_DEPS += "libdrm expat"
+LIB_DEPS += "libdrm expat udev"
 
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
@@ -8,7 +8,9 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
 
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
+EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--disable-egl --enable-gbm"
 
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-- 
1.7.10



