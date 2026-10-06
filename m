Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A86CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 06:25:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39332.1791267900296301278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 23:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eZDwu2q2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jNN8nfh4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a10fe30745-7546d4be-dcce-4608-bfb8-9422bed1ea64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791267899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U8w6Sdloi+jm1eG4UnnV4GeCqE/gof907WRw8wCtg7E=;
	b=eZDwu2q26Ff2RW+3cUMHAB585SxH1IxQ3RJuZ9W3Q8cpPI6/wV3PJBhi7whXw6xX
	VR/kXZtCi6yihyI/5AcSAsssmmUwo2v1qZj4lrTy9oJo7vveLU95xeIb4OjJMDshF9J
	ZO7q4gH42wbam+NXiuIcAuCrZw4i3fpv0AE1IeT4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791267899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U8w6Sdloi+jm1eG4UnnV4GeCqE/gof907WRw8wCtg7E=;
	b=jNN8nfh4hvdI1owz975cIFI0SNWWrHNCShMa1I7+5/1NNgszopwHZQd/qVz5MnPd
	YVSsU02gEHQIgzDp5qmr05jFzDNk7xmOH0zjDQfQQl4lvsH1OF3E0c5P/BryEWFLeqF
	4+4Tc/F62JID32pGZlB3mXt++EEbDj/10tCsHLTs=
Content-Type: multipart/mixed; boundary="===============8752406339316283361=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 14a7b30a95489e38e63c61779e2410cbf5884613 SUCCEEDED
Message-ID: <010101a10fe30745-7546d4be-dcce-4608-bfb8-9422bed1ea64-000000@us-west-2.amazonses.com>
Date: Tue, 6 Oct 2026 06:24:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.06-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 06:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247273

--===============8752406339316283361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *14a7b30a95489e38e63c61779e2410cbf5884613* has Succeeded.

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
From 653edc6b522adecff50d7a0a4025f48409bac7ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 6 Oct 2026 05:52:30 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

.gitlab-ci.yml: hardcode prebuilt image URLs for forks to use them
update-crypto-policies: add ruff ignore for positional arguments
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 7f7896cf85..ab6a3755e5 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "359ab169da6a0d4d0fa09fed562bb0d56f470030"
+SRCREV = "14a7b30a95489e38e63c61779e2410cbf5884613"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============8752406339316283361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="rpm-sequoia-crypto-policy-changelog.txt"

.gitlab-ci.yml: hardcode prebuilt image URLs for forks to use them
update-crypto-policies: add ruff ignore for positional arguments

--===============8752406339316283361==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSA2NTNlZGM2YjUyMmFkZWNmZjUwZDdhMGE0MDI1ZjQ4NDA5YmFjN2VhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNiBPY3QgMjAyNiAwNTo1MjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJw
bS1zZXF1b2lhLWNyeXB0by1wb2xpY3k6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgouZ2l0
bGFiLWNpLnltbDogaGFyZGNvZGUgcHJlYnVpbHQgaW1hZ2UgVVJMcyBmb3IgZm9ya3MgdG8gdXNl
IHRoZW0KdXBkYXRlLWNyeXB0by1wb2xpY2llczogYWRkIHJ1ZmYgaWdub3JlIGZvciBwb3NpdGlv
bmFsIGFyZ3VtZW50cwotLS0KIC4uLi9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9s
aWN5X2dpdC5iYiAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5i
YgppbmRleCA3Zjc4OTZjZjg1Li5hYjZhMzc1NWU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnBtLXNlcXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS1zZXF1b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1w
b2xpY3lfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIGluaGVyaXQgYWxsYXJjaCBweXRob24zbmF0
aXZlCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmNvbS9yZWRoYXQtY3J5cHRvL2ZlZG9yYS1j
cnlwdG8tcG9saWNpZXMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiAKLVNSQ1JF
ViA9ICIzNTlhYjE2OWRhNmEwZDRkMGZhMDlmZWQ1NjJiYjBkNTZmNDcwMDMwIgorU1JDUkVWID0g
IjE0YTdiMzBhOTU0ODllMzhlNjNjNjE3NzllMjQxMGNiZjU4ODQ2MTMiCiBVUFNUUkVBTV9DSEVD
S19DT01NSVRTID0gIjEiCiAKIGRvX2NvbXBpbGUgKCkgewotLSAKMi40Ny4xCgo=

--===============8752406339316283361==--

