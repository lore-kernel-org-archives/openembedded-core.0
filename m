Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AA1C982D6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33966.1789629010940299901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aAXZZd0v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1FzqAtIf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0ae3390a6-b5260702-4712-4d27-8f95-35045717f873-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g8+TTWDrfvbnURKHfnszzVmMCmlSIySFt60avmwDf6M=;
	b=aAXZZd0vuBbK3WWIfMDKdYYYdIZGnQwA91IsJQOtwWYRbbZqk0QVxkdgEpU+BcY6
	bLih2DEVzAsKyG3PEUwIOSUUEMuTdWIu6jGdpTTRRlYLq+YYWcP9fL6YrsoQ9fGJF3T
	dQG2TN3koA8kE9gJ25tZYj6o5b+63Y8bgTf8WwRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g8+TTWDrfvbnURKHfnszzVmMCmlSIySFt60avmwDf6M=;
	b=1FzqAtIfeX/+bF56Ttp9vQzD1d8oZP6r4LwuZ15yOe07DPbJ6uTxkmGEBoqG9tt8
	TcvIgJsH/fKvtflYZsgZ2TbjNRkA+p6dOxLbtibbVvja7Z2W6Zrl1V5lNLKedmf6+KK
	1OJ8c/r9kzV/uM9Xm+ctfZV28Z8Mv7YUSe0GEIZc=
Content-Type: multipart/mixed; boundary="===============1073271969744264761=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-hooks: upgrading to 1.3.3 SUCCEEDED
Message-ID: <010101a0ae3390a6-b5260702-4712-4d27-8f95-35045717f873-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246034

--===============1073271969744264761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-hooks* to *1.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-hooks-upgrade-1.2.0-1.3.3.patch
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
From 02a620366f5d0dabcd8d83c2a43141bedbe23134 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 17 Sep 2026 06:13:36 +0000
Subject: [PATCH] python3-pyproject-hooks: upgrade 1.2.0 -> 1.3.3

Source: docs/changelog.rst

v1.3.3
------

- No code changes from 1.3. The git tags and the version number got out of sync
  while fixing an issue with the Github actions workflow to publish the release.
  1.3.3 exists only to get them back in sync without reassigning any tags.

v1.3
----

- Python 3.8 or above is now required (:pr:`214`).
- UserWarnings from the backend are now captured and re-emitted in the frontend
  process as a new category ``BuildBackendWarning``, so that frontends can
  control how they are shown to users (:pr:`213`).
- Show the traceback from the backend on a ``BackendUnavailable`` error (:pr:`219`).
- Fix the return type annotation for ``prepare_metadata_for_build_wheel``
  (:pr:`209`).
- Fix removing the internal ``_in_process`` directory from ``sys.path`` where
  the install location includes a symlink (:pr:`230`).
- Use ``os.path.commonpath`` instead of the deprecated ``commonprefix`` to
  validate the location of in-tree backends.
- Fix in-tree backends in locations containing the path separator character -
  ``:`` on Posix platforms, ``;`` on Windows (:pr:`232`).
- Fix finding distribution metadata with ``importlib.metadata`` in the backend
  when an in-tree backend is used (:pr:`212`).
- ``pyproject_hooks`` can be built from source using flit_core 4.x (:pr:`233`).
- Document that the ``hooks.subprocess_runner`` context manager API is not
  thread-safe (:pr:227`)

  in setuptools compatibility in 1.1 (PR :pr:`199`).
  before imporing the backend (PR :pr:`193`).
- Rely on preferred "files" API on Python 3.9 and later (:issue:`140`).
---
 ...yproject-hooks_1.2.0.bb => python3-pyproject-hooks_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-hooks_1.2.0.bb => python3-pyproject-hooks_1.3.3.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
index cdb9fc78c9..5f1507a034 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/pyproject-hooks"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aad69c93f605003e3342b174d9b0708c"
 
-SRC_URI[sha256sum] = "1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c970da1f8"
+SRC_URI[sha256sum] = "defda19b854fa0d3bd4f76ea4ddcba8abd7dcfcdd585a6690ade050744fc5f43"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============1073271969744264761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pyproject-hooks-changelog.txt"

Changelog for python3-pyproject-hooks: 1.2.0 -> 1.3.3
Source: docs/changelog.rst

v1.3.3
------

- No code changes from 1.3. The git tags and the version number got out of sync
  while fixing an issue with the Github actions workflow to publish the release.
  1.3.3 exists only to get them back in sync without reassigning any tags.

v1.3
----

- Python 3.8 or above is now required (:pr:`214`).
- UserWarnings from the backend are now captured and re-emitted in the frontend
  process as a new category ``BuildBackendWarning``, so that frontends can
  control how they are shown to users (:pr:`213`).
- Show the traceback from the backend on a ``BackendUnavailable`` error (:pr:`219`).
- Fix the return type annotation for ``prepare_metadata_for_build_wheel``
  (:pr:`209`).
- Fix removing the internal ``_in_process`` directory from ``sys.path`` where
  the install location includes a symlink (:pr:`230`).
- Use ``os.path.commonpath`` instead of the deprecated ``commonprefix`` to
  validate the location of in-tree backends.
- Fix in-tree backends in locations containing the path separator character -
  ``:`` on Posix platforms, ``;`` on Windows (:pr:`232`).
- Fix finding distribution metadata with ``importlib.metadata`` in the backend
  when an in-tree backend is used (:pr:`212`).
- ``pyproject_hooks`` can be built from source using flit_core 4.x (:pr:`233`).
- Document that the ``hooks.subprocess_runner`` context manager API is not
  thread-safe (:pr:227`)

  in setuptools compatibility in 1.1 (PR :pr:`199`).
  before imporing the backend (PR :pr:`193`).
