Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05425CEB2F0
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11934.1763224717774095043
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l4MgNLXn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tX4Me9/Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a88620600-a83bd05d-8035-49c9-8235-d2629ef1674d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aoOugLNA6GYjqC1BdMLyc3kasBiN0zyXFlQmwiN3P1w=;
	b=l4MgNLXnh7MmLc8EAvcA+NcurApARTGoCevREEKeVfL9W8AnVGYZEX409a1HCgJF
	6E7HrHmSx1vJy8SqwB70nyipggB7to8A3606lySyokhtQjzT7N7L9f4ayGzjhbwCnHU
	h2ikWJjGXeF/HW2VnkiOLbyIl3/wFE+fLPl17vtw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aoOugLNA6GYjqC1BdMLyc3kasBiN0zyXFlQmwiN3P1w=;
	b=tX4Me9/QCl03TEEYvTBBs/gHPqM2zs+I5gvuJsWg3FUr450DJOkArK2zIaVsmtMR
	xipHqmonLOLJkdVnRNWFVBSFo1WBo6TShFPIfJP882iXpAuqRY9BO5lQvH5dmthAZC4
	5QM/Wmn7NAZFFWvRsL09rRcUtMTMNLalDL+iagUk=
Content-Type: multipart/mixed; boundary="===============0830498492103089002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.12.1 SUCCEEDED
Message-ID: <0101019a88620600-a83bd05d-8035-49c9-8235-d2629ef1674d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226329

--===============0830498492103089002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.12-4.12.1.patch
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
From c5de40ba6ba28ff5240f95665abbb7560d650461 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 08:46:43 +0000
Subject: [PATCH] ccache: upgrade 4.12 -> 4.12.1

---
 .../ccache/{ccache_4.12.bb => ccache_4.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.bb b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.1.bb
index 52643c4bff..2d0b83e244 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
+SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============0830498492103089002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 34501176 to 34517064 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1801295 to 1802121 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.12/ccache-4.12.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.12.1/ccache-4.12.1.tar.gz"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.12" to "4.12.1"

--===============0830498492103089002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.12-4.12.1.patch"

RnJvbSBjNWRlNDBiYTZiYTI4ZmY1MjQwZjk1NjY1YWJiYjc1NjBkNjUwNDYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDg6NDY6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMiAtPiA0LjEyLjEKCi0tLQogLi4uL2NjYWNoZS97Y2NhY2hlXzQu
MTIuYmIgPT4gY2NhY2hlXzQuMTIuMS5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuMTIuYmIgPT4gY2NhY2hlXzQuMTIuMS5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80
LjEyLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMi4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2Fj
aGUvY2NhY2hlXzQuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUv
Y2NhY2hlXzQuMTIuMS5iYgppbmRleCA1MjY0M2M0YmZmLi4yZDBiODNlMjQ0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEyLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTIuMS5iYgpAQCAtMTcsNyArMTcsNyBA
QCBERVBFTkRTID0gInpzdGQgZm10IHh4aGFzaCIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNF
X1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU4ODRjNjJjYmFjYWUyZTk0ODhiODY0MWE2NzFhNzlmYjdhMTIyMWRiMDEzMTBkYWNlZjYx
YzllNTVjMmU1NWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTNkYTUwYWIwZmIwZDQyZjYwYzE3
ZDE0NTAzMTJlNmFjZTliNjgxZjYyMjFjYjc3YzhhMDlhODQ1ZjlkNzYwYyIKIAogaW5oZXJpdCBj
bWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============0830498492103089002==--

