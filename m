Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E560F7555B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 14:07:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2018 07:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,247,1526367600"; d="scan'208";a="238794794"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 20 Jun 2018 07:07:26 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1555358012D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:07:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 17:07:21 +0300
Message-Id: <1529503642-7158-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/5] libepoxy: upgrade 1.5.0 -> 1.5.2
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
X-List-Received-Date: Wed, 20 Jun 2018 14:07:26 -0000

Remove upstreamed patch:
        no-tests.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libepoxy/libepoxy/no-tests.patch               | 33 ----------------------
 .../{libepoxy_1.5.0.bb => libepoxy_1.5.2.bb}       |  5 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.0.bb => libepoxy_1.5.2.bb} (79%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch b/meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch
deleted file mode 100644
index d2b6c1a..0000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Add option to disable tests.
-
-Upstream-Status: Submitted (https://github.com/anholt/libepoxy/pull/158)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/meson.build b/meson.build
-index b2ebaef..9632c7a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -242,7 +242,10 @@ libepoxy_inc = [
- 
- subdir('include/epoxy')
- subdir('src')
--subdir('test')
-+
-+if get_option('tests')
-+  subdir('test')
-+endif
- 
- if get_option('docs')
-   doxygen = find_program('doxygen', required: false)
-diff --git a/meson_options.txt b/meson_options.txt
-index b5d7c98..dc30e68 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -15,3 +15,7 @@ option('x11',
-        type: 'boolean',
-        value: true,
-        description: 'Enable X11 support (GLX or EGL-X11)')
-+option('tests',
-+       type: 'boolean',
-+       value: true,
-+       description: 'Build the test suite')
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
similarity index 79%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
index 5ca0868..1067212 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
@@ -6,10 +6,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://no-tests.patch \
            "
-SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
-SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e9685a0cac261414175c2adf4645cdfab42a5d5"
+SRC_URI[md5sum] = "4a6b9e581da229dee74c2263c84b1eca"
+SRC_URI[sha256sum] = "a9562386519eb3fd7f03209f279f697a8cba520d3c155d6e253c3e138beca7d8"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig distro_features_check
-- 
2.4.0


