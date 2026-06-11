Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0543CD98DA
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50417.1781195501857594655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A4xtvfZO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tJ4ziDxh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019eb7867a60-18765e34-abc4-441a-a280-d224ac438335-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JdhRjCB5S+2y3Tf8qskIra0tdEfPj3q4YZ4GHh9lGJc=;
	b=A4xtvfZO7xX0i3bHMwCXTJDjEitSB8H4+N7WDqANOrLOS5pF60Cv2/ShwpLyRokN
	MExQnGHHrHobZNhG03/B1QBxPSNVrzu7LGJYaYI51HKKHxEvNaCA1auwJ4CekbQ+Ffp
	cBaF947TL7nzmHCp0LoI2vRKBP8+wbG4q+8KXqg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JdhRjCB5S+2y3Tf8qskIra0tdEfPj3q4YZ4GHh9lGJc=;
	b=tJ4ziDxhBZggvJrJ8bM710WqZVQJbS+cm7x1Q+bHApzo4snwfmtRwgK/IJtdsZ5G
	D9t+JzsZk6qDKhglAnP8Ze6gELxps3Pey6YpfkR9gBsz8IM/6ow8IWxAhnTTlCBrjwK
	noJFwNzEJjd5jzMlLkXGNNHakMbbwcmwLRlLeR0g=
Content-Type: multipart/mixed; boundary="===============2186622577047389935=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.4.1 SUCCEEDED
Message-ID: <0101019eb7867a60-18765e34-abc4-441a-a280-d224ac438335-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238490

--===============2186622577047389935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.3.3-8.4.1.patch
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
From cd4a40f72f6391188956f2254fe27f4f7c596349 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:16:12 +0000
Subject: [PATCH] python3-click: upgrade 8.3.3 -> 8.4.1

