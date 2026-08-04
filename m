Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFE4C55ABC
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:24:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10868.1785824638527809613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hSxTLTOk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kKA63h5Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fcb71722d-a0c7f9b2-7d0b-426e-8813-c6d5e53d4ca1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785824637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RNP5+c9ufuc9lxHWOdkO2xgF7kpHp2tkgKn+i0COrEE=;
	b=hSxTLTOkMQOql12lD6Ck3ptim93bmuiyUTlxpSSOe5UB1m6qJuQehqdODvsL8nZH
	vjJ1fyJCsMCp/jgbCN3TJcCoyfGxnX3CgTqGi06jLpboLoZgyCrOP2X5aQGspkeS9V5
	VRGkiHo76O7Bxjv/itcGwZQRGsR1d6fOn6v1Wmkg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785824637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RNP5+c9ufuc9lxHWOdkO2xgF7kpHp2tkgKn+i0COrEE=;
	b=kKA63h5YJtmWkPnjDR7KdD2OQPULxWWncN8Q9YtiDc0lFyDqKKUTfmt4n2UoyH1u
	DnmhKcO2fjhbkLbaeDaC24DbHSCkDICdbywnOp1kOjDCs2tiHDySrArE5eURFtIUvO3
	3yQqjZe+sFxD+34tD2xcz+arQ0HjNMFJDuzZiXtg=
Content-Type: multipart/mixed; boundary="===============4457406702271625304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-metadata: upgrading to 0.12.1 SUCCEEDED
Message-ID: <0101019fcb71722d-a0c7f9b2-7d0b-426e-8813-c6d5e53d4ca1-000000@us-west-2.amazonses.com>
Date: Tue, 4 Aug 2026 06:23:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.04-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242706

--===============4457406702271625304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-metadata* to *0.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-metadata-upgrade-0.11.0-0.12.1.patch
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
From 4855fd9e30458a3a6fe275374bd95436a0909e90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 4 Aug 2026 06:01:34 +0000
Subject: [PATCH] python3-pyproject-metadata: upgrade 0.11.0 -> 0.12.1

Source: docs/changelog.md

## 0.12.1 (7-3-2026)

Fixes:

- Collect a config error instead of raising a raw `TypeError` when
  `project.dynamic` contains a non-string (unhashable) entry with
  `all_errors=True`.

## 0.12.0 (7-3-2026)

Features:

- Support [PEP 808](https://peps.python.org/pep-0808/) (partially dynamic
  project metadata) (METADATA 2.6).
