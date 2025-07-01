Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854E6C83F0F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1403.1751386801499103242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dNoB4rqd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IBdOenfe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010197c6ca0d5e-a81ff6f5-574b-43f2-98b2-c180d19af98a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OIJuuaWSFZNDOuRHCuwUt7MUyUwUlhwaHt/ZOgjY5u4=;
	b=dNoB4rqd0oQ/3YM1xD6vDCQARzSA0dUMxTG0wl29wJsP/w6t2O/xVuoZB1ED/O8R
	iDLsMs8sbrNdYNSIdIhgk+iES4L45ex76nUvgHIQsxSkSdxRVjHRNITDc6rZMXU1vAX
	AcM7Ug6wUoTukP7W53mzticwj0YN+Cv/I+2kbsHE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OIJuuaWSFZNDOuRHCuwUt7MUyUwUlhwaHt/ZOgjY5u4=;
	b=IBdOenfee9+7shoSV+P86KUPKUR7SBO3FolHTgqETWDqXNxl+GQWEYoiSIMkpd01
	jrdugYWGPOlGx63IcWiTfkXA8ZLTwI70C7pRIahMdx2g/NkyFznPa4Gr4N3kwFTMJ8t
	w1yJbEFGDln+a62jGnzLp6Mo5yFbxRSirS0Y7mhE=
Content-Type: multipart/mixed; boundary="===============4325504005619393774=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.99.5 SUCCEEDED
Message-ID: <01010197c6ca0d5e-a81ff6f5-574b-43f2-98b2-c180d19af98a-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219659

--===============4325504005619393774==
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
From 8c7dd416ca09368226e67164bb708cccdea093fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:48:44 +0000
Subject: [PATCH] lsof: upgrade 4.99.4 -> 4.99.5

---
 meta/recipes-extended/lsof/files/remove-host-information.patch | 2 +-
 meta/recipes-extended/lsof/{lsof_4.99.4.bb => lsof_4.99.5.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.99.4.bb => lsof_4.99.5.bb} (93%)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index 1f2b4afa69..c502cd1ec7 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,4 +1,4 @@
-From 4f05492ac07a7bbaf06dd8265b9cba329e1b53e9 Mon Sep 17 00:00:00 2001
+From 473aa274a31048005d128d299fda85fbb8d2d013 Mon Sep 17 00:00:00 2001
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


--===============4325504005619393774==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.99.4-4.99.5.patch"

RnJvbSA4YzdkZDQxNmNhMDkzNjgyMjZlNjcxNjRiYjcwOGNjY2RlYTA5M2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDo0ODo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxz
b2Y6IHVwZ3JhZGUgNC45OS40IC0+IDQuOTkuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHNvZi9maWxlcy9yZW1vdmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCB8IDIgKy0KIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9sc29mL3tsc29mXzQuOTkuNC5iYiA9PiBsc29mXzQuOTkuNS5iYn0gIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2Yve2xzb2ZfNC45OS40LmJiID0+IGxzb2Zf
NC45OS41LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xzb2YvZmlsZXMvcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0Y2gKaW5kZXggMWYyYjRh
ZmE2OS4uYzUwMmNkMWVjNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2Yv
ZmlsZXMvcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xzb2YvZmlsZXMvcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDRmMDU0OTJhYzA3YTdiYmFmMDZkZDgyNjViOWNiYTMyOWUxYjUzZTkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ3M2FhMjc0YTMxMDQ4MDA1ZDEyOGQyOTlmZGE4
NWZiYjhkMmQwMTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8
cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IFdlZCwgMzAgQXVnIDIwMTcgMTU6MDU6MTYgKzA4
MDAKIFN1YmplY3Q6IFtQQVRDSF0gbHNvZjogcmVtb3ZlIGhvc3QgaW5mb3JtYXRpb24gZnJvbSB2
ZXJzaW9uLmgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45
OS40LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk5LjUuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNv
Zl80Ljk5LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45
OS41LmJiCmluZGV4IGI5NzdmYzQ4OTcuLjcyN2U5OWI2NmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2xzb2ZfNC45OS41LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hNDhhYzk3YTg1NTBlZmYxMjM5NWEyYzBkNjE1MTUxMCIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xzb2Ytb3JnL2xzb2Y7YnJhbmNoPW1hc3Rl
cjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly9yZW1vdmUtaG9zdC1pbmZvcm1h
dGlvbi5wYXRjaCIKLVNSQ1JFViA9ICJiYmYzMjBjZTU4NmE4NDhmODgwYmNhN2I3NThkNTBhZTRj
NzEyNjI0IgorU1JDUkVWID0gImVkMGZlZjlhMTM0YjY0YzkzOTgwNzUxODU1MzRhNzY3MTRjOTEx
NzkiCiAKIGluaGVyaXQgdXBkYXRlLWFsdGVybmF0aXZlcyBhdXRvdG9vbHMgcGtnY29uZmlnIG1h
bnBhZ2VzCiBQQUNLQUdFQ09ORklHW21hbnBhZ2VzXSA9ICIiCi0tIAoyLjQ3LjEKCg==

--===============4325504005619393774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lsof: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-dbg: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-dbg: PKGSIZE changed from 1135632 to 1136200 (+0%)
packages/core2-64-poky-linux/lsof/lsof-dbg: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-dev: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-dev: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-doc: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-doc: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-locale: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-locale: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-src: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-src: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof-staticdev: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof-staticdev: PKGV changed from 4.99.4 [default] to 4.99.5 [default]
packages/core2-64-poky-linux/lsof/lsof: PV changed from "4.99.4" to "4.99.5"
packages/core2-64-poky-linux/lsof/lsof: PKGV changed from 4.99.4 [default] to 4.99.5 [default]

--===============4325504005619393774==--

