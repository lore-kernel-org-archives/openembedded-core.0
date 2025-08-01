Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08BCCA0ED9
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.88811.1754057271284911783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gfbRbWuM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dXM2Rov4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019865f5f149-2867e53b-38d7-4e29-8068-02e34abb7670-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QYxIltAomYifAguoDi/62Hh2+JzAKvRLVuMphyF0pGw=;
	b=gfbRbWuMLdFWSwIdyCf1oGk3//4kzUtSho0Q8kHL68vXbf+MBK7JlGejlsNKq1wL
	et3A+N9e9ZFKH0QrU+E11HK+C43FMDfwhXaiwKhU1uR4As3PVSMdPPGPy2CMSa7KjcT
	IYJtSUgIUmRnWcItVbJmSCAIv1c2FsC+FnQV9ndE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QYxIltAomYifAguoDi/62Hh2+JzAKvRLVuMphyF0pGw=;
	b=dXM2Rov4BWcegJGBtciSgbQwKHFpE1zdF13MgF+IRKLSSV2w5t1TMdQ8s6IVKicL
	1+ORnCnZWheVyinzwUmhjHEUGsQtuLUpChAdom7LUrR8l/tjCMqOSzoIzA4f3JEYK5L
	acQy5gP9aAXpNYtAzcp+OpIgqAOdKG1ejNeRpN4A=
Content-Type: multipart/mixed; boundary="===============8168795644633982519=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.25.0 SUCCEEDED
Message-ID: <0101019865f5f149-2867e53b-38d7-4e29-8068-02e34abb7670-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221280

--===============8168795644633982519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonschema* to *4.25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.24.0-4.25.0.patch
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
From b249d0de17d55fea61ba5233c5853f35e3ce1a44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:26:22 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.24.0 -> 4.25.0

---
 ...ython3-jsonschema_4.24.0.bb => python3-jsonschema_4.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.24.0.bb => python3-jsonschema_4.25.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
index 7a5f4a09a6..69cbf06760 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "0b4e8069eb12aedfa881333004bccaec24ecef5a8a6a4b6df142b2cc9599d196"
+SRC_URI[sha256sum] = "e63acf5c11762c0e6672ffb61482bdf57f0876684d8d249c0fe2d730d48bc55f"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8168795644633982519==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.24.0-4.25.0.patch"

RnJvbSBiMjQ5ZDBkZTE3ZDU1ZmVhNjFiYTUyMzNjNTg1M2YzNWUzY2UxYTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOToyNjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjI0LjAgLT4gNC4yNS4wCgotLS0KIC4uLnl0aG9u
My1qc29uc2NoZW1hXzQuMjQuMC5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4yNS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnNjaGVtYV80LjI0
LjAuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMjUuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjI0LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjI1
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yNC4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjI1LjAuYmIKaW5kZXgg
N2E1ZjRhMDlhNi4uNjljYmYwNjc2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjUuMC5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT03YTYwYTgxYzE0NmVjMjU1OTlhM2UxZGFiYjg2MTBhOCBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9qc29uL0xJQ0VOU0U7bWQ1PTlkNGRlNDMxMTFkMzM1NzBjOGZlNDliNGNiMGUwMWFm
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGI0ZTgwNjllYjEyYWVkZmE4ODEzMzMwMDRiY2Nh
ZWMyNGVjZWY1YThhNmE0YjZkZjE0MmIyY2M5NTk5ZDE5NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJlNjNhY2Y1YzExNzYyYzBlNjY3MmZmYjYxNDgyYmRmNTdmMDg3NjY4NGQ4ZDI0OWMwZmUyZDcz
MGQ0OGJjNTVmIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEK
Cg==

--===============8168795644633982519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.24.0.tar.gz;downloadfilename=jsonschema-4.24.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.25.0.tar.gz;downloadfilename=jsonschema-4.25.0.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 457929 to 463146 (+1%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.24.0" to "4.25.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.24.0 [default] to 4.25.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 471960 to 473964 (+0%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.24.0" to "4.25.0"
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.24.0.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.25.0.dist-info

--===============8168795644633982519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1934 targets, 50 skipped, 0 masked, 0 errors.
Removing 33 recipes from the core2-64 sysroot...done.
Removing 69 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-17ffa51b8a1b0fbe64e5c29e6bad6b66cfd2096a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:17ffa51b8a1b0fbe64e5c29e6bad6b66cfd2096a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 576 Local 562 Mirrors 0 Missed 14 Current 288 (97% match, 98% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 295 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 297 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 299 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 307 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 317 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 318 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 322 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 326 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 327 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 329 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 332 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_qa_setscene)
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_qa_setscene)
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 334 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 335 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 337 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 339 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 340 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 341 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 342 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 343 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 344 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 345 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_qa_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 348 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 351 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 361 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 369 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 374 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_create_spdx_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 375 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_qa_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 386 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 392 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 393 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 395 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 397 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_qa_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 401 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_populate_lic_setscene)
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 407 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 408 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 415 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 422 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 423 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 428 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 430 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 432 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 435 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rpds-py-0.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 444 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 453 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_packagedata_setscene)
NOTE: recipe python3-rpds-py-0.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-referencing-0.36.2-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.135.29/temp/log.do_packagedata_setscene.1649908
NOTE: Running setscene task 479 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 481 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 483 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 514 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 525 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 536 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 539 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 580 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 613 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1104 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1159 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_recipe_qa)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_recipe_qa: Started
NOTE: Running task 1302 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1311 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 689 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1437 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_fetch)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1443 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 709 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 710 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 719 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 726 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 751 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 754 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 766 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 767 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 775 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 793 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1510 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1511 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1564 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1580 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_patch: Succeeded
NOTE: Running task 1624 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1631 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 864 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2128 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2314 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata)
NOTE: Running task 2322 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2399 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_install)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_package)
NOTE: Running task 2403 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_create_spdx)
NOTE: Running task 2406 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_package_write_ipk)
NOTE: Running task 2407 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_package_write_deb)
NOTE: Running task 2408 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_package_write_rpm)
NOTE: Running task 2409 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2410 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_create_package_spdx)
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.25.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2411 of 2411 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2411 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.136.6-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8168795644633982519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.24.0.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.25.0.dist-info

--===============8168795644633982519==--

