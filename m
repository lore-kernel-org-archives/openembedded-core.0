Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFCB605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:24:24 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id o26so3732681lfc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 06:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2m6TlQyHpwYhaYzS5YIIp0cY303xC1InnaD+F7fkEU0=;
	b=VZqoJtr93Kj2ieSnUVz9CCCooRRI3sODJ2ufTWq3C119fe7ZJnB4sKzls1iDkoYRh2
	RGLbi/ZTeJjnyddNnJ/+P9HiqpCOsJe4VfLN2xlJ2qxzCePV5bgABWLOGfTxc8L3UgRS
	KoN21KQh2Lwb523w31/HmFbD5OsI51TVTUiJiHepS/5zp2gBmUy22pZmT5L1cUQbdZOc
	CDal/WiYsXECNt68e3kn/cqh8i4Pt8BNCIQTVhZ7gVYLJDn+hrXmV1CFzZBSMM3j2DER
	h9ZoDHzyq3THbSaZbw5J2a1w6ZEjPukTdpH1x8hwXX6D6nXIloBcrBg9wyrthiTAT9gM
	Oh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2m6TlQyHpwYhaYzS5YIIp0cY303xC1InnaD+F7fkEU0=;
	b=N4W9VF6ZT7je7rloU2dwEKTUhVBzkm0nygux4biSaFvYTW0uOrDu1Xk1nQoC0hcGh9
	r7dF82NYBPgNtZ7sq/oojfdwJenHyBeMA0kcBMp0Jxf5MyJaL0WjtKWudxLKJ+AQM1AR
	NT250jzGltsOJop56GEiLRyDNsNWGDhpfBkmZC85Z6CxvG2Y+TDeVnTuxggLYfDLo+94
	mwYkGOj68Suij+9ISCSchiIUV9krW/LC09QGeAdFHxdoD9U2FWhh5G5GWEFrdHgS/Jy4
	mLHwrVuQkMn1ymX4y6lrZPtrzgJegN0zpeMYjKiBTfu959e+t30+cnun4NL4W9PoyNEK
	eLsg==
X-Gm-Message-State: AKGB3mLeWAqQGWjJyeL/bncHaMAdnof7cwOOHgjazblJmETmpuw8AqKV
	eb+evDrAcnstQIlMa/0nTytLEMPn
X-Google-Smtp-Source: ACJfBoumlhGjc0VuoYb9a9P/xDn8YHqnh65BLG6I4CL2kMaiVjgI/4ONkJtJ5fe8a+EvA7klLUOUXw==
X-Received: by 10.25.209.79 with SMTP id i76mr4583lfg.103.1513607065508;
	Mon, 18 Dec 2017 06:24:25 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id j63sm538698lfi.31.2017.12.18.06.24.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Dec 2017 06:24:24 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 18 Dec 2017 15:24:23 +0100
Message-Id: <20171218142423.16954-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] meson: Port pkgconfig-native patch to 0.44.0
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
X-List-Received-Date: Mon, 18 Dec 2017 14:24:25 -0000

The update to 0.44.0 did not add this patch required for qt builds.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
This patch sits on top of  Alexander Kanavin's "Introduce meson build
system v5" patchset.

 .../meson/meson/0003-native_bindir.patch           | 109 +++++++++++++++++++++
 meta/recipes-devtools/meson/meson_0.44.0.bb        |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0003-native_bindir.patch

diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
new file mode 100644
index 000000000000..8911dd6b34e1
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -0,0 +1,109 @@
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Wed, 15 Nov 2017 15:05:01 +0100
+Subject: [PATCH] native_bindir
+
+Some libraries, like QT, have pre-processors that convert their input
+files into something that the cross-compiler can process. We find the
+path of those pre-processors via pkg-config-native instead of
+pkg-config.
+
+This path forces the use of pkg-config-native for host_bins arguments.
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
+index 0ef33722f196..b3f7e7c06822 100644
+--- a/mesonbuild/dependencies/base.py
++++ b/mesonbuild/dependencies/base.py
+@@ -130,7 +130,7 @@ class Dependency:
+     def need_threads(self):
+         return False
+ 
+-    def get_pkgconfig_variable(self, variable_name, kwargs):
++    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+         raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
+ 
+     def get_configtool_variable(self, variable_name):
+@@ -149,7 +149,7 @@ class InternalDependency(Dependency):
+         self.sources = sources
+         self.ext_deps = ext_deps
+ 
+-    def get_pkgconfig_variable(self, variable_name, kwargs):
++    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+         raise DependencyException('Method "get_pkgconfig_variable()" is '
+                                   'invalid for an internal dependency')
+ 
+@@ -414,10 +414,14 @@ class PkgConfigDependency(ExternalDependency):
+         return s.format(self.__class__.__name__, self.name, self.is_found,
+                         self.version_reqs)
+ 
+-    def _call_pkgbin(self, args, env=None):
++    def _call_pkgbin(self, args, env=None, use_native=False):
+         if not env:
+             env = os.environ
+-        p, out = Popen_safe([self.pkgbin] + args, env=env)[0:2]
++        if use_native:
++            pkgbin = [self.pkgbin + "-native"]
++        else:
++            pkgbin = [self.pkgbin]
++        p, out = Popen_safe(pkgbin + args, env=env)[0:2]
+         return p.returncode, out.strip()
+ 
+     def _convert_mingw_paths(self, args):
+@@ -499,7 +503,7 @@ class PkgConfigDependency(ExternalDependency):
+                 self.is_libtool = True
+             self.link_args.append(lib)
+ 
+-    def get_pkgconfig_variable(self, variable_name, kwargs):
++    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+         options = ['--variable=' + variable_name, self.name]
+ 
+         if 'define_variable' in kwargs:
+@@ -512,7 +516,7 @@ class PkgConfigDependency(ExternalDependency):
+ 
+             options = ['--define-variable=' + '='.join(definition)] + options
+ 
+-        ret, out = self._call_pkgbin(options)
++        ret, out = self._call_pkgbin(options, use_native=use_native)
+         variable = ''
+         if ret != 0:
+             if self.required:
+diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
+index 1db518c12477..4ed1d041f6f4 100644
+--- a/mesonbuild/dependencies/ui.py
++++ b/mesonbuild/dependencies/ui.py
+@@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
+         self.bindir = self.get_pkgconfig_host_bins(core)
+         if not self.bindir:
+             # If exec_prefix is not defined, the pkg-config file is broken
+-            prefix = core.get_pkgconfig_variable('exec_prefix', {})
++            prefix = core.get_pkgconfig_variable('exec_prefix', {}, use_native=True)
+             if prefix:
+                 self.bindir = os.path.join(prefix, 'bin')
+ 
+@@ -359,7 +359,7 @@ class Qt4Dependency(QtBaseDependency):
+         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
+         for application in applications:
+             try:
+-                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}))
++                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}, use_native=True))
+             except MesonException:
+                 pass
+ 
+@@ -369,7 +369,7 @@ class Qt5Dependency(QtBaseDependency):
+         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
+ 
+     def get_pkgconfig_host_bins(self, core):
+-        return core.get_pkgconfig_variable('host_bins', {})
++        return core.get_pkgconfig_variable('host_bins', {}, use_native=True)
+ 
+ 
+ # There are three different ways of depending on SDL2:
diff --git a/meta/recipes-devtools/meson/meson_0.44.0.bb b/meta/recipes-devtools/meson/meson_0.44.0.bb
index 9b4c7e6ab10b..d9c691c7f8b8 100644
--- a/meta/recipes-devtools/meson/meson_0.44.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.44.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
+           file://0003-native_bindir.patch \
            "
 SRC_URI[md5sum] = "26a7ca93ec9cea5facb365664261f9c6"
 SRC_URI[sha256sum] = "50f9b12b77272ef6ab064d26b7e06667f07fa9f931e6a20942bba2216ba4281b"
-- 
2.15.1


