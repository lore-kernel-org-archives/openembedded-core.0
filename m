Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE3EC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 07:11:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.63976.1738912296099580846
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 23:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rd3r9D4E;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso11549555e9.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 23:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738912294; x=1739517094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VZLBCMSlIYLuyYDunlidQZLJIpUyKR8XpVmXhZRe0I=;
        b=Rd3r9D4EMwbYnGQNmBiRovQukFIhJBJDMLXlUEfZIMGizM9e/blmVQEo2lZvRU1uHk
         5QJDiovrEHom+/sMsXW55IzO8jAUuU5PgbIVqB7Y8wpJaPmdGdYifxe7stsIat89rYLr
         8puQnDwH5jomgVUgm+23oeNLJXLEqHY4hLg9F56uwbz1EbgxVBDyWMawGqh7S3UTkxxW
         MHDt+EZOzSO1VOv5kPI1HJqr5F3sPsWQa5JuZkvPYgWHTbfkngxLz8X8XwDXHa9uxQ4Q
         yD1Tt6+TsfUfM4/tKEcKuDc8tCER9j5eVY/yIAi8dmBVrU7RrND0N4oOaD5NzYydiahC
         PRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738912294; x=1739517094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VZLBCMSlIYLuyYDunlidQZLJIpUyKR8XpVmXhZRe0I=;
        b=EhOMqPOffc9BOOvinEyNDq43AFk9nYQGl2y0boXOPaXIK5VRaDDpHa3bugkt4QZni6
         XkMl7i3z1RQdtxIMQKxap60pQ1T80i0fs74k7zpwQl+VLyA4wnjILJhMBgkgbF9nx8W0
         g8lgm1G39PRc6iaeTbnkE1p/ZkhfssH0t2HSmJgdj/JPE/RiYWQ+mS/HOxY2OJPkAS0q
         SP1xMXbR8VdYRZHFR8vArawNM27UxfUdOu+/ygyn1xahz1qdEyOLU/DWo7JY4w03HkZK
         aUXrsd2/7WmMxEWdqUgqlnILvIvLqjFKipwFmDjnUF8lo05MTSv7evF7ejuhXGNLmGYL
         0tEw==
X-Gm-Message-State: AOJu0YxumlQmkLycBgcyrr/kA5wBDZR3To/YiL522mPUH656USYoDvAB
	BQPtgDz79wAE8vzq0WgFf8MSiebI4iw+fR8C95glQ5cZvYCzn3F7chLWMG+F9y0=
X-Gm-Gg: ASbGncsd8bTL3DDIjOwE9SOzoozsoZ7PB1P3wcKggrgSaS9G4PDqn1pGUwCOxYfdfGE
	86w+1sdSMpqa6GZgMRd5HpjkIeuPbi146jgAKmvJRDZltjMLspfH0EoourlFjtZm8T/7WgFKR5z
	iHVr1xXbw+Zi+KDuztuhXLbtnzA2tqlgmYjhAkcRZlwKIHHeV7Hk2FlWY0NzfwtmRMZ5lKtNEz/
	ZWIjfS5jotTrqaEudy59l8f0YNh6AUyrKTH2oyJD3Q0JtVL/5LR4bSBjgwEiV4vxVrsBmr9+M7T
	2x1OLYfgwwfye8oo5pEuoNYuY597sSHCj4xFwsGLQWMMXZRkug==
X-Google-Smtp-Source: AGHT+IE3jQGwPmwSCIF/UchZbFC/1qT9l4QXEU0wb19WW0igolZz0QsZE4z2bhhBDQGEigJTCfXNrg==
X-Received: by 2002:a5d:64a3:0:b0:38d:adcd:a05e with SMTP id ffacd0b85a97d-38dc93496bbmr1279440f8f.39.1738912293576;
        Thu, 06 Feb 2025 23:11:33 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm45640125e9.2.2025.02.06.23.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:11:31 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4] systemd: Build the systemctl executable
Date: Fri,  7 Feb 2025 08:10:43 +0100
Message-ID: <20250207071043.96282-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 07:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210971

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Instead of the python re-implementation build the actual systemctl from
the systemd source tree. The python script was used when systemd didn't
provide an option to build individual executables. It is possible in the
meantime, so instead of always adapting the script when there's a new
functionality, we simply use upstream implementation.

