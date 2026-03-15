Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5F1EFCBDD
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28971.1773582117586239089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tCIlKbNE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H5+Vllte;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb6846-82b4793d-905e-4e3c-9d33-2b1077ad3c3b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LbNdCCZ+U4C9LtkEMTiiITp7wXCwnCsDWZV/3ZY5C9M=;
	b=tCIlKbNEXrT5PDLgaNydPQ8SCDV09hL0gsXdDYqm0vhraEa3IB/YW5EC7/dwOoxi
	rWdWzkUfrzi9hxqOkayyRHJkDnzBg9hLDOpPJKMe8lZqjS3d/jJuEcBKJMoN6gMnES0
	yyOSRTbH78kF1Jkt16Ur6f7XKMvsrHcU+G9IgEMU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LbNdCCZ+U4C9LtkEMTiiITp7wXCwnCsDWZV/3ZY5C9M=;
	b=H5+VllteC3BUEdMB/v1DhjfXEys1Ivupw4ffoWWkWY8noKQMsR3GvngZUYSOfoHw
	uasZex6qyBvAKjWjqwsTZ6Ha7QS9MR+cybYOZAKw1shnAjWQq34AUOnrqsVpqwZETb6
	xfa7d4JU9cKkiaBDD210UosaPldYU6Jp/Qm0dmzY=
Content-Type: multipart/mixed; boundary="===============3516402548895787902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.2.4 SUCCEEDED
Message-ID: <0101019cf1bb6846-82b4793d-905e-4e3c-9d33-2b1077ad3c3b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233143

--===============3516402548895787902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.2.3-8.2.4.patch
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
From 24ee774b545c70d4941314e5114205ba3feb410f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 07:32:52 +0000
Subject: [PATCH] fastfloat: upgrade 8.2.3 -> 8.2.4

---
 .../fastfloat/{fastfloat_8.2.3.bb => fastfloat_8.2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.3.bb => fastfloat_8.2.4.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
index 9ccf3dce0c..a5b48d259b 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "01ce95dfe46abccf3264fbccf9f5139ea9016cd2"
+SRCREV = "eb9ab42c0aa86d3cc41871ba7306527d95077b3b"
 
 inherit cmake
-- 
2.47.1


--===============3516402548895787902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.2.3" to "8.2.4"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.2.3" to "8.2.4"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 173590 to 173680 (+0%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.2.3" to "8.2.4"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.2.3" to "8.2.4"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.2.3" to "8.2.4"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.2.3" to "8.2.4"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.2.3" to "8.2.4"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.2.3 [default] to 8.2.4 [default]
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.3" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.4"
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.2.3" to "8.2.4"

--===============3516402548895787902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.2.3-8.2.4.patch"

RnJvbSAyNGVlNzc0YjU0NWM3MGQ0OTQxMzE0ZTUxMTQyMDViYTNmZWI0MTBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6MzI6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4yLjMgLT4gOC4yLjQKCi0tLQogLi4uL2Zhc3RmbG9hdC97ZmFz
dGZsb2F0XzguMi4zLmJiID0+IGZhc3RmbG9hdF84LjIuNC5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC97ZmFzdGZsb2F0XzguMi4zLmJiID0+IGZhc3RmbG9h
dF84LjIuNC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFz
dGZsb2F0L2Zhc3RmbG9hdF84LjIuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0Zmxv
YXQvZmFzdGZsb2F0XzguMi40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuNC5iYgppbmRl
eCA5Y2NmM2RjZTBjLi5hNWI0OGQyNTliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuNC5iYgpAQCAtOSw2ICs5LDYgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICIgXAogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmFzdGZsb2F0L2Zh
c3RfZmxvYXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0iCiAKLVNS
Q1JFViA9ICIwMWNlOTVkZmU0NmFiY2NmMzI2NGZiY2NmOWY1MTM5ZWE5MDE2Y2QyIgorU1JDUkVW
ID0gImViOWFiNDJjMGFhODZkM2NjNDE4NzFiYTczMDY1MjdkOTUwNzdiM2IiCiAKIGluaGVyaXQg
Y21ha2UKLS0gCjIuNDcuMQoK

--===============3516402548895787902==--

