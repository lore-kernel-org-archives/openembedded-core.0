Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6868DC79FB0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 06:03:34 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.957.1788847407679047908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 23:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Abp7fVjH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IwM9fquL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a07f9d3e0a-0a18c0f3-f054-4823-8f14-3dca5367c317-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788847406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mDNOpUHxuQYMv4DdZMMrEaYiDONQrtGq/C6gnbsBv54=;
	b=Abp7fVjHVmD2fOxRv4kaDThsXhsAVmgGn0bkQfABmSBF/8dg1A6QTo6YCTKIrm6k
	wu6BXztNCMgK5cM4LFekdjOI/aSTb8gnsIvml5tjM42dTN0GFlMvO6q7VYlJjCIx8np
	MvcuFFCoAb1V+GoxyIKEkrNVshWvzH80d+eR7YRQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788847406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mDNOpUHxuQYMv4DdZMMrEaYiDONQrtGq/C6gnbsBv54=;
	b=IwM9fquLPGJ5Uvl9oHooY7TFhBPTVMnN5sDYU7LJs23MfgL4NtpR0XQ/r9Mduoce
	5hiSERkYpvxs55/ymTxawOwtsV1ISl6BUf8W0JgnrnGzpgerHE0+c1ltHokdnF8wQzQ
	rytZ1tNljZdHRemv9s7fk5P9NTjOn7F+Rqs6q0HM=
Content-Type: multipart/mixed; boundary="===============0738048366716241026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sbom-cve-check: upgrading to 1.3.4 SUCCEEDED
Message-ID: <010101a07f9d3e0a-0a18c0f3-f054-4823-8f14-3dca5367c317-000000@us-west-2.amazonses.com>
Date: Tue, 8 Sep 2026 06:03:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.08-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 06:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245323

--===============0738048366716241026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sbom-cve-check* to *1.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sbom-cve-check-upgrade-1.3.3-1.3.4.patch
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
From 28e9dd796e888b58e1c4b080aa06797655be303f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 8 Sep 2026 05:36:19 +0000
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.3.3 -> 1.3.4

Source: CHANGELOG.md

## v1.3.4

### Added or Changed

- Added configurable logging through the `[logging]` TOML table, including log
  files, per-logger levels, custom formats, and optional Rich output.
- Added `offline_mode=` database configuration and the `--offline-mode` option
  to prevent operations that require network access.
- Changed SBOM, vulnerability database, and export class registration to use the
  `type_name` class keyword. The `register_sbom()`, `register_vuln_db()`, and
  `register_export()` decorators are now deprecated.
- Updated supported `spdx-python-model` versions to 0.0.6 through 0.0.7.
- Added an OpenSSF Best Practices badge to the project documentation.

### Fixed

- Fixed the error when a TOML configuration file does not contain a
  `databases` section.
- Fixed reproducible TOML configuration export when plugins are used.
- Avoided unnecessary Git database updates when automatic updates are disabled
  with either `--disable-auto-updates` or `auto_update_max_age=off`.
