Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6264.1795819739501534634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 14:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qm5i/TmQ;
 spf=pass (domain: konsulko.com, ip: 209.85.214.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0464dd6b6so52628115ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795819739; x=1796424539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vP3HFuZSFvIOOulvs0EUagnBG54yDVvp8MNGFIngTTU=;
        b=qm5i/TmQVYyAHemTPG5qLOaHIFV6obvZOI2oa9bq0Pd0Ur3X6V/XtL82KMyfg7XcxP
         Kfdaoij/dyh0CAd5Ljyr0lTX0E04qwJXMvfBpkJRV1FZ9PRO7ux5Z39P+pWTrRpa6L1E
         nBm63n+nNsu5vBnW+Rd3QNUAzmrl/2mC/SbSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819739; x=1796424539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP3HFuZSFvIOOulvs0EUagnBG54yDVvp8MNGFIngTTU=;
        b=mCg/jNfHnLMJFkhDWMyxQ5RprsjDpC2cDNPCki75J4Z0m/hV8zU5amRiUPTgQeo3dU
         WZQ+ZPp4bteL14Ln+4Vzxfnctj42LJtZamaIE7CZHREqfefBsVPtK5UfDo+Mz2mzfImG
         rgqAjTyws2cunRyTQvBszdu1tUBgwN6O5KVGzaqQiOCdrhgajnLnm2hHkHCd/oVo+4bv
         Eb1LWM5y6E99SCZWcyhjaToBAqFPCNv+3vKF+UvSkjq+m8DgC4+9ZI0NWptO69FNVzH8
         uomrivMzVW+yWO+iemTJTPTrmrZ/ajHEEe3ARe48v+YyBX9VAvT0KAw4NEqcib9R7v1n
         Ycyw==
X-Gm-Message-State: APuU4Z/xgIam0vk8t0P3Q+gVIMtLZj0jtiRC/8OD2ivZVrHPK+NxuNHU
	uXFyG9ZvIUMCMECNTjRrjACGmD/9MTxKK5DoEvrC9K4QJ3CWKaHGyInQgrdWg5B6BbN0N4ZYxNE
	CxrEtJao=
X-Gm-Gg: AZFdTZcmoFSGUq2e5Vqul/Yfurvef38dWIAVmJ9n0zT6Hef80DT0SD/TGrb8QkjBfKK
	VNLW8D7r+uzl6GpPl6ZHlYhyjtjSK8UnrGTiFP7HEdjcC7qCg4u8yx6YS5GAyihfTtDVo3udfJc
	srpE/KhaLHIbGhFuWLMVu+RrzyUuUhsLQHcJMTr2nZ/UyRAJj5Ufrx4AhBECnwzefySJwS4x8tj
	m0GfUDuEeND/N3C9t+T0hbbcutWqmfMWBW+uYJVfZ50vDuIBIPegkXp8JMJWEoeFfQrwQeLNQ3X
	FsWIimVz2VrsEgCNk1F8EPcbNxp0nQ9uCp3i06A47l2vcG3kC5AEVjFcCQv9n7GaFq4yZfhXT1S
	X33GESxO6VPur5d1j0QzyvA29SvFaQ9MZmvg65qOOCACxPvx4nT17MAiJcMd3KASrqMktno1R/I
	X+bMAd6wlbtypMoWNpnJvGc1RjT+Dd2sjJRK1X53lt1nx+ZVp1MGukI9ZNygqI4770sXhZtXRZK
	YrV9Vm7Sk/Kj5G09ElYB3aOoDJoF1clfnlb4yZeecgFDVFHu98b/+8V6zGjPqIhLlVX9tvXV89U
	BU9wm72o7j0/JXIJ/flOtIh0rsEGapoy76+lKCFeeSGIu50P65JpouyA9VKiEX1Mk+Cc1cEYQHs
	uQNedqjlCBq02TGqmVWJroq8pPrcyz45hQRwBgn1ZEACrR/ss0v3ns6YdAULF5rxevw==
X-Received: by 2002:a17:903:4586:b0:2ef:e547:e0cd with SMTP id d9443c01a7336-2f03f1707d4mr281766615ad.31.1795819738700;
        Fri, 27 Nov 2026 14:48:58 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm126594025ad.10.2026.11.27.14.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:48:58 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-packaging: upgrade 26.3 -> 26.4
Date: Fri, 27 Nov 2026 14:48:53 -0800
Message-ID: <20261127224853.51596-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 22:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251464
Content-Type: text/plain; charset="utf-8"

Drop reliable-test.patch, it is upstream (pypa/packaging#1407).
Add DESCRIPTION from the upstream README.

Changelog: https://github.com/pypa/packaging/blob/26.4/CHANGELOG.rst
- Drop support for Python 3.9.
- Add markers.prepare_environment(), Marker.evaluate_prepared(),
  tags.interpreter_abi() and new VersionRange methods.
- Add __replace__ to Requirement, Specifier and SpecifierSet.
- Many fixes for specifiers, markers, metadata, tags and pylock.
- Lazy imports on Python 3.15+, faster parsing.

Tested with core-image-ptest-python3-packaging on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python3-packaging/reliable-test.patch     | 79 -------------------
 ...ging_26.3.bb => python3-packaging_26.4.bb} |  9 ++-
 2 files changed, 6 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-packaging/reliable-test.patch
 rename meta/recipes-devtools/python/{python3-packaging_26.3.bb => python3-packaging_26.4.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-packaging/reliable-test.patch b/meta/recipes-devtools/python/python3-packaging/reliable-test.patch
deleted file mode 100644
index f830917f97..0000000000
--- a/meta/recipes-devtools/python/python3-packaging/reliable-test.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From ef837aad3127167671eb37b9f6bd8a94ec7ce26e Mon Sep 17 00:00:00 2001
-From: Louis Deconinck <louis.dck@gmail.com>
-Date: Tue, 13 Oct 2026 21:17:05 +0200
-Subject: [PATCH] test: avoid filtering compatible release examples (#1407)
-
-Assisted-by: Codex
-
-Signed-off-by: Louis Deconinck <louis.dck@gmail.com>
-
-Upstream-Status: Backport [https://github.com/pypa/packaging/pull/1407]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tests/property/strategies.py              | 13 ++++++++++++-
- tests/property/test_specifier_matching.py |  7 ++++---
- 2 files changed, 16 insertions(+), 4 deletions(-)
-
-diff --git a/tests/property/strategies.py b/tests/property/strategies.py
-index 4ce828b76..b42b6dcb4 100644
---- a/tests/property/strategies.py
-+++ b/tests/property/strategies.py
-@@ -85,9 +85,11 @@ def pep440_versions(
-     *,
-     include_local: bool = True,
-     min_segments: int = 1,
-+    epoch: int | None = None,
- ) -> Version:
-     """Generate a random PEP 440 version."""
--    epoch = draw(st.sampled_from([None, 0, 1, 2, 3]))
-+    if epoch is None:
-+        epoch = draw(st.sampled_from([None, 0, 1, 2, 3]))
-     num_segments = draw(st.integers(min_value=min_segments, max_value=4))
-     release = tuple(draw(small_ints) for _ in range(num_segments))
- 
-@@ -153,6 +155,15 @@ def multi_segment_versions(draw: st.DrawFn) -> Version:
-     return v
- 
- 
-+@st.composite
-+def compatible_release_version_pairs(draw: st.DrawFn) -> tuple[Version, Version]:
-+    """Generate compatible-release examples whose versions share an epoch."""
-+    epoch = draw(st.integers(min_value=0, max_value=3))
-+    spec_ver = draw(pep440_versions(include_local=False, min_segments=2, epoch=epoch))
-+    candidate = draw(pep440_versions(epoch=epoch))
-+    return spec_ver, candidate
-+
-+
- @st.composite
- def versions_with_local(draw: st.DrawFn) -> Version:
-     """Generate a PEP 440 version that always has a local segment."""
-diff --git a/tests/property/test_specifier_matching.py b/tests/property/test_specifier_matching.py
-index 4552ce8ce..d85eadaa7 100644
---- a/tests/property/test_specifier_matching.py
-+++ b/tests/property/test_specifier_matching.py
-@@ -12,6 +12,7 @@
- from packaging.version import Version
- from tests.property.strategies import (
-     SETTINGS,
-+    compatible_release_version_pairs,
-     multi_segment_versions,
-     nonlocal_versions,
-     ops,
-@@ -198,14 +199,14 @@ class TestCompatibleReleaseDefinition:
-     and a version identifier. It matches any candidate version that is expected
-     to be compatible with the specified version."""
- 
--    @given(spec_ver=multi_segment_versions(), candidate=pep440_versions())
-+    @given(versions=compatible_release_version_pairs())
-     @SETTINGS
-     def test_compatible_release_matches_expected_compatible(
--        self, spec_ver: Version, candidate: Version
-+        self, versions: tuple[Version, Version]
-     ) -> None:
-         """~=V matches candidate iff candidate >= V and candidate matches the
-         prefix wildcard derived from V."""
--        assume(spec_ver.epoch == candidate.epoch)
-+        spec_ver, candidate = versions
-         spec = Specifier(f"~={spec_ver}")
-         result = candidate in spec
-         # Also check via the expanded form
diff --git a/meta/recipes-devtools/python/python3-packaging_26.3.bb b/meta/recipes-devtools/python/python3-packaging_26.4.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-packaging_26.3.bb
rename to meta/recipes-devtools/python/python3-packaging_26.4.bb
index 628d8d7aa1..daeb250127 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.4.bb
@@ -1,12 +1,15 @@
 SUMMARY = "Core utilities for Python packages"
+DESCRIPTION = "\
+Reusable core utilities for the Python packaging interoperability \
+specifications: version handling, specifiers, markers, requirements, \
+tags, metadata, lockfiles and other utilities."
 HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 OR BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
+SRC_URI[sha256sum] = "c4b671c41ddb9bf26e543c37723610d28fb6bf7affc4da17cf048d419d2c062a"
 
-SRC_URI += "file://run-ptest.in \
-            file://reliable-test.patch"
+SRC_URI += "file://run-ptest.in"
 
 inherit pypi python_flit_core ptest
 
-- 
2.56.1

