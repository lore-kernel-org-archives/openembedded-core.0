Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E66D48985
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1426.1768526740384283148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qcWMKUIF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WjexoV6C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019bc4689041-50f31c2f-b682-4e79-b644-3d5a4d466d16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EC++FyQyu9IKfzede72orXD+WF/PPnY5uZxDobjzOUI=;
	b=qcWMKUIFIp1S8izdGpLcZOiRy0avWgeRqE8+d9vV0E6oUf2rBxBG9g592vXchmUY
	m6tqREln5rPYeZO7eqBTEQcrE3ubYGNn/y5fiNFMRFTqea9fSAw6Q4xh8NKdLwZ0VpN
	Yj/qeXpiIp3GRi875dTbMrh3plFcwUlCBmkGSOeg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EC++FyQyu9IKfzede72orXD+WF/PPnY5uZxDobjzOUI=;
	b=WjexoV6CMlRJ/MMUT2jdbH7k59p5ZOa21xfR7xcNhDoSp3jOJ1YWMm1AFnmQraKa
	vBpe2rLvEuCcrK16+7APXAXAvxUHufeJ8wabQIbgKpeAGJ08ryxyPe8ubCOheBtvwny
	E9qjR5cjpKp1WWlTjhtkGN6T5Js7qLEiz0YD2Bac=
Content-Type: multipart/mixed; boundary="===============7469323444873433085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 103f8b437f5e791e0aef9d5c372521a5d675fabb
 SUCCEEDED
Message-ID: <0101019bc4689041-50f31c2f-b682-4e79-b644-3d5a4d466d16-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229455

--===============7469323444873433085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *103f8b437f5e791e0aef9d5c372521a5d675fabb* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From ec72b4cfdd5d27bb2bf5000741d770631036dc70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:26:43 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index e61f3936c9..81d1814191 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "64d35867ca0a1088f13de8f4ccaf1a5687d7f1ce"
+SRCREV = "103f8b437f5e791e0aef9d5c372521a5d675fabb"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============7469323444873433085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f

--===============7469323444873433085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBlYzcyYjRjZmRkNWQyN2JiMmJmNTAwMDc0MWQ3NzA2MzEwMzZkYzcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6MjY6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2duL2duX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IGU2MWYzOTM2Yzku
LjgxZDE4MTQxOTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtNyw3ICs3LDcg
QEAgREVQRU5EUyArPSAibmluamEtbmF0aXZlIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiNjRkMzU4NjdjYTBhMTA4OGYxM2RlOGY0Y2NhZjFh
NTY4N2Q3ZjFjZSIKK1NSQ1JFViA9ICIxMDNmOGI0MzdmNWU3OTFlMGFlZjlkNWMzNzI1MjFhNWQ2
NzVmYWJiIgogUFYgPSAiMCtnaXQiCiAKIEJCX0dJVF9TSEFMTE9XID0gIiIKLS0gCjIuNDcuMQoK

--===============7469323444873433085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 100387040 to 100552288 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3122695 to 3124483 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+64d35867ca to 0+git0+103f8b437f
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3678392 to 3682488 (+0%)

--===============7469323444873433085==--

