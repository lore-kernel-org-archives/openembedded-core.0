Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7EDCDB494
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.102718.1697399115533071843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LEw1hKXB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D1hhH4oA;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b34df0eaf-d3599a32-2301-40d9-92dd-0aaa672a42f0-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fQGy3XchQlsb5u7XWUjaitp3d8bvKiJ1skaO4S/Zb70=;
	b=LEw1hKXBQvbFyjMKxkSQpdarRmDS5evjwRWlRF84bExc4qljaHknpHHgp7QmOyHq
	J7ljPRucPrsiOglMvJ4Hb13NpXf0a2fX41OY08ZywPTTXpja4fb1UjLaVmhz9Ks4ALz
	Q0Xu9jRgrRqYXa+q+kL7v7hE24Yb9MjIAXM3KMlg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fQGy3XchQlsb5u7XWUjaitp3d8bvKiJ1skaO4S/Zb70=;
	b=D1hhH4oAwpjofmdD8ztrI8tH75lEoQoQuvZyuUmrtBhLK73KnIBJofKOLx903/bD
	vsaiGfb/ZCoBY9C9U0bYVqdM6sqsgHqnZwJTGgIYghhSpZjI4syOTfoucTiarTMf1ez
	Lgp8PlvLGZSlvwsfWGjyiuQGSPmRQGhEj3kRjzkY=
Content-Type: multipart/mixed; boundary="===============7643648139081218502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.7 SUCCEEDED
Message-ID: <0101018b34df0eaf-d3599a32-2301-40d9-92dd-0aaa672a42f0-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189229

--===============7643648139081218502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2023.6-2023.7.patch
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
From fa4cd5c39d42bb162c65d935aa36dd361c592c1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 17:40:35 +0000
Subject: [PATCH] shaderc: upgrade 2023.6 -> 2023.7

---
 .../shaderc/{shaderc_2023.6.bb => shaderc_2023.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.6.bb => shaderc_2023.7.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.6.bb b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.6.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.7.bb
index 5afdec5ce9..e4555af6d5 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.6.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "9547789ecfa1be140327057e766ba80666b66e21"
+SRCREV = "23cc2d78fd4f866b6ab527886a396bec36948605"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.39.2


--===============7643648139081218502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.6-2023.7.patch"

RnJvbSBmYTRjZDVjMzlkNDJiYjE2MmM2NWQ5MzVhYTM2ZGQzNjFjNTkyYzFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTc6NDA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjMuNiAtPiAyMDIzLjcKCi0tLQogLi4uL3NoYWRlcmMve3NoYWRl
cmNfMjAyMy42LmJiID0+IHNoYWRlcmNfMjAyMy43LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3NoYWRlcmNfMjAyMy42LmJiID0+IHNoYWRlcmNfMjAy
My43LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L3NoYWRlcmNfMjAyMy42LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIzLjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIzLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMy43LmJiCmluZGV4IDVhZmRlYzVjZTkuLmU0
NTU1YWY2ZDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyMy42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNf
MjAyMy43LmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIK
IAotU1JDUkVWID0gIjk1NDc3ODllY2ZhMWJlMTQwMzI3MDU3ZTc2NmJhODA2NjZiNjZlMjEiCitT
UkNSRVYgPSAiMjNjYzJkNzhmZDRmODY2YjZhYjUyNzg4NmEzOTZiZWMzNjk0ODYwNSIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxk
aW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAy
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBc
Ci0tIAoyLjM5LjIKCg==

--===============7643648139081218502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc: PV changed from "2023.6" to "2023.7"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 6642100 to 6872664 (+3%)
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.6" to "2023.7"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2023.6" to "2023.7"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2023.6" to "2023.7"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2023.6" to "2023.7"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2023.6" to "2023.7"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2479472 to 2541306 (+2%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.6" to "2023.7"
packages/core2-32-poky-linux/shaderc/shaderc: PKGSIZE changed from 302516 to 306612 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2023.6" to "2023.7"

--===============7643648139081218502==--

