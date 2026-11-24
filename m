Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12769.1795501916132335539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=clMFAj7U;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=v0hM4gFV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a20c40fc65-90af38cb-cb53-4982-b52f-a498d1742d67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795501915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Il1VnnoPF8C014+UeisVtXLQwykZIfc6oZtfUMtr3BE=;
	b=clMFAj7UK4NQQsiCTOQOcJ9ulMqpcMTkHAR6i1W2eGSC8gd/BIcYDrpczgm/+7FX
	v/hOyT9b3trLMPMCJ1RMZJvctxHt/XYMkNEjDSRtvBB9givxLK8UJpd8l8EEVm4RnKP
	jxp/Zut+2KAqm/CZZpzt7OkT7xTyghi0kXEDeNG0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795501915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Il1VnnoPF8C014+UeisVtXLQwykZIfc6oZtfUMtr3BE=;
	b=v0hM4gFVkH5tSLPu8ANGpEcrERlegAW5Kv1La74vKxLoa5+EgP1IwLdVwG96HQJ6
	GpLPw2puISCJ8VdOyzRuDt/7Xt193SqynoTCQKAwVFcs8UrR+xkJ4uUPD0lUWnmm1Nr
	F0XgaPAgDYSISRFXN/M2Z7mrhodcuZiZe5/rnq9w=
Content-Type: multipart/mixed; boundary="===============5085878108949527547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 26.4 SUCCEEDED
Message-ID: <010101a20c40fc65-90af38cb-cb53-4982-b52f-a498d1742d67-000000@us-west-2.amazonses.com>
Date: Tue, 24 Nov 2026 06:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250956

--===============5085878108949527547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-packaging* to *26.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-26.3-26.4.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 1023f91758a1d0d1343ba67c82d4120e4a6274f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 24 Nov 2026 05:55:09 +0000
Subject: [PATCH] python3-packaging: upgrade 26.3 -> 26.4

26.4 - 2026-11-23
~~~~~~~~~~~~~~~~~

Removals:
Features:
Behavior adaptations:
Fixes for versions and specifiers:
Fixes for requirements and markers:
Fixes for metadata and licenses:
Fixes for tags and filenames:
Fixes for pylock and dependency groups:
Performance:
Documentation:
Benchmarks:
Internal:
---
 .../python3-packaging/reliable-test.patch     | 79 -------------------
 ...ging_26.3.bb => python3-packaging_26.4.bb} |  5 +-
 2 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-packaging/reliable-test.patch
 rename meta/recipes-devtools/python/{python3-packaging_26.3.bb => python3-packaging_26.4.bb} (87%)

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
similarity index 87%
rename from meta/recipes-devtools/python/python3-packaging_26.3.bb
rename to meta/recipes-devtools/python/python3-packaging_26.4.bb
index 628d8d7aa1..1cf3f1563b 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.4.bb
@@ -3,10 +3,9 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 OR BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
+SRC_URI[sha256sum] = "c4b671c41ddb9bf26e543c37723610d28fb6bf7affc4da17cf048d419d2c062a"
 
-SRC_URI += "file://run-ptest.in \
-            file://reliable-test.patch"
+SRC_URI += "file://run-ptest.in"
 
 inherit pypi python_flit_core ptest
 
-- 
2.47.1


