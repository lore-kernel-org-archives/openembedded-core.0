Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E10FC7113B
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.145835.1673805744513963018
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fM5jUgB6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185b698c607-c7d73fb6-c52d-4318-8e0d-9a0cf4f5bf8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iRvxEQk269ikYJ0Fm2UpD8WA9jRQ5u6l+ZfFrX/z5Yg=;
	b=fM5jUgB6hILtvEMc534LDjqn2yOmpGOryyi5xHYLxbwuxu0BrV4maWEzKyhW7YBh
	f/5oErcssVLsvEhCLeaRgu2i+awNPGPwnMEURHxVZO0VJJbCCm44zisy6yQcHxvW7fE
	4Veae9nBr0of5x7W0fEPK5ay+v3q8cd8G/lgFyW0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iRvxEQk269ikYJ0Fm2UpD8WA9jRQ5u6l+ZfFrX/z5Yg=;
	b=JPZpbuCBbAWBzsQflokVpK/radt/SNw/JqVCvY3fV48Rx5+SL2W0fwYgarAT5qTT
	I3s0KvhK9AEMKnJNCYv35r846rfW3883hqn32+0E469cQ4PtBQlFMCu2b50PFe6m6pR
	jlbzw6XWZdg8+7cDxuzH6m/eDBAOg04kycid2EQ0=
Content-Type: multipart/mixed; boundary="===============4861840705290568926=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.28.2 SUCCEEDED
Message-ID: <01010185b698c607-c7d73fb6-c52d-4318-8e0d-9a0cf4f5bf8e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175929

--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-requests* to *2.28.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.28.1-2.28.2.patch
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
--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-requests: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.2.tar.gz"
packages/core2-32-poky-linux/python3-requests: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 418573 to 418565 (-0%)
Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.28.1.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.28.2.dist-info

--===============4861840705290568926==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.28.1-2.28.2.patch"

RnJvbSAwMjJlN2U4MjhlOGE1YzZkZWExYzNmODFhYmQzNmEwOTNhMzQ2NmQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTI6MzA6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJlcXVlc3RzOiB1cGdyYWRlIDIuMjguMSAtPiAyLjI4LjIKCi0tLQogLi4uL3tweXRo
b24zLXJlcXVlc3RzXzIuMjguMS5iYiA9PiBweXRob24zLXJlcXVlc3RzXzIuMjguMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yZXF1ZXN0c18yLjI4LjEu
YmIgPT4gcHl0aG9uMy1yZXF1ZXN0c18yLjI4LjIuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMjguMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0c18yLjI4LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXJlcXVlc3RzXzIuMjguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMjguMi5iYgppbmRleCA4ZGUwOGQyNjIwLi4y
ZjM5N2RkYWFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcmVxdWVzdHNfMi4yOC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1yZXF1ZXN0c18yLjI4LjIuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0
dHA6Ly9weXRob24tcmVxdWVzdHMub3JnIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzQ0MDBiNjgwNzJkNzEwZmVjZDBhMjk0
MGEwZDE2NTgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3YzU1OTliMTAyZmVkZGFhNjYxYzgy
NmM1NmFiNGZlZTI4YmZkMTdmNWFiY2ExZWJiZTNlN2YxOWQ3Yzk3OTgzIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjk4YjFiMjc4MmUzYzZjNDkwNDkzOGI4NGMwZWI5MzI3MjEwNjlkZmRiOTEzNDMx
M2JlZmY3YzgzYzJkZjI0YmYiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM3
LjMKCg==

--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.28.1.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.28.2.dist-info

--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1698 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:de4577b39a90a8182c22083edf87350ca1dae691"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 338 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1156 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1177 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1178 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1182 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1183 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1184 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1185 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1243 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: Running task 1362 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1363 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1365 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 1367 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1368 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1369 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1370 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1371 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1372 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: Running task 1374 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1377 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1378 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1379 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1380 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1382 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1383 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 1384 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1385 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: Running task 1386 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1389 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1390 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1391 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1393 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1394 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1396 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1397 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic unihash changed to 20518e843486918395a62ce0297bbc3bede8a6099abe5f7c7fec9dc70ddee56b
NOTE: Running task 1398 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: Running task 1400 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1401 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: Running task 1402 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1403 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1404 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1405 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 1406 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1407 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1408 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: Running task 1409 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1410 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1411 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1413 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: Running task 1414 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1415 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1417 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1418 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: Running task 1419 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1420 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: Running task 1421 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: Running task 1422 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1423 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1424 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1425 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1426 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: Running task 1427 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1428 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1429 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1430 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1431 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1433 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: Running task 1434 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1435 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1436 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1437 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: Running task 1438 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: Running task 1439 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1440 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: Running task 1441 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: Running task 1443 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1444 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1445 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1445 tasks of which 1352 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-src went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dbg went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-tests went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-staticdev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-doc went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-locale went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pyopenssl/22.1.0-r0/temp/log.do_packagedata.3583411
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata) failed with exit code '1'

