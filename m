Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76359C83F3C
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.12182.1752594945194591375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fdkAlkQz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Akl8idhg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980ecc9bb5-e8c46efd-b33d-4dd5-ad96-03b7464f29c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OtAqkWHDVupKFsR/7beQl3BctHQjjz9Ck3VCoij0Uyg=;
	b=fdkAlkQz4mBy458gb1RQ1EC9tC/FEZNLDBNVK7q+GJMckQ2d21Rqv/bW/4oFHqQz
	unDrwsu5SHZZfZSjQMguRjVcbFGa2rkeo/EXpgZzKvSY+ssTZUWUnWiPIaeSuxPbMdE
	VV29pIdG/7ik5+S4zMKPQvlFUKLTWqB4+Kb2rnDk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OtAqkWHDVupKFsR/7beQl3BctHQjjz9Ck3VCoij0Uyg=;
	b=Akl8idhgD6md+LKarhulgUM1OtY8wTv4+njoY/amD40nC2CJPJxikcHNM2jJ5B9m
	S4JezOzLEHZuM0Dfb65pZys8VdEoAM+3x4cY/ZcFmHt33BnRX8GUJn0Pts7n2mX61SN
	Nl6PcLOXIN+DgmrIkfI9bbMCoyiD/HoUgVon6qkQ=
Content-Type: multipart/mixed; boundary="===============7039185995390157472=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.99.5 SUCCEEDED
Message-ID: <010101980ecc9bb5-e8c46efd-b33d-4dd5-ad96-03b7464f29c7-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220364

--===============7039185995390157472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lsof* to *4.99.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.99.4-4.99.5.patch
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
From 4e0d5c8ef6e550b91dbfe157b2f4ba1a99faed58 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:51:28 +0000
Subject: [PATCH] lsof: upgrade 4.99.4 -> 4.99.5

---
 meta/recipes-extended/lsof/files/remove-host-information.patch | 2 +-
 meta/recipes-extended/lsof/{lsof_4.99.4.bb => lsof_4.99.5.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.99.4.bb => lsof_4.99.5.bb} (93%)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index 1f2b4afa69..11942392a1 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,4 +1,4 @@
-From 4f05492ac07a7bbaf06dd8265b9cba329e1b53e9 Mon Sep 17 00:00:00 2001
+From a1e818a203514955bc6e7dd21945d8318e24567c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 30 Aug 2017 15:05:16 +0800
 Subject: [PATCH] lsof: remove host information from version.h
diff --git a/meta/recipes-extended/lsof/lsof_4.99.4.bb b/meta/recipes-extended/lsof/lsof_4.99.5.bb
similarity index 93%
rename from meta/recipes-extended/lsof/lsof_4.99.4.bb
rename to meta/recipes-extended/lsof/lsof_4.99.5.bb
index b977fc4897..727e99b66f 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.4.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
-SRCREV = "bbf320ce586a848f880bca7b758d50ae4c712624"
+SRCREV = "ed0fef9a134b64c9398075185534a76714c91179"
 
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""
-- 
2.47.1


--===============7039185995390157472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lsof: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-dbg: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-dbg: PKGSIZE changed from 1135648 to 1136208 (+0%)
packages/core2-64-poky-linux/lsof/lsof-dbg: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-dev: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-dev: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-doc: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-doc: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-locale: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-locale: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-src: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-src: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-staticdev: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-staticdev: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof: PV changed from "4.99.4" to "4.99.5"

--===============7039185995390157472==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.99.4-4.99.5.patch"

RnJvbSA0ZTBkNWM4ZWY2ZTU1MGI5MWRiZmUxNTdiMmY0YmExYTk5ZmFlZDU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6NTE6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
c29mOiB1cGdyYWRlIDQuOTkuNCAtPiA0Ljk5LjUKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xzb2YvZmlsZXMvcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0Y2ggfCAyICstCiBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHNvZi97bHNvZl80Ljk5LjQuYmIgPT4gbHNvZl80Ljk5LjUuYmJ9ICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL3tsc29mXzQuOTkuNC5iYiA9PiBsc29m
XzQuOTkuNS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNv
Zi9maWxlcy9yZW1vdmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCmluZGV4IDFmMmI0
YWZhNjkuLjExOTQyMzkyYTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sc29mL2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0ZjA1NDkyYWMwN2E3YmJhZjA2ZGQ4MjY1YjljYmEzMjllMWI1M2U5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMWU4MThhMjAzNTE0OTU1YmM2ZTdkZDIxOTQ1
ZDgzMThlMjQ1NjdjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBXZWQsIDMwIEF1ZyAyMDE3IDE1OjA1OjE2ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxzb2Y6IHJlbW92ZSBob3N0IGluZm9ybWF0aW9uIGZyb20g
dmVyc2lvbi5oCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQu
OTkuNC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OS41LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xz
b2ZfNC45OS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQu
OTkuNS5iYgppbmRleCBiOTc3ZmM0ODk3Li43MjdlOTliNjZmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQuOTkuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbHNvZi9sc29mXzQuOTkuNS5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YTQ4YWM5N2E4NTUwZWZmMTIzOTVhMmMwZDYxNTE1MTAi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9sc29mLW9yZy9sc29mO2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vcmVtb3ZlLWhvc3QtaW5mb3Jt
YXRpb24ucGF0Y2giCi1TUkNSRVYgPSAiYmJmMzIwY2U1ODZhODQ4Zjg4MGJjYTdiNzU4ZDUwYWU0
YzcxMjYyNCIKK1NSQ1JFViA9ICJlZDBmZWY5YTEzNGI2NGM5Mzk4MDc1MTg1NTM0YTc2NzE0Yzkx
MTc5IgogCiBpbmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBt
YW5wYWdlcwogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10gPSAiIgotLSAKMi40Ny4xCgo=

--===============7039185995390157472==--