- Generate a "not affected" assessment if the vulnerability is disputed ([#27](
  https://github.com/bootlin/sbom-cve-check/pull/27) by Peter Marko).
  prefixed by a comparison operator (`<`, `<=`, `>`, `>=`, or `=`) ([#28](
  https://github.com/bootlin/sbom-cve-check/pull/28) by Peter Marko).
### New Contributors

- Peter Marko made their first contribution in [#27](
  https://github.com/bootlin/sbom-cve-check/pull/27).

- Updated the Yocto Project Developer Guide link to the Scarthgap release, which
  retains documentation for the `cve-check` JSON report format ([#22](
  https://github.com/bootlin/sbom-cve-check/pull/22) by Aaron Honeycutt).

### New Contributors

- Aaron Honeycutt made their first contribution in [#22](
  https://github.com/bootlin/sbom-cve-check/pull/22).
- Fixed the type used for the version attribute in Yocto exports ([#18](
  https://github.com/bootlin/sbom-cve-check/pull/18) by Ross Burton).
  https://github.com/bootlin/sbom-cve-check/issues/16), [#17](
  https://github.com/bootlin/sbom-cve-check/pull/17) by Miguel Gazquez)
### New Contributors

- Miguel Gazquez made their first contribution in [#17](
  https://github.com/bootlin/sbom-cve-check/pull/17).

  https://github.com/bootlin/sbom-cve-check/pull/11) by Ross Burton).
- Fixed a typo in the documentation ([#14](
  https://github.com/bootlin/sbom-cve-check/pull/14) by Clayton Casciato).
### New Contributors

- Ross Burton made their first contribution in [#11](
  https://github.com/bootlin/sbom-cve-check/pull/11).
- Clayton Casciato made their first contribution in [#14](
  https://github.com/bootlin/sbom-cve-check/pull/14).

### Added or Changed

- Improved the project description and short documentation ([#1](
  https://github.com/bootlin/sbom-cve-check/pull/1) by Thomas Petazzoni).

### New Contributors

- Thomas Petazzoni made their first contribution in [#1](
  https://github.com/bootlin/sbom-cve-check/pull/1).
---
 ...-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
index 2aca100569..c26ce6e6b3 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
+SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============0738048366716241026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info/licenses, added "/usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/logging.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/registry.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/registry.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/logging.py"
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/logging.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/logging.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/registry.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/registry.py was added

--===============0738048366716241026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sbom-cve-check-upgrade-1.3.3-1.3.4.patch"

RnJvbSAyOGU5ZGQ3OTZlODg4YjU4ZTFjNGIwODBhYTA2Nzk3NjU1YmUzMDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgOCBTZXAgMjAyNiAwNTozNjoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2JvbS1jdmUtY2hlY2s6IHVwZ3JhZGUgMS4zLjMgLT4gMS4zLjQKClNvdXJjZTogQ0hB
TkdFTE9HLm1kCgojIyB2MS4zLjQKCiMjIyBBZGRlZCBvciBDaGFuZ2VkCgotIEFkZGVkIGNvbmZp
Z3VyYWJsZSBsb2dnaW5nIHRocm91Z2ggdGhlIGBbbG9nZ2luZ11gIFRPTUwgdGFibGUsIGluY2x1
ZGluZyBsb2cKICBmaWxlcywgcGVyLWxvZ2dlciBsZXZlbHMsIGN1c3RvbSBmb3JtYXRzLCBhbmQg
b3B0aW9uYWwgUmljaCBvdXRwdXQuCi0gQWRkZWQgYG9mZmxpbmVfbW9kZT1gIGRhdGFiYXNlIGNv
bmZpZ3VyYXRpb24gYW5kIHRoZSBgLS1vZmZsaW5lLW1vZGVgIG9wdGlvbgogIHRvIHByZXZlbnQg
b3BlcmF0aW9ucyB0aGF0IHJlcXVpcmUgbmV0d29yayBhY2Nlc3MuCi0gQ2hhbmdlZCBTQk9NLCB2
dWxuZXJhYmlsaXR5IGRhdGFiYXNlLCBhbmQgZXhwb3J0IGNsYXNzIHJlZ2lzdHJhdGlvbiB0byB1
c2UgdGhlCiAgYHR5cGVfbmFtZWAgY2xhc3Mga2V5d29yZC4gVGhlIGByZWdpc3Rlcl9zYm9tKClg
LCBgcmVnaXN0ZXJfdnVsbl9kYigpYCwgYW5kCiAgYHJlZ2lzdGVyX2V4cG9ydCgpYCBkZWNvcmF0
b3JzIGFyZSBub3cgZGVwcmVjYXRlZC4KLSBVcGRhdGVkIHN1cHBvcnRlZCBgc3BkeC1weXRob24t
bW9kZWxgIHZlcnNpb25zIHRvIDAuMC42IHRocm91Z2ggMC4wLjcuCi0gQWRkZWQgYW4gT3BlblNT
RiBCZXN0IFByYWN0aWNlcyBiYWRnZSB0byB0aGUgcHJvamVjdCBkb2N1bWVudGF0aW9uLgoKIyMj
IEZpeGVkCgotIEZpeGVkIHRoZSBlcnJvciB3aGVuIGEgVE9NTCBjb25maWd1cmF0aW9uIGZpbGUg
ZG9lcyBub3QgY29udGFpbiBhCiAgYGRhdGFiYXNlc2Agc2VjdGlvbi4KLSBGaXhlZCByZXByb2R1
Y2libGUgVE9NTCBjb25maWd1cmF0aW9uIGV4cG9ydCB3aGVuIHBsdWdpbnMgYXJlIHVzZWQuCi0g
QXZvaWRlZCB1bm5lY2Vzc2FyeSBHaXQgZGF0YWJhc2UgdXBkYXRlcyB3aGVuIGF1dG9tYXRpYyB1
cGRhdGVzIGFyZSBkaXNhYmxlZAogIHdpdGggZWl0aGVyIGAtLWRpc2FibGUtYXV0by11cGRhdGVz
YCBvciBgYXV0b191cGRhdGVfbWF4X2FnZT1vZmZgLgotIEdlbmVyYXRlIGEgIm5vdCBhZmZlY3Rl
ZCIgYXNzZXNzbWVudCBpZiB0aGUgdnVsbmVyYWJpbGl0eSBpcyBkaXNwdXRlZCAoWyMyN10oCiAg
aHR0cHM6Ly9naXRodWIuY29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcHVsbC8yNykgYnkgUGV0
ZXIgTWFya28pLgogIHByZWZpeGVkIGJ5IGEgY29tcGFyaXNvbiBvcGVyYXRvciAoYDxgLCBgPD1g
LCBgPmAsIGA+PWAsIG9yIGA9YCkgKFsjMjhdKAogIGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGlu
L3Nib20tY3ZlLWNoZWNrL3B1bGwvMjgpIGJ5IFBldGVyIE1hcmtvKS4KIyMjIE5ldyBDb250cmli
dXRvcnMKCi0gUGV0ZXIgTWFya28gbWFkZSB0aGVpciBmaXJzdCBjb250cmlidXRpb24gaW4gWyMy
N10oCiAgaHR0cHM6Ly9naXRodWIuY29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcHVsbC8yNyku
CgotIFVwZGF0ZWQgdGhlIFlvY3RvIFByb2plY3QgRGV2ZWxvcGVyIEd1aWRlIGxpbmsgdG8gdGhl
IFNjYXJ0aGdhcCByZWxlYXNlLCB3aGljaAogIHJldGFpbnMgZG9jdW1lbnRhdGlvbiBmb3IgdGhl
IGBjdmUtY2hlY2tgIEpTT04gcmVwb3J0IGZvcm1hdCAoWyMyMl0oCiAgaHR0cHM6Ly9naXRodWIu
Y29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcHVsbC8yMikgYnkgQWFyb24gSG9uZXljdXR0KS4K
CiMjIyBOZXcgQ29udHJpYnV0b3JzCgotIEFhcm9uIEhvbmV5Y3V0dCBtYWRlIHRoZWlyIGZpcnN0
IGNvbnRyaWJ1dGlvbiBpbiBbIzIyXSgKICBodHRwczovL2dpdGh1Yi5jb20vYm9vdGxpbi9zYm9t
LWN2ZS1jaGVjay9wdWxsLzIyKS4KLSBGaXhlZCB0aGUgdHlwZSB1c2VkIGZvciB0aGUgdmVyc2lv
biBhdHRyaWJ1dGUgaW4gWW9jdG8gZXhwb3J0cyAoWyMxOF0oCiAgaHR0cHM6Ly9naXRodWIuY29t
L2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcHVsbC8xOCkgYnkgUm9zcyBCdXJ0b24pLgogIGh0dHBz
Oi8vZ2l0aHViLmNvbS9ib290bGluL3Nib20tY3ZlLWNoZWNrL2lzc3Vlcy8xNiksIFsjMTddKAog
IGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGluL3Nib20tY3ZlLWNoZWNrL3B1bGwvMTcpIGJ5IE1p
Z3VlbCBHYXpxdWV6KQojIyMgTmV3IENvbnRyaWJ1dG9ycwoKLSBNaWd1ZWwgR2F6cXVleiBtYWRl
IHRoZWlyIGZpcnN0IGNvbnRyaWJ1dGlvbiBpbiBbIzE3XSgKICBodHRwczovL2dpdGh1Yi5jb20v
Ym9vdGxpbi9zYm9tLWN2ZS1jaGVjay9wdWxsLzE3KS4KCiAgaHR0cHM6Ly9naXRodWIuY29tL2Jv
b3RsaW4vc2JvbS1jdmUtY2hlY2svcHVsbC8xMSkgYnkgUm9zcyBCdXJ0b24pLgotIEZpeGVkIGEg
dHlwbyBpbiB0aGUgZG9jdW1lbnRhdGlvbiAoWyMxNF0oCiAgaHR0cHM6Ly9naXRodWIuY29tL2Jv
b3RsaW4vc2JvbS1jdmUtY2hlY2svcHVsbC8xNCkgYnkgQ2xheXRvbiBDYXNjaWF0bykuCiMjIyBO
ZXcgQ29udHJpYnV0b3JzCgotIFJvc3MgQnVydG9uIG1hZGUgdGhlaXIgZmlyc3QgY29udHJpYnV0
aW9uIGluIFsjMTFdKAogIGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGluL3Nib20tY3ZlLWNoZWNr
L3B1bGwvMTEpLgotIENsYXl0b24gQ2FzY2lhdG8gbWFkZSB0aGVpciBmaXJzdCBjb250cmlidXRp
b24gaW4gWyMxNF0oCiAgaHR0cHM6Ly9naXRodWIuY29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2sv
cHVsbC8xNCkuCgojIyMgQWRkZWQgb3IgQ2hhbmdlZAoKLSBJbXByb3ZlZCB0aGUgcHJvamVjdCBk
ZXNjcmlwdGlvbiBhbmQgc2hvcnQgZG9jdW1lbnRhdGlvbiAoWyMxXSgKICBodHRwczovL2dpdGh1
Yi5jb20vYm9vdGxpbi9zYm9tLWN2ZS1jaGVjay9wdWxsLzEpIGJ5IFRob21hcyBQZXRhenpvbmkp
LgoKIyMjIE5ldyBDb250cmlidXRvcnMKCi0gVGhvbWFzIFBldGF6em9uaSBtYWRlIHRoZWlyIGZp
cnN0IGNvbnRyaWJ1dGlvbiBpbiBbIzFdKAogIGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGluL3Ni
b20tY3ZlLWNoZWNrL3B1bGwvMSkuCi0tLQogLi4uLXNib20tY3ZlLWNoZWNrXzEuMy4zLmJiID0+
IHB5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3Nib20tY3ZlLWNoZWNrL3tweXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy4zLmJiID0+IHB5
dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjQuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4z
LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9t
LWN2ZS1jaGVja18xLjMuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18x
LjMuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3B5
dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjQuYmIKaW5kZXggMmFjYTEwMDU2OS4uYzI2Y2U2ZTZi
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3B5dGhv
bjMtc2JvbS1jdmUtY2hlY2tfMS4zLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Ni
b20tY3ZlLWNoZWNrL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjQuYmIKQEAgLTUsNyArNSw3
IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTU3MGE5YjM3NDlkZDA0NjNhMTc3ODgwM2IxMmE2ZGNlIgogCiBQWVBJ
X1BBQ0tBR0UgPSAic2JvbV9jdmVfY2hlY2siCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGI3NjZi
ZTFhZTkyYjRlY2VhYTJmNjk0ZGQ0NzI0ZTMxMDg4NmM2NDM2ZjQ0MjY3YTZiYmM2YTdiODFhYjhi
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYTJmNGUxODNiNjAwZmRhZDdjZTZlYjY3ZjdkNjQy
YmQzZTdjNjcyOTNhZTlmZmRhN2QzYTJmZGU0MzNlMDJiIgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============0738048366716241026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.3.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGSIZE changed from 1336424 to 1355819 (+1%)
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PV changed from "1.3.3" to "1.3.4"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info/licenses, added "/usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/registry.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/logging.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/registry.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/logging.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/logging.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/logging.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/registry.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/registry.py was added

--===============0738048366716241026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-sbom-cve-check-changelog.txt"

Changelog for python3-sbom-cve-check: 1.3.3 -> 1.3.4
Source: CHANGELOG.md

## v1.3.4

### Added or Changed

- Added configurable logging through the `[logging]` TOML table, including log
  files, per-logger levels, custom formats, and optional Rich output.
- Added `offline_mode=` database configuration and the `--offline-mode` option
  to prevent operations that require network access.
- Changed SBOM, vulnerability database, and export class registration to use the
  `type_name` class keyword. The `register_sbom()`, `register_vuln_db()`, and
  `register_export()` decorators are now deprecated.
- Updated supported `spdx-python-model` versions to 0.0.6 through 0.0.7.
- Added an OpenSSF Best Practices badge to the project documentation.

### Fixed

- Fixed the error when a TOML configuration file does not contain a
  `databases` section.
- Fixed reproducible TOML configuration export when plugins are used.
- Avoided unnecessary Git database updates when automatic updates are disabled
  with either `--disable-auto-updates` or `auto_update_max_age=off`.
- Generate a "not affected" assessment if the vulnerability is disputed ([#27](
  https://github.com/bootlin/sbom-cve-check/pull/27) by Peter Marko).
  prefixed by a comparison operator (`<`, `<=`, `>`, `>=`, or `=`) ([#28](
  https://github.com/bootlin/sbom-cve-check/pull/28) by Peter Marko).
### New Contributors

- Peter Marko made their first contribution in [#27](
  https://github.com/bootlin/sbom-cve-check/pull/27).

- Updated the Yocto Project Developer Guide link to the Scarthgap release, which
  retains documentation for the `cve-check` JSON report format ([#22](
  https://github.com/bootlin/sbom-cve-check/pull/22) by Aaron Honeycutt).

### New Contributors

- Aaron Honeycutt made their first contribution in [#22](
  https://github.com/bootlin/sbom-cve-check/pull/22).
- Fixed the type used for the version attribute in Yocto exports ([#18](
  https://github.com/bootlin/sbom-cve-check/pull/18) by Ross Burton).
  https://github.com/bootlin/sbom-cve-check/issues/16), [#17](
  https://github.com/bootlin/sbom-cve-check/pull/17) by Miguel Gazquez)
### New Contributors

- Miguel Gazquez made their first contribution in [#17](
  https://github.com/bootlin/sbom-cve-check/pull/17).

  https://github.com/bootlin/sbom-cve-check/pull/11) by Ross Burton).
- Fixed a typo in the documentation ([#14](
  https://github.com/bootlin/sbom-cve-check/pull/14) by Clayton Casciato).
### New Contributors

- Ross Burton made their first contribution in [#11](
  https://github.com/bootlin/sbom-cve-check/pull/11).
- Clayton Casciato made their first contribution in [#14](
  https://github.com/bootlin/sbom-cve-check/pull/14).

### Added or Changed

- Improved the project description and short documentation ([#1](
  https://github.com/bootlin/sbom-cve-check/pull/1) by Thomas Petazzoni).

### New Contributors

- Thomas Petazzoni made their first contribution in [#1](
  https://github.com/bootlin/sbom-cve-check/pull/1).

--===============0738048366716241026==--

