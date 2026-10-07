Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B01CA600B
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:48:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1833.1791352121096547708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AjUUaTaU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YaE8qdPJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a114e82400-fc2a0677-dcb8-4183-9891-2750229d2a01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791352120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/iTXSFYKOMkG1qlVFChlNyTpFx3Z0xlspsnYIcWp38A=;
	b=AjUUaTaUHfaCQJszx1zcic9SaRbo1kuO3IozDumF1LyjzfMEgswNp65Wahi2yMmR
	9O6gVlCYyJGdXXb/w//fxqBMaZtW7jkP9UC4au++xlBsmzEr39Rqauh+MGEBhrT/Kof
	NlKIJ4S0tyx6SgRRAc7jqAYuw62y6JFPo0v5Q05w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791352120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/iTXSFYKOMkG1qlVFChlNyTpFx3Z0xlspsnYIcWp38A=;
	b=YaE8qdPJBJtOoq/S1FQPVLWILpMgpf8z3WfMuDxlondGTAKQVWalpfMDNBvI8ws0
	NN8OA03MO6JBOxmeFxgAlJmuuPVkL726gwdNP7w3PSZou4IklK3t/QqX6wGDsG0r8xl
	3z0Y6CtKRm/RMk7yBoW5BsCIZX97JXZKuLjapq08=
Content-Type: multipart/mixed; boundary="===============0789036046666974086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.6.0 SUCCEEDED
Message-ID: <010101a114e82400-fc2a0677-dcb8-4183-9891-2750229d2a01-000000@us-west-2.amazonses.com>
Date: Wed, 7 Oct 2026 05:48:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.07-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247366

--===============0789036046666974086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.5.0-2.6.0.patch
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
From decbb344753fd9607421b8e883df92dd6a327ddb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 7 Oct 2026 05:34:46 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.5.0 -> 2.6.0

## 2.6.0 (2026-10-06)
### Added

