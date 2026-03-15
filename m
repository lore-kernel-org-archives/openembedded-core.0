Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B463F013FA
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28968.1773582115024802213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hCAQHerg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3JG9DMsy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb75cb-e42a13ac-742b-4185-8c65-041a6abe4ff3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X366r3w5LX3LlFNphYM3isqSPhFqT0C0TxZ67P1X35U=;
	b=hCAQHergSbrN5BfpYAiMuWVbgHIz0fk0blR/DiFPCj5XerO3tuCVl3Ig2/ny/KLY
	nKGINRG1+zyfGwRfBaNGt1UhTyHQjNnMJ+GZvC+KkyxnSfqMbVP3Uut/LaJEkJhRSwi
	1rCbpXwjTtN+1L0tfDYuBJ69D73/wNF+zLQyYiM8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X366r3w5LX3LlFNphYM3isqSPhFqT0C0TxZ67P1X35U=;
	b=3JG9DMsy7MJNYodJuL8Urx2hGEkBIlcCmwXMQoNVOAmccjVEdjbTn7bZXXwhDNYs
	byAIiE5xzaa92KtA7vAClFt/evg9+qphwfe8ZThVKWISHFTDDdYoy4+LWjDeZjh0FYi
	GFp42xuWFY1OpeRaz/ZeP4R+Yj8RLj2Ac2nXhwak=
Content-Type: multipart/mixed; boundary="===============8048182789305983026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.99.6 SUCCEEDED
Message-ID: <0101019cf1bb75cb-e42a13ac-742b-4185-8c65-041a6abe4ff3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233160

--===============8048182789305983026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lsof* to *4.99.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.99.5-4.99.6.patch
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
From 0b05257049f0a2c0105855fa765e5380d80bae6e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 09:13:21 +0000
Subject: [PATCH] lsof: upgrade 4.99.5 -> 4.99.6

---
 meta/recipes-extended/lsof/files/remove-host-information.patch | 2 +-
 meta/recipes-extended/lsof/{lsof_4.99.5.bb => lsof_4.99.6.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.99.5.bb => lsof_4.99.6.bb} (93%)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index 1f2b4afa69..67ae195e15 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,4 +1,4 @@
-From 4f05492ac07a7bbaf06dd8265b9cba329e1b53e9 Mon Sep 17 00:00:00 2001
+From 0d36b0395e23501f62b140609b3523a831f2738d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 30 Aug 2017 15:05:16 +0800
 Subject: [PATCH] lsof: remove host information from version.h
diff --git a/meta/recipes-extended/lsof/lsof_4.99.5.bb b/meta/recipes-extended/lsof/lsof_4.99.6.bb
similarity index 93%
rename from meta/recipes-extended/lsof/lsof_4.99.5.bb
rename to meta/recipes-extended/lsof/lsof_4.99.6.bb
index 292db224af..853924fd21 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.5.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=${PV} \
            file://remove-host-information.patch"
-SRCREV = "ed0fef9a134b64c9398075185534a76714c91179"
+SRCREV = "b173315c8f94bf61d52094857ea3fe7d0f5aaff9"
 
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""
-- 
2.47.1


--===============8048182789305983026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.99.5-4.99.6.patch"

