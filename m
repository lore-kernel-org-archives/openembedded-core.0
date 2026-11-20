Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6391.1795182835328005592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SdSe/mh5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so8254225e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182833; x=1795787633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4svXfMP+7Pl3KnEXyBVA4XOxrgtbUv6S1dBfgT2lzI=;
        b=SdSe/mh5QZEQJYTLEKsZiMxoNyUMr0zT28LyqQETKuHNQEMBExrntaY/FFSZq1ipdH
         es/HMNGGyKXR9T12c4TBbSkbVf0NwNW5rUmr4grUnE2wMcjnDrNw3zLnCY/GgABXG51H
         2pwEUudHiP/Ka5q2ZQdhEZrvilP4B2k1B/NhyZ89csrJJUrH8i6iw9Yya96EuKhfYe0j
         GRj/Vj2J3TdCB3toxZqrA08jUcCgrX7YFX2nezk67pmjOIy+a37pRxMOIzUQIULtLxAV
         8OD3Zrn63hAk2QFBJwbxyTa/bWMI2PQRUZKrQnTy5RqAA2lDr24t87tK7voW/4Ph4uM3
         2E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182833; x=1795787633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4svXfMP+7Pl3KnEXyBVA4XOxrgtbUv6S1dBfgT2lzI=;
        b=e8l+ULmgUQLJMFdj4/nWj8Mz68iVK9v71xKEK5OdLmou9RrgaXRfyG11VDFHnHxV8K
         eYnW+ZVVw2Ats57AUisGhSLq/Dz+SgZRVbytJQbcgxrQr0cOqjfjuvrjzQiffKPO8BTS
         OGb0gXCwkpBP1b0dW6tfAYiCKxky35pTmYtmh0v9SmQ3lZOtWFF9OlD0GloCXMUTRTby
         7FKj5pWD0z8PF1hizAwHPZQK/VFlzKpqXpDNXedlUR6xP3r+wdtaSlhOffkdXigWp4Ao
         UIERrtoC5omozgBAQAlgkblW+v9DOICGGdMNg8al1wHOVvccgijoVntz2ShmjFprLbxT
         vLYA==
X-Gm-Message-State: APuU4Z8PcPe7NM0WxVP8vJPAVYWPqNsDwEZ1GgQUXzT5agbctaXo0ylH
	frmEogiZFb2NEYW0esyMTDKae1L0nn82Kv1gdQc/+GYrsI/i6YsQWgt0Wr5J1+xp
X-Gm-Gg: AYBFou2TOIwG++6xCwBJiY73mHO0khBiWCAUT3Lw8MTGDHPD9b93vpwg5u0+88Ekxbb
	pxVZZHcIlKTsJ01DovlkLqu2A82vuWh/TH3qCeepgLNII5eEvWN37eK3KxcjAWwUjvBwGyDAQMJ
	7pR5D6DRuNJwEez5MJozgux6VlsMbNGeJj7PNTbEyMwVLAAZtpnef4YdNmYXwxJ28r9NOvJCtA6
	JM3VjTawa4iSGJuYzCrKg0pFSvG3iT7rMgdfUfnkrdm1kZ7u3rRF2iOjnKCbdkMNaEBWyllg7gp
	nEsFbfqiq9qdtqRqj+mYQPwctVSjFr8m6SqelWfsFP+3Ng0/E0MhK3o2UgTe4vpG373ynE2n7le
	wAXySUjdA3yiEg+btaoufdCdRxjO3CLzGaxdQ3OHxgaEQJQ9QBGfH6SQwq5G7cmDLalDwlnk0xU
	SCvP3PsdcgI+j6/WgG9+//xZcXYofw8kDqleD4pgNJUf/ozcuo+1lPcH6Cp3IlXjy41JNiQDbwM
	6QQAmOCOtK6X9p3NjjMzPmBVVaiNLeAQMbHQO29BXWmrt07dXLs/811oR432M/x/XSmPY7qGEtA
	afi8wm3s9K0=
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr72838085e9.8.1795182833457;
        Fri, 20 Nov 2026 05:53:53 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:52 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 06/10] lib/oe/npm: Add SRC_URI entries for the dependencies of a shrinkwrap file
