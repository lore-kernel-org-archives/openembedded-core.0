Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96193C982C7
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:44:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8383.1789537494946980413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PKbBQb/V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0q8TJuYE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0a8bf2495-f2b0eb3e-1d93-4de3-b2df-d4c6865d0ed9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789537494;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EdPfQOswSCdVU5egeTZWhk6fXw4FrS8YBu1qZdX99bA=;
	b=PKbBQb/V7qwlEqy/8k8aXs2GyvU9WZ3Dz/llYl5aU3j0iCJ0oQ+M5vH26uE6R09R
	aNw40lbSgt5uB+V0Ni2FHI/JoGDtdY1SB+bhUrXm4K7Su3tDfvCkrbjL40NyfDmrnUq
	skAkpXsuw9P7xFoI8avFFP6KhjlzvYK5iI/otdjI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789537494;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EdPfQOswSCdVU5egeTZWhk6fXw4FrS8YBu1qZdX99bA=;
	b=0q8TJuYExDmr5tGuoI7RaFiGOwQiHHtbBiU+G4QnPXCjiBUPdIhDwKvcRnEtKbzz
	3D0T7KbKxEj6GBN97klXH93PlWbIijQR4QBjSqedLk1+D5y0tdHHMioCSFz/DnwjB1j
	qndENjuGBIfAPq6zzpZPN8iXZV7OO+dd/7/tHUSk=
Content-Type: multipart/mixed; boundary="===============8053797304105894497=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-hooks: upgrading to 1.3.0 SUCCEEDED
Message-ID: <010101a0a8bf2495-f2b0eb3e-1d93-4de3-b2df-d4c6865d0ed9-000000@us-west-2.amazonses.com>
Date: Wed, 16 Sep 2026 05:44:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245918

--===============8053797304105894497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-hooks* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-hooks-upgrade-1.2.0-1.3.0.patch
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
From 97b14fc957626a4ddd0dfd0bada53912ffe53fe0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Sep 2026 05:35:34 +0000
Subject: [PATCH] python3-pyproject-hooks: upgrade 1.2.0 -> 1.3.0

Source: docs/changelog.rst

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
 ...yproject-hooks_1.2.0.bb => python3-pyproject-hooks_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-hooks_1.2.0.bb => python3-pyproject-hooks_1.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-hooks_1.3.0.bb
index cdb9fc78c9..fda19f2f8d 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/pyproject-hooks"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aad69c93f605003e3342b174d9b0708c"
 
