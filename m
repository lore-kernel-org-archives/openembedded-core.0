Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DB6C55AB9
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:24:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10709.1785824638428404447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=n47k5c34;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ybhLxlW4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019fcb717210-a63ec09f-9f92-43db-a6f0-a267c19d1614-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785824637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NU8FoJT7YOjEoFtXA7Wp5xtFzM5/aYWSsXjcijqesOk=;
	b=n47k5c34GvGhahdYHmPdMngDJ/IVY6m0DYylfCkvYZvklilitZ4B1luTn7yUA+ih
	XyEcODRPBrZELWsnU4p8PbdAi1ObEx3s6SBBRLnQi2SuiUYN6bXDgLEpWF33mBczGiO
	ZLvz9VuJssbAfBzkDNlbf5oY2zy82bDN/rcpmC+s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785824637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NU8FoJT7YOjEoFtXA7Wp5xtFzM5/aYWSsXjcijqesOk=;
	b=ybhLxlW4bqKHSU5tjkWU6GIN8aW8wH0fO63XiuHmMaVsayuhTx5nhN5EtlS4m+6S
	7clldP0bhaOlssmWBFTlbFrHmz2B3WRscBAsHJOIrwdPFbpMLhpvePk3wbQEgfUuClt
	RfmDkFs1bRXOHaK0vQoVYyhB04B0C3ieoRWUMgqE=
Content-Type: multipart/mixed; boundary="===============1345636175574381918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sbom-cve-check: upgrading to 1.3.3 SUCCEEDED
Message-ID: <0101019fcb717210-a63ec09f-9f92-43db-a6f0-a267c19d1614-000000@us-west-2.amazonses.com>
Date: Tue, 4 Aug 2026 06:23:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242705

--===============1345636175574381918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sbom-cve-check* to *1.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sbom-cve-check-upgrade-1.3.2-1.3.3.patch
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
From 5bd82580e0ce5081caa54dcafb798328b3cdfe4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 4 Aug 2026 06:04:38 +0000
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.3.2 -> 1.3.3

Source: CHANGELOG.md

## v1.3.3
- Updated the version of the CVE databases used for testing.
- Generate a "not affected" assessment if the vulnerability is disputed.
- Handle CVE List version field with multiple version expressions: a version
  prefixed by a comparison operator (`<`, `<=`, `>`, `>=`, or `=`).
