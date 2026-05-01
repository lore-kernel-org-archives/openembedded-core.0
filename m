Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658EACD37BD
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15719.1777645545728518817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oktOM8vE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PwQUqa42;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee66db-2e005ced-5dee-4f6d-86bb-3fc342dea971-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8XuHM0uJUIb8kq3TDmeteSHR6HKaA/RujI0oO+S099w=;
	b=oktOM8vEt9nC66kVEdm/I0WhmuZgtJceGWvxXFSxPMcvpOX9m0WV8J5Cv9pXhOXu
	pvu50sFkd/0In17VYNjn+2w5BeQ3bLIwpeEdUx9t5inxYkT9RgdjCb9NXed9vohtziF
	B2N73FjKI59OLO0PZcg4I2yOje0JVww7byCHgirE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8XuHM0uJUIb8kq3TDmeteSHR6HKaA/RujI0oO+S099w=;
	b=PwQUqa42bx1tBKgwkk7JKHNdhSWlvvx3RznDqCkTjNEYz9kmr3XlNbCgpU5492zq
	2isooljzIdh+FWWRfntn5jMYQxiEGJCAhUJFFt6W7p9rTSPnY0agas55R3Nv1y4nD3b
	7qOVT34jENxXSGBXChFt6uuXpHxrkt8DBY8mYWV0=
Content-Type: multipart/mixed; boundary="===============3659028806049605293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 1abb8a404613f33a2f98eb83e827b046d0820048 SUCCEEDED
Message-ID: <0101019de3ee66db-2e005ced-5dee-4f6d-86bb-3fc342dea971-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236250

--===============3659028806049605293==
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
From a804bfae5576530fc12d40419858f84bb01bc81d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:51:54 +0000
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


--===============3659028806049605293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSBhODA0YmZhZTU1NzY1MzBmYzEyZDQwNDE5ODU4Zjg0YmIwMWJjODFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOTo1MTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJw
bS1zZXF1b2lhLWNyeXB0by1wb2xpY3k6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0K
IC4uLi9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiAgICAgICAg
ICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0t
c2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0t
c2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgppbmRleCA5N2Q5MWY4ZWUx
Li4xYzk3OTM4ZTA4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVv
aWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JwbS1zZXF1b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCkBAIC0x
MCw3ICsxMCw3IEBAIGluaGVyaXQgYWxsYXJjaCBweXRob24zbmF0aXZlCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0bGFiLmNvbS9yZWRoYXQtY3J5cHRvL2ZlZG9yYS1jcnlwdG8tcG9saWNpZXMuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiAKLVNSQ1JFViA9ICJmM2Y1ZmE0NTQzNDVi
MDMwMzllZTNkOTA0OTY0ZmMxNDgyOTYzN2NlIgorU1JDUkVWID0gIjFhYmI4YTQwNDYxM2YzM2Ey
Zjk4ZWI4M2U4MjdiMDQ2ZDA4MjAwNDgiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAK
IGRvX2NvbXBpbGUgKCkgewotLSAKMi40Ny4xCgo=

--===============3659028806049605293==--

