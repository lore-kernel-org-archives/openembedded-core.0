Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC1EC54798
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2114.1706810406882047144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dS1hgH1o;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QlxCOjXs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d65d3f56d-a5ca18f5-5905-4c6c-8bb9-d0c6f5fe6caf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mMs7xg/08QefxvZvV5QfbuXjmWMyTyD2q0CUc9gvSJw=;
	b=dS1hgH1orkPKwOlYlt/tjTL0EjGMqupR+YIZul4tUPbNZDcD5h/Sykwl6LwNfXJw
	sWvu2PFUAdEfqFzy0IHVeeBB18w6G4wVg9yJwndKoGAKHMQeRXlmQAi4KEHskCzGiE5
	9Lbca0nIfAnbcl2cj8TDf7MQkZSuheLuQbPQ/h9M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mMs7xg/08QefxvZvV5QfbuXjmWMyTyD2q0CUc9gvSJw=;
	b=QlxCOjXsiMqFMbSHzRTj6fcX0fGEKqE8PfUvUwnWRTO1hl0xh5MGUQogI6pJpxHl
	o6a3iTwK1g64ng5moyh1PItQuxAriZNvOz29Az+Fm7v3ars1izRwSyoi/S+d6ZNwDY1
	5PcvPLZuhU36v5frav/+56r6gWg1dmHu7+XPjOww=
Content-Type: multipart/mixed; boundary="===============5191243461824093952=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ed: upgrading to 1.20 SUCCEEDED
Message-ID: <0101018d65d3f56d-a5ca18f5-5905-4c6c-8bb9-d0c6f5fe6caf-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194661

--===============5191243461824093952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ed* to *1.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.19-1.20.patch
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
From a040986e688fa6b5373fb7583c51ff502a20c236 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 10:40:04 +0000
Subject: [PATCH] ed: upgrade 1.19 -> 1.20

---
 .../ed/{ed_1.19.bb => ed_1.20.bb}             | 37 +++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.19.bb => ed_1.20.bb} (43%)

diff --git a/meta/recipes-extended/ed/ed_1.19.bb b/meta/recipes-extended/ed/ed_1.20.bb
similarity index 43%
rename from meta/recipes-extended/ed/ed_1.19.bb
rename to meta/recipes-extended/ed/ed_1.20.bb
index d01b7486d9..beb70669ec 100644
--- a/meta/recipes-extended/ed/ed_1.19.bb
+++ b/meta/recipes-extended/ed/ed_1.20.bb
@@ -1,11 +1,42 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- ed.h
+# +++ ed.h
+# @@ -1,7 +1,7 @@
+#  /* Global declarations for the ed editor.  */
+#  /* GNU ed - The GNU line editor.
+#     Copyright (C) 1993, 1994 Andrew L. Moore, Talke Studio
+# -   Copyright (C) 2006-2023 Antonio Diaz Diaz.
+# +   Copyright (C) 2006-2024 Antonio Diaz Diaz.
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# --- main.c
+# +++ main.c
+# @@ -1,5 +1,5 @@
+#  /* GNU ed - The GNU line editor.
+# -   Copyright (C) 2006-2023 Antonio Diaz Diaz.
+# +   Copyright (C) 2006-2024 Antonio Diaz Diaz.
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# 
+#
+
 SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://ed.h;endline=20;md5=504a90a78b045972e2fd2f3fc418c195 \
-                    file://main.c;endline=17;md5=cf9d322b0ac4445ca2299c61ee175365 \
+                    file://ed.h;endline=20;md5=c3212b6c53b09668107420af9368c0ef \
+                    file://main.c;endline=17;md5=e5d2ae5ddd1ecb87dc71702c06dd06dc \
                     "
 
 SECTION = "base"
@@ -19,7 +50,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48"
+SRC_URI[sha256sum] = "c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.42.0


--===============5191243461824093952==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ed-upgrade-1.19-1.20.patch"

