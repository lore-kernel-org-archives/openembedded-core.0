Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533D1C02192
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11488.1735723937672143311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RgtNtFfC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3Lp3ZkPg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019421358da3-d32cbedf-2fb1-45f1-8694-f43e34bb8596-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3YzsBXp10Zc4o7/TnYjVWt7N5AC6URiG7+GVsucjbN0=;
	b=RgtNtFfCWRVcRxijjW9Lq8ZKS6nQfc/ozmcqJvqRqghgYoAZZOl1xm0wYP4y9AFp
	K7Ngw5r0rDbDIcsXRXUa29Sh8QRi5VdHIK0rTlVqd5Q4j8Pf9iyVYcp0jofgiQZYlUG
	TMu/PNCq1Q7lT+NCo3r/viJcVF0LRT1kAWu4Kmes=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3YzsBXp10Zc4o7/TnYjVWt7N5AC6URiG7+GVsucjbN0=;
	b=3Lp3ZkPgMWLC7+ZI4zcwyunH1WTV9hhtXN7y51ISDrllFXPDT8s9VQDzxbHaWLLx
	y+bNU1QQrbiIgvcCLYYEzSopoLF5Vd7GUZqTOTgSh1PaqOk1u9yFV1QC70Qi8MSiQJ+
	aJIW/TPxrZ442Jjta+5yv2hZuncqY1PPWtoe43Ko=
Content-Type: multipart/mixed; boundary="===============8635296425685278966=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jinja2: upgrading to 3.1.5 SUCCEEDED
Message-ID: <0101019421358da3-d32cbedf-2fb1-45f1-8694-f43e34bb8596-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209213

--===============8635296425685278966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jinja2* to *3.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jinja2-upgrade-3.1.4-3.1.5.patch
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
From c46bb9d47eff5793ce4d4ff9fa244c497e735c8e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:02:12 +0000
Subject: [PATCH] python3-jinja2: upgrade 3.1.4 -> 3.1.5

---
 .../python/python3-jinja2/fix-3.13.patch      | 87 -------------------
 ...inja2_3.1.4.bb => python3-jinja2_3.1.5.bb} |  7 +-
 2 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch b/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
