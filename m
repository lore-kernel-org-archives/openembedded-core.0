Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36A6C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:49:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16956.1789451364843753706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 22:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cKYyEPV+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZiR3eLLH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0a39cf251-3aeef0f2-cb4f-426e-bbf0-1436ca114cb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789451367;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d/U8OMwWt8jY66plstNDFVVPBgSAoWHFf6JlvN3YBLs=;
	b=cKYyEPV+kFVgshzHlcvYHX4zx1tgUEXvjTNB/uhRn+SPyJqPImcNEbSi4Uji4Q06
	ah1hR2Ym4Ta2AGVx8sKBio3DGLIjE0vyzmD14ApOBfPwmki+TgNXg4yGlPG4K2NVt8z
	tI/jQRIMplyIwNPspiZsj3KlEshKeWnydrnTJREI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789451367;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d/U8OMwWt8jY66plstNDFVVPBgSAoWHFf6JlvN3YBLs=;
	b=ZiR3eLLHeWF2TcPrheQ7ebuMWTaSjOjhGTA63MZtgg2YiioDX8aSsKeHAb/js6EC
	qw+5FX92tC9IZ15soLPt2Pmmyl+rDoVkw81NS7/YOZjYN96MWyxbyWUMlyebZMce6Sz
	r4Klge2yG1UhdRk7WPKE6RHBUwwmQNdpfuAubdUk=
Content-Type: multipart/mixed; boundary="===============1843609274372991132=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sbom-cve-check: upgrading to 1.3.5 SUCCEEDED
Message-ID: <010101a0a39cf251-3aeef0f2-cb4f-426e-bbf0-1436ca114cb5-000000@us-west-2.amazonses.com>
Date: Tue, 15 Sep 2026 05:49:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245813

--===============1843609274372991132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sbom-cve-check* to *1.3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sbom-cve-check-upgrade-1.3.4-1.3.5.patch
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
From 9d38f9a61e53ba0a08b2f0d1fd91b6bf5d302051 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Sep 2026 05:34:08 +0000
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.3.4 -> 1.3.5

Source: CHANGELOG.md

## v1.3.5

### Added or Changed

- Reduced peak memory usage while building database indexes.
- Cached compiled-source path validation results to avoid repeated validation
  and duplicate warnings about missing important files in Linux kernel builds.
- Added the `--rich-logging` command line option.

### Fixed

- Prevented redundant database updates when multiple `sbom-cve-check`
  processes initialize the same database concurrently. Database initialization
  and indexing are now serialized across processes, allowing waiting processes
  to continue once initialization is complete, thereby substantially improving
  the parallel execution of multiple `sbom-cve-check` instances when a database
  update is needed.
---
 ...-sbom-cve-check_1.3.4.bb => python3-sbom-cve-check_1.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.4.bb => python3-sbom-cve-check_1.3.5.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
index c26ce6e6b3..83d420835d 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
+SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============1843609274372991132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-sbom-cve-check-changelog.txt"

Changelog for python3-sbom-cve-check: 1.3.4 -> 1.3.5
Source: CHANGELOG.md

## v1.3.5

### Added or Changed

- Reduced peak memory usage while building database indexes.
- Cached compiled-source path validation results to avoid repeated validation
  and duplicate warnings about missing important files in Linux kernel builds.
- Added the `--rich-logging` command line option.

### Fixed

- Prevented redundant database updates when multiple `sbom-cve-check`
  processes initialize the same database concurrently. Database initialization
  and indexing are now serialized across processes, allowing waiting processes
  to continue once initialization is complete, thereby substantially improving
  the parallel execution of multiple `sbom-cve-check` instances when a database
  update is needed.

--===============1843609274372991132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info, removed "/usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_win.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_unix.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_unix.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_win.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_unix.py /usr/lib/p
 ython3.14/site-packages/sbom_cve_check/utils/lockfile.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_win.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_win.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_unix.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_unix.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_win.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_unix.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_win.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir.py was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_unix.py was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_win.py was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_unix.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_win.cpython-314.pyc was removed

--===============1843609274372991132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.4.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_win.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_unix.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_unix.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_win.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_win.py /usr/lib/py
 thon3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_unix.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_win.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile.py /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_unix.py"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGSIZE changed from 1355819 to 1364094 (+1%)
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PV changed from "1.3.4" to "1.3.5"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.4.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_unix.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockfile_win.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_unix.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockfile_win.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir.py was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_unix.py was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/lockdir_win.py was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_unix.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sbom_cve_check/utils/__pycache__/lockdir_win.cpython-314.pyc was removed

