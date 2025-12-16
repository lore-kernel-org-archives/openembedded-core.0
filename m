Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCFDD5E125
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17179.1765872132136240971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iEMB/xuD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=m9k3w+WO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262eab75-838a7392-1533-4383-bd56-47dd23b6c4ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5DoPt2fxpEbbI1OGw0VaMIDXaKyhBe3yTws7hR2V7xY=;
	b=iEMB/xuDS6K7NGoPjKuZ/oU5vFwSDxr31pQzoaLZyWkUSbsqJs6huJjHoFVIANgf
	0R9xAEBvNeEYMQ11cyaF15FNbPyk1euBOb4va7bGAWjorknhtjCtQmbqOxehDYh14Jy
	/McXBQmw36K8N3XvyrELLhx5MsZM9LOBu7fb9I6E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5DoPt2fxpEbbI1OGw0VaMIDXaKyhBe3yTws7hR2V7xY=;
	b=m9k3w+WOaGzs0fNtye7afUI6eb+Gf3rx6am06YeYc8qk5iew+ZmX/NJ7sY2pBzUo
	cLZn95skiehyTzz0Fsc01YQtG74NiB38Hz8aKlKQc9afjuvkSk+39rEckJK7kJJOSjT
	wPvMTlksbCu1Wn8+uTjnGqg05l8D76MOBj8/JTU4=
Content-Type: multipart/mixed; boundary="===============6460618407239844390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 19878fea4c5f62208655e32269842bce55c819b2 SUCCEEDED
Message-ID: <0101019b262eab75-838a7392-1533-4383-bd56-47dd23b6c4ac-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227837

--===============6460618407239844390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *19878fea4c5f62208655e32269842bce55c819b2* has Succeeded.

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
From 28f5750836ead41f09655a9efd79e115312b0bad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:49:37 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 19b86ae391..d368159df2 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "ae1df75b1155294ebbd3c84fd206ffb55414c3ec"
+SRCREV = "19878fea4c5f62208655e32269842bce55c819b2"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============6460618407239844390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSAyOGY1NzUwODM2ZWFkNDFmMDk2NTVhOWVmZDc5ZTExNTMxMmIwYmFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6NDk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
cG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0t
CiAuLi4vcnBtLXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgICAgICAg
ICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVvaWEvcnBt
LXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBt
LXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKaW5kZXggMTliODZhZTM5
MS4uZDM2ODE1OWRmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS1zZXF1
b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgpAQCAt
MTAsNyArMTAsNyBAQCBpbmhlcml0IGFsbGFyY2ggcHl0aG9uM25hdGl2ZQogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGxhYi5jb20vcmVkaGF0LWNyeXB0by9mZWRvcmEtY3J5cHRvLXBvbGljaWVzLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgogCi1TUkNSRVYgPSAiYWUxZGY3NWIxMTU1
Mjk0ZWJiZDNjODRmZDIwNmZmYjU1NDE0YzNlYyIKK1NSQ1JFViA9ICIxOTg3OGZlYTRjNWY2MjIw
ODY1NWUzMjI2OTg0MmJjZTU1YzgxOWIyIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgog
CiBkb19jb21waWxlICgpIHsKLS0gCjIuNDcuMQoK

--===============6460618407239844390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/rpm-sequoia-crypto-policy/rpm-sequoia-crypto-policy: PKGSIZE changed from 1959 to 1985 (+1%)

--===============6460618407239844390==--