RnJvbSAwYjA1MjU3MDQ5ZjBhMmMwMTA1ODU1ZmE3NjVlNTM4MGQ4MGJhZTZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDk6MTM6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
c29mOiB1cGdyYWRlIDQuOTkuNSAtPiA0Ljk5LjYKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xzb2YvZmlsZXMvcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0Y2ggfCAyICstCiBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHNvZi97bHNvZl80Ljk5LjUuYmIgPT4gbHNvZl80Ljk5LjYuYmJ9ICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL3tsc29mXzQuOTkuNS5iYiA9PiBsc29m
XzQuOTkuNi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNv
Zi9maWxlcy9yZW1vdmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCmluZGV4IDFmMmI0
YWZhNjkuLjY3YWUxOTVlMTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sc29mL2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0ZjA1NDkyYWMwN2E3YmJhZjA2ZGQ4MjY1YjljYmEzMjllMWI1M2U5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZDM2YjAzOTVlMjM1MDFmNjJiMTQwNjA5YjM1
MjNhODMxZjI3MzhkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBXZWQsIDMwIEF1ZyAyMDE3IDE1OjA1OjE2ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxzb2Y6IHJlbW92ZSBob3N0IGluZm9ybWF0aW9uIGZyb20g
dmVyc2lvbi5oCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQu
OTkuNS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OS42LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xz
b2ZfNC45OS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQu
OTkuNi5iYgppbmRleCAyOTJkYjIyNGFmLi44NTM5MjRmZDIxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQuOTkuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbHNvZi9sc29mXzQuOTkuNi5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YTQ4YWM5N2E4NTUwZWZmMTIzOTVhMmMwZDYxNTE1MTAi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9sc29mLW9yZy9sc29mO2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPSR7UFZ9IFwKICAgICAgICAgICAgZmlsZTovL3JlbW92ZS1o
b3N0LWluZm9ybWF0aW9uLnBhdGNoIgotU1JDUkVWID0gImVkMGZlZjlhMTM0YjY0YzkzOTgwNzUx
ODU1MzRhNzY3MTRjOTExNzkiCitTUkNSRVYgPSAiYjE3MzMxNWM4Zjk0YmY2MWQ1MjA5NDg1N2Vh
M2ZlN2QwZjVhYWZmOSIKIAogaW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzIGF1dG90b29scyBw
a2djb25maWcgbWFucGFnZXMKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIiIKLS0gCjIuNDcu
MQoK

--===============8048182789305983026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lsof: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof: SRC_URI changed from "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=4.99.5 file://remove-host-information.patch" to "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=4.99.6 file://remove-host-information.patch"
packages/x86-64-v3-poky-linux/lsof: PV changed from "4.99.5" to "4.99.6"
packages/x86-64-v3-poky-linux/lsof/lsof-dbg: PKGSIZE changed from 1164360 to 1165432 (+0%)
packages/x86-64-v3-poky-linux/lsof/lsof-dbg: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-dbg: PV changed from "4.99.5" to "4.99.6"
packages/x86-64-v3-poky-linux/lsof/lsof-dev: PKGSIZE changed from 28390 to 28442 (+0%)
packages/x86-64-v3-poky-linux/lsof/lsof-dev: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-dev: PV changed from "4.99.5" to "4.99.6"
packages/x86-64-v3-poky-linux/lsof/lsof-doc: PKGSIZE changed from 125725 to 125825 (+0%)
packages/x86-64-v3-poky-linux/lsof/lsof-doc: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-doc: PV changed from "4.99.5" to "4.99.6"
packages/x86-64-v3-poky-linux/lsof/lsof-locale: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-locale: PV changed from "4.99.5" to "4.99.6"
packages/x86-64-v3-poky-linux/lsof/lsof-src: PKGSIZE changed from 991657 to 992042 (+0%)
packages/x86-64-v3-poky-linux/lsof/lsof-src: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-src: FILELIST: directory renamed /usr/src/debug/lsof/4.99.5/lib -> /usr/src/debug/lsof/4.99.6/lib, directory renamed /usr/src/debug/lsof/4.99.5/lib/dialects/linux -> /usr/src/debug/lsof/4.99.6/lib/dialects/linux, directory renamed /usr/src/debug/lsof/4.99.5/include -> /usr/src/debug/lsof/4.99.6/include, directory renamed /usr/src/debug/lsof/4.99.5/src/dialects/linux -> /usr/src/debug/lsof/4.99.6/src/dialects/linux, directory renamed /usr/src/debug/lsof/4.99.5/src -> /usr/src/debug/lsof/4.99.6/src
packages/x86-64-v3-poky-linux/lsof/lsof-src: PV changed from "4.99.5" to "4.99.6"
packages/x86-64-v3-poky-linux/lsof/lsof-staticdev: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-staticdev: PV changed from "4.99.5" to "4.99.6"
packages/x86-64-v3-poky-linux/lsof/lsof: PKGV changed from 4.99.5 [default] to 4.99.6 [default]
packages/x86-64-v3-poky-linux/lsof/lsof: PV changed from "4.99.5" to "4.99.6"

--===============8048182789305983026==--

