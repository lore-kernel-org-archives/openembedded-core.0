Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id C29B47876E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:52:27 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id g35so16455248lfi.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qxP565Oeb6KNTf8PVGDi1HAg+Yosu3VnVDdPKjEkb4Y=;
	b=uJxdXXz+u4oaX+9rPx9AixoHpwF5niAxyE8OEdguhW8IuHh0WN5rL6Vf0qAbsSj9/R
	uPW7NPiX9ep6K9L77A7sZrnX7e2Ju8MMN2NH+qwoyZ7cCiIHkUvHFcw+gyPKTZU+mMjy
	7e6qCzMGWuzApbFeNKnjcYC9hfYCWL7k0gAgj6yyaqz9xyhPyDIB23h8uzRNwzV/GiM/
	jLhjECdlsAp/K5A1SGoxK0Dv01CCA533vGEomlQboy9nVckUgBHAQVJqo0qy7wYXsGm4
	W4rW6H8KZzHuqh9tN/lIlIyjtXz0qMDv47GDb2lB2vl9qM0Rlz1OATtWGO2TwIEeUxyZ
	wuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qxP565Oeb6KNTf8PVGDi1HAg+Yosu3VnVDdPKjEkb4Y=;
	b=ITXAjlyZJ52pnp9tSWns1eiwKa1xtrjEE2VEBpRbtrJoEbifU50LvUmxnivCg2BgED
	h8OaJ+NxD6MCNqfWOZhSJbnNnkLWqRL5RMG9B5caVVHIul5KgZjOrEPUlfRYVdHTXq63
	zPKPwBvge5IYcyfdVK0YV0Z3rFnIgq3sHvIRP42Fp/GN8Iq1aGG/Er/S2nDq0yBPxAye
	9owsl5iAfFk35teow9Q+7uGnssXt8JLW8WVQFibYmGsf0CtskzkTG1IVl+VXMzLrPQyS
	DyNs1lAyzSBAuk3NdsyVfJDPBsrUiOU4gvtw6BIOFbggTK2tOdFMQkM4ZAZIVG3VNp9v
	gjlQ==
X-Gm-Message-State: AJaThX7eJx/+YucztbcShc0PmFBs1ASu77o8WpuEQUFW9eWfcaoM2E2m
	YhyeqyHnQl7EQCB9aazrxQykHQtk
X-Google-Smtp-Source: AGs4zMZ5MpW1UtqK/GQW5BTFLOuLfCwfKDpUheRGuv5VEOPPXeDV91X4zApJy4a2KDjJiaBCMj2htw==
X-Received: by 10.46.43.86 with SMTP id q83mr917000lje.104.1510847547947;
	Thu, 16 Nov 2017 07:52:27 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	a198sm264601lfb.79.2017.11.16.07.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Nov 2017 07:52:26 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 16 Nov 2017 16:52:15 +0100
Message-Id: <20171116155215.21122-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Thu, 16 Nov 2017 15:52:28 -0000

The update to 0.43.0 forgot to add this patch required for qt builds

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
This patch sits on top of  Alexander Kanavin's "Introduce meson build
system" patchset

 .../meson/meson/0003-native_bindir.patch           | 88 ++++++++++++++++++++++
 meta/recipes-devtools/meson/meson_0.43.0.bb        |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0003-native_bindir.patch

diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
new file mode 100644
index 000000000000..805c1f6a50dc
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -0,0 +1,88 @@
+From 01dd18c9c9c042268b87d576624c16fc74253cd9 Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Wed, 15 Nov 2017 15:05:01 +0100
+Subject: [PATCH] native_bindir
+
+There are some discussions upstream to merge this patch, but I presonaly believe
+that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ mesonbuild/dependencies/base.py | 14 +++++++++-----
+ mesonbuild/dependencies/ui.py   |  6 +++---
+ 2 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
+index 0d9742d426cb..0c8e79a8e9e3 100644
+--- a/mesonbuild/dependencies/base.py
++++ b/mesonbuild/dependencies/base.py
+@@ -114,7 +114,7 @@ class Dependency:
+     def need_threads(self):
+         return False
+ 
+-    def get_pkgconfig_variable(self, variable_name):
++    def get_pkgconfig_variable(self, variable_name, use_native=False):
+         raise NotImplementedError('{!r} is not a pkgconfig dependency'.format(self.name))
+ 
+ 
+@@ -256,8 +256,12 @@ class PkgConfigDependency(ExternalDependency):
+         return s.format(self.__class__.__name__, self.name, self.is_found,
+                         self.version_reqs)
+ 
+-    def _call_pkgbin(self, args):
+-        p, out = Popen_safe([self.pkgbin] + args, env=os.environ)[0:2]
++    def _call_pkgbin(self, args, use_native=False):
++        if use_native:
++            pkgbin = [self.pkgbin + "-native"]
++        else:
++            pkgbin = [self.pkgbin]
++        p, out = Popen_safe(pkgbin + args, env=os.environ)[0:2]
+         return p.returncode, out.strip()
+ 
+     def _set_cargs(self):
+@@ -291,8 +295,8 @@ class PkgConfigDependency(ExternalDependency):
+                 self.is_libtool = True
+             self.link_args.append(lib)
+ 
+-    def get_pkgconfig_variable(self, variable_name):
+-        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name])
++    def get_pkgconfig_variable(self, variable_name, use_native=False):
++        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name], use_native=use_native)
+         variable = ''
+         if ret != 0:
+             if self.required:
+diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
+index 8f183e54d4d2..34ef33e79ad9 100644
+--- a/mesonbuild/dependencies/ui.py
++++ b/mesonbuild/dependencies/ui.py
+@@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
+         self.bindir = self.get_pkgconfig_host_bins(core)
+         if not self.bindir:
+             # If exec_prefix is not defined, the pkg-config file is broken
+-            prefix = core.get_pkgconfig_variable('exec_prefix')
++            prefix = core.get_pkgconfig_variable('exec_prefix', use_native=True)
+             if prefix:
+                 self.bindir = os.path.join(prefix, 'bin')
+ 
+@@ -359,7 +359,7 @@ class Qt4Dependency(QtBaseDependency):
+         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
+         for application in applications:
+             try:
+-                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application))
++                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, use_native=True))
+             except MesonException:
+                 pass
+ 
+@@ -369,7 +369,7 @@ class Qt5Dependency(QtBaseDependency):
+         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
+ 
+     def get_pkgconfig_host_bins(self, core):
+-        return core.get_pkgconfig_variable('host_bins')
++        return core.get_pkgconfig_variable('host_bins', use_native=True)
+ 
+ 
+ # There are three different ways of depending on SDL2:
+-- 
+2.15.0
+
diff --git a/meta/recipes-devtools/meson/meson_0.43.0.bb b/meta/recipes-devtools/meson/meson_0.43.0.bb
index bbb48d9197c0..403f744c1cf5 100644
--- a/meta/recipes-devtools/meson/meson_0.43.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.43.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz \
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
+           file://0003-native_bindir.patch \
            "
 SRC_URI[md5sum] = "b0d389cc5937928c2f5114656dc5a99a"
 SRC_URI[sha256sum] = "c513eca90e0d70bf14cd1eaafea2fa91cf40a73326a7ff61f08a005048057340"
-- 
2.15.0


