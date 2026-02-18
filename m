Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235A5E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1395.1771440106297989794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3PrKjyws;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=o8Q3rfOf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c720ee8c4-1326c100-1227-44cf-aa45-b611809bcaf8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dOp2NbNHwWxKOvqNS2Abhb4XEeA6CsELnWpwUPqcrEg=;
	b=3PrKjywsN7hOeGJi0rZI+WTZwy04YiT5onZ4e36Kbl9+FjsxZxcLWN59rdTaWo0O
	5YZN4qYgh8opAo7vea9vv725gLda4GJ8v97SmDYYuwIyhEEjd2p/CaW3H9xPNhaSHbD
	tAlUkX4e/h97VvYhQRMJzqBk+VXsBRwz/2JGVnW0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dOp2NbNHwWxKOvqNS2Abhb4XEeA6CsELnWpwUPqcrEg=;
	b=o8Q3rfOfGONH42tG819JEmm1FWIEC8nfX2SRxqYorX7+I3VTii4pWcmwF4HdaZxm
	xLB75nzns/+CMzKQS1fjEJ6H+DMCZT/kqhC1OOfW6gX25MdS9zh8JdX0orKmxgi3Ppy
	2OMnPLHM7ThF9ZZVbVL4cvPdAcveQe/kgMO6nK4Y=
Content-Type: multipart/mixed; boundary="===============3268425231895643657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 f3f5fa454345b03039ee3d904964fc14829637ce SUCCEEDED
Message-ID: <0101019c720ee8c4-1326c100-1227-44cf-aa45-b611809bcaf8-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231368

--===============3268425231895643657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *f3f5fa454345b03039ee3d904964fc14829637ce* has Succeeded.

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
From 18e8ca64fd716f3da02ad49a8becbfcdb8a0c083 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:19:10 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index d368159df2..97d91f8ee1 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "19878fea4c5f62208655e32269842bce55c819b2"
+SRCREV = "f3f5fa454345b03039ee3d904964fc14829637ce"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============3268425231895643657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSAxOGU4Y2E2NGZkNzE2ZjNkYTAyYWQ0OWE4YmVjYmZjZGI4YTBjMDgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6MTk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
cG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0t
CiAuLi4vcnBtLXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgICAgICAg
ICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVvaWEvcnBt
LXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBt
LXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKaW5kZXggZDM2ODE1OWRm
Mi4uOTdkOTFmOGVlMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS1zZXF1
b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgpAQCAt
MTAsNyArMTAsNyBAQCBpbmhlcml0IGFsbGFyY2ggcHl0aG9uM25hdGl2ZQogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGxhYi5jb20vcmVkaGF0LWNyeXB0by9mZWRvcmEtY3J5cHRvLXBvbGljaWVzLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgogCi1TUkNSRVYgPSAiMTk4NzhmZWE0YzVm
NjIyMDg2NTVlMzIyNjk4NDJiY2U1NWM4MTliMiIKK1NSQ1JFViA9ICJmM2Y1ZmE0NTQzNDViMDMw
MzllZTNkOTA0OTY0ZmMxNDgyOTYzN2NlIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgog
CiBkb19jb21waWxlICgpIHsKLS0gCjIuNDcuMQoK

--===============3268425231895643657==--

