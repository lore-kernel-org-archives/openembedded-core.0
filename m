Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2641810FCAEC
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:08 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14761.1775054166129313056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BlWt0JKA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kSSkAHMM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d49791562-6acf853c-1fed-4e70-ad9f-a592a275036f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z1Om4s/k65u62PGZwzDNZPS8n6HLlTcOcC1wXjd3bzM=;
	b=BlWt0JKAp+onal2Mcp4N0A5A2H/em0zJ8qGsQqVuXBxfPmxu14MByyrEcWNflzbY
	SsnkH4rVJajxohP0RzS+fLTwB6hbfuJ/Pc1hgyyJIG1zWqoBApsG4/AziMDZCFJR9UC
	IsrwpBcbyPINlMuWRpq1hnvA2qVg1LTeWZyBxgCs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z1Om4s/k65u62PGZwzDNZPS8n6HLlTcOcC1wXjd3bzM=;
	b=kSSkAHMMIIhfKYRsF5pWkLxPfEZAoD16od8DHVzfiqKK6YTZaeo+ltOkqrBD0JUC
	ThaMEAOcXGcDbmOxLysE0TTXl4qN681kIL7HxUcCpUn7RgFkjNub4kmzERTqd2rj3ZZ
	QGLkB68PVCnZyfygaff3ew3rl1j2eaIB7g2/hH0o=
Content-Type: multipart/mixed; boundary="===============2289973330081521729=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 4c567b2a200f1c23076c4c09bf7a5d380ed36ae6 SUCCEEDED
Message-ID: <0101019d49791562-6acf853c-1fed-4e70-ad9f-a592a275036f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234394

--===============2289973330081521729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *4c567b2a200f1c23076c4c09bf7a5d380ed36ae6* has Succeeded.

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
From 46c39fa3a2c27f93f0d1e6645f32cb76d98eb45a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:51:51 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 97d91f8ee1..3c345910e0 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "f3f5fa454345b03039ee3d904964fc14829637ce"
+SRCREV = "4c567b2a200f1c23076c4c09bf7a5d380ed36ae6"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============2289973330081521729==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSA0NmMzOWZhM2EyYzI3ZjkzZjBkMWU2NjQ1ZjMyY2I3NmQ5OGViNDVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDo1MTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJw
bS1zZXF1b2lhLWNyeXB0by1wb2xpY3k6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0K
IC4uLi9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiAgICAgICAg
ICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0t
c2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0t
c2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgppbmRleCA5N2Q5MWY4ZWUx
Li4zYzM0NTkxMGUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVv
aWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JwbS1zZXF1b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCkBAIC0x
MCw3ICsxMCw3IEBAIGluaGVyaXQgYWxsYXJjaCBweXRob24zbmF0aXZlCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0bGFiLmNvbS9yZWRoYXQtY3J5cHRvL2ZlZG9yYS1jcnlwdG8tcG9saWNpZXMuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiAKLVNSQ1JFViA9ICJmM2Y1ZmE0NTQzNDVi
MDMwMzllZTNkOTA0OTY0ZmMxNDgyOTYzN2NlIgorU1JDUkVWID0gIjRjNTY3YjJhMjAwZjFjMjMw
NzZjNGMwOWJmN2E1ZDM4MGVkMzZhZTYiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAK
IGRvX2NvbXBpbGUgKCkgewotLSAKMi40Ny4xCgo=

--===============2289973330081521729==--

