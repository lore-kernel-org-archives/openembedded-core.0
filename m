Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F988CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87187.1781337021689745081
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EI0+ePTY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0UnxBYdH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ebff5d961-f4448dcb-e144-431d-be66-4b6901b8a2d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337020;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4eSVJANs996imvvj94OcfHgNceT+2eAMblKpVxjYyw0=;
	b=EI0+ePTYtgGoWNP6C/uGRlZFgnPGt3jgQn5CrpwCK9HcFETnil2AvliAsf26gOHk
	higTjELnVINyaIUl65pxrKaHoyhsJKAxt2lhMcfVaRmEMBicWa3wkHef67acwen6xYe
	fMxbi0/mpIvEgMDib/+Vi44v57gdCeNebUJnplPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337020;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4eSVJANs996imvvj94OcfHgNceT+2eAMblKpVxjYyw0=;
	b=0UnxBYdHnQmZtwnIDaM6c4iTCnizjCseXqq+uEa7aRDZZ7eRjP6YK1SVDnblYhpy
	UA39K0W+TSQirm2UztzjleB5v26fAN9H1Nd1lOVdUGoUMJjX9nWHnuFFqVPlTZb60UO
	zNFoPghki+bHL6pbZ9EswFVV49KCxDyySqP+KnQY=
Content-Type: multipart/mixed; boundary="===============2985897048298201035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.2.9 SUCCEEDED
Message-ID: <0101019ebff5d961-f4448dcb-e144-431d-be66-4b6901b8a2d6-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238652

--===============2985897048298201035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.2.5-8.2.9.patch
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
From c2f36e89df44982528200aa0f4754e3a930e1d90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:11:18 +0000
Subject: [PATCH] fastfloat: upgrade 8.2.5 -> 8.2.9

---
 .../fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.9.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.9.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.9.bb
index cbd7151f85..7be4f65285 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.9.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "05087a303dad9c98768b33c829d398223a649bc6"
+SRCREV = "8234a896236a6c98ee66cf214b31ca15e24579ca"
 
 inherit cmake
-- 
2.47.1


--===============2985897048298201035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.2.5" to "8.2.9"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 173674 to 180083 (+4%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.2.5" to "8.2.9"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.2.5" to "8.2.9"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.2.5" to "8.2.9"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.2.5" to "8.2.9"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.2.5" to "8.2.9"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.2.5" to "8.2.9"
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.5" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.9"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.2.5 [default] to 8.2.9 [default]
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.2.5" to "8.2.9"

--===============2985897048298201035==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.2.5-8.2.9.patch"

RnJvbSBjMmYzNmU4OWRmNDQ5ODI1MjgyMDBhYTBmNDc1NGUzYTkzMGUxZDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6MTE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4yLjUgLT4gOC4yLjkKCi0tLQogLi4uL2Zhc3RmbG9hdC97ZmFz
dGZsb2F0XzguMi41LmJiID0+IGZhc3RmbG9hdF84LjIuOS5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC97ZmFzdGZsb2F0XzguMi41LmJiID0+IGZhc3RmbG9h
dF84LjIuOS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFz
dGZsb2F0L2Zhc3RmbG9hdF84LjIuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0Zmxv
YXQvZmFzdGZsb2F0XzguMi45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi41LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuOS5iYgppbmRl
eCBjYmQ3MTUxZjg1Li43YmU0ZjY1Mjg1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuOS5iYgpAQCAtOSw2ICs5LDYgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICIgXAogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmFzdGZsb2F0L2Zh
c3RfZmxvYXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0iCiAKLVNS
Q1JFViA9ICIwNTA4N2EzMDNkYWQ5Yzk4NzY4YjMzYzgyOWQzOTgyMjNhNjQ5YmM2IgorU1JDUkVW
ID0gIjgyMzRhODk2MjM2YTZjOThlZTY2Y2YyMTRiMzFjYTE1ZTI0NTc5Y2EiCiAKIGluaGVyaXQg
Y21ha2UKLS0gCjIuNDcuMQoK

--===============2985897048298201035==--

