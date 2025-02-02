Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93816C02195
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 20:04:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.71735.1738526642523731083
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 12:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKZ3Yftn;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so43867735e9.0
        for <Openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 12:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738526641; x=1739131441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idVji423Gni6oQNjysbnSlkvX7lJhttFoTSgFc8uJOM=;
        b=dKZ3YftnHrrj98evG7qgFEggEYrqsYSBJt7/L5fsyjsC/JtTNN3+63UmOcc0m0eMpu
         xmlKX3wWdG4F4AcZCA1PGntX+9+qzKvxkSBTQyKZH9vtCsa9ZgbFe+p8OMgDlGu4oKVQ
         ZVhSlvxg95KfqaYBnET1K1yvk8NZdJBx0zpgjDdfIS+twEGdm6ydtbdPYqnMM46PZWLb
         oj7gF93WeSBkjBhLjIrfvNjAxLGetuZ9sTx0Bh6F5hlEjtH1q3Y47/TtrE581+e2BHHb
         r2h60AY/d9JzeLVFjqnKcumZewHnDqD86XvvbuR99mYK5XXvUOgytXpGoduPLCYpn/V4
         8n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738526641; x=1739131441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idVji423Gni6oQNjysbnSlkvX7lJhttFoTSgFc8uJOM=;
        b=MFqApRV1NgAX7fvWjWZlfx4bsunSkYdystHlRx631dYlbzazNDWcUAbbvZ/ZYTex67
         1Ukg2x38/e9wkF8ZgLedbBVFBWWBmR/Tn3KK9bTbS4pHcmMZZzOBVcKD8/3cyADDAwHY
         Xen8ASGwtLX7vxeM2aABQj6ivUuSduxkN0kC4XyVW37phJnpDZ3uHYWY9sMcKU9RCBeK
         XH7NqolsRNHEgy97SHscof36dAgM0t6KfqUaj5GgzxYRPG1KWY6IOg4z5r8TEBGizUCe
         Hc3b7mJiZA6OGk0BFPDLfFNCvH8jK2dPHIBtQm99mXZmJXinM+GNsIi3+dqQYIKppMb2
         sCvg==
X-Gm-Message-State: AOJu0YzTua20PIpI1NwM/+MLgLFolGMh+zAWiTQY3AuRHYDYBIxOyZcw
	YMM349sv1DMpHNOSreHKlbhX3vv8cAcotazUhZ5Li4QIiUS6MNz3ns2LpbxQ7RQ=
X-Gm-Gg: ASbGncuBSChwCy8MRf+Pw4oOendMZ+o/I5e9M6BRkRImI7gPn4Ko3h4E92sPtHr9zmH
	FijFV36uVlJtg7vf0eqZLygDrYM7pxmJgH/JEhc6HxiUEn+wyby9SNIGV2BsGZ7moA7ISYbayDA
	k7kv1/nBGRnG2TGWOx9myKWAXVuaB++aaZJRmGUs+ZH8TxQxuUgpm3tfz84uYD/Vbb8d/A88l/B
	X6aQEglDh+mwpSMaZfYA1Gr+5WINrzPACf5MawXQY/fmfxpSSd0IGMLKl/TdlJXFhOEZ/bSA2qC
	IK1Wwso1QjrSoqzXIWJzFoBfrPp+Xg+6P7pxiCNIYLGCNXSyiQ==
X-Google-Smtp-Source: AGHT+IGDC9WIfKKdUoN6ZwiLHtsJvnAxe77Q3yGzpOcUf3opY4QJPKN8TJJb7eq/tDce0dDkIpzk0A==
X-Received: by 2002:a05:600c:b89:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-438dc3bb62fmr155790335e9.4.1738526640256;
        Sun, 02 Feb 2025 12:04:00 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e5d4csm129032675e9.19.2025.02.02.12.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:03:59 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 3/3] systemd: Build the systemctl executable
Date: Sun,  2 Feb 2025 21:03:19 +0100
Message-ID: <20250202200319.82231-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250202200319.82231-1-uvv.mail@gmail.com>
References: <20250202200319.82231-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 20:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210625

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Instead of the python re-implementation build the actual systemctl from
the systemd source tree.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../systemd/systemd-systemctl-native.bb       |  20 +-
 ...-meson-add-install-tag-for-systemctl.patch |  24 ++
 .../systemd/systemd-systemctl/systemctl       | 366 ------------------
 3 files changed, 32 insertions(+), 378 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
 delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index ffa024caef..57bb1ab830 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -1,17 +1,13 @@
-SUMMARY = "Wrapper for enabling systemd services"
+SUMMARY = "Systemctl executable from systemd"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+require systemd.inc
 
+DEPENDS = "gperf-native libcap-native util-linux-native python3-jinja2-native"
 
-inherit native
+inherit pkgconfig meson native
 
-SRC_URI = "file://systemctl"
+SRC_URI = "file://0001-meson-add-install-tag-for-systemctl.patch"
 
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
index 0000000000..a4b3e5a47e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
@@ -0,0 +1,24 @@
+From fe2eb1dde51648b0e5825766e2f27a859de8521c Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <uvv.mail@gmail.com>
+Date: Sun, 2 Feb 2025 10:13:38 +0100
+Subject: [PATCH] meson: add install tag for systemctl
+
+Upstream-Status: Submitted
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