--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 52 skipped, 0 masked, 0 errors.
Removing 30 recipes from the core2-32 sysroot...done.
Removing 45 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:de4577b39a90a8182c22083edf87350ca1dae691"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 204 Local 164 Mirrors 0 Missed 40 Current 194 (80% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 201 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running task 788 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 805 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 806 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 807 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 810 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 811 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 812 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 813 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 830 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 869 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 871 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 872 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 873 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 875 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 876 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 877 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 886 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 887 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: Running task 888 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: Running task 889 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running setscene task 247 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_packagedata_setscene)
NOTE: Running task 890 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 891 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 892 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 893 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running setscene task 249 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 904 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: Running setscene task 252 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: Running task 905 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 906 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running task 907 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic)
NOTE: Running task 908 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 909 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 910 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 911 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 912 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 259 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running task 913 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 914 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic unihash changed to 20518e843486918395a62ce0297bbc3bede8a6099abe5f7c7fec9dc70ddee56b
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 269 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 280 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 284 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 285 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 308 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 311 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 326 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1307 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1348 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1379 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1380 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1388 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1389 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1409 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1449 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1450 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: Running task 1451 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1452 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: Running task 1454 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: Running task 1455 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1456 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: Running task 1458 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1459 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1464 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1465 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: Running task 1466 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1467 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: Running task 1468 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1469 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1470 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: Running task 1471 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_sysroot)
NOTE: Running task 1474 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1475 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1476 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1477 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1479 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1480 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1481 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1482 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1483 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: Running task 1484 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1485 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1486 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1487 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1488 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1490 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1491 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1492 tasks of which 1399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-src went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dbg went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-tests went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-staticdev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-doc went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-locale went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pyopenssl/22.1.0-r0/temp/log.do_packagedata.3651983
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata) failed with exit code '1'

--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:de4577b39a90a8182c22083edf87350ca1dae691"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 338 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1156 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1177 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1178 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1182 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1183 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1184 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1185 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1241 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 1362 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1363 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1365 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 1367 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1368 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1369 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1370 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1371 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: Running task 1372 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1375 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1376 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: Running task 1377 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1378 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: Running task 1379 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1380 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: Running task 1381 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1382 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: Running task 1383 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1384 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1389 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1390 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1391 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1393 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 1396 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1397 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic unihash changed to 20518e843486918395a62ce0297bbc3bede8a6099abe5f7c7fec9dc70ddee56b
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1398 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: Running task 1400 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1401 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1402 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1403 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: Running task 1404 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: Running task 1405 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1406 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: Running task 1407 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1408 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: Running task 1409 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1410 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1411 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: Running task 1412 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1413 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1414 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1415 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1417 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1418 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: Running task 1419 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: Running task 1420 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1421 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: Running task 1422 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1423 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1424 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1425 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1426 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1427 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: Running task 1428 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1429 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: Running task 1430 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: Running task 1431 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1433 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1434 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1435 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1436 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1437 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: Running task 1438 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1439 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1440 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: Running task 1441 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1443 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1444 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1444 tasks of which 1352 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-src went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dbg went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-tests went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-staticdev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-doc went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-locale went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pyopenssl/22.1.0-r0/temp/log.do_packagedata.3608402
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata) failed with exit code '1'

--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:de4577b39a90a8182c22083edf87350ca1dae691"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 338 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1156 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1177 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1178 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1182 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1183 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1184 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1185 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1243 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1362 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1363 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1364 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: Running task 1365 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1366 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1367 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1368 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1369 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1370 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1371 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1372 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1376 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: Running task 1377 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1378 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1379 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: Running task 1380 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1382 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1383 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1384 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1385 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: Running task 1387 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: Running task 1389 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1390 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1391 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1393 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1394 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1396 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1397 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1398 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic unihash changed to 20518e843486918395a62ce0297bbc3bede8a6099abe5f7c7fec9dc70ddee56b
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: Running task 1401 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1402 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1403 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1404 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1405 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1406 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1407 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1408 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1409 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1410 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: Running task 1411 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: Running task 1413 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1414 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1415 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1417 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1418 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: Running task 1419 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1420 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: Running task 1421 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 1422 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1423 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1424 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1425 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1426 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: Running task 1427 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: Running task 1428 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1429 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1430 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1431 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: Running task 1432 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1433 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1434 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1435 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1436 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1437 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1438 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1439 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1440 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1441 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1442 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 1443 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1444 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1445 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1445 tasks of which 1352 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-src went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dbg went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-tests went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-staticdev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-doc went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-locale went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pyopenssl/22.1.0-r0/temp/log.do_packagedata.3599339
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata) failed with exit code '1'

--===============4861840705290568926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 75 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:de4577b39a90a8182c22083edf87350ca1dae691"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 338 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1156 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1177 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1178 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1182 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1183 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1184 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1185 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1242 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 1362 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1363 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1365 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 1367 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1368 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1369 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1370 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1371 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1372 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: Running task 1375 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1376 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: Running task 1377 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1378 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: Running task 1379 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1380 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: Running task 1382 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1383 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1384 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1385 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: Running task 1386 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: Running task 1387 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1389 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1390 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: Running task 1391 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1392 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1393 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1395 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1396 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1397 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_lic unihash changed to 20518e843486918395a62ce0297bbc3bede8a6099abe5f7c7fec9dc70ddee56b
NOTE: Running task 1398 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1401 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: Running task 1402 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: Running task 1403 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1404 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: Running task 1405 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: Running task 1406 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: Running task 1407 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: Running task 1408 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1409 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: Running task 1410 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1411 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 1412 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1413 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1414 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1415 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1417 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1418 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: Running task 1419 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1420 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: Running task 1421 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 1422 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1423 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1424 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1425 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: Running task 1426 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1427 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: Running task 1428 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: Running task 1429 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1430 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: Running task 1431 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: Running task 1432 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1433 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1434 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1435 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1436 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1437 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1438 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1439 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1440 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1441 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1442 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1443 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: Running task 1444 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1444 tasks of which 1352 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-src went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dbg went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-tests went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-staticdev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-dev went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-doc went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl-locale went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: QA Issue: Package version for package python3-pyopenssl went backwards which would break package feeds (from 0:23.0.0-r0 to 0:22.1.0-r0) [version-going-backwards]
ERROR: python3-pyopenssl-22.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pyopenssl/22.1.0-r0/temp/log.do_packagedata.3627897
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata) failed with exit code '1'

--===============4861840705290568926==--