- Add the `towncrier-fragments-zerover` version scheme: like `towncrier-
  fragments`, but while the last tag is `0.x`, `breaking` and `removal`
  fragments bump the minor version and only a `major` fragment proposes `1.0.0`.
  ([#1556]( ))
---
 ...-vcs-versioning_2.5.0.bb => python3-vcs-versioning_2.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.5.0.bb => python3-vcs-versioning_2.6.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb
index a55597dbe4..d21498ca5f 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "956a796e31f80fe714d219d6d1df15a6bf247d10f6d851bf4b98279d0a42da55"
+SRC_URI[sha256sum] = "22e9159288e2d8bca2fa6f6c31c34c9c66aec157f60e9e526f5d160d2516d60f"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============0789036046666974086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info

--===============0789036046666974086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.5.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.6.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 311194 to 313414 (+1%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 831820 to 835176 (+0%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info

--===============0789036046666974086==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.5.0-2.6.0.patch"

RnJvbSBkZWNiYjM0NDc1M2ZkOTYwNzQyMWI4ZTg4M2RmOTJkZDZhMzI3ZGRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNyBPY3QgMjAyNiAwNTozNDo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdmNzLXZlcnNpb25pbmc6IHVwZ3JhZGUgMi41LjAgLT4gMi42LjAKCiMjIDIuNi4wICgy
MDI2LTEwLTA2KQojIyMgQWRkZWQKCi0gQWRkIHRoZSBgdG93bmNyaWVyLWZyYWdtZW50cy16ZXJv
dmVyYCB2ZXJzaW9uIHNjaGVtZTogbGlrZSBgdG93bmNyaWVyLQogIGZyYWdtZW50c2AsIGJ1dCB3
aGlsZSB0aGUgbGFzdCB0YWcgaXMgYDAueGAsIGBicmVha2luZ2AgYW5kIGByZW1vdmFsYAogIGZy
YWdtZW50cyBidW1wIHRoZSBtaW5vciB2ZXJzaW9uIGFuZCBvbmx5IGEgYG1ham9yYCBmcmFnbWVu
dCBwcm9wb3NlcyBgMS4wLjBgLgogIChbIzE1NTZdKCApKQotLS0KIC4uLi12Y3MtdmVyc2lvbmlu
Z18yLjUuMC5iYiA9PiBweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNi4wLmJifSB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi41LjAuYmIg
PT4gcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjYuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi41LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdf
Mi42LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNS4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi42LjAu
YmIKaW5kZXggYTU1NTk3ZGJlNC4uZDIxNDk4Y2E1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNS4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjYuMC5i
YgpAQCAtNSw3ICs1LDcgQEAgbGlicmFyeSB0aGF0IGNhbiBiZSB1c2VkIGluZGVwZW5kZW50bHkg
b2Ygc2V0dXB0b29scy4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT1jOWIwNmFkMmViZDdlMmU4MmQzNGIzY2FmMzUzZTdkNSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1NmE3OTZlMzFmODBmZTcxNGQyMTlkNmQxZGYxNWE2YmYy
NDdkMTBmNmQ4NTFiZjRiOTgyNzlkMGE0MmRhNTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjJl
OTE1OTI4OGUyZDhiY2EyZmE2ZjZjMzFjMzRjOWM2NmFlYzE1N2Y2MGU5ZTUyNmY1ZDE2MGQyNTE2
ZDYwZiIKIAogU1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4x
Cgo=

--===============0789036046666974086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

## 2.6.0 (2026-10-06)
### Added

- Add the `towncrier-fragments-zerover` version scheme: like `towncrier-
  fragments`, but while the last tag is `0.x`, `breaking` and `removal`
  fragments bump the minor version and only a `major` fragment proposes `1.0.0`.
  ([#1556]( ))

--===============0789036046666974086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-17970ba2f2e3ab4181e7d999061285c0585aca80"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:17970ba2f2e3ab4181e7d999061285c0585aca80"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 705 Local 611 Mirrors 0 Missed 94 Current 276 (86% match, 90% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 296 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 341 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 350 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 366 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 375 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 385 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 388 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 411 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 416 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 417 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 432 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 449 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 455 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 474 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 506 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 511 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 513 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 518 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.56.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 519 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 521 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 526 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 529 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 981 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: recipe git-2.56.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 541 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 545 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe qemu-native-11.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-23.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-11.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 546 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 550 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-23.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 981 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 572 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe git-2.56.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-native-11.1.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-11.1.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 594 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 610 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 618 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 628 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 634 of 981 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 663 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 668 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 669 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 670 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-native-4.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-native-4.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 981 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 687 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe libcxx-23.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 700 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-native-4.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-native-4.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcxx-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 715 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-23.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 521 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_recipe_qa)
NOTE: Running task 550 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_fetch)
NOTE: Running task 553 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe compiler-rt-23.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_fetch: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_package_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 813 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 850 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1124 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1201 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_unpack)
NOTE: Running task 1205 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1215 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1232 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_fetch)
NOTE: Running task 1281 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: Running task 1283 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_fetch)
NOTE: Running task 1287 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_recipe_qa)
NOTE: Running task 1292 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_fetch)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1299 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_fetch)
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Started
NOTE: Running task 1311 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1348 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1401 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_fetch: Started
NOTE: Running task 1411 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_recipe_qa: Started
NOTE: Running task 1413 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_fetch: Started
NOTE: Running task 1414 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_unpack)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe git-2.56.0-r0: task do_fetch: Started
NOTE: Running task 1415 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1416 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_unpack)
NOTE: Running task 1417 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1418 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1419 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_unpack: Started
NOTE: Running task 1430 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: Running task 1432 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: Running task 1433 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_fetch)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1439 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_patch)
NOTE: recipe git-2.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 1440 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_patch)
NOTE: Running task 1441 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: Running task 1442 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1445 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: Running task 1446 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_patch)
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1451 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_patch: Started
NOTE: recipe git-2.56.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1515 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: Running task 1516 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1518 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1519 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1520 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: Running task 1521 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1522 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Started
NOTE: Running task 1523 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_patch)
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1551 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 1585 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_recipe_spdx)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1586 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1587 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1588 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1589 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_check_backend)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1592 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_patch: Succeeded
NOTE: Running task 1593 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_rust_gen_targets)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1594 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.56.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Started
NOTE: Running task 1595 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_patch)
NOTE: Running task 1596 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Succeeded
NOTE: Running task 1597 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1599 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_deploy_source_date_epoch unihash changed to e6a53e13660d8bdd6c6b44388afe0ea3bc879c5a2e27b7cc325fc7a1a7207d07
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_deploy_source_date_epoch unihash changed to 745afedbc28c585b7d6a850a5eb5efd58a0baeb84a3637eed6d2e40a7b9674f2
NOTE: recipe git-2.56.0-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1600 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_unpack)
NOTE: Running task 1601 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx)
NOTE: Running task 1603 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_recipe_spdx)
NOTE: Running task 1605 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx)
NOTE: Running task 1606 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch unihash changed to 3b649f485624df111cb2b1c6ec2abe3b7bca98292d7fb0f1fc7e17f05cc801f1
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.56.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 886 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1615 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1616 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_deploy_source_date_epoch unihash changed to 8cce62bfc2d2810e8ac18596cb4405985629f60e4b7fa298ed5e23833ce8789e
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 897 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1618 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1619 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_package_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 907 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 911 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package_setscene)
NOTE: Running setscene task 915 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1630 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1637 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_fetch: Started
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_unpack)
NOTE: recipe git-2.56.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 921 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 923 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 928 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1672 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1674 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe curl-8.22.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1675 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe curl-8.22.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 1677 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 930 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 931 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 933 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1680 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1681 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1682 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1683 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 935 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 936 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 937 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 5b01dc40cbb9fd431177b0fcc1d948d7ef4d3069da39a57f9f3183a00537aee7 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'd40531f31ec6c3510a5df2cd3cb6d0f11ee6afa902f0cf7883234a4e08560bed', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5b01dc40cbb9fd431177b0fcc1d948d7ef4d3069da39a57f9f3183a00537aee7'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed d40531f31ec6c3510a5df2cd3cb6d0f11ee6afa902f0cf7883234a4e08560bed -> 5b01dc40cbb9fd431177b0fcc1d948d7ef4d3069da39a57f9f3183a00537aee7 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 938 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 943 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1687 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1693 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 948 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1696 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 960 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2032 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2054 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2109 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2130 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2169 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2171 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2194 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2195 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2196 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2253 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2254 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2255 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2256 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2314 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2338 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure)
NOTE: recipe git-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_configure)
NOTE: Running task 2340 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2341 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_configure)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2342 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2343 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_configure)
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Started
NOTE: Running task 2344 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_configure)
NOTE: Running task 2345 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_configure)
NOTE: recipe git-2.56.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2346 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_configure)
NOTE: Running task 2348 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Started
NOTE: Running task 2349 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_configure: Started
NOTE: Running task 2350 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure_ptest_base)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 2354 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_compile)
NOTE: Running task 2355 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_compile)
NOTE: Running task 2356 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile)
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile)
NOTE: Running task 2358 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_rust_create_wrappers)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2359 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_compile)
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_compile: Started
NOTE: Running task 2361 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_compile: Started
NOTE: Running task 2362 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Started
NOTE: Running task 2363 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2364 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx)
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Started
NOTE: Running task 2365 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2366 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_configure_ptest_base)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2368 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2369 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_compile)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2370 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_create_spdx)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Succeeded
NOTE: Running task 2372 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile_ptest_base)
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_create_spdx: Started
NOTE: Running task 2373 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: Running task 2375 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_install)
NOTE: Running task 2376 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package)
NOTE: Running task 2378 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package: Started
NOTE: Running task 2379 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Started
NOTE: recipe python3-packaging-26.3-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_install)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Started
NOTE: Running task 2384 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_install)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2386 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Started
NOTE: Running task 2387 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_install)
NOTE: Running task 2390 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_install)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2392 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Started
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot unihash changed to a14f5dd7388778d3ee1d44b47d194a23ea30642b3f747cb53ce88b5592b39844
NOTE: Setscene tasks completed
NOTE: Running task 2394 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Started
NOTE: Running task 2397 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package)
NOTE: Running task 2400 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2401 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package)
NOTE: recipe python3-pytest-9.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_packagedata)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package unihash changed to 9a1a30e251984b344a2cc97abcc7cae082f0c988abb23fb65026fabc41265469
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package unihash changed to 02dd13d63b81aa3321a20a3b663c70197e7c0dae04774e529d77f68c465c0a20
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata became valid
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Started
NOTE: Running setscene task 980 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running task 2403 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package)
NOTE: Running task 2404 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_packagedata: Started
NOTE: Running task 2405 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 2406 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_packagedata unihash changed to 6dac5e2f7f88ccfa40628b4c8b7269c918762ce9188b890086d28bfe6659463a
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_populate_sysroot unihash changed to e20ba79f2015a59b2d0320b4fa1638ab8afb9a4608e47f89d9ce61309869cf10
NOTE: Running task 2408 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_spdx)
NOTE: Running task 2409 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_ipk)
NOTE: Running task 2410 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_deb)
NOTE: Running task 2411 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_rpm)
NOTE: Running task 2412 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_qa)
NOTE: recipe git-2.56.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata unihash changed to 1d09c042c9bf1d15449a309c16cc0300288c14f61f76eb2252f9bbc41e8d757f
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_spdx: Started
NOTE: Running task 2414 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package)
NOTE: Running task 2415 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_qa: Started
NOTE: recipe git-2.56.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package unihash changed to 29dc7d6601a7ad317a9e983fcea96a5164eb9c2a35a5d6eaa903d25abdc554aa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata became valid
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_qa: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-iniconfig/2.3.0/temp/log.do_packagedata_setscene.2455308
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_qa unihash changed to edfa35784d66c7c125612bc241acb6d92bb3e42e8d6461cecc8ac3c53bd873fd
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 2416 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_ipk unihash changed to 478e74176749f72eb3d53896b42a045fd92c3ca6c50bd17323c960def243caaa
NOTE: Setscene tasks completed
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_deb unihash changed to 952a30cc291972764e65de89e6185ad16089206703d7830f0b87fe9d1b06ff7c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_rpm unihash changed to d7d0b928206606a3de27f544c86923a7364b65f9b2366607dfb0fd5fc078d62c
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package unihash changed to 95ba4db2b1c1e71b16a4e81e353cc6f398fc82ddd3b211d7523c8115d0502440
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata became valid
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package unihash changed to 8bc850126114d9467cb5b9b9c4aa6d1fe298138902f4f4b2b6a148f364589d19
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata became valid
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_packagedata: Succeeded
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata_setscene)
NOTE: Running task 2418 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_spdx: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2420 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 2422 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2423 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_create_spdx)
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package unihash changed to 96683e3ebd86d9f22c09d5765ae9f1e506926a2091bc2b9bd819ec84495719d6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 977 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 978 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 979 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 980 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package unihash changed to 7690e7c81ccd5da7e152626e3cda5bb6e21b0d7824c874dad3c5802c33692fe2
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2424 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-setuptools-84.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_packagedata unihash changed to 60e5d8558d713c7fe02088c831de55dcfcdae6de2cde3effccd33ada98169985
NOTE: Setscene tasks completed
NOTE: Running task 2430 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx)
NOTE: Running task 2431 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_ipk)
NOTE: Running task 2432 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_deb)
NOTE: Running task 2433 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_rpm)
NOTE: Running task 2434 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_qa)
NOTE: Running task 2435 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_ipk)
NOTE: Running task 2436 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_deb)
NOTE: Running task 2437 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx: Started
NOTE: Running task 2438 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_qa)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_deb: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_ipk unihash changed to 50bff82aea6e2e643b025bc5edb8e2d07765bbbd2e7dd306c1593a8d3e3c2e16
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_qa unihash changed to 7d0d877e20be7383c57f475198e4f216420e9f2fe9b40c803e542e0efe6d2890
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_rpm unihash changed to e3dacb6c27aab04511dff532383db9cb528e3834f3b4102a5781e84d50ba276f
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_deb unihash changed to cd117e592670b19778968bbc616c41971ef2a9833339dd7cac3a0681e3071ab4
NOTE: recipe git-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2439 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_install)
NOTE: recipe git-2.56.0-r0: task do_install: Started
NOTE: recipe git-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 2440 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package)
NOTE: Running task 2441 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_populate_sysroot)
NOTE: recipe git-2.56.0-r0: task do_package: Started
NOTE: recipe git-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2443 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_install)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install: Succeeded
NOTE: Running task 2444 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2445 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_package)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_package unihash changed to d3ff4532f97923e92e6b1a90dd7476cd2cdb4400b82aa45a640ca89640afbcef
NOTE: Setscene tasks completed
NOTE: Running task 2446 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.168.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb:do_packagedata unihash changed to 480d41f2a3671828395c678d77a033c9228a75f07b1d10ae7912625240dd642b
NOTE: Setscene tasks completed
NOTE: Running task 2447 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_write_ipk)
NOTE: Running task 2448 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_write_deb)
NOTE: Running task 2449 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_write_rpm)
NOTE: Running task 2450 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_qa)
NOTE: recipe python3-packaging-26.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_qa: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe git-2.56.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_write_ipk unihash changed to 311a8053635e7719ba0a8b1c68752b46317e672c8034d844508167c0c46e4c00
NOTE: Running task 2451 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_packagedata)
NOTE: recipe python3-packaging-26.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_write_deb unihash changed to 20b3a687126a80558590839bdd96d514d5f086a6eee6b693b2d0cf275e938686
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_qa unihash changed to 811e16706bb743ec95850c493f93ec40fd9e9bed901d724d8f8dcfab08154235
NOTE: recipe git-2.56.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_write_rpm unihash changed to de10ef988f557d7ca23efa9e443999fc7d7a4dae702809389564fce95ee33f09
NOTE: recipe git-2.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2452 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_create_spdx)
NOTE: Running task 2453 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_write_ipk)
NOTE: Running task 2454 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_write_deb)
NOTE: Running task 2455 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_write_rpm)
NOTE: Running task 2456 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_qa)
NOTE: Running task 2457 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_ipk)
NOTE: Running task 2458 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_deb)
NOTE: Running task 2459 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_rpm)
NOTE: Running task 2460 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_qa)
NOTE: recipe git-2.56.0-r0: task do_create_spdx: Started
NOTE: recipe git-2.56.0-r0: task do_package_write_ipk: Started
NOTE: recipe git-2.56.0-r0: task do_package_write_deb: Started
NOTE: recipe git-2.56.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.56.0-r0: task do_package_qa: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.56.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe git-2.56.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2461 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_create_package_spdx)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe git-2.56.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.56.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_qa unihash changed to 4b7c4c203ed2614425630511e8d3fbbbd9d10c6d0ce1202252f1eae94c8b2258
NOTE: recipe git-2.56.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2462 of 2462 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2462 tasks of which 2252 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-src went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-dbg went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-staticdev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-dev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-doc went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-locale went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0789036046666974086==--