Date: Fri, 20 Nov 2026 14:53:37 +0100
Message-ID: <20261120135342.2628228-7-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250799
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

The npmsw fetcher reads npm-shrinkwrap.json to find the dependencies of
an npm package. So SRC_URI does not show these dependencies, and the
fetcher holds logic that belongs in the metadata.

Add shrinkwrap_src_uri(), which gives one SRC_URI entry for each
dependency of a shrinkwrap file:

- A package from a registry gets an npm:// entry with its name,
  version and checksum.
- Another tarball gets its URL with the checksum.
- A git dependency gets a git:// entry with its revision.

Each entry unpacks to the location of the dependency in the source
tree, where npm.bbclass expects it. Add src_uri_differences(), which
compares these entries with SRC_URI.

Add tests for both functions.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/npm.py                        |  99 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/oelib/npm.py | 121 ++++++++++++++++++++++
 2 files changed, 220 insertions(+)
 create mode 100644 meta/lib/oe/npm.py
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/npm.py

diff --git a/meta/lib/oe/npm.py b/meta/lib/oe/npm.py
new file mode 100644
index 0000000000..19f547839e
--- /dev/null
+++ b/meta/lib/oe/npm.py
@@ -0,0 +1,99 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+"""Explicit SRC_URI entries for the dependencies of an npm shrinkwrap file."""
+
+import os
+import re
+
+import bb.fetch
+import bb.utils
+from bb.fetch.npm import npm_integrity, npm_localfile
+from bb.fetch.npmsw import foreach_dependencies
+
+GIT_RESOLVED_RE = re.compile(r"^git\+(?P<protocol>[a-z]+)://(?P<url>[^#]+)#(?P<rev>[0-9a-f]+)$")
+
+
+def shrinkwrap_src_uri(shrinkwrap, destdir, dev=False):
+    """Return one SRC_URI entry for each dependency of a shrinkwrap file.
+
+    shrinkwrap is the content of npm-shrinkwrap.json (lockfileVersion 2 or
+    later). destdir is the directory of the main package, relative to
+    UNPACKDIR. Each dependency unpacks to its location in destdir (for example
+    destdir/node_modules/foo), where npm.bbclass expects it. dev also adds the
+    devDependencies. The entries are sorted by location.
+
+    A package from a registry gets an npm:// entry, so that the fetcher knows
+    its name and version. Other tarballs get a plain URL and git dependencies
+    a git:// URL. Each entry has the checksum or revision of the shrinkwrap
+    file.
+    """
+    entries = {}
+
+    def _add(name, data, location):
+        package = data.get("name", name)
+        version = data.get("version")
+        resolved = data.get("resolved")
+        integrity = data.get("integrity")
+        destsuffix = os.path.join(destdir, location)
+
+        if not resolved:
+            # npm leaves out "resolved" for some duplicate packages. npm.bbclass
+            # does not need these, as npmsw already skipped them.
+            if version and integrity:
+                return
+            raise ValueError("%s: no 'resolved' field" % location)
+
+        if data.get("link") or resolved.startswith("file:"):
+            raise ValueError("%s: local dependencies are not supported" % location)
+
+        match = GIT_RESOLVED_RE.match(resolved)
+        if match:
+            entries[location] = "git://%s;protocol=%s;rev=%s;nobranch=1;destsuffix=%s" % (
+                match["url"], match["protocol"], match["rev"], destsuffix)
+            return
+
+        if not integrity or not resolved.startswith(("https://", "http://")):
+            raise ValueError("%s: unsupported dependency %s" % (location, resolved))
+
+        checksum_name, checksum = npm_integrity(integrity)
+        basename = package.split("/")[-1]
+        suffix = "/%s/-/%s-%s.tgz" % (package, basename, version)
+        if resolved.startswith("https://") and resolved.endswith(suffix) and bb.utils.is_semver(version):
+            registry = resolved[len("https://"):-len(suffix)]
+            entries[location] = "npm://%s/;package=%s;version=%s;%s=%s;destsuffix=%s" % (
+                registry, package, version, checksum_name, checksum, destsuffix)
+        else:
+            entries[location] = "%s;downloadfilename=%s;%s=%s;subdir=%s;striplevel=1" % (
+                resolved, npm_localfile(os.path.basename(resolved)), checksum_name, checksum, destsuffix)
+
+    foreach_dependencies(shrinkwrap, _add, dev)
+    return [entries[location] for location in sorted(entries)]
+
+
+def src_uri_differences(expected, src_uri):
+    """Compare the expected entries with SRC_URI.
+
+    Returns (missing, extra): the expected entries that SRC_URI does not have,
+    and the SRC_URI entries that unpack into a node_modules directory but are
+    not expected. Entries are compared after parsing, so the order of the URL
+    parameters does not matter.
+    """
+    def _key(url):
+        scheme, host, path, user, password, parm = bb.fetch.decodeurl(url)
+        return (scheme, host, path, user, password, tuple(sorted(parm.items())))
+
+    def _unpacks_to_node_modules(url):
+        parm = bb.fetch.decodeurl(url)[5]
+        dest = parm.get("destsuffix") or parm.get("subdir") or ""
+        return "node_modules/" in dest + "/"
+
+    expected_keys = {_key(url): url for url in expected}
+    actual_keys = {_key(url): url for url in src_uri}
+    missing = [url for key, url in expected_keys.items() if key not in actual_keys]
+    extra = [url for key, url in actual_keys.items()
+             if key not in expected_keys and _unpacks_to_node_modules(url)]
+    return missing, extra
diff --git a/meta/lib/oeqa/selftest/cases/oelib/npm.py b/meta/lib/oeqa/selftest/cases/oelib/npm.py
new file mode 100644
index 0000000000..df4f6aff5b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/npm.py
@@ -0,0 +1,121 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import base64
+from unittest.case import TestCase
+
+import oe.npm
+
+CHECKSUM = bytes(range(64)).hex()
+INTEGRITY = "sha512-" + base64.b64encode(bytes(range(64))).decode()
+
+
+def shrinkwrap(packages):
+    """Return a shrinkwrap file with the given dependencies"""
+    return {"lockfileVersion": 3, "packages": {"": {"name": "main"}, **packages}}
+
+
+def registry(package, version, host="registry.npmjs.org"):
+    """Return a dependency from a registry"""
+    basename = package.split("/")[-1]
+    return {
+        "version": version,
+        "resolved": "https://%s/%s/-/%s-%s.tgz" % (host, package, basename, version),
+        "integrity": INTEGRITY,
+    }
+
+
+class TestShrinkwrapSrcUri(TestCase):
+    def test_registry(self):
+        entries = oe.npm.shrinkwrap_src_uri(shrinkwrap({
+            "node_modules/send": registry("send", "0.19.0"),
+            "node_modules/send/node_modules/ms": registry("ms", "2.1.3"),
+            "node_modules/@scope/pkg": registry("@scope/pkg", "1.0.0", "npm.example.com/path"),
+        }), "npm")
+        self.assertEqual(entries, [
+            "npm://npm.example.com/path/;package=@scope/pkg;version=1.0.0;sha512sum=%s;destsuffix=npm/node_modules/@scope/pkg" % CHECKSUM,
+            "npm://registry.npmjs.org/;package=send;version=0.19.0;sha512sum=%s;destsuffix=npm/node_modules/send" % CHECKSUM,
+            "npm://registry.npmjs.org/;package=ms;version=2.1.3;sha512sum=%s;destsuffix=npm/node_modules/send/node_modules/ms" % CHECKSUM,
+        ])
+
+    def test_alias(self):
+        # An alias installs a package under another name: the "name" field
+        # gives the real package
+        dep = registry("real", "1.0.0")
+        dep["name"] = "real"
+        entries = oe.npm.shrinkwrap_src_uri(shrinkwrap({"node_modules/alias": dep}), "npm")
+        self.assertEqual(entries, [
+            "npm://registry.npmjs.org/;package=real;version=1.0.0;sha512sum=%s;destsuffix=npm/node_modules/alias" % CHECKSUM,
+        ])
+
+    def test_tarball(self):
+        entries = oe.npm.shrinkwrap_src_uri(shrinkwrap({
+            "node_modules/foo": {
+                "version": "1.0.0",
+                "resolved": "https://example.com/downloads/foo.tgz",
+                "integrity": INTEGRITY,
+            },
+        }), "npm")
+        self.assertEqual(entries, [
+            "https://example.com/downloads/foo.tgz;downloadfilename=npm2/foo.tgz;sha512sum=%s;subdir=npm/node_modules/foo;striplevel=1" % CHECKSUM,
+        ])
+
+    def test_git(self):
+        entries = oe.npm.shrinkwrap_src_uri(shrinkwrap({
+            "node_modules/foo": {
+                "version": "1.0.0",
+                "resolved": "git+ssh://git@github.com/example/foo.git#0123456789abcdef0123456789abcdef01234567",
+            },
+        }), "npm")
+        self.assertEqual(entries, [
+            "git://git@github.com/example/foo.git;protocol=ssh;rev=0123456789abcdef0123456789abcdef01234567;nobranch=1;destsuffix=npm/node_modules/foo",
+        ])
+
+    def test_skipped(self):
+        dev = registry("dev", "1.0.0")
+        dev["dev"] = True
+        bundled = registry("bundled", "1.0.0")
+        bundled["inBundle"] = True
+        no_resolved = registry("dup", "1.0.0")
+        del no_resolved["resolved"]
+        packages = {
+            "node_modules/dev": dev,
+            "node_modules/bundled": bundled,
+            "node_modules/dup": no_resolved,
+        }
+        self.assertEqual(oe.npm.shrinkwrap_src_uri(shrinkwrap(packages), "npm"), [])
+        self.assertEqual(len(oe.npm.shrinkwrap_src_uri(shrinkwrap(packages), "npm", dev=True)), 1)
+
+    def test_unsupported(self):
+        for dep in ({"version": "1.0.0", "resolved": "file:../foo"},
+                    {"link": True, "resolved": "../foo"},
+                    {"version": "1.0.0"}):
+            with self.assertRaises(ValueError):
+                oe.npm.shrinkwrap_src_uri(shrinkwrap({"node_modules/foo": dep}), "npm")
+
+
+class TestSrcUriDifferences(TestCase):
+    EXPECTED = [
+        "npm://registry.npmjs.org/;package=foo;version=1.0.0;sha512sum=%s;destsuffix=npm/node_modules/foo" % CHECKSUM,
+        "npm://registry.npmjs.org/;package=bar;version=2.0.0;sha512sum=%s;destsuffix=npm/node_modules/bar" % CHECKSUM,
+    ]
+
+    def test_match(self):
+        # The order of the entries and of the URL parameters does not matter.
+        # Entries that do not unpack into node_modules are not extra.
+        src_uri = [
+            "npm://registry.npmjs.org/;package=main;version=1.0.0;sha512sum=%s" % CHECKSUM,
+            "file://npm-shrinkwrap.json;subdir=npm",
+            self.EXPECTED[1],
+            "npm://registry.npmjs.org/;destsuffix=npm/node_modules/foo;sha512sum=%s;version=1.0.0;package=foo" % CHECKSUM,
+        ]
+        self.assertEqual(oe.npm.src_uri_differences(self.EXPECTED, src_uri), ([], []))
+
+    def test_missing_and_extra(self):
+        old_bar = "npm://registry.npmjs.org/;package=bar;version=1.0.0;sha512sum=%s;destsuffix=npm/node_modules/bar" % CHECKSUM
+        missing, extra = oe.npm.src_uri_differences(self.EXPECTED, [self.EXPECTED[0], old_bar])
+        self.assertEqual(missing, [self.EXPECTED[1]])
+        self.assertEqual(extra, [old_bar])
-- 
2.56.1

