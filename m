Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F817C5CFE6
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49081.1786433034887924389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FsMuHQS9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ccrJMnmM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019fefb4d6ab-9d3238ff-11bc-4570-b7aa-bac56222d5e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433034;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TWYXtvbSPWG/zbxUCtvX2JzUZlMqVjrJRdFkmqOPOCM=;
	b=FsMuHQS9iLYBlYuLOeHr2ivNTj45RCKAB63vB9WG1iYAJG9VlFGb+Ufva+HU3iUw
	Stt8H0sxPQ0KQo+2FlBspuZjwCLOeUry/PpqdUKWc5R+EA1UlFFizH1va+MSQ5WsOPg
	umuUajMtQs9Hs478Ez60pA5w1XXqO8GVORP6pZPg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433034;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TWYXtvbSPWG/zbxUCtvX2JzUZlMqVjrJRdFkmqOPOCM=;
	b=ccrJMnmMdfMazPgOx05kmZBfcN96rsZ7sS9TDdGiVKG1TbkLLaYU0680IvGPJyTX
	9bTnlA/Kh6VygGF8VB4p/zJMi3vlzKcM+FuzqxdO6mAZkMPhVt063bfUbqhXPnZtMXk
	2tI8BJQto+VIhBqUY9urBUz2vCHrP6TNGb9jA/kM=
Content-Type: multipart/mixed; boundary="===============8486174108846027934=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.2.0 FAILED
Message-ID: <0101019fefb4d6ab-9d3238ff-11bc-4570-b7aa-bac56222d5e5-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243162

--===============8486174108846027934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-shacl2code* to *1.2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-shacl2code-upgrade-1.1.0-1.2.0.patch
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
From b73a0d3601d424791ce9ff9662a8dbaded3722e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 11 Aug 2026 06:17:09 +0000
Subject: [PATCH] python3-shacl2code: upgrade 1.1.0 -> 1.2.0

