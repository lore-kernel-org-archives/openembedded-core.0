Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909E2C54E58
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2101.1706810405467394132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z192KsmY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dSGOnzRX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d65d3f3b2-de9e543c-317f-4bfd-9309-f4b3605ae9ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wrVRbdvoDHnTTvAgOsiJaAe1kz9p0xse0B8vLcIxbqw=;
	b=Z192KsmYdR8S0QWSKdiRC7RtgODww67E8Q/7Uk/S8xJ0wm6FutWcUKrkFMsAGqdJ
	FjpT0Z9coXK+MvqqbAW2bH1dqlBDdBQSEP0X18LjxD3CBIWP7SGyiqxMJ+tl+/1ib7D
	VatMYbs2li4yR7zkxkAmDFetNsjNwx4HyK3f2zvo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wrVRbdvoDHnTTvAgOsiJaAe1kz9p0xse0B8vLcIxbqw=;
	b=dSGOnzRXhxEXTokb23IiAATS0niiyAVbpVqTEvEh4ViBLxpq4UdFZSUWRNzA3gAY
	b3G5C7Yb910K9NYmeHYWWE2sCRHQ+RH43hCTZu0ggknMMHPmkuaqYP2QdlbZWa7Y2iR
	ymMdJYNJW+qK6aRO4I3P9zD5te6vreBTkX9Nf4zM=
Content-Type: multipart/mixed; boundary="===============4420701602824784834=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.2.0 SUCCEEDED
Message-ID: <0101018d65d3f3b2-de9e543c-317f-4bfd-9309-f4b3605ae9ac-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194654

--===============4420701602824784834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.1.0-2.2.0.patch
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
From bbffed40419739af192baf3286ee3fa1c5a3fa0d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:42:59 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.1.0 -> 2.2.0

---
 .../{python3-urllib3_2.1.0.bb => python3-urllib3_2.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.1.0.bb => python3-urllib3_2.2.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.2.0.bb
index b5b37e2924..294ad8026f 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "df7aa8afb0148fa78488e7899b2c59b5f4ffcfa82e6c54ccb9dd37c1d7b52d54"
+SRC_URI[sha256sum] = "051d961ad0c62a94e50ecf1af379c3aba230c66c710493493560c0c223c49f20"
 
 inherit pypi python_hatchling
 
-- 
2.42.0


--===============4420701602824784834==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.1.0-2.2.0.patch"

RnJvbSBiYmZmZWQ0MDQxOTczOWFmMTkyYmFmMzI4NmVlM2ZhMWM1YTNmYTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODo0Mjo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAyLjEuMCAtPiAyLjIuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
dXJsbGliM18yLjEuMC5iYiA9PiBweXRob24zLXVybGxpYjNfMi4yLjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXVybGxpYjNfMi4xLjAuYmIgPT4g
cHl0aG9uMy11cmxsaWIzXzIuMi4wLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi4yLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
bGxpYjNfMi4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy11cmxsaWIzXzIuMi4wLmJiCmluZGV4IGI1YjM3ZTI5MjQuLjI5NGFkODAyNmYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIu
Mi4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2hh
em93L3VybGxpYjMiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0UudHh0O21kNT01MmQyNzNhMzA1NGNlZDU2MTI3NWQ0ZDE1MjYwZWNkYSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImRmN2FhOGFmYjAxNDhmYTc4NDg4ZTc4OTliMmM1OWI1ZjRmZmNm
YTgyZTZjNTRjY2I5ZGQzN2MxZDdiNTJkNTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDUxZDk2
MWFkMGM2MmE5NGU1MGVjZjFhZjM3OWMzYWJhMjMwYzY2YzcxMDQ5MzQ5MzU2MGMwYzIyM2M0OWYy
MCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Mi4wCgo=

--===============4420701602824784834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info/licenses -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__init__.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py /usr/lib/python3.12/site-packages/urllib3/http2.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/response.py /usr/lib/python3.12/site-packages/urllib3/contr
 ib/emscripten/__pycache__/response.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 695041 to 811735 (+17%)
Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info moved to /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__init__.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__ was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/response.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/response.py was added
  /usr/lib/python3.12/site-packages/urllib3/http2.py was added
  /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc was added

--===============4420701602824784834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-64 sysroot...done.
Removing 72 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b0297d422c8c80b6e20a090f9aad25c764b63857"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b0297d422c8c80b6e20a090f9aad25c764b63857"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 568 Local 553 Mirrors 0 Missed 15 Current 304 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 308 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 309 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 310 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 312 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 313 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 315 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 316 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 318 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 336 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 337 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-idna-3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 446 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.92.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-5.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.92.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pyopenssl/23.3.0/temp/log.do_packagedata_setscene.1192210
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 487 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_package_setscene)
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pytz/2023.3/temp/log.do_packagedata_setscene.1192221
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_setscene)
NOTE: Running setscene task 505 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 546 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_setscene: Started
NOTE: Running task 987 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_recipe_qa)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_recipe_qa: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 613 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1410 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_fetch)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1417 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1449 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1450 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 647 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1531 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1532 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 716 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 732 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 734 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1588 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1589 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_patch: Started
NOTE: Running setscene task 771 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 776 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1611 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1612 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 782 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1618 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_populate_lic)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 787 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 791 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 796 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_populate_lic unihash changed to dd086f0ec639926131ea5ff0d5015d093f69730d0506ed68c21789d8de1fc2cc
NOTE: recipe python3-urllib3-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1680 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 833 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 838 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 862 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1740 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 872 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Running task 2186 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2254 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb:do_packagedata)
NOTE: Running task 2421 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2441 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyopenssl-23.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2463 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_configure)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_install)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package)
NOTE: Running task 2467 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2469 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_create_spdx)
NOTE: Running task 2470 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_write_ipk)
NOTE: Running task 2471 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_write_deb)
NOTE: Running task 2472 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_write_rpm)
NOTE: Running task 2473 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_qa)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2474 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2475 of 2475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2475 tasks of which 2443 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl-src went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl-dbg went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl-tests went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl-staticdev went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl-dev went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl-doc went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl-locale went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyopenssl went backwards which would break package feeds (from 0:24.0.0-r0 to 0:23.3.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-23.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2023.4-r0 to 0:2023.3-r0) [version-going-backwards]
ERROR: python3-pytz-2023.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4420701602824784834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-urllib3: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.1.0.tar.gz;downloadfilename=urllib3-2.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.2.0.tar.gz;downloadfilename=urllib3-2.2.0.tar.gz"
packages/core2-64-poky-linux/python3-urllib3: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info/licenses -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info/licenses, directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info, added "/usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/response.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/response.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc /usr/lib/python3.1
 2/site-packages/urllib3/contrib/emscripten/__init__.py /usr/lib/python3.12/site-packages/urllib3/http2.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 695041 to 811735 (+17%)
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info moved to /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__init__.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__ was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/response.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/response.py was added
  /usr/lib/python3.12/site-packages/urllib3/http2.py was added
  /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc was added

--===============4420701602824784834==--

