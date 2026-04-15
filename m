Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B7F428FE
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19744.1776261885198712077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tXy/x2p2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TgPTz0td;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d91756aad-b12698d7-57d5-4608-aa6d-53b4c9960818-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261884;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fo2qDRcWFjpojKvkO6jgsRNhCpzws2oyl9X38rrioYA=;
	b=tXy/x2p2R3LHF2/JI4e+tZ947/ZzwhN3GYNPDPzTPT6scXvLWQwnMdK4vQj6X1yA
	J4PWUQUwx6rj3B2X886JLHhJh4SHzehZz5pC2ccCpoG6ENjX+ttQkokA/83Itbi6A9F
	MZJyJsf6yDyv3M53KnxewhC9waisRoxD6SrweEaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261884;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fo2qDRcWFjpojKvkO6jgsRNhCpzws2oyl9X38rrioYA=;
	b=TgPTz0td2ov3uK434DjajbPfB2Mq5C254uhYFskzxjQeLmh+GMFUZvkMFBc7wjVO
	+xn1ceFimRYdbaHnMY5DOP3ohTUvSFF4Bzs/YBTuX7mZH2QKnSoBbTY38AQU2IfGCUJ
	7eml82Nxo5SdJur6v1ABubQ8wShgrpqiuxOiHvn4=
Content-Type: multipart/mixed; boundary="===============4446677386148446778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 1abb8a404613f33a2f98eb83e827b046d0820048 SUCCEEDED
Message-ID: <0101019d91756aad-b12698d7-57d5-4608-aa6d-53b4c9960818-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235255

--===============4446677386148446778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *1abb8a404613f33a2f98eb83e827b046d0820048* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch
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
From 2d2edaa76a32f7300aac0348f5feb4fd7ce49055 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:21:12 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 97d91f8ee1..1c97938e08 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "f3f5fa454345b03039ee3d904964fc14829637ce"
+SRCREV = "1abb8a404613f33a2f98eb83e827b046d0820048"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============4446677386148446778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSAyZDJlZGFhNzZhMzJmNzMwMGFhYzAzNDhmNWZlYjRmZDdjZTQ5MDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6MjE6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
cG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0t
CiAuLi4vcnBtLXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgICAgICAg
ICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVvaWEvcnBt
LXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBt
LXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKaW5kZXggOTdkOTFmOGVl
MS4uMWM5NzkzOGUwOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS1zZXF1
b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgpAQCAt
MTAsNyArMTAsNyBAQCBpbmhlcml0IGFsbGFyY2ggcHl0aG9uM25hdGl2ZQogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGxhYi5jb20vcmVkaGF0LWNyeXB0by9mZWRvcmEtY3J5cHRvLXBvbGljaWVzLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgogCi1TUkNSRVYgPSAiZjNmNWZhNDU0MzQ1
YjAzMDM5ZWUzZDkwNDk2NGZjMTQ4Mjk2MzdjZSIKK1NSQ1JFViA9ICIxYWJiOGE0MDQ2MTNmMzNh
MmY5OGViODNlODI3YjA0NmQwODIwMDQ4IgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgog
CiBkb19jb21waWxlICgpIHsKLS0gCjIuNDcuMQoK

--===============4446677386148446778==--