--===============5085878108949527547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 882899 to 1022046 (+16%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: added "/usr/lib/python3-packaging/ptest/tests/property/test_markers_prepared_environment.py /usr/lib/python3-packaging/ptest/tests/test_tokenizer.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_fast_match.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_overlapping_literals.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.15/site-packages/packaging-26.3.dist-info -> /usr/lib/python3.15/site-packages/packaging-26.4.dist-info, directory renamed /usr/lib/python3.15/site-packages/packaging-26.3.dist-info/licenses -> /usr/lib/python3.15/site-packages/packaging-26.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.15/site-packages/packaging-26.3.dist-info moved to /usr/lib/python3.15/site-packages/packaging-26.4.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.15/site-packages/packaging-26.3.dist-info moved to /usr/lib/python3.15/site-packages/packaging-26.4.dist-info

--===============5085878108949527547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-26.3-26.4.patch"

RnJvbSAxMDIzZjkxNzU4YTFkMGQxMzQzYmE2N2M4MmQ0MTIwZTRhNjI3NGY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjQgTm92IDIwMjYgMDU6NTU6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyNi4zIC0+IDI2LjQKCjI2LjQgLSAyMDI2LTExLTIz
Cn5+fn5+fn5+fn5+fn5+fn5+CgpSZW1vdmFsczoKRmVhdHVyZXM6CkJlaGF2aW9yIGFkYXB0YXRp
b25zOgpGaXhlcyBmb3IgdmVyc2lvbnMgYW5kIHNwZWNpZmllcnM6CkZpeGVzIGZvciByZXF1aXJl
bWVudHMgYW5kIG1hcmtlcnM6CkZpeGVzIGZvciBtZXRhZGF0YSBhbmQgbGljZW5zZXM6CkZpeGVz
IGZvciB0YWdzIGFuZCBmaWxlbmFtZXM6CkZpeGVzIGZvciBweWxvY2sgYW5kIGRlcGVuZGVuY3kg
Z3JvdXBzOgpQZXJmb3JtYW5jZToKRG9jdW1lbnRhdGlvbjoKQmVuY2htYXJrczoKSW50ZXJuYWw6
Ci0tLQogLi4uL3B5dGhvbjMtcGFja2FnaW5nL3JlbGlhYmxlLXRlc3QucGF0Y2ggICAgIHwgNzkg
LS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uZ2luZ18yNi4zLmJiID0+IHB5dGhvbjMtcGFja2FnaW5n
XzI2LjQuYmJ9IHwgIDUgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4MiBk
ZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcGFja2FnaW5nL3JlbGlhYmxlLXRlc3QucGF0Y2gKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhY2thZ2luZ18yNi4zLmJiID0+IHB5dGhv
bjMtcGFja2FnaW5nXzI2LjQuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZy9yZWxpYWJsZS10ZXN0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZy9yZWxpYWJsZS10ZXN0
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmODMwOTE3Zjk3Li4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmcv
cmVsaWFibGUtdGVzdC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDc5ICswLDAgQEAKLUZyb20g
ZWY4MzdhYWQzMTI3MTY3NjcxZWIzN2I5ZjZiZDhhOTRlYzdjZTI2ZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IExvdWlzIERlY29uaW5jayA8bG91aXMuZGNrQGdtYWlsLmNvbT4KLURh
dGU6IFR1ZSwgMTMgT2N0IDIwMjYgMjE6MTc6MDUgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gdGVz
dDogYXZvaWQgZmlsdGVyaW5nIGNvbXBhdGlibGUgcmVsZWFzZSBleGFtcGxlcyAoIzE0MDcpCi0K
LUFzc2lzdGVkLWJ5OiBDb2RleAotCi1TaWduZWQtb2ZmLWJ5OiBMb3VpcyBEZWNvbmluY2sgPGxv
dWlzLmRja0BnbWFpbC5jb20+Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0aHViLmNvbS9weXBhL3BhY2thZ2luZy9wdWxsLzE0MDddCi1TaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIHRlc3RzL3Byb3BlcnR5L3N0cmF0
ZWdpZXMucHkgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrLQotIHRlc3RzL3Byb3BlcnR5
L3Rlc3Rfc3BlY2lmaWVyX21hdGNoaW5nLnB5IHwgIDcgKysrKy0tLQotIDIgZmlsZXMgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3Rlc3Rz
L3Byb3BlcnR5L3N0cmF0ZWdpZXMucHkgYi90ZXN0cy9wcm9wZXJ0eS9zdHJhdGVnaWVzLnB5Ci1p
bmRleCA0Y2U4MjhiNzYuLmI0MmI2ZGNiNCAxMDA2NDQKLS0tLSBhL3Rlc3RzL3Byb3BlcnR5L3N0
cmF0ZWdpZXMucHkKLSsrKyBiL3Rlc3RzL3Byb3BlcnR5L3N0cmF0ZWdpZXMucHkKLUBAIC04NSw5
ICs4NSwxMSBAQCBkZWYgcGVwNDQwX3ZlcnNpb25zKAotICAgICAqLAotICAgICBpbmNsdWRlX2xv
Y2FsOiBib29sID0gVHJ1ZSwKLSAgICAgbWluX3NlZ21lbnRzOiBpbnQgPSAxLAotKyAgICBlcG9j
aDogaW50IHwgTm9uZSA9IE5vbmUsCi0gKSAtPiBWZXJzaW9uOgotICAgICAiIiJHZW5lcmF0ZSBh
IHJhbmRvbSBQRVAgNDQwIHZlcnNpb24uIiIiCi0tICAgIGVwb2NoID0gZHJhdyhzdC5zYW1wbGVk
X2Zyb20oW05vbmUsIDAsIDEsIDIsIDNdKSkKLSsgICAgaWYgZXBvY2ggaXMgTm9uZToKLSsgICAg
ICAgIGVwb2NoID0gZHJhdyhzdC5zYW1wbGVkX2Zyb20oW05vbmUsIDAsIDEsIDIsIDNdKSkKLSAg
ICAgbnVtX3NlZ21lbnRzID0gZHJhdyhzdC5pbnRlZ2VycyhtaW5fdmFsdWU9bWluX3NlZ21lbnRz
LCBtYXhfdmFsdWU9NCkpCi0gICAgIHJlbGVhc2UgPSB0dXBsZShkcmF3KHNtYWxsX2ludHMpIGZv
ciBfIGluIHJhbmdlKG51bV9zZWdtZW50cykpCi0gCi1AQCAtMTUzLDYgKzE1NSwxNSBAQCBkZWYg
bXVsdGlfc2VnbWVudF92ZXJzaW9ucyhkcmF3OiBzdC5EcmF3Rm4pIC0+IFZlcnNpb246Ci0gICAg
IHJldHVybiB2Ci0gCi0gCi0rQHN0LmNvbXBvc2l0ZQotK2RlZiBjb21wYXRpYmxlX3JlbGVhc2Vf
dmVyc2lvbl9wYWlycyhkcmF3OiBzdC5EcmF3Rm4pIC0+IHR1cGxlW1ZlcnNpb24sIFZlcnNpb25d
OgotKyAgICAiIiJHZW5lcmF0ZSBjb21wYXRpYmxlLXJlbGVhc2UgZXhhbXBsZXMgd2hvc2UgdmVy
c2lvbnMgc2hhcmUgYW4gZXBvY2guIiIiCi0rICAgIGVwb2NoID0gZHJhdyhzdC5pbnRlZ2Vycyht
aW5fdmFsdWU9MCwgbWF4X3ZhbHVlPTMpKQotKyAgICBzcGVjX3ZlciA9IGRyYXcocGVwNDQwX3Zl
cnNpb25zKGluY2x1ZGVfbG9jYWw9RmFsc2UsIG1pbl9zZWdtZW50cz0yLCBlcG9jaD1lcG9jaCkp
Ci0rICAgIGNhbmRpZGF0ZSA9IGRyYXcocGVwNDQwX3ZlcnNpb25zKGVwb2NoPWVwb2NoKSkKLSsg
ICAgcmV0dXJuIHNwZWNfdmVyLCBjYW5kaWRhdGUKLSsKLSsKLSBAc3QuY29tcG9zaXRlCi0gZGVm
IHZlcnNpb25zX3dpdGhfbG9jYWwoZHJhdzogc3QuRHJhd0ZuKSAtPiBWZXJzaW9uOgotICAgICAi
IiJHZW5lcmF0ZSBhIFBFUCA0NDAgdmVyc2lvbiB0aGF0IGFsd2F5cyBoYXMgYSBsb2NhbCBzZWdt
ZW50LiIiIgotZGlmZiAtLWdpdCBhL3Rlc3RzL3Byb3BlcnR5L3Rlc3Rfc3BlY2lmaWVyX21hdGNo
aW5nLnB5IGIvdGVzdHMvcHJvcGVydHkvdGVzdF9zcGVjaWZpZXJfbWF0Y2hpbmcucHkKLWluZGV4
IDQ1NTJjZThjZS4uZDg1ZWFkYWE3IDEwMDY0NAotLS0tIGEvdGVzdHMvcHJvcGVydHkvdGVzdF9z
cGVjaWZpZXJfbWF0Y2hpbmcucHkKLSsrKyBiL3Rlc3RzL3Byb3BlcnR5L3Rlc3Rfc3BlY2lmaWVy
X21hdGNoaW5nLnB5Ci1AQCAtMTIsNiArMTIsNyBAQAotIGZyb20gcGFja2FnaW5nLnZlcnNpb24g
aW1wb3J0IFZlcnNpb24KLSBmcm9tIHRlc3RzLnByb3BlcnR5LnN0cmF0ZWdpZXMgaW1wb3J0ICgK
LSAgICAgU0VUVElOR1MsCi0rICAgIGNvbXBhdGlibGVfcmVsZWFzZV92ZXJzaW9uX3BhaXJzLAot
ICAgICBtdWx0aV9zZWdtZW50X3ZlcnNpb25zLAotICAgICBub25sb2NhbF92ZXJzaW9ucywKLSAg
ICAgb3BzLAotQEAgLTE5OCwxNCArMTk5LDE0IEBAIGNsYXNzIFRlc3RDb21wYXRpYmxlUmVsZWFz
ZURlZmluaXRpb246Ci0gICAgIGFuZCBhIHZlcnNpb24gaWRlbnRpZmllci4gSXQgbWF0Y2hlcyBh
bnkgY2FuZGlkYXRlIHZlcnNpb24gdGhhdCBpcyBleHBlY3RlZAotICAgICB0byBiZSBjb21wYXRp
YmxlIHdpdGggdGhlIHNwZWNpZmllZCB2ZXJzaW9uLiIiIgotIAotLSAgICBAZ2l2ZW4oc3BlY192
ZXI9bXVsdGlfc2VnbWVudF92ZXJzaW9ucygpLCBjYW5kaWRhdGU9cGVwNDQwX3ZlcnNpb25zKCkp
Ci0rICAgIEBnaXZlbih2ZXJzaW9ucz1jb21wYXRpYmxlX3JlbGVhc2VfdmVyc2lvbl9wYWlycygp
KQotICAgICBAU0VUVElOR1MKLSAgICAgZGVmIHRlc3RfY29tcGF0aWJsZV9yZWxlYXNlX21hdGNo
ZXNfZXhwZWN0ZWRfY29tcGF0aWJsZSgKLS0gICAgICAgIHNlbGYsIHNwZWNfdmVyOiBWZXJzaW9u
LCBjYW5kaWRhdGU6IFZlcnNpb24KLSsgICAgICAgIHNlbGYsIHZlcnNpb25zOiB0dXBsZVtWZXJz
aW9uLCBWZXJzaW9uXQotICAgICApIC0+IE5vbmU6Ci0gICAgICAgICAiIiJ+PVYgbWF0Y2hlcyBj
YW5kaWRhdGUgaWZmIGNhbmRpZGF0ZSA+PSBWIGFuZCBjYW5kaWRhdGUgbWF0Y2hlcyB0aGUKLSAg
ICAgICAgIHByZWZpeCB3aWxkY2FyZCBkZXJpdmVkIGZyb20gVi4iIiIKLS0gICAgICAgIGFzc3Vt
ZShzcGVjX3Zlci5lcG9jaCA9PSBjYW5kaWRhdGUuZXBvY2gpCi0rICAgICAgICBzcGVjX3Zlciwg
Y2FuZGlkYXRlID0gdmVyc2lvbnMKLSAgICAgICAgIHNwZWMgPSBTcGVjaWZpZXIoZiJ+PXtzcGVj
X3Zlcn0iKQotICAgICAgICAgcmVzdWx0ID0gY2FuZGlkYXRlIGluIHNwZWMKLSAgICAgICAgICMg
QWxzbyBjaGVjayB2aWEgdGhlIGV4cGFuZGVkIGZvcm0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMy5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuNC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cGFja2FnaW5nXzI2LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1wYWNrYWdpbmdfMjYuNC5iYgppbmRleCA2MjhkOGQ3YWExLi4xY2YzZjE1NjNiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2FnaW5n
XzI2LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2th
Z2luZ18yNi40LmJiCkBAIC0zLDEwICszLDkgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIu
Y29tL3B5cGEvcGFja2FnaW5nIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIE9SIEJTRC0yLUNsYXVz
ZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFh
OTBiMjA1YzkxNjc1NzhjZTkxIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTRlZGMyNTY0MjRh
ZjM4NzYyZWIzMTMwNmVlZDI4YmViOWYwZWZjNTBhODgzNzQ5MmM5ZDZmZDYwMDRhZWQ3OSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJjNGI2NzFjNDFkZGI5YmYyNmU1NDNjMzc3MjM2MTBkMjhmYjZi
ZjdhZmZjNGRhMTdjZjA0OGQ0MTlkMmMwNjJhIgogCi1TUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0
ZXN0LmluIFwKLSAgICAgICAgICAgIGZpbGU6Ly9yZWxpYWJsZS10ZXN0LnBhdGNoIgorU1JDX1VS
SSArPSAiZmlsZTovL3J1bi1wdGVzdC5pbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2Nv
cmUgcHRlc3QKIAotLSAKMi40Ny4xCgo=

--===============5085878108949527547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-packaging-changelog.txt"

26.4 - 2026-11-23
~~~~~~~~~~~~~~~~~

Removals:
Features:
Behavior adaptations:
Fixes for versions and specifiers:
Fixes for requirements and markers:
Fixes for metadata and licenses:
Fixes for tags and filenames:
Fixes for pylock and dependency groups:
Performance:
Documentation:
Benchmarks:
Internal:

--===============5085878108949527547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/*.la /lib/lib*.so"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/python3-packaging: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.3.tar.gz file://run-ptest.in file://reliable-test.patch" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.4.tar.gz file://run-ptest.in"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: added "/usr/lib/python3-packaging/ptest/tests/test_tokenizer.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_fast_match.py /usr/lib/python3-packaging/ptest/tests/property/test_markers_prepared_environment.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_overlapping_literals.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 882899 to 1022046 (+16%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGV changed from 26.3 [default] to 26.4 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.15/site-packages/packaging-26.3.dist-info -> /usr/lib/python3.15/site-packages/packaging-26.4.dist-info, directory renamed /usr/lib/python3.15/site-packages/packaging-26.3.dist-info/licenses -> /usr/lib/python3.15/site-packages/packaging-26.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PV changed from "26.3" to "26.4"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 1083531 to 1164266 (+7%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.15/site-packages/packaging-26.3.dist-info moved to /usr/lib/python3.15/site-packages/packaging-26.4.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.15/site-packages/packaging-26.3.dist-info moved to /usr/lib/python3.15/site-packages/packaging-26.4.dist-info

--===============5085878108949527547==--
