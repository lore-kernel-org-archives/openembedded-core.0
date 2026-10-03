Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EF2CA5FE7
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 06:22:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1161.1791008549338979982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 23:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bfLd+v8s;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Nc7pT28l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1006da6c4-6e3fd815-d24f-451a-8f95-af19b1c1bd6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791008548;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xU+AWlNk1Z3yfir181qTyATqV2t238DpB0Z9UQwcgJU=;
	b=bfLd+v8sJbt2zwcHyIUDpLq7zVFM+q8LvHf0KZlAEV4B/J817kMIxsfrc287jz4R
	owSKrC7ThsHbgH9rV1K1C+UZPFfMt9YLa2qxI5oNegKznCCFlQFK/rNde0JfhcSneOp
	NfOrMwZiP/KsbGNPjIqgry/B9riCu/bA9DvE1yLg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791008548;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xU+AWlNk1Z3yfir181qTyATqV2t238DpB0Z9UQwcgJU=;
	b=Nc7pT28lDQCi4ISvCihA5rzIZraXW6SjYoGit5EhFGR/h5M7iJaK2grqjPiSpK2t
	A2nr79DtXhVH+2bGvSkeMlfIJwDDvJ83Thp+HUiJofQAn8NJJEoGmj24OQh1ieDyzeX
	6dvRfe/NIkI1RT0amcPYQnxcKwAzTkcTa9Udmekc=
Content-Type: multipart/mixed; boundary="===============0311081562954526806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa-demos: upgrading to
 649baedafcb90313ade69909fdef1ee156ab5f8d SUCCEEDED
Message-ID: <010101a1006da6c4-6e3fd815-d24f-451a-8f95-af19b1c1bd6e-000000@us-west-2.amazonses.com>
Date: Sat, 3 Oct 2026 06:22:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.03-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 06:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247143

--===============0311081562954526806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-demos* to *649baedafcb90313ade69909fdef1ee156ab5f8d* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-demos-upgrade-to-latest-revision.patch
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
From 4cb9f4e713c6500d8898b2300c01fd8449391a26 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 3 Oct 2026 05:36:39 +0000
Subject: [PATCH] mesa-demos: upgrade to latest revision

meson: list GLU before GL in demo dependencies
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index e945538c48..6c5b83f4a1 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=5;md5=2c456
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
 
-SRCREV = "71b184c379625c91195f5d69186d4de5a1f642ac"
+SRCREV = "649baedafcb90313ade69909fdef1ee156ab5f8d"
 
 # This recipe doesn't plan to make more releases, so track upstream git commits
 PV .= "+git"
-- 
2.47.1


--===============0311081562954526806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-demos-upgrade-to-latest-revision.patch"

RnJvbSA0Y2I5ZjRlNzEzYzY1MDBkODg5OGIyMzAwYzAxZmQ4NDQ5MzkxYTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMyBPY3QgMjAyNiAwNTozNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2EtZGVtb3M6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgptZXNvbjogbGlzdCBHTFUgYmVm
b3JlIEdMIGluIGRlbW8gZGVwZW5kZW5jaWVzCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvbWVzYS1kZW1vc185LjAuMC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL21lc2EtZGVtb3NfOS4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNh
LWRlbW9zXzkuMC4wLmJiCmluZGV4IGU5NDU1MzhjNDguLjZjNWI4M2Y0YTEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtZGVtb3NfOS4wLjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS1kZW1vc185LjAuMC5iYgpAQCAtMTEsNyArMTEs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9zcmMveGRlbW9zL2dseGdlYXJzLmM7YmVn
aW5saW5lPTE7ZW5kbGluZT01O21kNT0yYzQ1NgogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9kZW1vcy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4i
CiAKLVNSQ1JFViA9ICI3MWIxODRjMzc5NjI1YzkxMTk1ZjVkNjkxODZkNGRlNWExZjY0MmFjIgor
U1JDUkVWID0gIjY0OWJhZWRhZmNiOTAzMTNhZGU2OTkwOWZkZWYxZWUxNTZhYjVmOGQiCiAKICMg
VGhpcyByZWNpcGUgZG9lc24ndCBwbGFuIHRvIG1ha2UgbW9yZSByZWxlYXNlcywgc28gdHJhY2sg
dXBzdHJlYW0gZ2l0IGNvbW1pdHMKIFBWIC49ICIrZ2l0IgotLSAKMi40Ny4xCgo=

--===============0311081562954526806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc

--===============0311081562954526806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mesa-demos-changelog.txt"

meson: list GLU before GL in demo dependencies

--===============0311081562954526806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc

--===============0311081562954526806==--

