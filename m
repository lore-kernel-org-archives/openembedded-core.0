Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id D03F7793B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:43:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id f10-v6so2408722wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ukyVJx+JfZFQpZbMc5uOckpJVBQgoz3zMvA2CPNWhPw=;
	b=f4phK5v6afgl884Z/v7d+nAhTOU32OjcF+dhHKwUpkVAlwy/u1JMXF1U8wan3LLJER
	MN3mXNuhZuzDn0qsXDCdQuesctZ+HJSdqVBMXzxvQWQcaEWkQUXE+oWyHbZT37IgFLh2
	d+MWVVjzNM1v6fyRo8oqnAZeMH8LNwK0yfgBu5lBKqDqv2x9o2Fph+L7P2aPkSIrssbZ
	kzgmqa7QjWk2WzaxSwmmdhdTejGKil1DpMxMbE8kxb46t9qLpLij5Vbr+a2WUx/dMVHF
	WVLpTKkXVJQVVX+YCYJ9u2bFrURiZ0C+EXDPVUG9sJpS/BL089VbUDHYQFXYZ3JZKepM
	Y/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ukyVJx+JfZFQpZbMc5uOckpJVBQgoz3zMvA2CPNWhPw=;
	b=Y2A3TXFssuisJEWbv86blnT1fsp7+vARpZC9ctiQFYUsxwtLj/7eFQRtxBbCFaW2fw
	CyXDd8E8/32odPREgWsRH7H1Vb2x5Hox+ax/zLR1DHpKRDvaZTzrwD61iR3n5XlrVxXx
	WW3RX3QcEMp3KN0roOXkXKlv/6wfT2iy8SI3rNig/rVvfpD395sGQi8P9IaxY5/twBQX
	6mL6szfXp74elZ04T2WUVPCMw1ai/tY/zsqOHshkh3udamFyGYAGu/6EWsI7CULypqQs
	f6ZZ3g/1thjD2MYUdGLMO+h4VGB78blDoXI9l5rr9K79M7NFbItDDyx3KUr8jDQrULuK
	ERwQ==
X-Gm-Message-State: ABuFfoj+rn5XntNv0uBkN5xSL5LIZw77IuROmh/ZpJpK9vHwypkjobJb
	9SdjmDAqqYtnVpPSb3vFbblWErBe6sk=
X-Google-Smtp-Source: ACcGV636/XdUAGB1VXnkF2cGSIQAdfEI3cc3VKj9iVgFdkatigTTz0/GsiKVVjD23HO7NGRTddctJg==
X-Received: by 2002:adf:a10c:: with SMTP id
	o12-v6mr1073118wro.169.1537883038931; 
	Tue, 25 Sep 2018 06:43:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b21-v6sm1852340wmj.28.2018.09.25.06.43.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 06:43:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:43:47 +0100
Message-Id: <20180925134348.5562-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180925134348.5562-1-ross.burton@intel.com>
References: <20180925134348.5562-1-ross.burton@intel.com>
Subject: [PATCH 5/6] meson: respect target/native flag distinction in G-I and gtk-doc
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
X-List-Received-Date: Tue, 25 Sep 2018 13:43:59 -0000

Remove the previous attempt at this from
0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch as it wasn't quite
right, and the rest of the patch is adding the currently not upstreamable runner
option.

Add two new patches to fix both gobject-introspection and gtk-doc using native
flags for target compiles.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc              |  2 +
 ...ix-issues-that-arise-when-cross-compiling.patch | 26 -------------
 meta/recipes-devtools/meson/meson/gi-flags.patch   | 21 +++++++++++
 .../meson/meson/gtkdoc-flags.patch                 | 44 ++++++++++++++++++++++
 4 files changed, 67 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/gi-flags.patch
 create mode 100644 meta/recipes-devtools/meson/meson/gtkdoc-flags.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index cfb831b106f..205d2a4abd7 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,6 +11,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://0002-Make-CPU-family-warnings-fatal.patch \
            file://0001-Support-building-allarch-recipes-again.patch \
+           file://gi-flags.patch \
+           file://gtkdoc-flags.patch \
            "
 SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
 SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index 57cb678f2c8..7ffd6c54cb0 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -35,32 +35,6 @@ index cb69641..727eb6a 100644
          args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
          args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
          args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
