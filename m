Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121CBD172A9
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29189.1769951567213826413
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=koN2/P6c;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=d3n33pPe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955b212-d263538a-ae62-412f-a14e-e680a1a71e22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c68wALkUKScZtn39urWJCSEC0BBdEFL5Db6CyzDIWyM=;
	b=koN2/P6cMoS3Kce6H9eaC8TThQ7kf/yfUPyE10v7a+AlHmFdx04BAsxb0lA2+XSJ
	mg4vCFGEjDDDLW6vE0clzMULEovJHW/6jn5ftEFVNbMTw6cAJu8y8S/xv5QKGVfnR/E
	blk/YbTNYwENKLt4RHQJ7Uu35k7ZGtlu9YeuAoBI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c68wALkUKScZtn39urWJCSEC0BBdEFL5Db6CyzDIWyM=;
	b=d3n33pPeGyh8e9EZEdQ2MqfBWjPEAE1Rdolqg2/Yji84Xu3/zdMP5Fks0OGUyHF0
	5bWY0kRmEAy1oG0QeXSVgedKj55ccHBsOO3/4AmqjrAZnSiN2q4KdDd2NhMgI0wcgPZ
	Dm6+1A7GaS9uvkOfbx87lnf1iPJqa0Sw8aYXH354=
Content-Type: multipart/mixed; boundary="===============2970380905368109823=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.61.1 SUCCEEDED
Message-ID: <0101019c1955b212-d263538a-ae62-412f-a14e-e680a1a71e22-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230293

--===============2970380905368109823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.61.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.61-2.61.1.patch
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
From 017411612a0ef38fcfd323c52a02d33423e3b438 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 09:45:03 +0000
Subject: [PATCH] repo: upgrade 2.61 -> 2.61.1

---
 meta/recipes-devtools/repo/{repo_2.61.bb => repo_2.61.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.61.bb => repo_2.61.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.61.bb b/meta/recipes-devtools/repo/repo_2.61.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.61.bb
rename to meta/recipes-devtools/repo/repo_2.61.1.bb
index 2abe84f612..456f3ad556 100644
--- a/meta/recipes-devtools/repo/repo_2.61.bb
+++ b/meta/recipes-devtools/repo/repo_2.61.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "e71a8c6dd85026c8861e675ed7ff468fc611df44"
+SRCREV = "5d88972390295e229ee940992cb33ce8cfd39cd5"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============2970380905368109823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.61" to "2.61.1"
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.61" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.61.1"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.61" to "2.61.1"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.61" to "2.61.1"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.61" to "2.61.1"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.61" to "2.61.1"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.61" to "2.61.1"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.61" to "2.61.1"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.61 [default] to 2.61.1 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.61" to "2.61.1"

--===============2970380905368109823==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.61-2.61.1.patch"

RnJvbSAwMTc0MTE2MTJhMGVmMzhmY2ZkMzIzYzUyYTAyZDMzNDIzZTNiNDM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwOTo0NTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi42MSAtPiAyLjYxLjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi42MS5iYiA9PiByZXBvXzIuNjEuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjYxLmJiID0+IHJlcG9fMi42MS4xLmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjYxLjEuYmIKaW5kZXggMmFiZTg0
ZjYxMi4uNDU2ZjNhZDU1NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjYxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MS4x
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDov
L2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImU3MWE4YzZkZDg1
MDI2Yzg4NjFlNjc1ZWQ3ZmY0NjhmYzYxMWRmNDQiCitTUkNSRVYgPSAiNWQ4ODk3MjM5MDI5NWUy
MjllZTk0MDk5MmNiMzNjZThjZmQzOWNkNSIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdv
b2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJl
dmlldy9naXQtcmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============2970380905368109823==--

