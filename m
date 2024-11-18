Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338B1D62045
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4836.1731964644847072345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d8Pif3GZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WfQI1hus;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019341232b36-461600b0-feba-43a4-a7c5-93c2ef884250-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964644;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AVDAaTJzTo+AHvX5d5jxnzJxN+32ZkLStkCzTbydkwY=;
	b=d8Pif3GZOqF0XLGuTyutsxkJw8dS5bUIauqwGHm+gpmPEHSYQPbCkZKVY3V2QXrT
	OPJfKG8LBq/l4DL8v8uOrxNsm7crUgE5h0vmdwsQAFHxu2UGWxXb4eZwc2kVm4fanvV
	OeML14jCvC/z/FXT+TXjLQeSBFlYb2exK5dMDLck=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964644;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AVDAaTJzTo+AHvX5d5jxnzJxN+32ZkLStkCzTbydkwY=;
	b=WfQI1husEE7ZC09w0vBIPK69xProAhCyjcY3TETn6utsvlMT2Oo3DeS5LWPEBs2X
	upre1qztB8p+VrmyLh2Gf9Smf5YltumtB3JJZT6UTQjOIVKbwMavawqUIoB6tvUz389
	2Myu73hGhLkQB3eAjEvpt98n9JObZDD9pfcMvfHU=
Content-Type: multipart/mixed; boundary="===============1103086852247082309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.49.3 SUCCEEDED
Message-ID: <0101019341232b36-461600b0-feba-43a4-a7c5-93c2ef884250-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207300

--===============1103086852247082309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.49.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.48-2.49.3.patch
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
From b1fdd0fe79ddb909dbe761b33ab4166339a87055 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 04:47:45 +0000
Subject: [PATCH] repo: upgrade 2.48 -> 2.49.3

---
 meta/recipes-devtools/repo/{repo_2.48.bb => repo_2.49.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.48.bb => repo_2.49.3.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.48.bb b/meta/recipes-devtools/repo/repo_2.49.3.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.48.bb
rename to meta/recipes-devtools/repo/repo_2.49.3.bb
index 8b72a9e71b..5cb10b6096 100644
--- a/meta/recipes-devtools/repo/repo_2.48.bb
+++ b/meta/recipes-devtools/repo/repo_2.49.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "454fdaf1191c87e5c770ab865a911e10e600e178"
+SRCREV = "ab2d3211043e2cb42a55f56e5abf69d23103c105"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.44.1


--===============1103086852247082309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.48-2.49.3.patch"

RnJvbSBiMWZkZDBmZTc5ZGRiOTA5ZGJlNzYxYjMzYWI0MTY2MzM5YTg3MDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDQ6NDc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNDggLT4gMi40OS4zCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuNDguYmIgPT4gcmVwb18yLjQ5LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8ve3JlcG9fMi40OC5iYiA9PiByZXBvXzIuNDkuMy5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDguYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDguYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40OS4zLmJiCmluZGV4IDhiNzJh
OWU3MWIuLjVjYjEwYjYwOTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi40OC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDku
My5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJh
bmNoPW1haW4gXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNDU0ZmRhZjExOTFjODdlNWM3NzBh
Yjg2NWE5MTFlMTBlNjAwZTE3OCIKK1NSQ1JFViA9ICJhYjJkMzIxMTA0M2UyY2I0MmE1NWY1NmU1
YWJmNjlkMjMxMDNjMTA1IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNl
LmNvbS9naXQtcmVwby5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1y
ZXBvLmdpdCIKIAotLSAKMi40NC4xCgo=

--===============1103086852247082309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PKGV changed from 2.48 [default] to 2.49.3 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.48 [default] to 2.49.3 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.48 [default] to 2.49.3 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.48 [default] to 2.49.3 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.48 [default] to 2.49.3 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.48 [default] to 2.49.3 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.48 [default] to 2.49.3 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.48" to "2.49.3"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.48 [default] to 2.49.3 [default]

--===============1103086852247082309==--

