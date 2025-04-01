Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93D4C3601B
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18047.1743511393838442158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NcXOxnHy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XzpjdDZi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f160b5ca-bea6c116-887a-4be5-9056-ba59184e532d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AZcTt36J622uQ17kCqppZpS4+eG5tAlcvPXUtJGhNKE=;
	b=NcXOxnHyskDfpto3C9MJyU9fFUUpr9vLU76QgnIox+GKTxrG8VDkdGmnxyNQ0/7G
	hOWKfYZgR2P6Ijq868c0oa9Emo5g3ytW6TElqi0DYb/zW6VgQzjH076RYy4LV/sjRnq
	59MDkNRFdFpIoNJbNRWSrByTKu1Kl+mjipaCYctY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AZcTt36J622uQ17kCqppZpS4+eG5tAlcvPXUtJGhNKE=;
	b=XzpjdDZio2+h+CaxVrrXDg3i9VJzSCF3dz1o0btlpMMDhmbwnQ9VMMSMMEDTGgE/
	qvHIo+DUqb7a93+KX2kWIFmLcRLW1U0RwKFXfa5y2Iaw6CNXJh1Or1R6HWrKsEsy+zw
	DXAF1FXUqXQuzSGM/nUOtaQmyFArHvgWQjCRW8/s=
Content-Type: multipart/mixed; boundary="===============2228622726235410649=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.53 SUCCEEDED
Message-ID: <01010195f160b5ca-bea6c116-887a-4be5-9056-ba59184e532d-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214077

--===============2228622726235410649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.53* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.52-2.53.patch
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
From 99bd2560c9c4a8161d90fe52fabcf12aed45ed17 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:45:53 +0000
Subject: [PATCH] repo: upgrade 2.52 -> 2.53

---
 meta/recipes-devtools/repo/{repo_2.52.bb => repo_2.53.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.52.bb => repo_2.53.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.52.bb b/meta/recipes-devtools/repo/repo_2.53.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.52.bb
rename to meta/recipes-devtools/repo/repo_2.53.bb
index 2e877c1847..05326eb3a0 100644
--- a/meta/recipes-devtools/repo/repo_2.52.bb
+++ b/meta/recipes-devtools/repo/repo_2.53.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "8d5f03261164f3cd65af0576dfa7d4edded96c67"
+SRCREV = "4b94e773efd36754f6c8649ad55b90d19a61107f"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============2228622726235410649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo: PKGV changed from 2.52 [default] to 2.53 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.52 [default] to 2.53 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.52 [default] to 2.53 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.52 [default] to 2.53 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.52 [default] to 2.53 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.52 [default] to 2.53 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.52 [default] to 2.53 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.52" to "2.53"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.52 [default] to 2.53 [default]

--===============2228622726235410649==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.52-2.53.patch"

RnJvbSA5OWJkMjU2MGM5YzRhODE2MWQ5MGZlNTJmYWJjZjEyYWVkNDVlZDE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOTo0NTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41MiAtPiAyLjUzCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNTIuYmIgPT4gcmVwb18yLjUzLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNTIuYmIgPT4gcmVwb18yLjUzLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41Mi5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi41My5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41My5iYgppbmRleCAyZTg3N2MxODQ3Li4wNTMy
NmViM2EwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjUzLmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAg
ICAgICAgICAgICIKLVNSQ1JFViA9ICI4ZDVmMDMyNjExNjRmM2NkNjVhZjA1NzZkZmE3ZDRlZGRl
ZDk2YzY3IgorU1JDUkVWID0gIjRiOTRlNzczZWZkMzY3NTRmNmM4NjQ5YWQ1NWI5MGQxOWE2MTEw
N2YiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBv
LmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0t
IAoyLjQ3LjEKCg==

--===============2228622726235410649==--