-SRC_URI[sha256sum] = "1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c970da1f8"
+SRC_URI[sha256sum] = "26dfd4229ff1820b7964be33bd3eb64367eb7c841215defe11341450c219ce20"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============8053797304105894497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-hooks (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info
Changes to packages/x86_64-linux/python3-pyproject-hooks-native (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info

--===============8053797304105894497==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-hooks-upgrade-1.2.0-1.3.0.patch"

RnJvbSA5N2IxNGZjOTU3NjI2YTRkZGQwZGZkMGJhZGE1MzkxMmZmZTUzZmUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgU2VwIDIwMjYgMDU6MzU6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cHJvamVjdC1ob29rczogdXBncmFkZSAxLjIuMCAtPiAxLjMuMAoKU291cmNlOiBk
b2NzL2NoYW5nZWxvZy5yc3QKCnYxLjMKLS0tLQoKLSBQeXRob24gMy44IG9yIGFib3ZlIGlzIG5v
dyByZXF1aXJlZCAoOnByOmAyMTRgKS4KLSBVc2VyV2FybmluZ3MgZnJvbSB0aGUgYmFja2VuZCBh
cmUgbm93IGNhcHR1cmVkIGFuZCByZS1lbWl0dGVkIGluIHRoZSBmcm9udGVuZAogIHByb2Nlc3Mg
YXMgYSBuZXcgY2F0ZWdvcnkgYGBCdWlsZEJhY2tlbmRXYXJuaW5nYGAsIHNvIHRoYXQgZnJvbnRl
bmRzIGNhbgogIGNvbnRyb2wgaG93IHRoZXkgYXJlIHNob3duIHRvIHVzZXJzICg6cHI6YDIxM2Ap
LgotIFNob3cgdGhlIHRyYWNlYmFjayBmcm9tIHRoZSBiYWNrZW5kIG9uIGEgYGBCYWNrZW5kVW5h
dmFpbGFibGVgYCBlcnJvciAoOnByOmAyMTlgKS4KLSBGaXggdGhlIHJldHVybiB0eXBlIGFubm90
YXRpb24gZm9yIGBgcHJlcGFyZV9tZXRhZGF0YV9mb3JfYnVpbGRfd2hlZWxgYAogICg6cHI6YDIw
OWApLgotIEZpeCByZW1vdmluZyB0aGUgaW50ZXJuYWwgYGBfaW5fcHJvY2Vzc2BgIGRpcmVjdG9y
eSBmcm9tIGBgc3lzLnBhdGhgYCB3aGVyZQogIHRoZSBpbnN0YWxsIGxvY2F0aW9uIGluY2x1ZGVz
IGEgc3ltbGluayAoOnByOmAyMzBgKS4KLSBVc2UgYGBvcy5wYXRoLmNvbW1vbnBhdGhgYCBpbnN0
ZWFkIG9mIHRoZSBkZXByZWNhdGVkIGBgY29tbW9ucHJlZml4YGAgdG8KICB2YWxpZGF0ZSB0aGUg
bG9jYXRpb24gb2YgaW4tdHJlZSBiYWNrZW5kcy4KLSBGaXggaW4tdHJlZSBiYWNrZW5kcyBpbiBs
b2NhdGlvbnMgY29udGFpbmluZyB0aGUgcGF0aCBzZXBhcmF0b3IgY2hhcmFjdGVyIC0KICBgYDpg
YCBvbiBQb3NpeCBwbGF0Zm9ybXMsIGBgO2BgIG9uIFdpbmRvd3MgKDpwcjpgMjMyYCkuCi0gRml4
IGZpbmRpbmcgZGlzdHJpYnV0aW9uIG1ldGFkYXRhIHdpdGggYGBpbXBvcnRsaWIubWV0YWRhdGFg
YCBpbiB0aGUgYmFja2VuZAogIHdoZW4gYW4gaW4tdHJlZSBiYWNrZW5kIGlzIHVzZWQgKDpwcjpg
MjEyYCkuCi0gYGBweXByb2plY3RfaG9va3NgYCBjYW4gYmUgYnVpbHQgZnJvbSBzb3VyY2UgdXNp
bmcgZmxpdF9jb3JlIDQueCAoOnByOmAyMzNgKS4KLSBEb2N1bWVudCB0aGF0IHRoZSBgYGhvb2tz
LnN1YnByb2Nlc3NfcnVubmVyYGAgY29udGV4dCBtYW5hZ2VyIEFQSSBpcyBub3QKICB0aHJlYWQt
c2FmZSAoOnByOjIyN2ApCgogIGluIHNldHVwdG9vbHMgY29tcGF0aWJpbGl0eSBpbiAxLjEgKFBS
IDpwcjpgMTk5YCkuCiAgYmVmb3JlIGltcG9yaW5nIHRoZSBiYWNrZW5kIChQUiA6cHI6YDE5M2Ap
LgotIFJlbHkgb24gcHJlZmVycmVkICJmaWxlcyIgQVBJIG9uIFB5dGhvbiAzLjkgYW5kIGxhdGVy
ICg6aXNzdWU6YDE0MGApLgotLS0KIC4uLnlwcm9qZWN0LWhvb2tzXzEuMi4wLmJiID0+IHB5dGhv
bjMtcHlwcm9qZWN0LWhvb2tzXzEuMy4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtcHlwcm9qZWN0LWhvb2tzXzEuMi4wLmJiID0+IHB5dGhvbjMtcHlwcm9q
ZWN0LWhvb2tzXzEuMy4wLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weXByb2plY3QtaG9va3NfMS4yLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LWhvb2tzXzEuMy4wLmJiCnNpbWls
YXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXByb2plY3QtaG9va3NfMS4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXByb2plY3QtaG9va3NfMS4zLjAuYmIKaW5kZXggY2Ri
OWZjNzhjOS4uZmRhMTlmMmY4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5cHJvamVjdC1ob29rc18xLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LWhvb2tzXzEuMy4wLmJiCkBAIC0zLDcg
KzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9weXByb2plY3QtaG9v
a3MiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWFhZDY5YzkzZjYwNTAwM2UzMzQyYjE3NGQ5YjA3MDhjIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMWU4NTliZDVjNDBmYWU5NDQ4NjQyZGQ4NzFhZGY0NTllNWUyMDg0MTg2ZThkMmMyYTc5
YTgyNGM5NzBkYTFmOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNmRmZDQyMjlmZjE4MjBiNzk2
NGJlMzNiZDNlYjY0MzY3ZWI3Yzg0MTIxNWRlZmUxMTM0MTQ1MGMyMTljZTIwIgogCiBpbmhlcml0
IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============8053797304105894497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-hooks: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_hooks/pyproject_hooks-1.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_hooks/pyproject_hooks-1.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dbg: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dbg: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-dev: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-doc: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-doc: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-locale: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-locale: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-src: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-src: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-staticdev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks-staticdev: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: PKGSIZE changed from 70184 to 74129 (+6%)
packages/x86-64-v3-poky-linux/python3-pyproject-hooks/python3-pyproject-hooks: PV changed from "1.2.0" to "1.3.0"
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-hooks (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info
Changes to packages/x86_64-linux/python3-pyproject-hooks-native (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_hooks-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_hooks-1.3.0.dist-info

--===============8053797304105894497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pyproject-hooks-changelog.txt"

Changelog for python3-pyproject-hooks: 1.2.0 -> 1.3.0
Source: docs/changelog.rst

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

--===============8053797304105894497==--