- Rely on preferred "files" API on Python 3.9 and later (:issue:`140`).

--===============1073271969744264761==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-hooks-upgrade-1.2.0-1.3.3.patch"

RnJvbSAwMmE2MjAzNjZmNWQwZGFiY2Q4ZDgzYzJhNDMxNDFiZWRiZTIzMTM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTcgU2VwIDIwMjYgMDY6MTM6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cHJvamVjdC1ob29rczogdXBncmFkZSAxLjIuMCAtPiAxLjMuMwoKU291cmNlOiBk
b2NzL2NoYW5nZWxvZy5yc3QKCnYxLjMuMwotLS0tLS0KCi0gTm8gY29kZSBjaGFuZ2VzIGZyb20g
MS4zLiBUaGUgZ2l0IHRhZ3MgYW5kIHRoZSB2ZXJzaW9uIG51bWJlciBnb3Qgb3V0IG9mIHN5bmMK
ICB3aGlsZSBmaXhpbmcgYW4gaXNzdWUgd2l0aCB0aGUgR2l0aHViIGFjdGlvbnMgd29ya2Zsb3cg
dG8gcHVibGlzaCB0aGUgcmVsZWFzZS4KICAxLjMuMyBleGlzdHMgb25seSB0byBnZXQgdGhlbSBi
YWNrIGluIHN5bmMgd2l0aG91dCByZWFzc2lnbmluZyBhbnkgdGFncy4KCnYxLjMKLS0tLQoKLSBQ
eXRob24gMy44IG9yIGFib3ZlIGlzIG5vdyByZXF1aXJlZCAoOnByOmAyMTRgKS4KLSBVc2VyV2Fy
bmluZ3MgZnJvbSB0aGUgYmFja2VuZCBhcmUgbm93IGNhcHR1cmVkIGFuZCByZS1lbWl0dGVkIGlu
IHRoZSBmcm9udGVuZAogIHByb2Nlc3MgYXMgYSBuZXcgY2F0ZWdvcnkgYGBCdWlsZEJhY2tlbmRX
YXJuaW5nYGAsIHNvIHRoYXQgZnJvbnRlbmRzIGNhbgogIGNvbnRyb2wgaG93IHRoZXkgYXJlIHNo
b3duIHRvIHVzZXJzICg6cHI6YDIxM2ApLgotIFNob3cgdGhlIHRyYWNlYmFjayBmcm9tIHRoZSBi
YWNrZW5kIG9uIGEgYGBCYWNrZW5kVW5hdmFpbGFibGVgYCBlcnJvciAoOnByOmAyMTlgKS4KLSBG
aXggdGhlIHJldHVybiB0eXBlIGFubm90YXRpb24gZm9yIGBgcHJlcGFyZV9tZXRhZGF0YV9mb3Jf
YnVpbGRfd2hlZWxgYAogICg6cHI6YDIwOWApLgotIEZpeCByZW1vdmluZyB0aGUgaW50ZXJuYWwg
YGBfaW5fcHJvY2Vzc2BgIGRpcmVjdG9yeSBmcm9tIGBgc3lzLnBhdGhgYCB3aGVyZQogIHRoZSBp
bnN0YWxsIGxvY2F0aW9uIGluY2x1ZGVzIGEgc3ltbGluayAoOnByOmAyMzBgKS4KLSBVc2UgYGBv
cy5wYXRoLmNvbW1vbnBhdGhgYCBpbnN0ZWFkIG9mIHRoZSBkZXByZWNhdGVkIGBgY29tbW9ucHJl
Zml4YGAgdG8KICB2YWxpZGF0ZSB0aGUgbG9jYXRpb24gb2YgaW4tdHJlZSBiYWNrZW5kcy4KLSBG
aXggaW4tdHJlZSBiYWNrZW5kcyBpbiBsb2NhdGlvbnMgY29udGFpbmluZyB0aGUgcGF0aCBzZXBh
cmF0b3IgY2hhcmFjdGVyIC0KICBgYDpgYCBvbiBQb3NpeCBwbGF0Zm9ybXMsIGBgO2BgIG9uIFdp
bmRvd3MgKDpwcjpgMjMyYCkuCi0gRml4IGZpbmRpbmcgZGlzdHJpYnV0aW9uIG1ldGFkYXRhIHdp
dGggYGBpbXBvcnRsaWIubWV0YWRhdGFgYCBpbiB0aGUgYmFja2VuZAogIHdoZW4gYW4gaW4tdHJl
ZSBiYWNrZW5kIGlzIHVzZWQgKDpwcjpgMjEyYCkuCi0gYGBweXByb2plY3RfaG9va3NgYCBjYW4g
YmUgYnVpbHQgZnJvbSBzb3VyY2UgdXNpbmcgZmxpdF9jb3JlIDQueCAoOnByOmAyMzNgKS4KLSBE
b2N1bWVudCB0aGF0IHRoZSBgYGhvb2tzLnN1YnByb2Nlc3NfcnVubmVyYGAgY29udGV4dCBtYW5h
Z2VyIEFQSSBpcyBub3QKICB0aHJlYWQtc2FmZSAoOnByOjIyN2ApCgogIGluIHNldHVwdG9vbHMg
Y29tcGF0aWJpbGl0eSBpbiAxLjEgKFBSIDpwcjpgMTk5YCkuCiAgYmVmb3JlIGltcG9yaW5nIHRo
ZSBiYWNrZW5kIChQUiA6cHI6YDE5M2ApLgotIFJlbHkgb24gcHJlZmVycmVkICJmaWxlcyIgQVBJ
IG9uIFB5dGhvbiAzLjkgYW5kIGxhdGVyICg6aXNzdWU6YDE0MGApLgotLS0KIC4uLnlwcm9qZWN0
LWhvb2tzXzEuMi4wLmJiID0+IHB5dGhvbjMtcHlwcm9qZWN0LWhvb2tzXzEuMy4zLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlwcm9qZWN0LWhvb2tzXzEu
Mi4wLmJiID0+IHB5dGhvbjMtcHlwcm9qZWN0LWhvb2tzXzEuMy4zLmJifSAoODYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXByb2plY3QtaG9v
a3NfMS4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9q
ZWN0LWhvb2tzXzEuMy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXByb2plY3QtaG9va3NfMS4yLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXByb2plY3Qt
aG9va3NfMS4zLjMuYmIKaW5kZXggY2RiOWZjNzhjOS4uNWYxNTA3YTAzNCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cHJvamVjdC1ob29rc18xLjIu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0
LWhvb2tzXzEuMy4zLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9weXByb2plY3QtaG9va3MiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWFhZDY5YzkzZjYwNTAwM2UzMzQyYjE3NGQ5YjA3
MDhjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWU4NTliZDVjNDBmYWU5NDQ4NjQyZGQ4NzFh
ZGY0NTllNWUyMDg0MTg2ZThkMmMyYTc5YTgyNGM5NzBkYTFmOCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJkZWZkYTE5Yjg1NGZhMGQzYmQ0Zjc2ZWE0ZGRjYmE4YWJkN2RjZmNkZDU4NWE2NjkwYWRl
MDUwNzQ0ZmM1ZjQzIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQ3
LjEKCg==

--===============1073271969744264761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-hooks (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info
Changes to packages/x86_64-linux/python3-pyproject-hooks-native (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info

--===============1073271969744264761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.la /lib/*.o /lib/lib*.so"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/bin/* /sbin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/bin/* /sbin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11341250 to 11141818 (-2%)
packages/x86-64-v3-poky-linux/python3-pyproject-hooks: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_hooks/pyproject_hooks-1.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_hooks/pyproject_hooks-1.3.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks: PV changed from "1.2.0" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dbg: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dbg: PV changed from "1.2.0" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dev: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dev: PV changed from "1.2.0" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-doc: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-doc: PV changed from "1.2.0" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-locale: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-locale: PV changed from "1.2.0" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-src: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-src: PV changed from "1.2.0" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-staticdev: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-staticdev: PV changed from "1.2.0" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: PKGV changed from 1.2.0 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: PKGSIZE changed from 70184 to 74129 (+6%)
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: PV changed from "1.2.0" to "1.3.3"
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-hooks (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info
Changes to packages/x86_64-linux/python3-pyproject-hooks-native (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.3.dist-info

--===============1073271969744264761==--