- Add support for Python 3.15.
- Warn ([PEP 685](https://peps.python.org/pep-0685/)) when an extra name in
  `project.optional-dependencies` is not a valid name. The extra is still
  emitted, only a `ConfigurationWarning` is produced.

Fixes:

- Error on an unset dynamic version instead of silently writing
  `Version: 0.0.0`. If `"version"` is declared in `project.dynamic` but never
  assigned by the build backend, writing the metadata now raises a
  `ConfigurationError` (`Field "project.version" missing`), restoring the 0.8.x
  behavior that regressed in the 0.9 rewrite.
- Don't crash on a non-table `[project]` when `all_errors=True`.
- Tighten `license-files` glob checks and private-tag parsing.
- Handle braces in user data within error messages.
- Correct the `Import-Namespace` field name in the metadata mapping.
- Fix UTF-8 author and maintainer names.

Performance:

- Cache `get_type_hints` and precompile dispatch patterns.

Documentation:

- Fix a stale dynamic docstring and a broken module example.
- Add a documentation project URL.

Internal and CI:

- Refactoring: consistent dataclass decorators, sorted constant entries, and
  removal of duplicate imports and dead code.
- Cover defensive branches in dispatch helpers and validators.
- Secure GitHub Actions workflows and bump pinned/downstream dependencies.
---
 ...-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
index 1e485df338..9918cae075 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf"
+SRC_URI[sha256sum] = "8809a4df6fe08279b39a8890669506ed3158e0617855ac9aff098fcbe772ae4c"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.47.1


--===============4457406702271625304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info

--===============4457406702271625304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.11.0.tar.gz;downloadfilename=pyproject_metadata-0.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.12.1.tar.gz;downloadfilename=pyproject_metadata-0.12.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGSIZE changed from 166428 to 176342 (+6%)
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info

--===============4457406702271625304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pyproject-metadata-changelog.txt"

Changelog for python3-pyproject-metadata: 0.11.0 -> 0.12.1
Source: docs/changelog.md

## 0.12.1 (7-3-2026)

Fixes:

- Collect a config error instead of raising a raw `TypeError` when
  `project.dynamic` contains a non-string (unhashable) entry with
  `all_errors=True`.

## 0.12.0 (7-3-2026)

Features:

- Support [PEP 808](https://peps.python.org/pep-0808/) (partially dynamic
  project metadata) (METADATA 2.6).
- Add support for Python 3.15.
- Warn ([PEP 685](https://peps.python.org/pep-0685/)) when an extra name in
  `project.optional-dependencies` is not a valid name. The extra is still
  emitted, only a `ConfigurationWarning` is produced.

Fixes:

- Error on an unset dynamic version instead of silently writing
  `Version: 0.0.0`. If `"version"` is declared in `project.dynamic` but never
  assigned by the build backend, writing the metadata now raises a
  `ConfigurationError` (`Field "project.version" missing`), restoring the 0.8.x
  behavior that regressed in the 0.9 rewrite.
- Don't crash on a non-table `[project]` when `all_errors=True`.
- Tighten `license-files` glob checks and private-tag parsing.
- Handle braces in user data within error messages.
- Correct the `Import-Namespace` field name in the metadata mapping.
- Fix UTF-8 author and maintainer names.

Performance:

- Cache `get_type_hints` and precompile dispatch patterns.

Documentation:

- Fix a stale dynamic docstring and a broken module example.
- Add a documentation project URL.

Internal and CI:

- Refactoring: consistent dataclass decorators, sorted constant entries, and
  removal of duplicate imports and dead code.
- Cover defensive branches in dispatch helpers and validators.
- Secure GitHub Actions workflows and bump pinned/downstream dependencies.

--===============4457406702271625304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-metadata-upgrade-0.11.0-0.12.1.patch"

RnJvbSA0ODU1ZmQ5ZTMwNDU4YTNhNmZlMjc1Mzc0YmQ5NTQzNmEwOTA5ZTkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNCBBdWcgMjAyNiAwNjowMTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhOiB1cGdyYWRlIDAuMTEuMCAtPiAwLjEyLjEKClNvdXJj
ZTogZG9jcy9jaGFuZ2Vsb2cubWQKCiMjIDAuMTIuMSAoNy0zLTIwMjYpCgpGaXhlczoKCi0gQ29s
bGVjdCBhIGNvbmZpZyBlcnJvciBpbnN0ZWFkIG9mIHJhaXNpbmcgYSByYXcgYFR5cGVFcnJvcmAg
d2hlbgogIGBwcm9qZWN0LmR5bmFtaWNgIGNvbnRhaW5zIGEgbm9uLXN0cmluZyAodW5oYXNoYWJs
ZSkgZW50cnkgd2l0aAogIGBhbGxfZXJyb3JzPVRydWVgLgoKIyMgMC4xMi4wICg3LTMtMjAyNikK
CkZlYXR1cmVzOgoKLSBTdXBwb3J0IFtQRVAgODA4XShodHRwczovL3BlcHMucHl0aG9uLm9yZy9w
ZXAtMDgwOC8pIChwYXJ0aWFsbHkgZHluYW1pYwogIHByb2plY3QgbWV0YWRhdGEpIChNRVRBREFU
QSAyLjYpLgotIEFkZCBzdXBwb3J0IGZvciBQeXRob24gMy4xNS4KLSBXYXJuIChbUEVQIDY4NV0o
aHR0cHM6Ly9wZXBzLnB5dGhvbi5vcmcvcGVwLTA2ODUvKSkgd2hlbiBhbiBleHRyYSBuYW1lIGlu
CiAgYHByb2plY3Qub3B0aW9uYWwtZGVwZW5kZW5jaWVzYCBpcyBub3QgYSB2YWxpZCBuYW1lLiBU
aGUgZXh0cmEgaXMgc3RpbGwKICBlbWl0dGVkLCBvbmx5IGEgYENvbmZpZ3VyYXRpb25XYXJuaW5n
YCBpcyBwcm9kdWNlZC4KCkZpeGVzOgoKLSBFcnJvciBvbiBhbiB1bnNldCBkeW5hbWljIHZlcnNp
b24gaW5zdGVhZCBvZiBzaWxlbnRseSB3cml0aW5nCiAgYFZlcnNpb246IDAuMC4wYC4gSWYgYCJ2
ZXJzaW9uImAgaXMgZGVjbGFyZWQgaW4gYHByb2plY3QuZHluYW1pY2AgYnV0IG5ldmVyCiAgYXNz
aWduZWQgYnkgdGhlIGJ1aWxkIGJhY2tlbmQsIHdyaXRpbmcgdGhlIG1ldGFkYXRhIG5vdyByYWlz
ZXMgYQogIGBDb25maWd1cmF0aW9uRXJyb3JgIChgRmllbGQgInByb2plY3QudmVyc2lvbiIgbWlz
c2luZ2ApLCByZXN0b3JpbmcgdGhlIDAuOC54CiAgYmVoYXZpb3IgdGhhdCByZWdyZXNzZWQgaW4g
dGhlIDAuOSByZXdyaXRlLgotIERvbid0IGNyYXNoIG9uIGEgbm9uLXRhYmxlIGBbcHJvamVjdF1g
IHdoZW4gYGFsbF9lcnJvcnM9VHJ1ZWAuCi0gVGlnaHRlbiBgbGljZW5zZS1maWxlc2AgZ2xvYiBj
aGVja3MgYW5kIHByaXZhdGUtdGFnIHBhcnNpbmcuCi0gSGFuZGxlIGJyYWNlcyBpbiB1c2VyIGRh
dGEgd2l0aGluIGVycm9yIG1lc3NhZ2VzLgotIENvcnJlY3QgdGhlIGBJbXBvcnQtTmFtZXNwYWNl
YCBmaWVsZCBuYW1lIGluIHRoZSBtZXRhZGF0YSBtYXBwaW5nLgotIEZpeCBVVEYtOCBhdXRob3Ig
YW5kIG1haW50YWluZXIgbmFtZXMuCgpQZXJmb3JtYW5jZToKCi0gQ2FjaGUgYGdldF90eXBlX2hp
bnRzYCBhbmQgcHJlY29tcGlsZSBkaXNwYXRjaCBwYXR0ZXJucy4KCkRvY3VtZW50YXRpb246Cgot
IEZpeCBhIHN0YWxlIGR5bmFtaWMgZG9jc3RyaW5nIGFuZCBhIGJyb2tlbiBtb2R1bGUgZXhhbXBs
ZS4KLSBBZGQgYSBkb2N1bWVudGF0aW9uIHByb2plY3QgVVJMLgoKSW50ZXJuYWwgYW5kIENJOgoK
LSBSZWZhY3RvcmluZzogY29uc2lzdGVudCBkYXRhY2xhc3MgZGVjb3JhdG9ycywgc29ydGVkIGNv
bnN0YW50IGVudHJpZXMsIGFuZAogIHJlbW92YWwgb2YgZHVwbGljYXRlIGltcG9ydHMgYW5kIGRl
YWQgY29kZS4KLSBDb3ZlciBkZWZlbnNpdmUgYnJhbmNoZXMgaW4gZGlzcGF0Y2ggaGVscGVycyBh
bmQgdmFsaWRhdG9ycy4KLSBTZWN1cmUgR2l0SHViIEFjdGlvbnMgd29ya2Zsb3dzIGFuZCBidW1w
IHBpbm5lZC9kb3duc3RyZWFtIGRlcGVuZGVuY2llcy4KLS0tCiAuLi4tbWV0YWRhdGFfMC4xMS4w
LmJiID0+IHB5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTIuMS5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjExLjAu
YmIgPT4gcHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC4xMi4xLmJifSAoODklKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXByb2plY3QtbWV0
YWRhdGFfMC4xMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
cHJvamVjdC1tZXRhZGF0YV8wLjEyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0
YV8wLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXByb2plY3QtbWV0YWRhdGFfMC4xMi4xLmJiCmluZGV4IDFlNDg1ZGYzMzguLjk5MThjYWUw
NzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXBy
b2plY3QtbWV0YWRhdGFfMC4xMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC4xMi4xLmJiCkBAIC0xNiw3ICsxNiw3IEBA
IFBZUElfUEFDS0FHRSA9ICJweXByb2plY3RfbWV0YWRhdGEiCiAKIGluaGVyaXQgcHlwaSBweXRo
b25fZmxpdF9jb3JlCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNzJmYTQ5NDE4YmI3YzVhMTBm
MjVlMDUwYzQxODAwOTg5OGQxYzA1MTcyMWQxOWY5OGE2ZmI2ZGE1OWE2NmNmIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjg4MDlhNGRmNmZlMDgyNzliMzlhODg5MDY2OTUwNmVkMzE1OGUwNjE3ODU1
YWM5YWZmMDk4ZmNiZTc3MmFlNGMiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhv
bjMtbG9nZ2luZyBcCi0tIAoyLjQ3LjEKCg==

--===============4457406702271625304==--