- Added support for `uv` and updated the [Developer Guide](
  https://sbom-cve-check.readthedocs.io/en/v1.3.3/dev-guide.html).
- Added a contributing guide.

- Fixed CVE database git repository update when initially cloned from a tag
  and updated to a new tag.
- Ignore version range if a boundary is a date (YYYY-MM-DD) and the component
  version is not a date (e.g., a semver).
- Ignore in some cases the version range if a boundary has a distro packaging
  version (e.g., with a `.el7` suffix), as documented in the [design section](
  https://sbom-cve-check.readthedocs.io/en/v1.3.3/design.html#compute-vex-assessment-from-semantic-version-ranges).
---
 ...-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
index f14901e300..2aca100569 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
+SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============1345636175574381918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sbom-cve-check-upgrade-1.3.2-1.3.3.patch"

RnJvbSA1YmQ4MjU4MGUwY2U1MDgxY2FhNTRkY2FmYjc5ODMyOGIzY2RmZTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNCBBdWcgMjAyNiAwNjowNDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2JvbS1jdmUtY2hlY2s6IHVwZ3JhZGUgMS4zLjIgLT4gMS4zLjMKClNvdXJjZTogQ0hB
TkdFTE9HLm1kCgojIyB2MS4zLjMKLSBVcGRhdGVkIHRoZSB2ZXJzaW9uIG9mIHRoZSBDVkUgZGF0
YWJhc2VzIHVzZWQgZm9yIHRlc3RpbmcuCi0gR2VuZXJhdGUgYSAibm90IGFmZmVjdGVkIiBhc3Nl
c3NtZW50IGlmIHRoZSB2dWxuZXJhYmlsaXR5IGlzIGRpc3B1dGVkLgotIEhhbmRsZSBDVkUgTGlz
dCB2ZXJzaW9uIGZpZWxkIHdpdGggbXVsdGlwbGUgdmVyc2lvbiBleHByZXNzaW9uczogYSB2ZXJz
aW9uCiAgcHJlZml4ZWQgYnkgYSBjb21wYXJpc29uIG9wZXJhdG9yIChgPGAsIGA8PWAsIGA+YCwg
YD49YCwgb3IgYD1gKS4KLSBBZGRlZCBzdXBwb3J0IGZvciBgdXZgIGFuZCB1cGRhdGVkIHRoZSBb
RGV2ZWxvcGVyIEd1aWRlXSgKICBodHRwczovL3Nib20tY3ZlLWNoZWNrLnJlYWR0aGVkb2NzLmlv
L2VuL3YxLjMuMy9kZXYtZ3VpZGUuaHRtbCkuCi0gQWRkZWQgYSBjb250cmlidXRpbmcgZ3VpZGUu
CgotIEZpeGVkIENWRSBkYXRhYmFzZSBnaXQgcmVwb3NpdG9yeSB1cGRhdGUgd2hlbiBpbml0aWFs
bHkgY2xvbmVkIGZyb20gYSB0YWcKICBhbmQgdXBkYXRlZCB0byBhIG5ldyB0YWcuCi0gSWdub3Jl
IHZlcnNpb24gcmFuZ2UgaWYgYSBib3VuZGFyeSBpcyBhIGRhdGUgKFlZWVktTU0tREQpIGFuZCB0
aGUgY29tcG9uZW50CiAgdmVyc2lvbiBpcyBub3QgYSBkYXRlIChlLmcuLCBhIHNlbXZlcikuCi0g
SWdub3JlIGluIHNvbWUgY2FzZXMgdGhlIHZlcnNpb24gcmFuZ2UgaWYgYSBib3VuZGFyeSBoYXMg
YSBkaXN0cm8gcGFja2FnaW5nCiAgdmVyc2lvbiAoZS5nLiwgd2l0aCBhIGAuZWw3YCBzdWZmaXgp
LCBhcyBkb2N1bWVudGVkIGluIHRoZSBbZGVzaWduIHNlY3Rpb25dKAogIGh0dHBzOi8vc2JvbS1j
dmUtY2hlY2sucmVhZHRoZWRvY3MuaW8vZW4vdjEuMy4zL2Rlc2lnbi5odG1sI2NvbXB1dGUtdmV4
LWFzc2Vzc21lbnQtZnJvbS1zZW1hbnRpYy12ZXJzaW9uLXJhbmdlcykuCi0tLQogLi4uLXNib20t
Y3ZlLWNoZWNrXzEuMy4yLmJiID0+IHB5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjMuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3tweXRob24zLXNib20tY3Zl
LWNoZWNrXzEuMy4yLmJiID0+IHB5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjMuYmJ9ICg4MiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3B5dGhv
bjMtc2JvbS1jdmUtY2hlY2tfMS4zLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1j
dmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuMy5iYgpzaW1pbGFyaXR5IGluZGV4
IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0
aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3Nib20tY3ZlLWNoZWNrL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjMuYmIKaW5kZXgg
ZjE0OTAxZTMwMC4uMmFjYTEwMDU2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3Nib20tY3ZlLWNoZWNrL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjIuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tf
MS4zLjMuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTU3MGE5YjM3NDlkZDA0NjNhMTc3
ODgwM2IxMmE2ZGNlIgogCiBQWVBJX1BBQ0tBR0UgPSAic2JvbV9jdmVfY2hlY2siCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMGE3ZjA3YTBjNmNlNDVkNDBhZGM2ZDMxMWRkYzI1YzQ0NjZmNTliYWZj
YmNlMTQ5YjZmYjM2NjM3OTFhNWQ4OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4Yjc2NmJlMWFl
OTJiNGVjZWFhMmY2OTRkZDQ3MjRlMzEwODg2YzY0MzZmNDQyNjdhNmJiYzZhN2I4MWFiOGI5Igog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============1345636175574381918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info

--===============1345636175574381918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.2.tar.gz;downloadfilename=sbom_cve_check-1.3.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.3.tar.gz;downloadfilename=sbom_cve_check-1.3.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PV changed from "1.3.2" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PV changed from "1.3.2" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PV changed from "1.3.2" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PV changed from "1.3.2" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PV changed from "1.3.2" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PV changed from "1.3.2" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PV changed from "1.3.2" to "1.3.3"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGSIZE changed from 1320720 to 1336424 (+1%)
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PV changed from "1.3.2" to "1.3.3"
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.3.dist-info

--===============1345636175574381918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-sbom-cve-check-changelog.txt"

Changelog for python3-sbom-cve-check: 1.3.2 -> 1.3.3
Source: CHANGELOG.md

## v1.3.3
- Updated the version of the CVE databases used for testing.
- Generate a "not affected" assessment if the vulnerability is disputed.
- Handle CVE List version field with multiple version expressions: a version
  prefixed by a comparison operator (`<`, `<=`, `>`, `>=`, or `=`).
- Added support for `uv` and updated the [Developer Guide](
  https://sbom-cve-check.readthedocs.io/en/v1.3.3/dev-guide.html).
- Added a contributing guide.

- Fixed CVE database git repository update when initially cloned from a tag
  and updated to a new tag.
- Ignore version range if a boundary is a date (YYYY-MM-DD) and the component
  version is not a date (e.g., a semver).
- Ignore in some cases the version range if a boundary has a distro packaging
  version (e.g., with a `.el7` suffix), as documented in the [design section](
  https://sbom-cve-check.readthedocs.io/en/v1.3.3/design.html#compute-vex-assessment-from-semantic-version-ranges).

--===============1345636175574381918==--

