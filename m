Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335A1CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.89801.1756850190481652980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ANThT+nr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jeMcJ8l6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101990c6e762c-cf1eeab8-8d4a-4be7-b882-f34912fc9bd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L/IgHGne9m3S9Sn1YZZPsHwmjjfx4cFEa17/oabH3kQ=;
	b=ANThT+nrIzpc0pRHgFoqwXvt9JS0mZNPU4JdgDK7ifBZ8qS79KYda+WkhkIp2Ru4
	ix6WZbqPVB2TWP3uEy2SqYKx7+DttZvzDIxvUMRTQK6B0735nafcmd0y1e/ij6Sn6t5
	uhO3hb690ScAXDKsrjNZaoPaAg2eaU845Qs+kqAU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L/IgHGne9m3S9Sn1YZZPsHwmjjfx4cFEa17/oabH3kQ=;
	b=jeMcJ8l6rJuNZg+BKlhcveHlXTe2TwNXIhQdAUzu2RJ5sYWBJW7rnajNRQYKPEh4
	AjRuqBzVcvFM0kiWIGHDiL0quUyvjtggcAVi5/lybfDOklkTWZaNhqVrteHN4G3+gyK
	/wxG/eck7ALWhr0co7iVuoZAbSjvxZcHNwVbCW9g=
Content-Type: multipart/mixed; boundary="===============2981070995966803905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.25.1 SUCCEEDED
Message-ID: <010101990c6e762c-cf1eeab8-8d4a-4be7-b882-f34912fc9bd9-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222779

--===============2981070995966803905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonschema* to *4.25.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.25.0-4.25.1.patch
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
From 9728a676b0611444ea7caa0e92892e8266114a99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 17:55:58 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.25.0 -> 4.25.1

---
 ...ython3-jsonschema_4.25.0.bb => python3-jsonschema_4.25.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.25.0.bb => python3-jsonschema_4.25.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
index 2f683d5bde..5ccb829ff4 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "e63acf5c11762c0e6672ffb61482bdf57f0876684d8d249c0fe2d730d48bc55f"
+SRC_URI[sha256sum] = "e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============2981070995966803905==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.25.0-4.25.1.patch"

RnJvbSA5NzI4YTY3NmIwNjExNDQ0ZWE3Y2FhMGU5Mjg5MmU4MjY2MTE0YTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNzo1NTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjI1LjAgLT4gNC4yNS4xCgotLS0KIC4uLnl0aG9u
My1qc29uc2NoZW1hXzQuMjUuMC5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4yNS4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnNjaGVtYV80LjI1
LjAuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMjUuMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjI1LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjI1
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yNS4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjI1LjEuYmIKaW5kZXgg
MmY2ODNkNWJkZS4uNWNjYjgyOWZmNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjUuMS5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT03YTYwYTgxYzE0NmVjMjU1OTlhM2UxZGFiYjg2MTBhOCBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9qc29uL0xJQ0VOU0U7bWQ1PTlkNGRlNDMxMTFkMzM1NzBjOGZlNDliNGNiMGUwMWFm
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTYzYWNmNWMxMTc2MmMwZTY2NzJmZmI2MTQ4MmJk
ZjU3ZjA4NzY2ODRkOGQyNDljMGZlMmQ3MzBkNDhiYzU1ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJlNGE5NjU1Y2UwZGEwYzBiNjdhMDg1ODQ3ZTAwYTNhNTE0NDllMTE1N2Y0Zjc1ZTlmYjVhYTU0
NWUxMjJlYjg1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEK
Cg==

--===============2981070995966803905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonschema: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.25.0.tar.gz;downloadfilename=jsonschema-4.25.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.25.1.tar.gz;downloadfilename=jsonschema-4.25.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-jsonschema: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: added "/usr/lib/python3.13/site-packages/jsonschema/tests/typing/__init__.py /usr/lib/python3.13/site-packages/jsonschema/tests/typing/test_all_concrete_validators_match_protocol.py /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/test_all_concrete_validators_match_protocol.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 463146 to 465516 (+1%)
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.25.0 [default] to 4.25.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.25.0" to "4.25.1"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 473964 to 474056 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.25.0.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__init__.py was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__ was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/test_all_concrete_validators_match_protocol.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/test_all_concrete_validators_match_protocol.py was added

--===============2981070995966803905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1941 targets, 53 skipped, 0 masked, 0 errors.
Removing 70 recipes from the qemux86_64 sysroot...done.
Removing 31 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-58191b1964fc15e0ec34e3afb79ebdddaed4444f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:58191b1964fc15e0ec34e3afb79ebdddaed4444f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 583 Local 569 Mirrors 0 Missed 14 Current 283 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 285 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 287 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 293 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 301 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 302 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 310 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 316 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 321 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 323 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 324 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 325 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 328 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 338 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 339 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 346 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 347 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 349 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 352 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 354 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 363 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 368 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 371 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_deb_setscene)
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 372 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 374 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 376 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 377 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb:do_package_qa_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 381 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 383 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 384 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_qa_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 388 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 394 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 395 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 398 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 405 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 409 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 410 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 411 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 417 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 424 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 434 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 436 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-hypothesis/6.135.29/temp/log.do_packagedata_setscene.2651971
NOTE: Running setscene task 447 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 448 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 453 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 529 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.89.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.89.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 592 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.27.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.89.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1076 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1218 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_recipe_qa)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1325 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1326 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_recipe_qa: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 691 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1440 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running setscene task 703 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1446 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 721 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_fetch: Started
NOTE: Running setscene task 724 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1463 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_fetch: Succeeded
NOTE: Running task 1464 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_unpack: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 747 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1496 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 798 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1555 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 814 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 817 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 819 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 839 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1638 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 858 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2149 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2319 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata)
NOTE: Running task 2331 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2405 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_configure)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_compile)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_install)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_package)
NOTE: Running task 2409 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_create_spdx)
NOTE: Running task 2412 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_package_write_ipk)
NOTE: Running task 2413 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_package_write_deb)
NOTE: Running task 2414 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_package_write_rpm)
NOTE: Running task 2415 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2416 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_create_package_spdx)
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.25.1-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2417 of 2417 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2417 tasks of which 2387 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.138.13-r0 to 0:6.135.29-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.135.29-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2981070995966803905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: added "/usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/test_all_concrete_validators_match_protocol.cpython-313.pyc /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__init__.py /usr/lib/python3.13/site-packages/jsonschema/tests/typing/test_all_concrete_validators_match_protocol.py /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/__init__.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.25.0.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__init__.py was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__ was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/__pycache__/test_all_concrete_validators_match_protocol.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/jsonschema/tests/typing/test_all_concrete_validators_match_protocol.py was added

--===============2981070995966803905==--