deleted file mode 100644
index 34ecd15176..0000000000
--- a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From cf6ba7732b49ab4637aa747186cf1d1572688584 Mon Sep 17 00:00:00 2001
-From: Thomas Grainger <tagrain@gmail.com>
-Date: Mon, 13 May 2024 18:02:35 +0100
-Subject: [PATCH] fix test_package_zip_list on 3.13
-
-Upstream-Status: Backport [https://github.com/pallets/jinja/pull/1979]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/jinja2/loaders.py | 32 ++++++++++++++++++++++++++------
- tests/test_loader.py  |  4 ++--
- 2 files changed, 28 insertions(+), 8 deletions(-)
-
-diff --git a/src/jinja2/loaders.py b/src/jinja2/loaders.py
-index 9eaf647..8c2c86c 100644
---- a/src/jinja2/loaders.py
-+++ b/src/jinja2/loaders.py
-@@ -238,6 +238,30 @@ class FileSystemLoader(BaseLoader):
-         return sorted(found)
- 
- 
-+if sys.version_info >= (3, 13):
-+
-+    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
-+        try:
-+            get_files = z._get_files
-+        except AttributeError as e:
-+            raise TypeError(
-+                "This zip import does not have the required"
-+                " metadata to list templates."
-+            ) from e
-+        return get_files()
-+else:
-+
-+    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
-+        try:
-+            files = z._files
-+        except AttributeError as e:
-+            raise TypeError(
-+                "This zip import does not have the required"
-+                " metadata to list templates."
-+            ) from e
-+        return files  # type: ignore[no-any-return]
-+
-+
- class PackageLoader(BaseLoader):
-     """Load templates from a directory in a Python package.
- 
-@@ -382,11 +406,7 @@ class PackageLoader(BaseLoader):
-                     for name in filenames
-                 )
-         else:
--            if not hasattr(self._loader, "_files"):
--                raise TypeError(
--                    "This zip import does not have the required"
--                    " metadata to list templates."
--                )
-+            files = _get_zipimporter_files(self._loader)
- 
-             # Package is a zip file.
-             prefix = (
-@@ -395,7 +415,7 @@ class PackageLoader(BaseLoader):
-             )
-             offset = len(prefix)
- 
--            for name in self._loader._files.keys():
-+            for name in files:
-                 # Find names under the templates directory that aren't directories.
-                 if name.startswith(prefix) and name[-1] != os.path.sep:
-                     results.append(name[offset:].replace(os.path.sep, "/"))
-diff --git a/tests/test_loader.py b/tests/test_loader.py
-index 77d686e..e0683e4 100644
---- a/tests/test_loader.py
-+++ b/tests/test_loader.py
-@@ -364,8 +364,8 @@ def test_package_zip_source(package_zip_loader, template, expect):
- 
- 
- @pytest.mark.xfail(
--    platform.python_implementation() == "PyPy",
--    reason="PyPy's zipimporter doesn't have a '_files' attribute.",
-+    sys.implementation.name == "pypy",
-+    reason="zipimporter doesn't have a '_files' attribute",
-     raises=TypeError,
- )
- def test_package_zip_list(package_zip_loader):
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
index fd0afc1cb1..e5212e7ffc 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
+SRC_URI[sha256sum] = "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
 
 PYPI_PACKAGE = "jinja2"
 
@@ -14,10 +14,7 @@ CLEANBROKEN = "1"
 
 inherit pypi python_flit_core ptest
 
-SRC_URI += " \
-	file://run-ptest \
-	file://fix-3.13.patch \
-"
+SRC_URI += "file://run-ptest"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.44.1


--===============8635296425685278966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jinja2: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jinja2/jinja2-3.1.4.tar.gz;downloadfilename=jinja2-3.1.4.tar.gz file://run-ptest file://fix-3.13.patch" to "https://files.pythonhosted.org/packages/source/j/jinja2/jinja2-3.1.5.tar.gz;downloadfilename=jinja2-3.1.5.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dbg: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dbg: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dev: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dev: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-doc: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-doc: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-locale: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-locale: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-ptest: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGSIZE changed from 264507 to 275596 (+4%)
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-src: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-src: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-staticdev: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-staticdev: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2: PKGV changed from 3.1.4 [default] to 3.1.5 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2: PV changed from "3.1.4" to "3.1.5"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2: PKGSIZE changed from 1161838 to 1171360 (+1%)
Changes to packages/core2-64-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.13/site-packages/jinja2-3.1.4.dist-info moved to /usr/lib/python3.13/site-packages/jinja2-3.1.5.dist-info

--===============8635296425685278966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.13/site-packages/jinja2-3.1.4.dist-info moved to /usr/lib/python3.13/site-packages/jinja2-3.1.5.dist-info

--===============8635296425685278966==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jinja2-upgrade-3.1.4-3.1.5.patch"

RnJvbSBjNDZiYjlkNDdlZmY1NzkzY2U0ZDRmZjlmYTI0NGM0OTdlNzM1YzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzowMjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtamluamEyOiB1cGdyYWRlIDMuMS40IC0+IDMuMS41CgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1qaW5qYTIvZml4LTMuMTMucGF0Y2ggICAgICB8IDg3IC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLmluamEyXzMuMS40LmJiID0+IHB5dGhvbjMtamluamEyXzMuMS41LmJifSB8ICA3ICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOTIgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWppbmphMi9m
aXgtMy4xMy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtamluamEyXzMuMS40LmJiID0+IHB5dGhvbjMtamluamEyXzMuMS41LmJifSAoODUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qaW5qYTIvZml4
LTMuMTMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtamluamEy
L2ZpeC0zLjEzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzNGVjZDE1MTc2
Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1q
aW5qYTIvZml4LTMuMTMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw4NyArMCwwIEBACi1Gcm9t
IGNmNmJhNzczMmI0OWFiNDYzN2FhNzQ3MTg2Y2YxZDE1NzI2ODg1ODQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBUaG9tYXMgR3JhaW5nZXIgPHRhZ3JhaW5AZ21haWwuY29tPgotRGF0
ZTogTW9uLCAxMyBNYXkgMjAyNCAxODowMjozNSArMDEwMAotU3ViamVjdDogW1BBVENIXSBmaXgg
dGVzdF9wYWNrYWdlX3ppcF9saXN0IG9uIDMuMTMKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9y
dCBbaHR0cHM6Ly9naXRodWIuY29tL3BhbGxldHMvamluamEvcHVsbC8xOTc5XQotU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHNyYy9q
aW5qYTIvbG9hZGVycy5weSB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCi0g
dGVzdHMvdGVzdF9sb2FkZXIucHkgIHwgIDQgKystLQotIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9qaW5qYTIvbG9h
ZGVycy5weSBiL3NyYy9qaW5qYTIvbG9hZGVycy5weQotaW5kZXggOWVhZjY0Ny4uOGMyYzg2YyAx
MDA2NDQKLS0tLSBhL3NyYy9qaW5qYTIvbG9hZGVycy5weQotKysrIGIvc3JjL2ppbmphMi9sb2Fk
ZXJzLnB5Ci1AQCAtMjM4LDYgKzIzOCwzMCBAQCBjbGFzcyBGaWxlU3lzdGVtTG9hZGVyKEJhc2VM
b2FkZXIpOgotICAgICAgICAgcmV0dXJuIHNvcnRlZChmb3VuZCkKLSAKLSAKLStpZiBzeXMudmVy
c2lvbl9pbmZvID49ICgzLCAxMyk6Ci0rCi0rICAgIGRlZiBfZ2V0X3ppcGltcG9ydGVyX2ZpbGVz
KHo6IHQuQW55KSAtPiB0LkRpY3Rbc3RyLCBvYmplY3RdOgotKyAgICAgICAgdHJ5OgotKyAgICAg
ICAgICAgIGdldF9maWxlcyA9IHouX2dldF9maWxlcwotKyAgICAgICAgZXhjZXB0IEF0dHJpYnV0
ZUVycm9yIGFzIGU6Ci0rICAgICAgICAgICAgcmFpc2UgVHlwZUVycm9yKAotKyAgICAgICAgICAg
ICAgICAiVGhpcyB6aXAgaW1wb3J0IGRvZXMgbm90IGhhdmUgdGhlIHJlcXVpcmVkIgotKyAgICAg
ICAgICAgICAgICAiIG1ldGFkYXRhIHRvIGxpc3QgdGVtcGxhdGVzLiIKLSsgICAgICAgICAgICAp
IGZyb20gZQotKyAgICAgICAgcmV0dXJuIGdldF9maWxlcygpCi0rZWxzZToKLSsKLSsgICAgZGVm
IF9nZXRfemlwaW1wb3J0ZXJfZmlsZXMoejogdC5BbnkpIC0+IHQuRGljdFtzdHIsIG9iamVjdF06
Ci0rICAgICAgICB0cnk6Ci0rICAgICAgICAgICAgZmlsZXMgPSB6Ll9maWxlcwotKyAgICAgICAg
ZXhjZXB0IEF0dHJpYnV0ZUVycm9yIGFzIGU6Ci0rICAgICAgICAgICAgcmFpc2UgVHlwZUVycm9y
KAotKyAgICAgICAgICAgICAgICAiVGhpcyB6aXAgaW1wb3J0IGRvZXMgbm90IGhhdmUgdGhlIHJl
cXVpcmVkIgotKyAgICAgICAgICAgICAgICAiIG1ldGFkYXRhIHRvIGxpc3QgdGVtcGxhdGVzLiIK
LSsgICAgICAgICAgICApIGZyb20gZQotKyAgICAgICAgcmV0dXJuIGZpbGVzICAjIHR5cGU6IGln
bm9yZVtuby1hbnktcmV0dXJuXQotKwotKwotIGNsYXNzIFBhY2thZ2VMb2FkZXIoQmFzZUxvYWRl
cik6Ci0gICAgICIiIkxvYWQgdGVtcGxhdGVzIGZyb20gYSBkaXJlY3RvcnkgaW4gYSBQeXRob24g
cGFja2FnZS4KLSAKLUBAIC0zODIsMTEgKzQwNiw3IEBAIGNsYXNzIFBhY2thZ2VMb2FkZXIoQmFz
ZUxvYWRlcik6Ci0gICAgICAgICAgICAgICAgICAgICBmb3IgbmFtZSBpbiBmaWxlbmFtZXMKLSAg
ICAgICAgICAgICAgICAgKQotICAgICAgICAgZWxzZToKLS0gICAgICAgICAgICBpZiBub3QgaGFz
YXR0cihzZWxmLl9sb2FkZXIsICJfZmlsZXMiKToKLS0gICAgICAgICAgICAgICAgcmFpc2UgVHlw
ZUVycm9yKAotLSAgICAgICAgICAgICAgICAgICAgIlRoaXMgemlwIGltcG9ydCBkb2VzIG5vdCBo
YXZlIHRoZSByZXF1aXJlZCIKLS0gICAgICAgICAgICAgICAgICAgICIgbWV0YWRhdGEgdG8gbGlz
dCB0ZW1wbGF0ZXMuIgotLSAgICAgICAgICAgICAgICApCi0rICAgICAgICAgICAgZmlsZXMgPSBf
Z2V0X3ppcGltcG9ydGVyX2ZpbGVzKHNlbGYuX2xvYWRlcikKLSAKLSAgICAgICAgICAgICAjIFBh
Y2thZ2UgaXMgYSB6aXAgZmlsZS4KLSAgICAgICAgICAgICBwcmVmaXggPSAoCi1AQCAtMzk1LDcg
KzQxNSw3IEBAIGNsYXNzIFBhY2thZ2VMb2FkZXIoQmFzZUxvYWRlcik6Ci0gICAgICAgICAgICAg
KQotICAgICAgICAgICAgIG9mZnNldCA9IGxlbihwcmVmaXgpCi0gCi0tICAgICAgICAgICAgZm9y
IG5hbWUgaW4gc2VsZi5fbG9hZGVyLl9maWxlcy5rZXlzKCk6Ci0rICAgICAgICAgICAgZm9yIG5h
bWUgaW4gZmlsZXM6Ci0gICAgICAgICAgICAgICAgICMgRmluZCBuYW1lcyB1bmRlciB0aGUgdGVt
cGxhdGVzIGRpcmVjdG9yeSB0aGF0IGFyZW4ndCBkaXJlY3Rvcmllcy4KLSAgICAgICAgICAgICAg
ICAgaWYgbmFtZS5zdGFydHN3aXRoKHByZWZpeCkgYW5kIG5hbWVbLTFdICE9IG9zLnBhdGguc2Vw
OgotICAgICAgICAgICAgICAgICAgICAgcmVzdWx0cy5hcHBlbmQobmFtZVtvZmZzZXQ6XS5yZXBs
YWNlKG9zLnBhdGguc2VwLCAiLyIpKQotZGlmZiAtLWdpdCBhL3Rlc3RzL3Rlc3RfbG9hZGVyLnB5
IGIvdGVzdHMvdGVzdF9sb2FkZXIucHkKLWluZGV4IDc3ZDY4NmUuLmUwNjgzZTQgMTAwNjQ0Ci0t
LS0gYS90ZXN0cy90ZXN0X2xvYWRlci5weQotKysrIGIvdGVzdHMvdGVzdF9sb2FkZXIucHkKLUBA
IC0zNjQsOCArMzY0LDggQEAgZGVmIHRlc3RfcGFja2FnZV96aXBfc291cmNlKHBhY2thZ2Vfemlw
X2xvYWRlciwgdGVtcGxhdGUsIGV4cGVjdCk6Ci0gCi0gCi0gQHB5dGVzdC5tYXJrLnhmYWlsKAot
LSAgICBwbGF0Zm9ybS5weXRob25faW1wbGVtZW50YXRpb24oKSA9PSAiUHlQeSIsCi0tICAgIHJl
YXNvbj0iUHlQeSdzIHppcGltcG9ydGVyIGRvZXNuJ3QgaGF2ZSBhICdfZmlsZXMnIGF0dHJpYnV0
ZS4iLAotKyAgICBzeXMuaW1wbGVtZW50YXRpb24ubmFtZSA9PSAicHlweSIsCi0rICAgIHJlYXNv
bj0iemlwaW1wb3J0ZXIgZG9lc24ndCBoYXZlIGEgJ19maWxlcycgYXR0cmlidXRlIiwKLSAgICAg
cmFpc2VzPVR5cGVFcnJvciwKLSApCi0gZGVmIHRlc3RfcGFja2FnZV96aXBfbGlzdChwYWNrYWdl
X3ppcF9sb2FkZXIpOgotLS0gCi0yLjM5LjUKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWppbmphMl8zLjEuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1qaW5qYTJfMy4xLjUuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWppbmphMl8z
LjEuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpp
bmphMl8zLjEuNS5iYgppbmRleCBmZDBhZmMxY2IxLi5lNTIxMmU3ZmZjIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtamluamEyXzMuMS40LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qaW5qYTJfMy4xLjUuYmIKQEAg
LTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9KaW5qYTIv
IgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLnR4dDttZDU9NWRjODgzMDA3ODZmMWMyMTRjMWU5ODI3YTUyMjk0NjIiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI0YTNhZWU3YWNiYmU3MzAzYWVkZThlOTY0OGQxM2I4YmY4OGE0Mjky
ODJhYTYxMjJhOTkzZjBhYzgwMGNiMzY5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmZWZmZjhk
YzMwMzRlMjdiYjgwZDY3YzY3MWViOGE5YmM0MjRjMGVmNGMwODI2ZWRiZmYzMDRjY2VmZjQzYmIi
CiAKIFBZUElfUEFDS0FHRSA9ICJqaW5qYTIiCiAKQEAgLTE0LDEwICsxNCw3IEBAIENMRUFOQlJP
S0VOID0gIjEiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlIHB0ZXN0CiAKLVNSQ19V
UkkgKz0gIiBcCi0JZmlsZTovL3J1bi1wdGVzdCBcCi0JZmlsZTovL2ZpeC0zLjEzLnBhdGNoIFwK
LSIKK1NSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiCiAKIGRvX2luc3RhbGxfcHRlc3QoKSB7
CiAgICAgaW5zdGFsbCAtZCAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cwotLSAKMi40NC4xCgo=

--===============8635296425685278966==--