License-Update: Base recipe is used

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../systemd/systemd-systemctl-native.bb       |  23 +-
 ...-meson-add-install-tag-for-systemctl.patch |  25 ++
 ...2-meson-Bypass-certain-config-checks.patch |  64 +++
 .../systemd/systemd-systemctl/systemctl       | 366 ------------------
 4 files changed, 100 insertions(+), 378 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0002-meson-Bypass-certain-config-checks.patch
 delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index ffa024caef..30b28477c0 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -1,17 +1,16 @@
-SUMMARY = "Wrapper for enabling systemd services"
+SUMMARY = "Systemctl executable from systemd"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+require systemd.inc
 
+DEPENDS = "gperf-native libcap-native util-linux-native python3-jinja2-native"
 
-inherit native
+inherit pkgconfig meson native
 
-SRC_URI = "file://systemctl"
+SRC_URI:append = " \
+    file://0001-meson-add-install-tag-for-systemctl.patch \
+    file://0002-meson-Bypass-certain-config-checks.patch \
+"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/systemctl ${D}${bindir}
-}
+MESON_TARGET = "systemctl:executable"
+MESON_INSTALL_TAGS = "systemctl"
+EXTRA_OEMESON:append = " -Dlink-systemctl-shared=false"
diff --git a/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch b/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
new file mode 100644
index 0000000000..a9b3e62708
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
@@ -0,0 +1,25 @@
+From fbf1ae3b7bd074a8d3bfb741f54b8539123399f1 Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <uvv.mail@gmail.com>
+Date: Sun, 2 Feb 2025 10:13:38 +0100
+Subject: [PATCH] meson: add install tag for systemctl
+
+Upstream-Status: Backport
+[https://github.com/systemd/systemd/commit/b1e5a7aa3f1e552c56d5adbeed6ff67d88d1e103]
+
+Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
+---
+ src/systemctl/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/systemctl/meson.build b/src/systemctl/meson.build
+index 88f73bf502..46218dc8ef 100644
+--- a/src/systemctl/meson.build
++++ b/src/systemctl/meson.build
+@@ -61,6 +61,7 @@ executables += [
+                         libzstd_cflags,
+                         threads,
+                 ],
++                'install_tag' : 'systemctl',
+         },
+         fuzz_template + {
+                 'sources' : [
diff --git a/meta/recipes-core/systemd/systemd-systemctl/0002-meson-Bypass-certain-config-checks.patch b/meta/recipes-core/systemd/systemd-systemctl/0002-meson-Bypass-certain-config-checks.patch
new file mode 100644
index 0000000000..a1db61fb8d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-systemctl/0002-meson-Bypass-certain-config-checks.patch
@@ -0,0 +1,64 @@
+From fbc797ed6bd35bd26e5b64a9026d519768b1799e Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <uvv.mail@gmail.com>
+Date: Wed, 5 Feb 2025 07:14:20 +0000
+Subject: [PATCH 2/2] meson: Bypass certain config checks
+
+Upstream-Status: Backport
+[https://github.com/systemd/systemd/commit/8b413ae4060b21ed4712fdad7eba195890740756]
+
+Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
+---
+ meson.build | 33 +++++++++++++++++++--------------
+ 1 file changed, 19 insertions(+), 14 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index bffda86845..bfc35b88e6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -890,13 +890,16 @@ nobody_user = get_option('nobody-user')
+ nobody_group = get_option('nobody-group')
+ 
+ if not meson.is_cross_build()
+-        getent_result = run_command('getent', 'passwd', '65534', check : false)
+-        if getent_result.returncode() == 0
+-                name = getent_result.stdout().split(':')[0]
+-                if name != nobody_user
+-                        warning('\n' +
+-                                'The local user with the UID 65534 does not match the configured user name "@0@" of the nobody user (its name is @1@).\n'.format(nobody_user, name) +
+-                                'Your build will result in an user table setup that is incompatible with the local system.')
++        find_getent_result = find_program('getent', required : false)
++        if find_getent_result.found()
++                getent_result = run_command('getent', 'passwd', '65534', check : false)
++                if getent_result.returncode() == 0
++                        name = getent_result.stdout().split(':')[0]
++                        if name != nobody_user
++                                warning('\n' +
++                                        'The local user with the UID 65534 does not match the configured user name "@0@" of the nobody user (its name is @1@).\n'.format(nobody_user, name) +
++                                        'Your build will result in an user table setup that is incompatible with the local system.')
++                        endif
+                 endif
+         endif
+         id_result = run_command('id', '-u', nobody_user, check : false)
+@@ -909,13 +912,15 @@ if not meson.is_cross_build()
+                 endif
+         endif
+ 
+-        getent_result = run_command('getent', 'group', '65534', check : false)
+-        if getent_result.returncode() == 0
+-                name = getent_result.stdout().split(':')[0]
+-                if name != nobody_group
+-                        warning('\n' +
+-                                'The local group with the GID 65534 does not match the configured group name "@0@" of the nobody group (its name is @1@).\n'.format(nobody_group, name) +
+-                                'Your build will result in an group table setup that is incompatible with the local system.')
++        if find_getent_result.found()
++                getent_result = run_command('getent', 'group', '65534', check : false)
++                if getent_result.returncode() == 0
++                        name = getent_result.stdout().split(':')[0]
++                        if name != nobody_group
++                                warning('\n' +
++                                        'The local group with the GID 65534 does not match the configured group name "@0@" of the nobody group (its name is @1@).\n'.format(nobody_group, name) +
++                                        'Your build will result in an group table setup that is incompatible with the local system.')
++                        endif
+                 endif
+         endif
+         id_result = run_command('id', '-g', nobody_group, check : false)
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
deleted file mode 100755
index 81c246a5b2..0000000000
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ /dev/null
@@ -1,366 +0,0 @@
-#!/usr/bin/env python3
-"""systemctl: subset of systemctl used for image construction
-
-Mask/preset systemd units
-"""
-
-import argparse
-import fnmatch
-import os
-import re
-import sys
-
-from collections import namedtuple
-from itertools import chain
-from pathlib import Path
-
-version = 1.0
-
-ROOT = Path("/")
-SYSCONFDIR = Path("etc")
-BASE_LIBDIR = Path("lib")
-LIBDIR = Path("usr", "lib")
-
-locations = list()
-
-
-class SystemdFile():
-    """Class representing a single systemd configuration file"""
-
-    _clearable_keys = ['WantedBy']
-
-    def __init__(self, root, path, instance_unit_name, unit_type):
-        self.sections = dict()
-        self._parse(root, path)
-        dirname = os.path.basename(path.name) + ".d"
-        for location in locations:
-            files = (root / location / unit_type / dirname).glob("*.conf")
-            if instance_unit_name:
-                inst_dirname = instance_unit_name + ".d"
-                files = chain(files, (root / location / unit_type / inst_dirname).glob("*.conf"))
-            for path2 in sorted(files):
-                self._parse(root, path2)
-
-    def _parse(self, root, path):
-        """Parse a systemd syntax configuration file
-
-        Args:
-            path: A pathlib.Path object pointing to the file
-
-        """
-        skip_re = re.compile(r"^\s*([#;]|$)")
-        section_re = re.compile(r"^\s*\[(?P<section>.*)\]")
-        kv_re = re.compile(r"^\s*(?P<key>[^\s]+)\s*=\s*(?P<value>.*)")
-        section = None
-
-        if path.is_symlink():
-            try:
-                path.resolve()
-            except FileNotFoundError:
-                # broken symlink, try relative to root
-                path = root / Path(os.readlink(str(path))).relative_to(ROOT)
-
-        with path.open() as f:
-            for line in f:
-                if skip_re.match(line):
-                    continue
-
-                line = line.strip()
-                m = section_re.match(line)
-                if m:
-                    if m.group('section') not in self.sections:
-                        section = dict()
-                        self.sections[m.group('section')] = section
-                    else:
-                        section = self.sections[m.group('section')]
-                    continue
-
-                while line.endswith("\\"):
-                    line += f.readline().rstrip("\n")
-
-                m = kv_re.match(line)
-                k = m.group('key')
-                v = m.group('value')
-                if k not in section:
-                    section[k] = list()
-
-                # If we come across a "key=" line for a "clearable key", then
-                # forget all preceding assignments. This works because we are
-                # processing files in correct parse order.
-                if k in self._clearable_keys and not v:
-                    del section[k]
-                    continue
-
-                section[k].extend(v.split())
-
-    def get(self, section, prop):
-        """Get a property from section
-
-        Args:
-            section: Section to retrieve property from
-            prop: Property to retrieve
-
-        Returns:
-            List representing all properties of type prop in section.
-
-        Raises:
-            KeyError: if ``section`` or ``prop`` not found
-        """
-        return self.sections[section][prop]
-
-
-class Presets():
-    """Class representing all systemd presets"""
-    def __init__(self, scope, root):
-        self.directives = list()
-        self._collect_presets(scope, root)
-
-    def _parse_presets(self, presets):
-        """Parse presets out of a set of preset files"""
-        skip_re = re.compile(r"^\s*([#;]|$)")
-        directive_re = re.compile(r"^\s*(?P<action>enable|disable)\s+(?P<unit_name>(.+))")
-
-        Directive = namedtuple("Directive", "action unit_name")
-        for preset in presets:
-            with preset.open() as f:
-                for line in f:
-                    m = directive_re.match(line)
-                    if m:
-                        directive = Directive(action=m.group('action'),
-                                              unit_name=m.group('unit_name'))
-                        self.directives.append(directive)
-                    elif skip_re.match(line):
-                        pass
-                    else:
-                        sys.exit("Unparsed preset line in {}".format(preset))
-
-    def _collect_presets(self, scope, root):
-        """Collect list of preset files"""
-        presets = dict()
-        for location in locations:
-            paths = (root / location / scope).glob("*.preset")
-            for path in paths:
-                # earlier names override later ones
-                if path.name not in presets:
-                    presets[path.name] = path
-
-        self._parse_presets([v for k, v in sorted(presets.items())])
-
-    def state(self, unit_name):
-        """Return state of preset for unit_name
-
-        Args:
-            presets: set of presets
-            unit_name: name of the unit
-
-        Returns:
-            None: no matching preset
-            `enable`: unit_name is enabled
-            `disable`: unit_name is disabled
-        """
-        for directive in self.directives:
-            if fnmatch.fnmatch(unit_name, directive.unit_name):
-                return directive.action
-
-        return None
-
-
-def add_link(path, target):
-    try:
-        path.parent.mkdir(parents=True)
-    except FileExistsError:
-        pass
-    if not path.is_symlink():
-        print("ln -s {} {}".format(target, path))
-        path.symlink_to(target)
-
-
-class SystemdUnitNotFoundError(Exception):
-    def __init__(self, path, unit):
-        self.path = path
-        self.unit = unit
-
-
-class SystemdUnit():
-    def __init__(self, root, unit, unit_type):
-        self.root = root
-        self.unit = unit
-        self.unit_type = unit_type
-        self.config = None
-
-    def _path_for_unit(self, unit):
-        for location in locations:
-            path = self.root / location / self.unit_type / unit
-            if path.exists() or path.is_symlink():
-                return path
-
-        raise SystemdUnitNotFoundError(self.root, unit)
-
-    def _process_deps(self, config, service, location, prop, dirstem, instance):
-        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
-
-        target = ROOT / location.relative_to(self.root)
-        try:
-            for dependent in config.get('Install', prop):
-                # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
-                wants = systemdir / "{}.{}".format(dependent, dirstem) / service
-                add_link(wants, target)
-
-        except KeyError:
-            pass
-
-    def enable(self, units_enabled=[]):
-        # if we're enabling an instance, first extract the actual instance
-        # then figure out what the template unit is
-        template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
-        instance_unit_name = None
-        if template:
-            instance = template.group('instance')
-            if instance != "":
-                instance_unit_name = self.unit
-            unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
-        else:
-            instance = None
-            unit = self.unit
-
-        path = self._path_for_unit(unit)
-
-        if path.is_symlink():
-            # ignore aliases
-            return
-
-        config = SystemdFile(self.root, path, instance_unit_name, self.unit_type)
-        if instance == "":
-            try:
-                default_instance = config.get('Install', 'DefaultInstance')[0]
-            except KeyError:
-                # no default instance, so nothing to enable
-                return
-
-            service = self.unit.replace("@.",
-                                        "@{}.".format(default_instance))
-        else:
-            service = self.unit
-
-        self._process_deps(config, service, path, 'WantedBy', 'wants', instance)
-        self._process_deps(config, service, path, 'RequiredBy', 'requires', instance)
-
-        try:
-            for also in config.get('Install', 'Also'):
-                try:
-                     units_enabled.append(unit)
-                     if also not in units_enabled:
-                        SystemdUnit(self.root, also, self.unit_type).enable(units_enabled)
-                except SystemdUnitNotFoundError as e:
-                    sys.exit("Error: Systemctl also enable issue with  %s (%s)" % (service, e.unit))
-
-        except KeyError:
-            pass
-
-        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
-        target = ROOT / path.relative_to(self.root)
-        try:
-            for dest in config.get('Install', 'Alias'):
-                alias = systemdir / dest
-                add_link(alias, target)
-
-        except KeyError:
-            pass
-
-    def mask(self):
-        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
-        add_link(systemdir / self.unit, "/dev/null")
-
-
-def collect_services(root, unit_type):
-    """Collect list of service files"""
-    services = set()
-    for location in locations:
-        paths = (root / location / unit_type).glob("*")
-        for path in paths:
-            if path.is_dir():
-                continue
-            services.add(path.name)
-
-    return services
-
-
-def preset_all(root, unit_type):
-    presets = Presets('{}-preset'.format(unit_type), root)
-    services = collect_services(root, unit_type)
-
-    for service in services:
-        state = presets.state(service)
-
-        if state == "enable" or state is None:
-            try:
-                SystemdUnit(root, service, unit_type).enable()
-            except SystemdUnitNotFoundError:
-                sys.exit("Error: Systemctl preset_all issue in %s" % service)
-
-    # If we populate the systemd links we also create /etc/machine-id, which
-    # allows systemd to boot with the filesystem read-only before generating
-    # a real value and then committing it back.
-    #
-    # For the stateless configuration, where /etc is generated at runtime
-    # (for example on a tmpfs), this script shouldn't run at all and we
-    # allow systemd to completely populate /etc.
-    (root / SYSCONFDIR / "machine-id").touch()
-
-
-def main():
-    if sys.version_info < (3, 4, 0):
-        sys.exit("Python 3.4 or greater is required")
-
-    parser = argparse.ArgumentParser()
-    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
-                                                     'preset-all'])
-    parser.add_argument('service', nargs=argparse.REMAINDER)
-    parser.add_argument('--root')
-    parser.add_argument('--preset-mode',
-                        choices=['full', 'enable-only', 'disable-only'],
-                        default='full')
-    parser.add_argument('--global', dest="opt_global", action="store_true", default=False)
-
-    args = parser.parse_args()
-
-    root = Path(args.root) if args.root else ROOT
-
-    locations.append(SYSCONFDIR / "systemd")
-    # Handle the usrmerge case by ignoring /lib when it's a symlink
-    if not (root / BASE_LIBDIR).is_symlink():
-        locations.append(BASE_LIBDIR / "systemd")
-    locations.append(LIBDIR / "systemd")
-
-    command = args.command
-    if not command:
-        parser.print_help()
-        return 0
-
-    unit_type = "user" if args.opt_global else "system"
-
-    if command == "mask":
-        for service in args.service:
-            try:
-                SystemdUnit(root, service, unit_type).mask()
-            except SystemdUnitNotFoundError as e:
-                sys.exit("Error: Systemctl main mask issue in %s (%s)" % (service, e.unit))
-    elif command == "enable":
-        for service in args.service:
-            try:
-                SystemdUnit(root, service, unit_type).enable()
-            except SystemdUnitNotFoundError as e:
-                sys.exit("Error: Systemctl main enable issue in %s (%s)" % (service, e.unit))
-    elif command == "preset-all":
-        if len(args.service) != 0:
-            sys.exit("Too many arguments.")
-        if args.preset_mode != "enable-only":
-            sys.exit("Only enable-only is supported as preset-mode.")
-        preset_all(root, unit_type)
-    else:
-        raise RuntimeError()
-
-
-if __name__ == '__main__':
-    main()