-@@ -854,14 +858,22 @@ This will become a hard error in the future.''')
-         ldflags.update(internal_ldflags)
-         ldflags.update(state.environment.coredata.get_external_link_args('c'))
-         ldflags.update(external_ldflags)
-+
-+        cross_c_args = " ".join(state.environment.cross_info.config["properties"].get('c_args', ""))
-+        cross_link_args = " ".join(state.environment.cross_info.config["properties"].get('c_link_args', ""))
-+
-         if cflags:
--            args += ['--cflags=%s' % ' '.join(cflags)]
-+            args += ['--cflags=%s %s' % (cross_c_args,' '.join(cflags))]
-         if ldflags:
--            args += ['--ldflags=%s' % ' '.join(ldflags)]
-+            args += ['--ldflags=%s %s' % (cross_link_args, ' '.join(ldflags))]
-         compiler = state.environment.coredata.compilers.get('c')
--        if compiler:
-+        cross_compiler = state.environment.coredata.cross_compilers.get('c')
-+        if compiler and not state.environment.is_cross_build():
-             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
-             args += ['--ld=%s' % ' '.join(compiler.get_linker_exelist())]
-+        elif cross_compiler and state.environment.is_cross_build():
-+            args += ['--cc=%s' % ' '.join(cross_compiler.get_exelist())]
-+            args += ['--ld=%s' % ' '.join(cross_compiler.get_linker_exelist())]
- 
-         return args
- 
 diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/gtkdochelper.py
 index 948dc5a..9c5bd19 100644
 --- a/mesonbuild/scripts/gtkdochelper.py
diff --git a/meta/recipes-devtools/meson/meson/gi-flags.patch b/meta/recipes-devtools/meson/meson/gi-flags.patch
new file mode 100644
index 00000000000..b437ce37cf7
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/gi-flags.patch
@@ -0,0 +1,21 @@
+Pass the correct cflags/ldflags to the gobject-introspection tools.
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/4261]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index cb69641e..bb4449a0 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -579,7 +579,10 @@ class GnomeModule(ExtensionModule):
+         external_ldflags += list(dep_external_ldflags)
+         scan_command += ['--cflags-begin']
+         scan_command += cflags
+-        scan_command += state.environment.coredata.get_external_args(lang)
++        if state.environment.is_cross_build():
++            scan_command += state.environment.cross_info.config["properties"].get(lang + '_args', "")
++        else:
++            scan_command += state.environment.coredata.get_external_args(lang)
+         scan_command += ['--cflags-end']
+         # need to put our output directory first as we need to use the
+         # generated libraries instead of any possibly installed system/prefix
diff --git a/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch b/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch
new file mode 100644
index 00000000000..ecf3489bbe5
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch
@@ -0,0 +1,44 @@
+Ensure that in a cross compile only the target flags are passed to gtk-doc, and
+not the native flags.
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/4261]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 4af33304..8751f53c 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -851,17 +851,30 @@ This will become a hard error in the future.''')
+             if not isinstance(incd.held_object, (str, build.IncludeDirs)):
+                 raise MesonException(
+                     'Gir include dirs should be include_directories().')
++
+         cflags.update(get_include_args(inc_dirs))
+-        cflags.update(state.environment.coredata.get_external_args('c'))
++        if state.environment.is_cross_build():
++            cflags.update(state.environment.cross_info.config["properties"].get('c_args', ""))
++        else:
++            cflags.update(state.environment.coredata.get_external_args('c'))
++
+         ldflags = OrderedSet()
+         ldflags.update(internal_ldflags)
+-        ldflags.update(state.environment.coredata.get_external_link_args('c'))
++        if state.environment.is_cross_build():
++            ldflags.update(state.environment.cross_info.config["properties"].get('c_link_args', ""))
++        else:
++            ldflags.update(state.environment.coredata.get_external_link_args('c'))
+         ldflags.update(external_ldflags)
++
+         if cflags:
+             args += ['--cflags=%s' % ' '.join(cflags)]
+         if ldflags:
+             args += ['--ldflags=%s' % ' '.join(ldflags)]
+-        compiler = state.environment.coredata.compilers.get('c')
++
++        if state.environment.is_cross_build():
++            compiler = state.environment.coredata.cross_compilers.get('c')
++        else:
++            compiler = state.environment.coredata.compilers.get('c')
+         if compiler:
+             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
+             args += ['--ld=%s' % ' '.join(compiler.get_linker_exelist())]
-- 
2.11.0