---
 .../python/{python3-click_8.3.3.bb => python3-click_8.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.3.bb => python3-click_8.4.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.3.bb b/meta/recipes-devtools/python/python3-click_8.4.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.3.bb
rename to meta/recipes-devtools/python/python3-click_8.4.1.bb
index 12fd3cbfbd..0669cc6510 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.3.bb
+++ b/meta/recipes-devtools/python/python3-click_8.4.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
+SRC_URI[sha256sum] = "918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============2186622577047389935==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.3.3-8.4.1.patch"

RnJvbSBjZDRhNDBmNzJmNjM5MTE4ODk1NmYyMjU0ZmUyN2Y0ZjdjNTk2MzQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6MTY6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNsaWNrOiB1cGdyYWRlIDguMy4zIC0+IDguNC4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY2xpY2tfOC4zLjMuYmIgPT4gcHl0aG9uMy1jbGlja184LjQuMS5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2xpY2tfOC4zLjMuYmIgPT4gcHl0
aG9uMy1jbGlja184LjQuMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC40LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMy4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tf
OC40LjEuYmIKaW5kZXggMTJmZDNjYmZiZC4uMDY2OWNjNjUxMCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMy4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjQuMS5iYgpAQCAtOCw3ICs4
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NsaWNrLnBvY29vLm9yZy8iCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0x
ZmE5ODIzMmZkNjQ1NjA4OTM3YTBmZGM4MmU5OTliOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjM5ODMyOWFkNDgzN2IyZmY3Y2JlMWRkMTY2YTRjMGY4OTAwYzNjYTNhMjE4ZGUwNDQ2NmYzOGY2
NDk3ZjE4YTIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTE4YjU2MzNlZGRmNmI0MWMzMmQ0ZjQ1
NGJmMGRlODEwMDY1Yzc0ZTNmN2RiZjhlZTU0NTJmOGJlODhkM2U5NiIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9mbGl0X2NvcmUgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============2186622577047389935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.3.3.tar.gz;downloadfilename=click-8.3.3.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.4.1.tar.gz;downloadfilename=click-8.4.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 537604 to 622798 (+16%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/index.rst /usr/lib/python3-click/ptest/docs/changes.rst", added "/usr/lib/python3-click/ptest/docs/changes.md /usr/lib/python3-click/ptest/docs/index.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 921506 to 972354 (+6%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.3.dist-info moved to /usr/lib/python3.14/site-packages/click-8.4.1.dist-info

--===============2186622577047389935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-944836b3d9c8fe92770624e7ee952634597837ba"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:944836b3d9c8fe92770624e7ee952634597837ba"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 583 Local 555 Mirrors 0 Missed 28 Current 301 (95% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 310 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 329 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 331 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 333 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 334 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 337 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 356 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 364 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_qa_setscene)
NOTE: Running setscene task 365 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 368 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 372 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 378 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-click-8.4.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 384 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 389 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-click-8.4.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 396 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 399 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 403 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 408 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 418 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 433 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 446 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe less-692-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 450 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 452 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 453 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 454 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 455 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 458 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_packagedata_setscene)
NOTE: recipe less-692-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 468 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_packagedata_setscene)
NOTE: recipe python3-click-8.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 475 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe less-692-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 476 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 477 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-click-8.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-26.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 479 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe less-692-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 480 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 484 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 486 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 495 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe less-692-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 527 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 529 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-click-8.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 542 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe less-692-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 545 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-click-8.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 560 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 572 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 627 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 629 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 667 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 668 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 671 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 709 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 846 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_fetch)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 850 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 887 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-click-8.4.1-r0: task do_fetch: Started
NOTE: recipe python3-click-8.4.1-r0: task do_fetch: Succeeded
NOTE: recipe less-692-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/file/5.47/temp/log.do_packagedata_setscene.621356
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 888 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_unpack)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 722 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 726 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 959 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1029 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-click-8.4.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.47-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-click-8.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1128 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1299 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1300 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-click-8.4.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1302 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-click-8.4.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-click-8.4.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.47-r0: task do_package_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 775 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1353 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe file-5.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-click-8.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1354 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_create_recipe_spdx)
NOTE: recipe file-5.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running task 1370 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe coreutils-9.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe less-692-r0: task do_fetch: Succeeded
NOTE: Running task 1387 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe less-692-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe less-692-r0: task do_unpack: Succeeded
NOTE: Running task 1403 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_patch)
NOTE: recipe less-692-r0: task do_patch: Started
NOTE: recipe less-692-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 813 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 820 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1406 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 833 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1417 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 836 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 838 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 844 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1434 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1435 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: Running task 1436 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe coreutils-9.11-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: Running task 1497 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe coreutils-9.11-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 874 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 882 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 884 of 884 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1824 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1830 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2054 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata)
NOTE: Running task 2135 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx)
NOTE: recipe python3-click-8.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe less-692-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.47-r0: task do_packagedata: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Started
NOTE: recipe less-692-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2151 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_configure)
NOTE: recipe file-5.47-r0: task do_packagedata: Succeeded
NOTE: recipe less-692-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Succeeded
NOTE: Running task 2158 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_create_spdx)
NOTE: recipe python3-click-8.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2159 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_configure)
NOTE: recipe coreutils-9.11-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.4.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-click-8.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2161 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-click-8.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2162 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_compile)
NOTE: recipe python3-click-8.4.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 77e4f950d0a10954800f386b641172fce07e5c331d5ad8dbc92205ac2f988db8 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'be23eb9d1ebe00405c07db1fe3518b0d944bb9c8f229c2c724934939a15cd573', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '77e4f950d0a10954800f386b641172fce07e5c331d5ad8dbc92205ac2f988db8'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed be23eb9d1ebe00405c07db1fe3518b0d944bb9c8f229c2c724934939a15cd573 -> 77e4f950d0a10954800f386b641172fce07e5c331d5ad8dbc92205ac2f988db8 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-click-8.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2179 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-click-8.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-click-8.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2180 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_install)
NOTE: recipe python3-click-8.4.1-r0: task do_install: Started
NOTE: recipe coreutils-9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-click-8.4.1-r0: task do_install: Succeeded
NOTE: Running task 2181 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-click-8.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-click-8.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2182 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package)
NOTE: Running task 2183 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_populate_sysroot)
NOTE: recipe python3-click-8.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-click-8.4.1-r0: task do_package: Started
NOTE: recipe python3-click-8.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-click-8.4.1-r0: task do_package: Succeeded
NOTE: Running task 2184 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_packagedata)
NOTE: recipe python3-click-8.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_packagedata unihash changed to 6845ebe4860606072332eaa1ba05356657fa5742f31b1fa37e3203efc60bc795
NOTE: Setscene tasks completed
NOTE: Running task 2185 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_create_spdx)
NOTE: recipe python3-click-8.4.1-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe less-692-r0: task do_configure: Succeeded
NOTE: Running task 2186 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_configure_ptest_base)
NOTE: recipe less-692-r0: task do_configure_ptest_base: Started
NOTE: recipe less-692-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2187 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_compile)
NOTE: recipe less-692-r0: task do_compile: Started
NOTE: recipe less-692-r0: task do_compile: Succeeded
NOTE: Running task 2188 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_compile_ptest_base)
NOTE: recipe less-692-r0: task do_compile_ptest_base: Started
NOTE: recipe less-692-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2189 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_install)
NOTE: recipe less-692-r0: task do_install: Started
NOTE: recipe less-692-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_install_ptest_base)
NOTE: recipe less-692-r0: task do_install_ptest_base: Started
NOTE: recipe less-692-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2191 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_package)
NOTE: Running task 2192 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_populate_sysroot)
NOTE: recipe less-692-r0: task do_populate_sysroot: Started
NOTE: recipe less-692-r0: task do_package: Started
NOTE: recipe less-692-r0: task do_populate_sysroot: Succeeded
NOTE: recipe less-692-r0: task do_package: Succeeded
NOTE: Running task 2193 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_packagedata)
NOTE: recipe less-692-r0: task do_packagedata: Started
NOTE: recipe less-692-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_packagedata unihash changed to 3fb29dc3ef336e7461aa4156608b0f05aea0e528ac7a43536bd53fddd61f524e
NOTE: Setscene tasks completed
NOTE: Running task 2194 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_create_spdx)
NOTE: Running task 2195 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_package_write_ipk)
NOTE: Running task 2196 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_package_write_deb)
NOTE: Running task 2197 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_package_write_rpm)
NOTE: Running task 2198 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_package_qa)
NOTE: Running task 2199 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_write_ipk)
NOTE: Running task 2200 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_write_deb)
NOTE: recipe less-692-r0: task do_create_spdx: Started
NOTE: Running task 2201 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_write_rpm)
NOTE: Running task 2202 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_qa)
NOTE: recipe less-692-r0: task do_package_write_ipk: Started
NOTE: recipe less-692-r0: task do_package_write_deb: Started
NOTE: recipe less-692-r0: task do_package_write_rpm: Started
NOTE: recipe less-692-r0: task do_package_qa: Started
NOTE: recipe python3-click-8.4.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-click-8.4.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-click-8.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-click-8.4.1-r0: task do_package_qa: Started
NOTE: recipe less-692-r0: task do_create_spdx: Succeeded
NOTE: Running task 2203 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_create_package_spdx)
NOTE: recipe python3-click-8.4.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-click-8.4.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe less-692-r0: task do_package_qa: Succeeded
NOTE: recipe less-692-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_write_ipk unihash changed to 7bff4583c7a7bbee03c4631173ce6fc84249765604323d3bd447f9ccc17583d9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_692.bb:do_package_qa unihash changed to ececa721c677b57bf2bfa713c192693e32ac3b1c90d6ed2f97fb958bf04cfae3
NOTE: recipe python3-click-8.4.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-click-8.4.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-click-8.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe less-692-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_qa unihash changed to 3d5695b00207f2583d6d1e8ee9d8caab49e455b2238da2a180cd6efbb2c93eb8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_write_deb unihash changed to 543ba6df2bc2ad6f2c3b03df18488e833d98a90c2f02917249d805174aef43ca
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_package_write_rpm unihash changed to 6a8417648c42cc25ddb06e3272226e13828febc8b9e37c91eb1d321e0faaba2a
NOTE: recipe python3-click-8.4.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe less-692-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2204 of 2204 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-click_8.4.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2204 tasks of which 2145 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: file-5.47-r0 do_packagedata_setscene: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.48-r0 to 0:5.47-r0) [version-going-backwards]
ERROR: file-5.47-r0 do_packagedata_setscene: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.48-r0 to 0:5.47-r0) [version-going-backwards]
ERROR: file-5.47-r0 do_packagedata_setscene: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.48-r0 to 0:5.47-r0) [version-going-backwards]
ERROR: file-5.47-r0 do_packagedata_setscene: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.48-r0 to 0:5.47-r0) [version-going-backwards]
ERROR: file-5.47-r0 do_packagedata_setscene: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.48-r0 to 0:5.47-r0) [version-going-backwards]
ERROR: file-5.47-r0 do_packagedata_setscene: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.48-r0 to 0:5.47-r0) [version-going-backwards]
ERROR: file-5.47-r0 do_packagedata_setscene: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.48-r0 to 0:5.47-r0) [version-going-backwards]
ERROR: file-5.47-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2186622577047389935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/changes.rst /usr/lib/python3-click/ptest/docs/index.rst", added "/usr/lib/python3-click/ptest/docs/changes.md /usr/lib/python3-click/ptest/docs/index.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 537604 to 622798 (+16%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.3.dist-info moved to /usr/lib/python3.14/site-packages/click-8.4.1.dist-info

--===============2186622577047389935==--

