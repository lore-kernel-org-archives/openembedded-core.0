Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56CBD5E13F
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17401.1765872145995976586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rfW1zzcz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ebz/6oZV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262ec61f-d667f70d-542f-47d0-8231-18b23fd912b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EasRkLxaOYBukxPs/7nopu17Otg+m6H6dp4CamI5tew=;
	b=rfW1zzczKQ7FMLylNNxgqt8Jef8sZ5SowiT5ftLzZZqyWVZ3O1vpAExl27nIGQaN
	tL7dwyKjdL4ZA6adRv8J7KMKvTr7se9KmM3JDXjypuV9RlsaOL7yBXZ+2p6AzvDnB43
	0CyGe1hL3BWsvRs4PUNoTzbTKsUSK+Ay6npP8klQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EasRkLxaOYBukxPs/7nopu17Otg+m6H6dp4CamI5tew=;
	b=Ebz/6oZV+YbXqzmCH2Uun/2ofdbefjkZNp6yIth1gQbY4fCEKRdNnAolGEOcbzFn
	d4V+P2/WAXG9L5NcUNnjxvXxk03A6XlOg7T0llkGyBPb6jKv/QPThzUbdao/8j0qmsr
	Lt7Wb13k/enuR7rgUcp9Etthg0gjJqPcnJbkubrI=
Content-Type: multipart/mixed; boundary="===============2867848724121329694=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libjpeg-turbo: upgrading to 3.1.3 SUCCEEDED
Message-ID: <0101019b262ec61f-d667f70d-542f-47d0-8231-18b23fd912b1-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227864

--===============2867848724121329694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libjpeg-turbo* to *3.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjpeg-turbo-upgrade-3.1.2-3.1.3.patch
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
From f6c50a0b5145fcce955e1534331d7e8cff15770d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:24:59 +0000
Subject: [PATCH] libjpeg-turbo: upgrade 3.1.2 -> 3.1.3

---
 .../jpeg/{libjpeg-turbo_3.1.2.bb => libjpeg-turbo_3.1.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.1.2.bb => libjpeg-turbo_3.1.3.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
index d4877bb92b..26e84ca42c 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
@@ -9,7 +9,7 @@ DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8f0012234b464ce50890c490f18194f913a7b1f4e6a03d6644179fa0f867d0cf"
+SRC_URI[sha256sum] = "075920b826834ac4ddf97661cc73491047855859affd671d52079c6867c1c6c0"
 
 PE = "1"
 
-- 
2.47.1


--===============2867848724121329694==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.1.2-3.1.3.patch"

RnJvbSBmNmM1MGEwYjUxNDVmY2NlOTU1ZTE1MzQzMzFkN2U4Y2ZmMTU3NzBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6MjQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqcGVnLXR1cmJvOiB1cGdyYWRlIDMuMS4yIC0+IDMuMS4zCgotLS0KIC4uLi9qcGVnL3tsaWJq
cGVnLXR1cmJvXzMuMS4yLmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjMuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL3tsaWJqcGVnLXR1cmJvXzMuMS4yLmJiID0+IGxpYmpw
ZWctdHVyYm9fMy4xLjMuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9q
cGVnL2xpYmpwZWctdHVyYm9fMy4xLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMy5iYgpp
bmRleCBkNDg3N2JiOTJiLi4yNmU4NGNhNDJjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjMuYmIKQEAgLTksNyArOSw3IEBAIERFUEVORFM6
YXBwZW5kOng4Ni02NDpjbGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogREVQRU5EUzphcHBl
bmQ6eDg2OmNsYXNzLXRhcmdldCA9ICIgbmFzbS1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiJHtHSVRI
VUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI4ZjAwMTIyMzRiNDY0Y2U1MDg5MGM0OTBmMTgxOTRmOTEzYTdiMWY0ZTZhMDNkNjY0
NDE3OWZhMGY4NjdkMGNmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3NTkyMGI4MjY4MzRhYzRk
ZGY5NzY2MWNjNzM0OTEwNDc4NTU4NTlhZmZkNjcxZDUyMDc5YzY4NjdjMWM2YzAiCiAKIFBFID0g
IjEiCiAKLS0gCjIuNDcuMQoK

--===============2867848724121329694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 283192 to 287288 (+1%)
packages/x86-64-v3-poky-linux/libjpeg-turbo: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo: SRC_URI changed from "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.2/libjpeg-turbo-3.1.2.tar.gz" to "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.3/libjpeg-turbo-3.1.3.tar.gz"
packages/x86-64-v3-poky-linux/libjpeg-turbo: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5692824 to 5706808 (+0%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 218289 to 218034 (-0%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: FILELIST: directory renamed /usr/src/debug/libjpeg-turbo/3.1.2/src -> /usr/src/debug/libjpeg-turbo/3.1.3/src, directory renamed /usr/src/debug/libjpeg-turbo/3.1.2/simd/x86_64 -> /usr/src/debug/libjpeg-turbo/3.1.3/simd/x86_64, directory renamed /usr/src/debug/libjpeg-turbo/3.1.2/simd -> /usr/src/debug/libjpeg-turbo/3.1.3/simd
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2121928 to 2123117 (+0%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.1.2" to "3.1.3"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 870877 to 874973 (+0%)

--===============2867848724121329694==--

