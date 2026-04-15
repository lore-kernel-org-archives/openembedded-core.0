Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF90F42115
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19812.1776261873807100432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XPHCqixm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rJYVNNgk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91756ad0-cf71e77d-5130-406a-a753-99e52820bd3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261884;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vDkCdUIOUEdotkQEm9r93uGxNqRpJQju3K9Ae1yaoQ4=;
	b=XPHCqixm/pvwwC7RnhMujolZivebF2Dd+5Tt25Ze/pVUTriqDeoM7aO6ZpcMIVm1
	vog8zMyjP9pthPWcfHOfCXEEr1lYAfKsXkpdOvzp0HfD6L1RuyfIqkICVXQ9/RM9r4p
	0q/9eZY6utVUuOt9Ua4VyoQEvTNF1ZD7F4tiN0tQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261884;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vDkCdUIOUEdotkQEm9r93uGxNqRpJQju3K9Ae1yaoQ4=;
	b=rJYVNNgkwx/PfxFeqC/vMOXAawucleSKhql7ursFe20tmtYa7XzRkLMSmS+WlYyq
	6sNyjxkTCRTKwgD8y92iQ82uzFqSNkVtZqy6UudKsc8LUGrTsK4VHxxxg3shns6o9nu
	sz3yIUp0mU++uH+Hf53PiKwOXmUjoTtiqt5KfEH0=
Content-Type: multipart/mixed; boundary="===============3661545384046164352=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.62 SUCCEEDED
Message-ID: <0101019d91756ad0-cf71e77d-5130-406a-a753-99e52820bd3c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235254

--===============3661545384046164352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.62* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.61.1-2.62.patch
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
From 6e70d7ba36abb86bd52267803c81a221e2249471 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:18:48 +0000
Subject: [PATCH] repo: upgrade 2.61.1 -> 2.62

---
 meta/recipes-devtools/repo/{repo_2.61.1.bb => repo_2.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.61.1.bb => repo_2.62.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.61.1.bb b/meta/recipes-devtools/repo/repo_2.62.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.61.1.bb
rename to meta/recipes-devtools/repo/repo_2.62.bb
index 456f3ad556..769c7e16ef 100644
--- a/meta/recipes-devtools/repo/repo_2.61.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.62.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "5d88972390295e229ee940992cb33ce8cfd39cd5"
+SRCREV = "ade45de7707e25d8a11b3beedf754caa44aba34d"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============3661545384046164352==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.61.1-2.62.patch"

RnJvbSA2ZTcwZDdiYTM2YWJiODZiZDUyMjY3ODAzYzgxYTIyMWUyMjQ5NDcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6MTg6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjEuMSAtPiAyLjYyCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuNjEuMS5iYiA9PiByZXBvXzIuNjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8ve3JlcG9fMi42MS4xLmJiID0+IHJlcG9fMi42Mi5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjEuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjEuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjYyLmJiCmluZGV4IDQ1NmYz
YWQ1NTYuLjc2OWM3ZTE2ZWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi42MS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42
Mi5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJh
bmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI1ZDg4OTcyMzkw
Mjk1ZTIyOWVlOTQwOTkyY2IzM2NlOGNmZDM5Y2Q1IgorU1JDUkVWID0gImFkZTQ1ZGU3NzA3ZTI1
ZDhhMTFiM2JlZWRmNzU0Y2FhNDRhYmEzNGQiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5n
b29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVS
ZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============3661545384046164352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.61.1" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.62"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.61.1 [default] to 2.62 [default]

--===============3661545384046164352==--

