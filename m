Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53ACCA9EAE
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107883.1682976348773182789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QckfFTPo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d935210b-02536a31-1d50-4834-bab1-616758e87d38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qPhF9qBdy26HxczvpOGBpndqjZccsVhri/p8/5cc3sc=;
	b=QckfFTPo2cVHHoUTo6DyO8ppHvA6Cnwb/geUJIPojDUaZ6d1ljTwsGCv+DPDh2T1
	w/TQ4lqHhuSvy6DNWub5IXiD0/+8CCv8BeBq0s+tbYzlR1XoWGsGiZwcjpUXZzWjbAG
	VWNjonJBBW3L1UY5tB9dEkLji9yLhmCnXk82FZa0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qPhF9qBdy26HxczvpOGBpndqjZccsVhri/p8/5cc3sc=;
	b=R99+XRGbqZtPg8okic2IUSaWpJrCbKH6AnPjay0eqLklJGVmDiGa4KLOnsVeGKVQ
	fa1dmFAnckeb92RDVqRJs5D20g4nC1UHx4zJ4V6O5STintGnr/JkrHTJEquc7QYYofi
	KkdCTKQS8Jjxgue51pzBno7tRa2l0B4as2JkjbXs=
Content-Type: multipart/mixed; boundary="===============8094861413965812657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.29.0 SUCCEEDED
Message-ID: <01010187d935210b-02536a31-1d50-4834-bab1-616758e87d38-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180687

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-requests* to *2.29.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.28.2-2.29.0.patch
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
--===============8094861413965812657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.28.2-2.29.0.patch"

