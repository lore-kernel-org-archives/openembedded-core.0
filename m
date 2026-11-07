Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4615.1794032732684848291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 22:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=j3n5YsoW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tkYh6JCQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1b4af07ad-5bb2f6ff-bd4a-46e7-ae9b-da6c2f72913f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794032732;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/NxtsC64lnNmKOnsfImlHtIfXgft0By9HMhUMNehAGI=;
	b=j3n5YsoWyBwwXjwMH40RIJNhz79rurIJBsTAbkLsEA1iNFpJ9r3q4peDZoBjzPHN
	6E6z9fbC0Mzad8xHH5ObArDlWEkNfVTvxYsvKYDmtt0NgiIxJvw7b01ZkpGgr4sbHIF
	b+ER2eMyWPT6KWsg5+tvONEyWVkB5Xm/8MDQAyKk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794032732;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/NxtsC64lnNmKOnsfImlHtIfXgft0By9HMhUMNehAGI=;
	b=tkYh6JCQB29Qq4uw7M/GyALeML6vaiXczTJarEntiblvsQ3tNrraahKcGcoywkaM
	rugAyCzBm2Gp9ywuvKzFtBtFmYNjDmRZdpmx+frS6hwuzO20stb6Ttk8Ord+4g0z/PP
	tKjakOjc93rJO45MhYl/axrwxcb0T71+YrGS6cxU=
Content-Type: multipart/mixed; boundary="===============3298890376419418713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.6.0 SUCCEEDED
Message-ID: <010101a1b4af07ad-5bb2f6ff-bd4a-46e7-ae9b-da6c2f72913f-000000@us-west-2.amazonses.com>
Date: Sat, 7 Nov 2026 06:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.07-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 06:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249728

--===============3298890376419418713==
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
From 64680853021aca5db9dfdd5af4f4ec84da110440 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 7 Nov 2026 05:46:36 +0000
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


