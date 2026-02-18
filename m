Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1602DC531CE
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1421.1771440099547804679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FZSgC9x3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TE8U5pLW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720ed3a7-50032806-5070-42f5-b052-81c743a6e20a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XKGfjfx84Dm5TTL4cdyP+XPSi9iPVp7tepCFwsNpkA8=;
	b=FZSgC9x3QkDgaFfkQI3J6OuvFcXsuRSkO0SCcqSOgAyS9nqaFeQn3hpJMCF9Qd3j
	UcX/SipKUphl/RXo/SQ7y5Scv++zJgpokAoo+iAavrG6o5pNrBWBhtjAgX6Fzy5A0v4
	eVRd+hKyLJJAYVKrhipR2f3ESxX2Ig35KSZLxKno=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XKGfjfx84Dm5TTL4cdyP+XPSi9iPVp7tepCFwsNpkA8=;
	b=TE8U5pLWe7KEPhv9LftP+YNRHDhA4eZI1flrJVuWYBAbEITGh4IcLm1eMe6/DgNF
	e/Xc5Owk0BG1iZQD04ZgvsUjIP2xHEPYCfTdvQaLW9BFFC4WAsS6lA7/wgMWwZJT0E/
	rnudgKJRktYl21Dtn0svlPxZiGNosgJ86lIKdzZY=
Content-Type: multipart/mixed; boundary="===============5098356094139775143=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.2.3 SUCCEEDED
Message-ID: <0101019c720ed3a7-50032806-5070-42f5-b052-81c743a6e20a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231347

--===============5098356094139775143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.2.2-8.2.3.patch
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
From fafbc573abc2743774b0b564213fd9a29214dec5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:52:30 +0000
Subject: [PATCH] fastfloat: upgrade 8.2.2 -> 8.2.3

---
 .../fastfloat/{fastfloat_8.2.2.bb => fastfloat_8.2.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.2.bb => fastfloat_8.2.3.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
index 28d59ca09b..9ccf3dce0c 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "97b54ca9e75f5303507699d27c6b4f4efe4641a1"
+SRCREV = "01ce95dfe46abccf3264fbccf9f5139ea9016cd2"
 
 inherit cmake
-- 
2.47.1


--===============5098356094139775143==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.2.2-8.2.3.patch"

RnJvbSBmYWZiYzU3M2FiYzI3NDM3NzRiMGI1NjQyMTNmZDlhMjkyMTRkZWM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6NTI6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4yLjIgLT4gOC4yLjMKCi0tLQogLi4uL2Zhc3RmbG9hdC97ZmFz
dGZsb2F0XzguMi4yLmJiID0+IGZhc3RmbG9hdF84LjIuMy5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC97ZmFzdGZsb2F0XzguMi4yLmJiID0+IGZhc3RmbG9h
dF84LjIuMy5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFz
dGZsb2F0L2Zhc3RmbG9hdF84LjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0Zmxv
YXQvZmFzdGZsb2F0XzguMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi4yLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuMy5iYgppbmRl
eCAyOGQ1OWNhMDliLi45Y2NmM2RjZTBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuMy5iYgpAQCAtOSw2ICs5LDYgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICIgXAogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmFzdGZsb2F0L2Zh
c3RfZmxvYXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0iCiAKLVNS
Q1JFViA9ICI5N2I1NGNhOWU3NWY1MzAzNTA3Njk5ZDI3YzZiNGY0ZWZlNDY0MWExIgorU1JDUkVW
ID0gIjAxY2U5NWRmZTQ2YWJjY2YzMjY0ZmJjY2Y5ZjUxMzllYTkwMTZjZDIiCiAKIGluaGVyaXQg
Y21ha2UKLS0gCjIuNDcuMQoK

--===============5098356094139775143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 167201 to 173590 (+4%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.2.2 [default] to 8.2.3 [default]
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.2.2" to "8.2.3"
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.2" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.3"

--===============5098356094139775143==--

