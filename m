Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E60C04FCE
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.102669.1697399114327301881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bbs8/mtM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=o4nEwNBn;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b34df0703-1ce04eb5-fba3-4f99-bfa6-878d7964406e-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z84/WOWEqyosGcUOR7USkXGfnhRnUFZ9HQqp22oBOVM=;
	b=Bbs8/mtMIIzekXpcgAo8i/v5MnNA5IGfcbv5KzJLbDs4wZbbNhiPLqbiPi9rCBl8
	qL+lVQktDlqigrccKkJxxQJHXz99E7DEuFeVR/wNRu+RYDgvNnVX5mojAIIZiqIRwgN
	/w4EXs51VZvqcbG65HGfQzP3jessiLOfWwjWl4Jw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z84/WOWEqyosGcUOR7USkXGfnhRnUFZ9HQqp22oBOVM=;
	b=o4nEwNBn68c9M4kk6aY8AaBF5TEjw2N8DAaTn3SrKJtqU3dB0xksRk9i6GOoLHRu
	wvU4tPR9dQ70H2XO54BSdohtbm63mxoe+pxQcr1SI57VBDWlCz2JNEZjE7FQvexRecg
	inQkxdP5MTTsHCfh2ytT4ovOgaIUg4fo1yP8lw4A=
Content-Type: multipart/mixed; boundary="===============3312317320513606579=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 b5ca140312d279ad2f22068fd72a6230eea13436 SUCCEEDED
Message-ID: <0101018b34df0703-1ce04eb5-fba3-4f99-bfa6-878d7964406e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189177

--===============3312317320513606579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *b5ca140312d279ad2f22068fd72a6230eea13436* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From c75679eeb62f17a518e73256c9781e963dfd456d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 09:39:49 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 2d02927af7..a7e4d369ff 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "613495ecaca97a19fa7f8f3ea23306472b36453c"
+SRCREV = "b5ca140312d279ad2f22068fd72a6230eea13436"
 
 PV = "0.1+git"
 
-- 
2.39.2


--===============3312317320513606579==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSBjNzU2NzllZWI2MmYxN2E1MThlNzMyNTZjOTc4MWU5NjNkZmQ0NTZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDk6Mzk6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCAyZDAyOTI3YWY3Li5hN2U0ZDM2OWZmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICI2MTM0OTVlY2FjYTk3YTE5ZmE3Zjhm
M2VhMjMzMDY0NzJiMzY0NTNjIgorU1JDUkVWID0gImI1Y2ExNDAzMTJkMjc5YWQyZjIyMDY4ZmQ3
MmE2MjMwZWVhMTM0MzYiCiAKIFBWID0gIjAuMStnaXQiCiAKLS0gCjIuMzkuMgoK

--===============3312317320513606579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312

--===============3312317320513606579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 247124 to 244332 (-1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 215757 to 213396 (-1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+613495ecac to 0.1+git0+b5ca140312
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 143204 to 138980 (-3%)

--===============3312317320513606579==--