RnJvbSA4M2Q2ODI4MzhjM2IxM2RlZTEwZjIwNDM1YzM2ODMyNWI3YmNhZDA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMTo0MzowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVxdWVzdHM6IHVwZ3JhZGUgMi4yOC4yIC0+IDIuMjkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtcmVxdWVzdHNfMi4yOC4yLmJiID0+IHB5dGhvbjMtcmVxdWVzdHNfMi4yOS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJlcXVlc3RzXzIuMjguMi5i
YiA9PiBweXRob24zLXJlcXVlc3RzXzIuMjkuMC5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4yOC4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMjkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcmVxdWVzdHNfMi4yOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4yOS4wLmJiCmluZGV4IDhhYjFlYzAxMjEuLjdl
OGI5YTg3NzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1yZXF1ZXN0c18yLjI4LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXJlcXVlc3RzXzIuMjkuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0
cDovL3B5dGhvbi1yZXF1ZXN0cy5vcmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zNDQwMGI2ODA3MmQ3MTBmZWNkMGEyOTQw
YTBkMTY1OCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk4YjFiMjc4MmUzYzZjNDkwNDkzOGI4
NGMwZWI5MzI3MjEwNjlkZmRiOTEzNDMxM2JlZmY3YzgzYzJkZjI0YmYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZjJlMzRhNzVmNDc0OTAxOWJiMGUzZWZmYjY2NjgzNjMwZTRmZmVhZjc1ODE5ZmI1
MWJlYmVmMWJmNWFlZjA1OSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzku
MgoK

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a4be37a2372110108d9c85e5d92f4d39ae4cebc"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 353 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1144 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1168 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_fetch)
NOTE: Running task 1171 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1177 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1178 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1179 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1180 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1262 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1410 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1411 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1412 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1413 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_unpack)
NOTE: Running task 1414 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1415 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1416 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1417 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1418 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1419 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1425 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1426 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_patch)
NOTE: Running task 1428 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1431 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1432 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1434 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic)
NOTE: Running task 1439 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: Running task 1440 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1441 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic unihash changed to 08582ebb765081062315b4fac2b794fbec6c0d129e0f7ff73dd7385869021835
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1445 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1446 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1448 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1449 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: Running task 1450 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: Running task 1451 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1452 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Succeeded
NOTE: Running task 1454 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1458 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: Running task 1459 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 1460 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1461 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1464 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: Running task 1465 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_install)
NOTE: Running task 1466 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: Running task 1467 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1468 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1469 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1470 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1471 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: Running task 1472 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_package)
NOTE: Running task 1473 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1474 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: Running task 1475 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1476 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1477 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: Running task 1478 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1479 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1480 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1481 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1482 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1483 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1484 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: Running task 1487 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1488 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1490 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1492 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1493 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1494 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1496 tasks of which 1399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.2383126
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a4be37a2372110108d9c85e5d92f4d39ae4cebc"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 353 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1144 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1168 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_fetch)
NOTE: Running task 1171 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1177 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1178 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1179 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1180 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1262 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1410 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: Running task 1411 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1412 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1413 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_unpack)
NOTE: Running task 1414 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1415 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1416 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1417 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1418 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1419 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1425 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1426 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1428 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1430 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1431 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1432 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: Running task 1434 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1440 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1441 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1443 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic unihash changed to 08582ebb765081062315b4fac2b794fbec6c0d129e0f7ff73dd7385869021835
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1445 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_configure)
NOTE: Running task 1446 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: Running task 1447 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1448 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1450 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: Running task 1451 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: Running task 1452 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1454 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1455 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1458 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: Running task 1460 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1461 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1464 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: Running task 1465 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_install)
NOTE: Running task 1466 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1467 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: Running task 1468 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1469 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1470 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1471 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_package)
NOTE: Running task 1473 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1474 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: Running task 1475 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_sysroot)
NOTE: Running task 1476 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1479 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1480 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1481 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1482 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1483 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1484 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1485 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1486 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1487 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: Running task 1488 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 1490 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: Running task 1491 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1492 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1493 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: Running task 1495 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1496 tasks of which 1399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.2392692
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-requests: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.2.tar.gz;downloadfilename=requests-2.28.2.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.29.0.tar.gz;downloadfilename=requests-2.29.0.tar.gz"
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests: PV changed from "2.28.2" to "2.29.0"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 418565 to 415844 (-1%)
Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.28.2.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.29.0.dist-info

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 32 recipes from the core2-32 sysroot...done.
Removing 48 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a4be37a2372110108d9c85e5d92f4d39ae4cebc"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 223 Local 183 Mirrors 0 Missed 40 Current 190 (82% match, 90% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 792 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 805 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 806 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_fetch)
NOTE: Running task 807 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 810 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 811 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 812 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 813 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 833 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 894 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 895 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 896 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 897 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 898 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 255 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb:do_packagedata_setscene)
NOTE: Running task 899 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_unpack)
NOTE: Running task 900 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 901 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 902 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 256 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 913 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 914 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: Running task 915 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Succeeded
NOTE: Running task 916 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running task 918 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 919 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 920 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 921 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 930 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 932 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: Running task 933 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 934 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running task 935 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 936 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 937 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 938 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Started
NOTE: Running task 939 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic unihash changed to 08582ebb765081062315b4fac2b794fbec6c0d129e0f7ff73dd7385869021835
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 297 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 310 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 327 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 351 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1332 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1407 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1493 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1495 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1496 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: Running task 1497 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1498 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1499 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: Running task 1501 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: Running task 1505 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1506 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Started
NOTE: Running task 1507 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: Running task 1508 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1509 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1511 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: Running task 1512 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_install)
NOTE: Running task 1513 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1514 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: Running task 1515 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: Running task 1516 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1518 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1519 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_package)
NOTE: Running task 1520 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: Running task 1521 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1522 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: Running task 1523 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1524 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1526 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1527 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1528 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1529 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: Running task 1533 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: Running task 1534 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: Running task 1535 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1536 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: Running task 1537 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1538 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1539 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1540 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1541 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1542 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1543 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1543 tasks of which 1446 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.2417248
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a4be37a2372110108d9c85e5d92f4d39ae4cebc"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 353 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1144 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1168 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_fetch)
NOTE: Running task 1171 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1177 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1178 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1179 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1180 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1264 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1410 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: Running task 1411 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1412 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1413 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_unpack)
NOTE: Running task 1414 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1415 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1416 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1417 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1418 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1419 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1425 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1426 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1430 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1431 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1432 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1434 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1439 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: Running task 1440 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1441 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic unihash changed to 08582ebb765081062315b4fac2b794fbec6c0d129e0f7ff73dd7385869021835
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1445 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1446 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_configure)
NOTE: Running task 1447 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1448 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: Running task 1449 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1450 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1451 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: Running task 1452 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1454 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: Running task 1458 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: Running task 1460 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1461 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1464 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: Running task 1465 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_install)
NOTE: Running task 1466 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1467 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: Running task 1468 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: Running task 1469 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1470 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1471 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_package)
NOTE: Running task 1473 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_sysroot)
NOTE: Running task 1474 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1475 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: Running task 1476 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1477 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1480 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1482 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1483 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: Running task 1484 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1485 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1487 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 1490 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1492 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1493 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1495 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1496 tasks of which 1399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.2402363
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a4be37a2372110108d9c85e5d92f4d39ae4cebc"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 353 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1144 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1168 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_fetch)
NOTE: Running task 1171 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1177 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1178 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1179 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 1180 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1262 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: Running task 1410 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1411 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1412 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1413 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_unpack)
NOTE: Running task 1414 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1415 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1416 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1417 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1418 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1419 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1420 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1425 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1426 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1428 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_patch)
NOTE: Running task 1430 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1431 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: Running task 1432 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: Running task 1434 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1440 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic)
NOTE: recipe python3-requests-2.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_lic unihash changed to 08582ebb765081062315b4fac2b794fbec6c0d129e0f7ff73dd7385869021835
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1445 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1446 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: Running task 1448 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1450 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: Running task 1451 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: Running task 1452 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1454 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: Running task 1458 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: Running task 1459 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 1460 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1461 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.29.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1464 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_install)
NOTE: Running task 1465 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_install)
NOTE: Running task 1466 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: Running task 1467 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1468 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: Running task 1469 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1470 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_install: Succeeded
NOTE: Running task 1471 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-requests-2.29.0-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package)
NOTE: Running task 1473 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1474 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot)
NOTE: Running task 1475 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: Running task 1476 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1477 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1479 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: recipe python3-requests-2.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1480 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: Running task 1481 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1482 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1483 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1484 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-requests-2.29.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.29.0.bb:do_packagedata)
NOTE: Running task 1486 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package: Succeeded
NOTE: Running task 1487 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: Running task 1488 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata)
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1490 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.29.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1492 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1493 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: Running task 1495 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1496 tasks of which 1399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.2373597
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8094861413965812657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.28.2.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.29.0.dist-info

--===============8094861413965812657==--

