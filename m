Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDF4CD12CA
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1997.1711994601991325208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N9ieSDRx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=z4lpx1kb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9ad485de-cfbb4a67-a336-4a70-8395-cfe449a5a489-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=7qHnfd/+TwiMwUpI1ssiewDlTfbBxJqSWUa9mQtN8QE=;
	b=N9ieSDRxOtZjN3isxKMR6B0rC7rLNx+UEq4kd+ZMgtzchbCaNYGXsx0zcIzvlrfO
	Fzcl1vOofC1qwbjMXJBQ41C5LdbuUrk/HCMpRRunZFUnYLZYXL6Wb7ZaBP5qLYv5/ju
	svNIhELfQcWqdSoTXEf6jSusyzL1I+IfLVqF1OpM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=7qHnfd/+TwiMwUpI1ssiewDlTfbBxJqSWUa9mQtN8QE=;
	b=z4lpx1kbmB6hCR0fd19RHFuTSNxM6xDqEANrUbjwu8/ZWt9WATcLgMX8ZHr8DWyl
	42oAvkqGZ6+RCaOCv/eN/+BOy7gSZGbDNAE0p9msEKEwRZEybS9UXyg8zn1rXpffMK6
	Hw9NXERY5Icnx1Puk4khUoN0cEuXRra1U/J68kv4=
Content-Type: multipart/mixed; boundary="===============4383989194799133901=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] encodings: upgrading to 1.1.0 SUCCEEDED
Message-ID: <0101018e9ad485de-cfbb4a67-a336-4a70-8395-cfe449a5a489-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197764

--===============4383989194799133901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *encodings* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-encodings-upgrade-1.0.7-1.1.0.patch
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
From e77619bcd002e38d66291a84e15aa898a7debf0b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:41:35 +0000
Subject: [PATCH] encodings: upgrade 1.0.7 -> 1.1.0

---
 .../xorg-font/{encodings_1.0.7.bb => encodings_1.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.7.bb => encodings_1.1.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
rename to meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
index 5906da416a..7432c08ec0 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
@@ -11,7 +11,7 @@ PE = "1"
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS:${PN} = ""
 
-SRC_URI[sha256sum] = "3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4"
+SRC_URI[sha256sum] = "9ff13c621756cfa12e95f32ba48a5b23839e8f577d0048beda66c67dab4de975"
 
 SRC_URI_EXT = "xz"
 
-- 
2.42.0


--===============4383989194799133901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/encodings/encodings: FILELIST: added "/usr/share/fonts/X11/encodings/iso8859-14.enc.gz"

--===============4383989194799133901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/encodings/encodings-dbg: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-dbg: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-dev: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-dev: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-doc: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-doc: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-locale: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-locale: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-src: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-src: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-staticdev: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-staticdev: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings: PKGSIZE changed from 643033 to 644033 (+0%)
packages/all-poky-linux/encodings/encodings: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings: FILELIST: added "/usr/share/fonts/X11/encodings/iso8859-14.enc.gz"
packages/all-poky-linux/encodings/encodings: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings: SRC_URI changed from "https://www.x.org/releases//individual/font/encodings-1.0.7.tar.xz" to "https://www.x.org/releases//individual/font/encodings-1.1.0.tar.xz"

--===============4383989194799133901==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-encodings-upgrade-1.0.7-1.1.0.patch"

RnJvbSBlNzc2MTliY2QwMDJlMzhkNjYyOTFhODRlMTVhYTg5OGE3ZGViZjBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDo0MTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y29kaW5nczogdXBncmFkZSAxLjAuNyAtPiAxLjEuMAoKLS0tCiAuLi4veG9yZy1mb250L3tlbmNv
ZGluZ3NfMS4wLjcuYmIgPT4gZW5jb2RpbmdzXzEuMS4wLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1mb250L3tlbmNvZGluZ3NfMS4wLjcuYmIgPT4gZW5jb2Rpbmdz
XzEuMS4wLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWZvbnQvZW5jb2RpbmdzXzEuMC43LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9u
dC9lbmNvZGluZ3NfMS4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9udC9lbmNvZGluZ3NfMS4wLjcuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWZvbnQvZW5jb2RpbmdzXzEuMS4wLmJiCmluZGV4
IDU5MDZkYTQxNmEuLjc0MzJjMDhlYzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWZvbnQvZW5jb2RpbmdzXzEuMC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWZvbnQvZW5jb2RpbmdzXzEuMS4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFBFID0gIjEi
CiBERVBFTkRTID0gIm1rZm9udHNjYWxlLW5hdGl2ZSBta2ZvbnRkaXItbmF0aXZlIGZvbnQtdXRp
bC1uYXRpdmUiCiBSREVQRU5EUzoke1BOfSA9ICIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIz
YTM5YTlmNDNiMTY1MjFjZGJkOWY4MTAwOTA5NTJhZjRmMTA5YjQ0ZmE3YTg2NWNkNTU1ZjhmZWJj
ZWE3MGE0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlmZjEzYzYyMTc1NmNmYTEyZTk1ZjMyYmE0
OGE1YjIzODM5ZThmNTc3ZDAwNDhiZWRhNjZjNjdkYWI0ZGU5NzUiCiAKIFNSQ19VUklfRVhUID0g
Inh6IgogCi0tIAoyLjQyLjAKCg==

--===============4383989194799133901==--