RnJvbSBhMDQwOTg2ZTY4OGZhNmI1MzczZmI3NTgzYzUxZmY1MDJhMjBjMjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMDo0MDowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVk
OiB1cGdyYWRlIDEuMTkgLT4gMS4yMAoKLS0tCiAuLi4vZWQve2VkXzEuMTkuYmIgPT4gZWRfMS4y
MC5iYn0gICAgICAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZWQve2VkXzEuMTkuYmIgPT4gZWRfMS4yMC5iYn0gKDQzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4xOS5iYiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9lZC9lZF8xLjIwLmJiCnNpbWlsYXJpdHkgaW5kZXggNDMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjE5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZWQvZWRfMS4yMC5iYgppbmRleCBkMDFiNzQ4NmQ5Li5iZWI3MDY2OWVjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4xOS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMC5iYgpAQCAtMSwxMSArMSw0MiBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIGVkLmgKKyMgKysrIGVkLmgKKyMgQEAgLTEsNyArMSw3IEBACisjICAvKiBHbG9i
YWwgZGVjbGFyYXRpb25zIGZvciB0aGUgZWQgZWRpdG9yLiAgKi8KKyMgIC8qIEdOVSBlZCAtIFRo
ZSBHTlUgbGluZSBlZGl0b3IuCisjICAgICBDb3B5cmlnaHQgKEMpIDE5OTMsIDE5OTQgQW5kcmV3
IEwuIE1vb3JlLCBUYWxrZSBTdHVkaW8KKyMgLSAgIENvcHlyaWdodCAoQykgMjAwNi0yMDIzIEFu
dG9uaW8gRGlheiBEaWF6LgorIyArICAgQ29weXJpZ2h0IChDKSAyMDA2LTIwMjQgQW50b25pbyBE
aWF6IERpYXouCisjICAKKyMgICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOiB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjICAgICBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorIyAt
LS0gbWFpbi5jCisjICsrKyBtYWluLmMKKyMgQEAgLTEsNSArMSw1IEBACisjICAvKiBHTlUgZWQg
LSBUaGUgR05VIGxpbmUgZWRpdG9yLgorIyAtICAgQ29weXJpZ2h0IChDKSAyMDA2LTIwMjMgQW50
b25pbyBEaWF6IERpYXouCisjICsgICBDb3B5cmlnaHQgKEMpIDIwMDYtMjAyNCBBbnRvbmlvIERp
YXogRGlhei4KKyMgIAorIyAgICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU6IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgICAgIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjIAor
IworCiBTVU1NQVJZID0gIkxpbmUtb3JpZW50ZWQgdGV4dCBlZGl0b3IiCiBIT01FUEFHRSA9ICJo
dHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZWQvIgogREVTQ1JJUFRJT04gPSAiR05VIGVkIGlz
IGEgbGluZS1vcmllbnRlZCB0ZXh0IGVkaXRvci4gSXQgaXMgdXNlZCB0byBjcmVhdGUsIGRpc3Bs
YXksIG1vZGlmeSBhbmQgb3RoZXJ3aXNlIG1hbmlwdWxhdGUgdGV4dCBmaWxlcywgYm90aCBpbnRl
cmFjdGl2ZWx5IGFuZCB2aWEgc2hlbGwgc2NyaXB0cy4gQSByZXN0cmljdGVkIHZlcnNpb24gb2Yg
ZWQsIHJlZCwgY2FuIG9ubHkgZWRpdCBmaWxlcyBpbiB0aGUgY3VycmVudCBkaXJlY3RvcnkgYW5k
IGNhbm5vdCBleGVjdXRlIHNoZWxsIGNvbW1hbmRzLiIKIAogTElDRU5TRSA9ICJHUEwtMi4wLW9u
bHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NmQ2ZTMwMGZmZDhm
YjlkMThiZDliMTM2YTliYmExMyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9lZC5oO2Vu
ZGxpbmU9MjA7bWQ1PTUwNGE5MGE3OGIwNDU5NzJlMmZkMmYzZmM0MThjMTk1IFwKLSAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL21haW4uYztlbmRsaW5lPTE3O21kNT1jZjlkMzIyYjBhYzQ0NDVj
YTIyOTljNjFlZTE3NTM2NSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9lZC5oO2VuZGxp
bmU9MjA7bWQ1PWMzMjEyYjZjNTNiMDk2NjgxMDc0MjBhZjkzNjhjMGVmIFwKKyAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL21haW4uYztlbmRsaW5lPTE3O21kNT1lNWQyYWU1ZGRkMWVjYjg3ZGM3
MTcwMmMwNmRkMDZkYyBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU0VDVElPTiA9ICJiYXNl
IgpAQCAtMTksNyArNTAsNyBAQCBiaW5kaXIgPSAiJHtiYXNlX2JpbmRpcn0iCiBTUkNfVVJJID0g
IiR7R05VX01JUlJPUn0vZWQvJHtCUH0udGFyLmx6IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gIiR7
R05VX01JUlJPUn0vZWQvIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2UyZjJlNWM0MjQ3OTBh
YTk2ZDA5ZGFjYjkzZDliYmZkYzBiN2ViNjI0OWM5Y2I3NTM4NDUyZThlYzc3Y2Q0OCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJjNjAzMGRlZmU2YWUxNzJmMTY4NzkwNmQ3MzU0MDU0Yzc1YTZhOTEz
MGFmMzE5ZDRlNzNjNTBhOTE5NTljNWE2IgogCiBFWFRSQV9PRU1BS0UgPSAiLWUgTUFLRUZMQUdT
PSIKIAotLSAKMi40Mi4wCgo=

--===============5191243461824093952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ed/ed-dbg: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed/ed-dbg: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed/ed-dbg: PKGSIZE changed from 151480 to 160840 (+6%)
packages/core2-64-poky-linux/ed/ed-dev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed/ed-dev: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed/ed-doc: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed/ed-doc: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed/ed-doc: PKGSIZE changed from 71650 to 73783 (+3%)
packages/core2-64-poky-linux/ed/ed-locale: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed/ed-locale: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed/ed-src: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed/ed-src: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed/ed-src: PKGSIZE changed from 107620 to 114489 (+6%)
packages/core2-64-poky-linux/ed/ed-staticdev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed/ed-staticdev: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed/ed: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed/ed: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed/ed: PKGSIZE changed from 55785 to 59921 (+7%)
packages/core2-64-poky-linux/ed: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-64-poky-linux/ed: PV changed from "1.19" to "1.20"
packages/core2-64-poky-linux/ed: SRC_URI changed from "https://ftp.gnu.org/gnu/ed/ed-1.19.tar.lz" to "https://ftp.gnu.org/gnu/ed/ed-1.20.tar.lz"

--===============5191243461824093952==--

