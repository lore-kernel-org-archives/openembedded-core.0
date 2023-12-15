Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3D1C47DA6
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63134.1702649863102937805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UYiCquB4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TwXaCY3h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018c6dd72d65-e6b155cb-782a-4be1-a034-84549f730a54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wa4ufZ8A22HI6xJXIWKkxheC3pdxG0wmWQ/z3tQS/Zw=;
	b=UYiCquB4A05tXF96/S7TfpmeFJJDagH97Do9wtBbbce7bt4ltt4wpaWxoczuqEbC
	DdTW9V5u4ZAOmKQroIW6ZHXEz5MB08sLHDig8cqPJEkYaoQwaWdtLpWO1AmRj/yjqs2
	YbbLgYG6KWnHMDABpsvzYAITxDfyBe9KvB1O+63c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wa4ufZ8A22HI6xJXIWKkxheC3pdxG0wmWQ/z3tQS/Zw=;
	b=TwXaCY3hRoCJJGj0AIYJ67rlnDBo0Pket0v1SR8uQHNqyZfCRjTApJ/LQnD2nfhV
	iX8AalBArQ/AToLxoU/fhpCVeJWS5ROTOtR+L5g1jJ1O8VcTuMgDH0EZ8teAxMgalSs
	zTSuhJK7ji3KM9Avjq/xJr9DT+lGDNoTR5TJW2H4=
Content-Type: multipart/mixed; boundary="===============0686423835590029924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.20.1 SUCCEEDED
Message-ID: <0101018c6dd72d65-e6b155cb-782a-4be1-a034-84549f730a54-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192497

--===============0686423835590029924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-utils-upgrade-2.20.0-2.20.1.patch
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
From f6ae04e26b6bee10947fe7423b143fa61aa99d7a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 10:34:46 +0000
Subject: [PATCH] libva-utils: upgrade 2.20.0 -> 2.20.1

---
 .../libva/{libva-utils_2.20.0.bb => libva-utils_2.20.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.20.0.bb => libva-utils_2.20.1.bb} (95%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.20.0.bb b/meta/recipes-graphics/libva/libva-utils_2.20.1.bb
similarity index 95%
rename from meta/recipes-graphics/libva/libva-utils_2.20.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.20.1.bb
index 2e1fd09406..3bce9a1e32 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.20.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.20.1.bb
@@ -15,7 +15,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
 SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.20-branch;protocol=https"
-SRCREV = "0c8373e62af3e4d9a3831334c5402ad255797e67"
+SRCREV = "2ad888bb463dc9bfb3deb512ec9faf78f1d3bfa8"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.42.0


--===============0686423835590029924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libva-utils: PKGV changed from 2.20.0 [default] to 2.20.1 [default]
packages/core2-64-poky-linux/libva-utils: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils-dbg: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils-dbg: PKGSIZE changed from 3195512 to 3200032 (+0%)
packages/core2-64-poky-linux/libva-utils/libva-utils-dbg: PKGV changed from 2.20.0 [default] to 2.20.1 [default]
packages/core2-64-poky-linux/libva-utils/libva-utils-dev: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils-dev: PKGV changed from 2.20.0 [default] to 2.20.1 [default]
packages/core2-64-poky-linux/libva-utils/libva-utils-doc: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils-doc: PKGV changed from 2.20.0 [default] to 2.20.1 [default]
packages/core2-64-poky-linux/libva-utils/libva-utils-locale: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils-locale: PKGV changed from 2.20.0 [default] to 2.20.1 [default]
packages/core2-64-poky-linux/libva-utils/libva-utils-src: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils-src: PKGSIZE changed from 4446652 to 4447827 (+0%)
packages/core2-64-poky-linux/libva-utils/libva-utils-src: PKGV changed from 2.20.0 [default] to 2.20.1 [default]
packages/core2-64-poky-linux/libva-utils/libva-utils-staticdev: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils-staticdev: PKGV changed from 2.20.0 [default] to 2.20.1 [default]
packages/core2-64-poky-linux/libva-utils/libva-utils: PV changed from "2.20.0" to "2.20.1"
packages/core2-64-poky-linux/libva-utils/libva-utils: PKGV changed from 2.20.0 [default] to 2.20.1 [default]

--===============0686423835590029924==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-utils-upgrade-2.20.0-2.20.1.patch"

RnJvbSBmNmFlMDRlMjZiNmJlZTEwOTQ3ZmU3NDIzYjE0M2ZhNjFhYTk5ZDdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTA6MzQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YS11dGlsczogdXBncmFkZSAyLjIwLjAgLT4gMi4yMC4xCgotLS0KIC4uLi9saWJ2YS97bGli
dmEtdXRpbHNfMi4yMC4wLmJiID0+IGxpYnZhLXV0aWxzXzIuMjAuMS5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS97bGlidmEtdXRpbHNfMi4yMC4wLmJiID0+IGxpYnZh
LXV0aWxzXzIuMjAuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbGlidmEvbGlidmEtdXRpbHNfMi4yMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xp
YnZhL2xpYnZhLXV0aWxzXzIuMjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtdXRpbHNfMi4yMC4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtdXRpbHNfMi4yMC4xLmJiCmlu
ZGV4IDJlMWZkMDk0MDYuLjNiY2U5YTFlMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS11dGlsc18yLjIwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2xpYnZhL2xpYnZhLXV0aWxzXzIuMjAuMS5iYgpAQCAtMTUsNyArMTUsNyBAQCBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIxNDhmYzhh
ZGYxOWRjOWFlYzE3Y2Y5Y2QyOWE5YTVlIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
aW50ZWwvbGlidmEtdXRpbHMuZ2l0O2JyYW5jaD12Mi4yMC1icmFuY2g7cHJvdG9jb2w9aHR0cHMi
Ci1TUkNSRVYgPSAiMGM4MzczZTYyYWYzZTRkOWEzODMxMzM0YzU0MDJhZDI1NTc5N2U2NyIKK1NS
Q1JFViA9ICIyYWQ4ODhiYjQ2M2RjOWJmYjNkZWI1MTJlYzlmYWY3OGYxZDNiZmE4IgogUyA9ICIk
e1dPUktESVJ9L2dpdCIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+
KFxkKyhcLlxkKykrKSkkIgotLSAKMi40Mi4wCgo=

--===============0686423835590029924==--