--===============1843609274372991132==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sbom-cve-check-upgrade-1.3.4-1.3.5.patch"

RnJvbSA5ZDM4ZjlhNjFlNTNiYTBhMDhiMmYwZDFmZDkxYjZiZjVkMzAyMDUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgU2VwIDIwMjYgMDU6MzQ6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNib20tY3ZlLWNoZWNrOiB1cGdyYWRlIDEuMy40IC0+IDEuMy41CgpTb3VyY2U6IENI
QU5HRUxPRy5tZAoKIyMgdjEuMy41CgojIyMgQWRkZWQgb3IgQ2hhbmdlZAoKLSBSZWR1Y2VkIHBl
YWsgbWVtb3J5IHVzYWdlIHdoaWxlIGJ1aWxkaW5nIGRhdGFiYXNlIGluZGV4ZXMuCi0gQ2FjaGVk
IGNvbXBpbGVkLXNvdXJjZSBwYXRoIHZhbGlkYXRpb24gcmVzdWx0cyB0byBhdm9pZCByZXBlYXRl
ZCB2YWxpZGF0aW9uCiAgYW5kIGR1cGxpY2F0ZSB3YXJuaW5ncyBhYm91dCBtaXNzaW5nIGltcG9y
dGFudCBmaWxlcyBpbiBMaW51eCBrZXJuZWwgYnVpbGRzLgotIEFkZGVkIHRoZSBgLS1yaWNoLWxv
Z2dpbmdgIGNvbW1hbmQgbGluZSBvcHRpb24uCgojIyMgRml4ZWQKCi0gUHJldmVudGVkIHJlZHVu
ZGFudCBkYXRhYmFzZSB1cGRhdGVzIHdoZW4gbXVsdGlwbGUgYHNib20tY3ZlLWNoZWNrYAogIHBy
b2Nlc3NlcyBpbml0aWFsaXplIHRoZSBzYW1lIGRhdGFiYXNlIGNvbmN1cnJlbnRseS4gRGF0YWJh
c2UgaW5pdGlhbGl6YXRpb24KICBhbmQgaW5kZXhpbmcgYXJlIG5vdyBzZXJpYWxpemVkIGFjcm9z
cyBwcm9jZXNzZXMsIGFsbG93aW5nIHdhaXRpbmcgcHJvY2Vzc2VzCiAgdG8gY29udGludWUgb25j
ZSBpbml0aWFsaXphdGlvbiBpcyBjb21wbGV0ZSwgdGhlcmVieSBzdWJzdGFudGlhbGx5IGltcHJv
dmluZwogIHRoZSBwYXJhbGxlbCBleGVjdXRpb24gb2YgbXVsdGlwbGUgYHNib20tY3ZlLWNoZWNr
YCBpbnN0YW5jZXMgd2hlbiBhIGRhdGFiYXNlCiAgdXBkYXRlIGlzIG5lZWRlZC4KLS0tCiAuLi4t
c2JvbS1jdmUtY2hlY2tfMS4zLjQuYmIgPT4gcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuNS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2sve3B5dGhvbjMtc2Jv
bS1jdmUtY2hlY2tfMS4zLjQuYmIgPT4gcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuNS5iYn0g
KDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2sv
cHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
Ym9tLWN2ZS1jaGVjay9weXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy41LmJiCnNpbWlsYXJpdHkg
aW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVj
ay9weXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuNS5iYgpp
bmRleCBjMjZjZTZlNmIzLi44M2Q0MjA4MzVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuNC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1j
aGVja18xLjMuNS5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVy
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NTcwYTliMzc0OWRkMDQ2
M2ExNzc4ODAzYjEyYTZkY2UiCiAKIFBZUElfUEFDS0FHRSA9ICJzYm9tX2N2ZV9jaGVjayIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJhYTJmNGUxODNiNjAwZmRhZDdjZTZlYjY3ZjdkNjQyYmQzZTdj
NjcyOTNhZTlmZmRhN2QzYTJmZGU0MzNlMDJiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjllZDhi
MGU5YzQ2MDE1NDQ0Y2QzZTMwMzMyZDk1NThlMGJlNWY1ZmVjOTdmNmRmNDdjNjc2MDE2NmEzMTQx
NjciCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDcuMQoK

--===============1843609274372991132==--