--===============3298890376419418713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.5.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.6.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 311194 to 313414 (+1%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.5.0" to "2.6.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 831820 to 835176 (+0%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.5.0" to "2.6.0"
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info

--===============3298890376419418713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.5.0-2.6.0.patch"

RnJvbSA2NDY4MDg1MzAyMWFjYTVkYjlkZmRkNWFmNGY0ZWM4NGRhMTEwNDQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNyBOb3YgMjAyNiAwNTo0NjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============3298890376419418713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2003 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-eb7159b8c82ab3f818cfb7f5b988fcb91296bb15"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:eb7159b8c82ab3f818cfb7f5b988fcb91296bb15"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 683 Local 607 Mirrors 0 Missed 76 Current 298 (88% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 308 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 310 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 311 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 312 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 316 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 329 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 366 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 389 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 391 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 392 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 397 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 423 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.99.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libstd-rs-1.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 439 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 443 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 461 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 483 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 492 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libstd-rs-1.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 516 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 526 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 529 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 536 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 543 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 544 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 547 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 550 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pluggy-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 557 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 564 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pytest-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 570 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 574 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 577 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 579 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 596 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 612 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_spdx_setscene)
NOTE: recipe git-2.56.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 619 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.99.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe git-2.56.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 639 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 644 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.99.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 661 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 662 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 670 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.99.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 689 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 694 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 699 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 713 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libcxx-23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 754 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_fetch)
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running task 776 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_fetch)
NOTE: Running task 780 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 748 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 870 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 768 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_packagedata_setscene)
NOTE: Running task 888 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 895 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running setscene task 784 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_fetch: Succeeded
NOTE: recipe compiler-rt-23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 906 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_unpack)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 930 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_unpack)
NOTE: recipe compiler-rt-23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 965 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_fetch)
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 971 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_recipe_qa)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_unpack: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 799 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 973 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_unpack: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.2.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_recipe_qa: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_patch: Started
NOTE: Running setscene task 809 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: Running task 984 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_patch)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 823 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 991 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 996 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 998 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa)
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running task 1007 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_fetch)
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Started
NOTE: Running task 1010 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_unpack: Succeeded
NOTE: Running setscene task 840 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_fetch: Started
NOTE: Running setscene task 841 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 843 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 844 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 845 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe git-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 847 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 851 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 854 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_deploy_source_date_epoch unihash changed to 81959d24f91ca613403f7152c0dc6ab90a3f48e710a143826815081883838f25
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 847 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1054 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 891 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1060 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_patch)
NOTE: Running task 1061 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_fetch)
NOTE: Running setscene task 895 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 899 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 902 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1083 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1085 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1090 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1106 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_unpack)
NOTE: Running task 1107 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_unpack)
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1183 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 907 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1184 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1203 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_unpack: Started
NOTE: recipe git-2.56.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1204 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1215 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_fetch)
NOTE: Running task 1216 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_unpack: Started
NOTE: Running task 1217 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: Running task 1218 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_rust_gen_targets)
NOTE: Running task 1219 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1220 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1226 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_patch)
NOTE: Running task 1231 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1254 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_patch: Started
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Succeeded
NOTE: Running task 1308 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 1311 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx)
NOTE: Running task 1313 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1314 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_unpack)
NOTE: Running task 1315 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_unpack)
NOTE: recipe python3-pytest-9.2.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_rust_gen_targets: Started
NOTE: Running task 1316 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1317 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1318 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1319 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1320 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe git-2.56.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1322 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_recipe_spdx)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1323 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_patch)
NOTE: Running task 1324 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1331 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe git-2.56.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1332 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_patch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1333 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_check_backend)
NOTE: Running task 1334 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_deploy_source_date_epoch unihash changed to 3842beb86650c064b988505dba0f1dac09e4eeb718e11f4ef6356af69c33b850
NOTE: recipe git-2.56.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Started
NOTE: recipe git-2.56.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_deploy_source_date_epoch unihash changed to 20ff758ebaf5601baedb2ff658dfbb6ebc622f2d6c334b5a698a13c9a8739b2f
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_deploy_source_date_epoch unihash changed to e6a53e13660d8bdd6c6b44388afe0ea3bc879c5a2e27b7cc325fc7a1a7207d07
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch unihash changed to 3b649f485624df111cb2b1c6ec2abe3b7bca98292d7fb0f1fc7e17f05cc801f1
NOTE: Running task 1604 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1654 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_patch)
NOTE: Running setscene task 927 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 930 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 934 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 963 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 967 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2030 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2054 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2111 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2135 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2170 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2197 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2198 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2199 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2257 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2258 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2259 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2260 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-9.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2342 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2343 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure)
NOTE: recipe git-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2344 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_configure)
NOTE: Running task 2345 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2346 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_configure)
NOTE: recipe python3-pytest-9.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash bd14cceae358cb6971af2d44a0cd0fe38cfd933061179814d70308777887a7cc to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '852806d5f9a3c3556e612c68e81c46528deb713b0cfd54148be6380a618d77a5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'bd14cceae358cb6971af2d44a0cd0fe38cfd933061179814d70308777887a7cc'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 852806d5f9a3c3556e612c68e81c46528deb713b0cfd54148be6380a618d77a5 -> bd14cceae358cb6971af2d44a0cd0fe38cfd933061179814d70308777887a7cc as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Started
NOTE: Running task 2348 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2350 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_configure)
NOTE: recipe git-2.56.0-r0: task do_configure: Started
NOTE: Running task 2351 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_configure)
NOTE: Running task 2352 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_configure)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-9.2.0-r0: task do_configure: Started
NOTE: Running task 2365 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_configure: Started
NOTE: Running task 2366 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_configure: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: Running task 2368 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_configure_ptest_base)
NOTE: Running task 2369 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2370 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile)
NOTE: Running task 2372 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_rust_create_wrappers)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2373 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2376 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: Running task 2377 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_compile)
NOTE: Running task 2378 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2379 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pluggy-1.7.0-r0: task do_compile: Started
NOTE: Running task 2380 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_configure)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2382 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_compile)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_compile: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile_ptest_base)
NOTE: Running task 2384 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2386 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2389 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package)
NOTE: Running task 2390 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2391 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-packaging-26.3-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install_ptest_base)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_compile: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Started
NOTE: Running task 2395 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_install)
NOTE: Running task 2397 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_compile_ptest_base)
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2400 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_install: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_install)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2402 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_install)
NOTE: Running task 2403 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_package)
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_package: Started
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2405 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_install_ptest_base)
NOTE: Running task 2407 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Started
NOTE: Running task 2408 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_populate_sysroot)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2409 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package)
NOTE: Running task 2411 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2412 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_package)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pluggy-1.7.0-r0: task do_package: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2415 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package)
NOTE: Running task 2416 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 2417 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package unihash changed to 85a5d564c527695c26c966c0529b3f6a373f97a9c41192e92ba918d34d74e6f3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata became valid
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package: Started
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_packagedata unihash changed to 6dac5e2f7f88ccfa40628b4c8b7269c918762ce9188b890086d28bfe6659463a
NOTE: Running task 2418 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_spdx)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 2419 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_ipk)
NOTE: Running task 2420 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_deb)
NOTE: Running task 2421 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-9.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_populate_sysroot unihash changed to b8121917447bf997d45d72c30a6985e1573b90b40f51e2337092a9718502123b
NOTE: recipe git-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_spdx: Started
NOTE: Running task 2424 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_qa)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata unihash changed to 1d09c042c9bf1d15449a309c16cc0300288c14f61f76eb2252f9bbc41e8d757f
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: recipe git-2.56.0-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_qa: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_package unihash changed to 4ad1d36edfa1c9f5261a3c1602d0415ecb530bc928177798d52a25911213bd62
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_qa unihash changed to edfa35784d66c7c125612bc241acb6d92bb3e42e8d6461cecc8ac3c53bd873fd
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_ipk unihash changed to 478e74176749f72eb3d53896b42a045fd92c3ca6c50bd17323c960def243caaa
NOTE: recipe python3-iniconfig-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_deb unihash changed to 952a30cc291972764e65de89e6185ad16089206703d7830f0b87fe9d1b06ff7c
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_rpm unihash changed to d7d0b928206606a3de27f544c86923a7364b65f9b2366607dfb0fd5fc078d62c
NOTE: Setscene tasks completed
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_package unihash changed to a2a163943a01e6ffab5efa15e92a5e2e98c89cb97811d320c8202fc3a8a90c81
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_packagedata unihash changed to 080693ddea0967daddf0aeebd0a02a79ab26e09eacb1a024ce156588a8475784
NOTE: recipe python3-pytest-9.2.0-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package unihash changed to 284d975cb689ae8dd33c3b5fd4972f7c3184431c297e6f06cb9b07347ed61012
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_packagedata became valid
NOTE: recipe python3-pluggy-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_packagedata_setscene)
NOTE: Running task 2429 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_ipk)
NOTE: Running task 2430 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_deb)
NOTE: Running task 2431 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_spdx: Started
NOTE: Running task 2432 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_qa)
NOTE: recipe python3-pytest-9.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_deb: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_qa: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2434 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_create_spdx)
NOTE: Running task 2435 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_create_spdx: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_ipk unihash changed to 33b97c06cd7982cf5aa54317d29a404ed13c0d87e6a296db51f27a653821408e
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_packagedata unihash changed to baeb6abdce0c3121b83a2e60a51d63b36a58ce0583bd7e308dab4b2ab68f2090
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_qa unihash changed to 144925792b5e57325e7550e83b9800cee84ddc88f42339986378ff943b6b6a91
NOTE: Running task 2436 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_deb unihash changed to 8341b56b2e2acd0b40b55be32fe9dafa3c5a550f7ba8f42396b1adb43099dd62
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_package_write_rpm unihash changed to 70391fce1d2602e7dbe97dab315b8ab8c5db8cd99304ee9f664e18aadea85b89
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package unihash changed to 76d15788ed24bdcb9c7764cb214ae79229aebbf324d6919932f5d0e5ffb341d8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 977 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 978 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 979 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 980 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.2.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 981 of 981 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe git-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_install)
NOTE: recipe git-2.56.0-r0: task do_install: Started
NOTE: recipe git-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package)
NOTE: Running task 2444 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_populate_sysroot)
NOTE: recipe git-2.56.0-r0: task do_package: Started
NOTE: recipe git-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2446 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_install)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2448 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_package)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_package: Succeeded
NOTE: Running task 2449 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_packagedata: Started
NOTE: recipe git-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_packagedata)
NOTE: recipe git-2.56.0-r0: task do_packagedata: Started
NOTE: recipe git-2.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2451 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_create_spdx)
NOTE: Running task 2452 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_write_ipk)
NOTE: Running task 2453 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_write_deb)
NOTE: Running task 2454 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_write_rpm)
NOTE: Running task 2455 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package_qa)
NOTE: Running task 2456 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_ipk)
NOTE: Running task 2457 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_deb)
NOTE: Running task 2458 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_rpm)
NOTE: recipe git-2.56.0-r0: task do_create_spdx: Started
NOTE: Running task 2459 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_qa)
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_ipk unihash changed to 227b45c05bf730fb4496201f9c6f9a9d2170c7910927bcfd13da28a1fa1b04a7
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_qa unihash changed to c5d7c9cd4f4bdeb26dc04916fca1cbeacf8ad44d475ddc4d38911ca358ebf76c
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_rpm unihash changed to 84baeafac4a98ecc69d1dd46b4a4e6ea1ed514339a34a6abd48aa46cef49d73f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_package_write_deb unihash changed to bd07b92d743239686660c109ac8dceafe30ed3d3e46031e796634a093e860b68
NOTE: recipe git-2.56.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe git-2.56.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2460 of 2465 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.6.0.bb:do_create_package_spdx)
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-vcs-versioning-2.6.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.170.12-r0: task do_packagedata: Failed
NOTE: recipe git-2.56.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.56.0-r0: task do_package_qa: Succeeded
NOTE: recipe git-2.56.0-r0: task do_package_write_deb: Succeeded
NOTE: Tasks Summary: Attempted 2460 tasks of which 2293 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261107054550.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261107054550.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.170.12/temp/log.do_packagedata.229679
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.170.15-r0 to 0:6.170.12-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.170.12-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.170.12/temp/log.do_packagedata.229679
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb:do_packagedata) failed with exit code '1'

--===============3298890376419418713==
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

--===============3298890376419418713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.6.0.dist-info

--===============3298890376419418713==--
