Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEF7C44507
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2992.1783577517532886340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L+7I/ti7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ar4+6UWO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f458119ba-b6233f68-44f0-4c8a-922f-8e8692af7bc8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3zGkW8cF0HlGfnjbJ9zXzZsHT0EeIkbaIIjh4jOuZa8=;
	b=L+7I/ti72np7/m+2W5KGcQXxdXJn9F0dHHPAK/NgJ3TKrIIGFRv2JHuEHBxntMoU
	3C0b1BBJ38KXTOxRYnA8UWqPvRQAEYXvxzaPHysUzP1u7muUf4PPCLI7djH6O9UQRnR
	lqcplhd/dX8/fgKt1PVXqh7J8eHzph7vl8sjU+Rw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3zGkW8cF0HlGfnjbJ9zXzZsHT0EeIkbaIIjh4jOuZa8=;
	b=Ar4+6UWOMuZy6McoswPEcgSwBbaCOlObWgUz5aNQR7U7WOyNQqDBOJrmVwF+dAA3
	FW81CysqY5tr4xGFcbTzqMGrY9Dl+bWBiWihsY1IrATjnqzwWpq3zGLas5xApwmrshg
	qFsazY7DEyls50zBc/mKVtr6esmjDXpZB7H5vbQA=
Content-Type: multipart/mixed; boundary="===============8754093296573313216=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 6ce654c2572d75d8ba320d22d46a7d3f76cbd2a4 SUCCEEDED
Message-ID: <0101019f458119ba-b6233f68-44f0-4c8a-922f-8e8692af7bc8-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240533

--===============8754093296573313216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *6ce654c2572d75d8ba320d22d46a7d3f76cbd2a4* has Succeeded.

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
From 69936b97d0c5ed67b3cd545bc212b0dc3a842981 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:32:05 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 1c97938e08..853e75ac09 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "1abb8a404613f33a2f98eb83e827b046d0820048"
+SRCREV = "6ce654c2572d75d8ba320d22d46a7d3f76cbd2a4"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============8754093296573313216==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSA2OTkzNmI5N2QwYzVlZDY3YjNjZDU0NWJjMjEyYjBkYzNhODQyOTgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNTozMjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJw
bS1zZXF1b2lhLWNyeXB0by1wb2xpY3k6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0K
IC4uLi9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiAgICAgICAg
ICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0t
c2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0t
c2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgppbmRleCAxYzk3OTM4ZTA4
Li44NTNlNzVhYzA5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVv
aWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JwbS1zZXF1b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCkBAIC0x
MCw3ICsxMCw3IEBAIGluaGVyaXQgYWxsYXJjaCBweXRob24zbmF0aXZlCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0bGFiLmNvbS9yZWRoYXQtY3J5cHRvL2ZlZG9yYS1jcnlwdG8tcG9saWNpZXMuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiAKLVNSQ1JFViA9ICIxYWJiOGE0MDQ2MTNm
MzNhMmY5OGViODNlODI3YjA0NmQwODIwMDQ4IgorU1JDUkVWID0gIjZjZTY1NGMyNTcyZDc1ZDhi
YTMyMGQyMmQ0NmE3ZDNmNzZjYmQyYTQiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAK
IGRvX2NvbXBpbGUgKCkgewotLSAKMi40Ny4xCgo=

--===============8754093296573313216==--