---
 ...{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.2.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb b/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
index a9c8bec84f..6956aad618 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
+SRC_URI[sha256sum] = "92c5bb633b232bb914699157b3e79796aaf1672f22c0cac0cc633f353aa8a398"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8486174108846027934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.2.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.2.0.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============8486174108846027934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.1.0.tar.gz;downloadfilename=shacl2code-1.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.2.0.tar.gz;downloadfilename=shacl2code-1.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-shacl2code: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1610517 to 1726614 (+7%)
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.2.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.2.0.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============8486174108846027934==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-1.1.0-1.2.0.patch"

RnJvbSBiNzNhMGQzNjAxZDQyNDc5MWNlOWZmOTY2MmE4ZGJhZGVkMzcyMmUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTEgQXVnIDIwMjYgMDY6MTc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNoYWNsMmNvZGU6IHVwZ3JhZGUgMS4xLjAgLT4gMS4yLjAKCi0tLQogLi4ue3B5dGhv
bjMtc2hhY2wyY29kZV8xLjEuMC5iYiA9PiBweXRob24zLXNoYWNsMmNvZGVfMS4yLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zaGFjbDJjb2RlXzEuMS4w
LmJiID0+IHB5dGhvbjMtc2hhY2wyY29kZV8xLjIuMC5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8xLjEuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMi4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8xLjIuMC5iYgppbmRleCBhOWM4YmVj
ODRmLi42OTU2YWFkNjE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2hhY2wyY29kZV8xLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8xLjIuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wNTgyZjM1
ODYyOGYyOTlmMjljMjNiZjVmYjJmNzNjOSIKIAogUFlQSV9QQUNLQUdFID0gInNoYWNsMmNvZGUi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGYzYTI0M2M2NDgyYTBmOTVjNWE3OTMyODhkMzA0OTA4
NTA2YjUxYjgyZGM2MTMzZGUyMmJlNDc3Y2Q3NWMyNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5
MmM1YmI2MzNiMjMyYmI5MTQ2OTkxNTdiM2U3OTc5NmFhZjE2NzJmMjJjMGNhYzBjYzYzM2YzNTNh
YThhMzk4IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============8486174108846027934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-2be8bb818b656ef2c419cf7f7b7d449695585934"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:2be8bb818b656ef2c419cf7f7b7d449695585934"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 514 Local 428 Mirrors 0 Missed 86 Current 302 (83% match, 89% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 311 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 371 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 465 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 468 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 473 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 476 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 477 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 480 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 483 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 488 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 490 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 491 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 498 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 520 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 528 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 540 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 542 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 543 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 546 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 560 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 571 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-native-26.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 590 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 596 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-poetry-core-native-2.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 604 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 606 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 613 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 615 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 616 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pip-native-26.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 630 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 634 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 635 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 816 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pip-native-26.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 659 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Started
NOTE: recipe python3-pip-native-26.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 661 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 673 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 684 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 687 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 855 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 862 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: Running task 864 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: Running task 870 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: Running task 873 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: Running task 874 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 876 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running task 879 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 888 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 693 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 904 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: Running setscene task 698 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 905 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 957 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 990 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 992 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 993 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 994 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: Running task 1007 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: Running task 1021 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Started
NOTE: Running task 1022 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1024 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1083 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb:do_recipe_qa)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 712 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1097 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb:do_recipe_qa)
NOTE: Running task 1098 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: Running task 1099 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_unpack)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_recipe_qa: Started
NOTE: Running task 1100 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rdflib-7.6.0-r0: task do_recipe_qa: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1101 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: Running task 1102 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: Running task 1103 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1104 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: Running task 1105 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_patch)
NOTE: Running task 1106 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1107 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_unpack)
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1122 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1251 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Started
NOTE: Running task 1253 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.6.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1254 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Running task 1255 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb:do_fetch)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: Running task 1256 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: Running task 1257 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1258 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: Running task 1260 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.6.0-r0: task do_fetch: Started
NOTE: Running task 1261 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_patch)
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: Running task 1262 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: Running task 1263 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: Running task 1264 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: Running task 1265 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1269 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: Running task 1270 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb:do_patch)
NOTE: Running task 1271 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb:do_unpack)
NOTE: Running task 1292 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1294 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 1328 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_fetch)
NOTE: Running task 1365 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: Running task 1366 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-rdflib-7.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch unihash changed to 29b2d2009b0b936ed2d026f93fa18bb3f723303aebc56f4601a0cae395097392
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1368 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: Running task 1370 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx)
NOTE: Running task 1371 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: Running task 1374 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-rdflib-7.6.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1375 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb:do_unpack)
NOTE: Running task 1376 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_unpack: Started
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Load average limiting set to True as load average: 1.5018259684244792 - using 14/16 bitbake threads
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-rdflib-7.6.0-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch unihash changed to f5fb11a830ca434568e1253f47338aa1f1dac9a3e3a89255813a1f2d1c62c571
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-rdflib-7.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-shacl2code-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 713 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 728 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 746 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 771 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 779 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 814 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 816 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Load average limiting set to False as load average: 1.460906982421875 - using 1/16 bitbake threads
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1572 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: Running task 1598 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1691 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1715 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: Running task 1766 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb:do_patch)
NOTE: Running task 1800 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1806 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: Running task 1808 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb:do_patch)
NOTE: Running task 1811 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1860 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-rdflib-7.6.0-r0: task do_patch: Started
NOTE: Running task 1888 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: Running task 1889 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe gcc-16.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rdflib-7.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1890 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1891 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1892 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_configure)
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rdflib-7.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1893 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure)
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Started
NOTE: recipe gcc-16.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_configure)
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Started
NOTE: recipe python3-pyparsing-3.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb:do_deploy_source_date_epoch unihash changed to ae8b90f41f17b4d6edb82315aeddc81481082e77f94e90a87fd1c627522e1be3
NOTE: recipe python3-rdflib-7.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1895 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: Running task 1899 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb:do_deploy_source_date_epoch unihash changed to a501aaaff664d600f3d2fd52fdef8c5e34e774f38098e40cae5da57619bf174c
NOTE: Setscene tasks completed
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1902 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1906 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe python3-3.14.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1909 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 01601c830bf0505dffefe38b59daca3ab016e10d573425e9e20abf8724f20aa7
NOTE: recipe gcc-16.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1912 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_compile)
NOTE: recipe gcc-16.1.0-r0: task do_compile: Started
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1914 of 2084 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_compile)
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1914 tasks of which 1824 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811060900.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811060900.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.1777426
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.1777426
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============8486174108846027934==--

