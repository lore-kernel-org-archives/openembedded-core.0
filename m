Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72D4C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 10:39:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.19413.1739961579199019540
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 02:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NhIPtYhB;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so44871835e9.1
        for <Openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739961577; x=1740566377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUkhhB4f0lJB3UXl/aFcn1SSyJAeloS84Kk2GzqkehQ=;
        b=NhIPtYhBpXs8124BE5I/j3n4pdS21ecFHm8uguwwiQ9TPSCYO4uEhIaiOC7N17edWf
         s2+USr9s5R+U6haJ7qmgZRUvUnCH+FS1ql+G9EjpgQU9WXJF2HMSdhXYqfzap94urAKY
         TJf/4kA7atDRxr4R69kQ3GXX+Nv+AA8qZSX/oQF1XLXq7qgGRKTSLfS/jBooUT19Qsqd
         KZBVs7u3kCHR5kh52XkkrWal8T6KzVRFJw54knYyuFLOEQ4IiDlsI3wmvqFuRMN+szbV
         JJe7x8+TFZ5GgFQgrUwgyFYHCb5jk6uPIOHhnEQ+F/iTTdr3d8TTg1r1aFVWDWDCcfUY
         Ui5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961577; x=1740566377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUkhhB4f0lJB3UXl/aFcn1SSyJAeloS84Kk2GzqkehQ=;
        b=C/sZuoQHTStQ2qa2TjCk5s8Sm4zRhDwd1cRPEP7lGftV+YWLweCcBR/QzYKlx+KC4G
         vPYKX3iSyJcae6XPlayjB0xx8op6DeQSJ2L56VM0hhPfti6XPKOE0fTmxBX87hThdr0B
         dk1T9LVk8afwHwa1AZy0CUvkN59t4cjjkzpoV0Ds3nNNOJ0Y5K0iQ0Mt/e3nl1lGL+Kj
         XbyCIExVCj1TolmD/UQ2A+kEibMS/sIz8eJQIJ7oLTjpV1r4I0tIeZ8+/KIPr0kPGF4t
         C2Za44/Qw2q8AxC7/y2WztG4BhebxNQYFAYwAJVF3Ls8DaTLEUmLNyCkDcO4HfvvL7IO
         2opA==
X-Gm-Message-State: AOJu0YxHPI+gHG7Z/6eOB75fQTzULGDfy9HEmOMQCT3QGKO/NyLTU4W9
	ndsrgHXugd3kzFpAqbj53Vl8rRKNSz9ZJjUSxEl86ckEjQUV7cJ4yyU2QKMz
X-Gm-Gg: ASbGncsBR1IfU1WOkm8Yyu2IYjf4EgKXVQFgJltsN95T95erVSUqfYAVwOnWWBzs3yj
	j2pqPKrAT7XXY7vhXuzU0wrzEwv9U/c8kxie0ydOJNUED5qfmdtZduL4S4D01YOF+03eM7XDwfl
	uLSYnVj6IzY+F6NPLoQiar5GxY+lIQJ97pg14SORF8hYg9H2aJOyQO+5pzT9Mc1Ncn3wvxrJt2v
	9TTvzWVlI4Q78fSUx3KTstrNUlEpTyRag+VcGE8bcrY89EwhPvy/y036cUKfKOK+aNG2xly2Yjq
	aeM+thZtZ75D7/Qpn7UJpCUUjZL0t55RKnJ/wug7G5uG
X-Google-Smtp-Source: AGHT+IGSdejscGvLuv+qTXlqCzuyCmQPu1QJp2G/jlgBZDB4o1G6pg+c8fI2FEwUgnVzKDrfinImzA==
X-Received: by 2002:a05:600c:5101:b0:439:9496:181c with SMTP id 5b1f17b1804b1-43994961a51mr56887245e9.29.1739961576866;
        Wed, 19 Feb 2025 02:39:36 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04ee48sm210109755e9.3.2025.02.19.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 02:39:36 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v6] systemd: Build the systemctl executable
Date: Wed, 19 Feb 2025 11:39:08 +0100
Message-ID: <20250219103908.42513-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 10:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211701

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
 .../systemd/systemd-systemctl/systemctl       | 376 ------------------
 2 files changed, 11 insertions(+), 388 deletions(-)
 delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index ffa024caef..73862b4e23 100644
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
+MESON_TARGET = "systemctl:executable"
+MESON_INSTALL_TAGS = "systemctl"
+EXTRA_OEMESON:append = " -Dlink-systemctl-shared=false"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/systemctl ${D}${bindir}
-}
+# Systemctl is supposed to operate on target, but the target sysroot is not
+# determined at run-time, but rather set during configure
+# More details are here https://github.com/systemd/systemd/issues/35897#issuecomment-2665405887
+EXTRA_OEMESON:append = " --sysconfdir ${sysconfdir_native}"
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
deleted file mode 100755
index 65e3157859..0000000000
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ /dev/null
@@ -1,376 +0,0 @@
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
-        if instance_unit_name is not None:
-            try:
-                # Try first with instance unit name. Systemd allows to create instance unit files
-                # e.g. `gnome-shell@wayland.service` which cause template unit file to be ignored
-                # for the instance for which instance unit file is present. In that case, there may
-                # not be any template file at all.
-                path = self._path_for_unit(instance_unit_name)
-            except SystemdUnitNotFoundError:
-                path = self._path_for_unit(unit)
-        else:
-            path = self._path_for_unit(unit)
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

