Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A865EEB585
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103050.1767267466163066700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mtjiMqAv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LzQeRDnh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b7959ab46-3da846b1-b81c-49ce-9964-892e34c186d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9K6DCI6OHs7eR3o+la6lZrmUDzdmtsV/82OIFhL5agY=;
	b=mtjiMqAvUW9bB8RwPmfG+L2r2K90SSlbGmNAZg+dDjNA3jwLw9WzVfnIOhzgAK+9
	XBBwkWVfOWeEuA766qwthdalLgQHN9xiuNmRRs6CwfwJ7TbU4xXKOafd4mrzAg74C/e
	1XAcFkGq7jNtCId9f5znzwkgVft+vcVOf4h42B5M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9K6DCI6OHs7eR3o+la6lZrmUDzdmtsV/82OIFhL5agY=;
	b=LzQeRDnhGxavSUlv3JiazMw1I4JArAg7umCGNZpYxRoiARFXTnXEoJx2h0y5jgWg
	X6Ohk0AX2Kisl9ROJN7iiXZoO+nWNas7r1BFqA9JqpiKBMLm4OKdi53o28402nTo0Wb
	+jESRoyK5AtwY96a0Rnow7Np1l/xa+4PMoSaQBFY=
Content-Type: multipart/mixed; boundary="===============2987653308469965687=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.20.3 SUCCEEDED
Message-ID: <0101019b7959ab46-3da846b1-b81c-49ce-9964-892e34c186d7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228791

--===============2987653308469965687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.20.2-4.20.3.patch
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
From 71cf59c2d6c43b03c76411324e1ce7d4e719a718 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 09:55:17 +0000
Subject: [PATCH] gtk4: upgrade 4.20.2 -> 4.20.3

---
 meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
index 92791db169..ef9a05f7fe 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f90e010e10bddc5c"
+SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============2987653308469965687==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.20.2-4.20.3.patch"

RnJvbSA3MWNmNTljMmQ2YzQzYjAzYzc2NDExMzI0ZTFjZTdkNGU3MTlhNzE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwOTo1NToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC4yMC4yIC0+IDQuMjAuMwoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky97Z3RrNF80LjIwLjIuYmIgPT4gZ3RrNF80LjIwLjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdu
b21lL2d0aysve2d0azRfNC4yMC4yLmJiID0+IGd0azRfNC4yMC4zLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjIwLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjIwLjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiCmluZGV4IDkyNzkxZGIxNjkuLmVm
OWEwNWY3ZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiCkBAIC0zMyw3
ICszMyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiIFwKICAgICBmaWxlOi8vdGVzdHMvdGVzdGd0
ay5jO2VuZGxpbmU9MjU7bWQ1PTQ5ZDA2NzcwNjgxYjgzMjI0NjZiNTJlZDE5ZDI5ZmIyIFwKICIK
IAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNWU4MjQwZWRlY2FmYWZmMmI4YmFmNDY2
M2JkY2VhYTY2OGVmMTBhMjA3YmVlNGQ3ZjkwZTAxMGUxMGJkZGM1YyIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjI4NzNmMjkwMzA4OGE2NmM3MTE3M2VhMmVkODVmZmFlMjY2YTY2Yjk3
MmMzYTQ4NDJiYmIyZjZmMTg3ZWMxNTMiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7R05PTUVCTn0t
JHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============2987653308469965687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2000.2", added "/usr/lib/.debug/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 73372512 to 73409176 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 23794509 to 23802810 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 121534 to 122638 (+1%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGSIZE changed from 113168 to 115169 (+2%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 122561 to 122565 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGSIZE changed from 115522 to 121144 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGSIZE changed from 141246 to 148230 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y -> /usr/src/debug/gtk4/4.20.3/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/x11 -> /usr/src/debug/gtk4/4.20.3/gdk/x11, directory renamed /usr/src/debug/gtk4/4.20.2/gtk -> /usr/src/debug/gtk4/4.20.3/gtk, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/loaders -> /usr/src/debug/gtk4/4.20.3/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gl -> /usr/src/debug/gtk4/4.20.3/gsk/gl, directory renamed /usr/src/debug/gtk4/4.20.2/testsuite/reftests -> /usr/src/debug/gtk4/4.20.3/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.20.3/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/deprecated -> /usr/src/debug/gtk4/4.20.3/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/deprecated -> /usr/src/debug/gtk4/4.20.3/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/pr
 int -> /usr/src/debug/gtk4/4.20.3/gtk/print, directory renamed /usr/src/debug/gtk4/4.20.2/gsk -> /usr/src/debug/gtk4/4.20.3/gsk, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/wayland -> /usr/src/debug/gtk4/4.20.3/gdk/wayland, directory renamed /usr/src/debug/gtk4/4.20.2/gdk -> /usr/src/debug/gtk4/4.20.3/gdk, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu -> /usr/src/debug/gtk4/4.20.3/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/roaring -> /usr/src/debug/gtk4/4.20.3/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/css -> /usr/src/debug/gtk4/4.20.3/gtk/css, directory renamed /usr/src/debug/gtk4/4.20.2/tools -> /usr/src/debug/gtk4/4.20.3/tools, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/media -> /usr/src/debug/gtk4/4.20.3/gtk/media, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/print/backends -> /usr/src/debug/gtk4/4.20.3/gtk/print/backends, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/timsort -> /usr/src/debug/gtk4/4.20.3/gtk/timsort, di
 rectory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.20.3/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/inspector -> /usr/src/debug/gtk4/4.20.3/gtk/inspector
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 48648202 to 48660513 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGSIZE changed from 18779030 to 18833598 (+0%)
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.2.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.3.tar.xz;name=archive"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============2987653308469965687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-cfe6f4e6942be946343145d136b089d9ee3f3176"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:cfe6f4e6942be946343145d136b089d9ee3f3176"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 983 Local 893 Mirrors 0 Missed 90 Current 441 (90% match, 93% complete)
done.
Removing 10 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 449 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 473 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 483 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 499 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 525 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 550 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 577 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 613 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 620 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 633 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 675 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 680 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 682 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 683 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.85-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 696 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 702 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 718 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 736 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 737 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 739 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.85-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 741 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 748 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.85-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 751 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 752 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.85-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 757 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 763 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 766 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 777 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 783 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 784 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 791 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 796 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 802 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 813 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 818 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 823 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 846 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 847 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 852 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 853 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 859 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 865 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 868 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 869 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 873 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 896 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 910 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 912 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 915 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 921 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 922 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 928 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 931 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 943 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 951 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 953 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 959 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 964 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 967 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 969 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 971 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 980 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 982 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 984 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 990 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 991 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 997 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 998 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1001 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1002 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1007 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1015 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_recipe_qa_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1019 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1027 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1029 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1030 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1031 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1033 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1034 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1039 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.53-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1042 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1048 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.53-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1055 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1057 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1058 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1059 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1062 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1067 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1075 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1076 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1077 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1079 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1086 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1089 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1090 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1097 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1098 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1102 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1107 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1108 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1110 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1113 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1115 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1116 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1118 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1122 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1130 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1131 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1135 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1136 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1137 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1138 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1141 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1145 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1148 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1150 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1151 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1152 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1156 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1157 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1158 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1160 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1163 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1164 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1165 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1166 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1168 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1170 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1175 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1177 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1179 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1180 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1182 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1190 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1192 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1194 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1196 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1198 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1199 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1201 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1203 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1207 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1213 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1214 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1215 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1216 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1218 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1219 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1220 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1221 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 958 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1126 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1127 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1232 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1236 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1237 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1239 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1241 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1242 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1388 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1247 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 1249 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1557 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_recipe_qa)
NOTE: Running task 1559 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: Running task 1560 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1561 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1599 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1633 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_fetch)
NOTE: Running task 1634 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_fetch)
NOTE: Running task 1635 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1636 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1645 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1666 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1667 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Started
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 1715 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Started
NOTE: Running task 1720 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_recipe_qa)
NOTE: Running task 1721 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_unpack)
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 1722 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_write_config: Started
NOTE: Running task 1723 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_unpack)
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Succeeded
NOTE: Running task 1724 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1725 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Started
NOTE: Running task 1752 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_write_config)
NOTE: Running task 1753 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1754 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1755 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 1763 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 1765 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_unpack)
NOTE: Running task 1766 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Started
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1784 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1789 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_fetch)
NOTE: Running task 1792 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Succeeded
NOTE: Running task 1813 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_patch)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 1834 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_write_config)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1835 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1838 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_unpack: Succeeded
NOTE: Running task 1839 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_patch)
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Started
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1844 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1853 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1854 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1855 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1856 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1857 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Succeeded
NOTE: Running task 1869 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1870 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: Running task 1871 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_fetch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1872 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Succeeded
NOTE: Running task 1873 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1250 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1251 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1252 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 1253 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Started
NOTE: recipe libpng-1.6.53-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to df565cc150da9ad44a6e90d5f273c5ff654a5f8dcfcd3c8c3451a6e9b1adb457
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch unihash changed to 187b589db7dbee2bf45409cbd9f9aa8a1a11489566baba5f929f1ae5237fd86d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch unihash changed to 3f14bbc7987249eee3d9ad5e087dcc777f9b63ed091dbcbbdd33baa3c72c3a02
NOTE: Running setscene task 1229 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch unihash changed to 28bfd3348bccd791291e882f72f38b3a1f856323f3711b7825f5f6688cd82994
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'dbd39c7cc9c4a643c5e065179c22eeabcbe5515e403d1d860b3d8715986efbb6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed dbd39c7cc9c4a643c5e065179c22eeabcbe5515e403d1d860b3d8715986efbb6 -> 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9f0a89387b72f11f4aa462e222ea42986a783d8901c9c180a310ccb268872ddc', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 9f0a89387b72f11f4aa462e222ea42986a783d8901c9c180a310ccb268872ddc -> 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1224 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1875 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1876 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch)
NOTE: Running task 1877 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 1878 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_patch)
NOTE: Running task 1879 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_unpack)
NOTE: Running task 1881 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: Running task 1903 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe libpng-1.6.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1259 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 1904 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_patch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1905 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: Running task 1911 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1922 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_populate_lic)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 1262 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1264 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1923 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.53-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch unihash changed to 9f281ae700dd469b716e59a81d556f783b322f5e26b0182948194491eff91d5f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7719dec6a0645123ff8b3949a9f0961184a9ab0d87dd4e8215c2446122b780df', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 7719dec6a0645123ff8b3949a9f0961184a9ab0d87dd4e8215c2446122b780df -> 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '959bb0efe7f12a3301fd17e42e33e2db6e64621384155b9628c711c60b90151f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 959bb0efe7f12a3301fd17e42e33e2db6e64621384155b9628c711c60b90151f -> 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch unihash changed to ae8f9c1d698c02d14600200efe944d143ed62bf5c6201151f57426fe04ed2278
NOTE: recipe libpng-1.6.53-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch unihash changed to 73e76bf06240a91e0b6c22691db78d3dde06dfba8b7b2bd2dc4d89c99b409f41
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic: Succeeded
NOTE: Running task 1935 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1936 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch unihash changed to 266664f31e63b63b46728403871a5ad81bb9406412961076fbf36a674a24059c
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1937 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_deploy_source_date_epoch unihash changed to 657d99be0232d0ef046be7a087a4317b49245a5a401378245cb94c6647bde0b1
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1938 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1939 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_unpack)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch unihash changed to 5894fcc7f99aa1605981d274a1e93f300d967b0be6254d64823a7388159b1a89
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '3a6675c0d48aec5df30a50c5cb5d8e70a16fa476192ba7873546790004791859', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 3a6675c0d48aec5df30a50c5cb5d8e70a16fa476192ba7873546790004791859 -> 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '03314892f554d0370ace44ad791cb32a240721321f04d54434ef11366fc083d6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 03314892f554d0370ace44ad791cb32a240721321f04d54434ef11366fc083d6 -> 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1940 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1941 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe tiff-4.7.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe tiff-4.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1942 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1943 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1944 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch unihash changed to 542dc977ec38616f99b5b91e99709c7cfc53138c4f578c116b0c0b5c56769977
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch unihash changed to d44c47012b255c3b02087677681a46dfbf096ee93097a58ca8622d4e063820ec
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1945 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1265 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1266 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1267 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1268 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1956 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Running setscene task 1271 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1274 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1957 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 60208da05b72ebc099a80a4ac6494b2c5172c8edb2de9a53e77089b607eb28b7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9a16af720c6949ca23ccdaaf0f1721ead3e042e0a1d0fc7440a243027901ed11', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 9a16af720c6949ca23ccdaaf0f1721ead3e042e0a1d0fc7440a243027901ed11 -> 0f47dccd2b053ad2bc1708bcd66f3ab2b85bb054ebd5b67d88a735354e594ad2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '62c33bedeb92acdbe2a3c92106b5a3f8b9cb81a3962388ecb0773d7cabb4b070', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 62c33bedeb92acdbe2a3c92106b5a3f8b9cb81a3962388ecb0773d7cabb4b070 -> 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1265 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1276 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1277 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1278 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1279 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1280 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1281 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1282 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1284 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1287 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1288 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1291 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1294 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1296 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1298 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1299 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1301 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1303 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1304 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1305 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1307 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1308 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1310 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1311 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1312 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1313 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1314 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1316 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1317 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1318 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1319 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1323 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1324 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1325 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1328 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1329 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1331 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1333 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1336 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1338 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1342 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1344 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1346 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xz/5.8.1/temp/log.do_packagedata_setscene.1312477
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1349 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_package_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1351 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1353 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1355 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1357 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1359 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1361 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1363 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1365 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1367 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_package_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1369 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1373 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1375 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1376 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1377 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1379 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1380 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1382 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1386 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1387 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1389 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1390 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1391 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1394 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1396 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1397 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1398 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1400 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1401 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1405 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1406 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1410 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1414 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1415 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1417 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1419 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1421 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1422 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2969 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata)
NOTE: Running task 3017 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xz-5.8.1-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3374 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3395 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3396 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3397 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3426 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3463 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3464 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3465 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3573 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3582 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3610 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3612 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3632 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_collect_spdx_deps)
NOTE: Running task 3633 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 670d72af7a653b140152419f574bc9b10b2bac0f90a7433dfd069fde36d299e4 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5763b2dde5046c555ee85cb186015e28ff419e427f67e951b00556641cea0d25', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '670d72af7a653b140152419f574bc9b10b2bac0f90a7433dfd069fde36d299e4'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5763b2dde5046c555ee85cb186015e28ff419e427f67e951b00556641cea0d25 -> 670d72af7a653b140152419f574bc9b10b2bac0f90a7433dfd069fde36d299e4 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3648 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3649 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3650 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: Running task 3653 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_configure)
NOTE: Running task 3658 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3659 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3751 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe tiff-4.7.1-r0: task do_configure: Started
NOTE: Running task 3752 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3758 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_collect_spdx_deps)
NOTE: Running task 3759 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3760 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: Running task 3761 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 3762 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: Running task 3763 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_compile)
NOTE: Running task 3764 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3765 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3766 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_configure: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 3767 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_configure)
NOTE: Running task 3768 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3778 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_configure: Succeeded
NOTE: Running task 3779 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb)
NOTE: Running task 3780 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Started
NOTE: Running task 3781 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3782 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_configure)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 3783 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_configure: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to 51778725f194616169f7bd986fe6a210102aab443a45fbba5c1fe4f7017cc1bc
NOTE: Setscene tasks completed
NOTE: Running task 3784 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3785 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 670d72af7a653b140152419f574bc9b10b2bac0f90a7433dfd069fde36d299e4 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '211734e0d8363e3d14b195abba33cf0331839178166c2da3708a9891d6f37215', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '670d72af7a653b140152419f574bc9b10b2bac0f90a7433dfd069fde36d299e4'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 211734e0d8363e3d14b195abba33cf0331839178166c2da3708a9891d6f37215 -> 670d72af7a653b140152419f574bc9b10b2bac0f90a7433dfd069fde36d299e4 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3795 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 3796 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_compile: Succeeded
NOTE: Running task 3797 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3808 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_install: Succeeded
NOTE: Running task 3809 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_package)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 3810 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb unihash changed to 17b290acaac0b59eb0001bda1cf3182ef7985470be2375742020f7e0ea8f0d02
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk unihash changed to 197ae3d0942d7f23cb0c4cebf56614f9bf5acc01744543f5b6917b713074b5b6
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa unihash changed to 996db5236af6f9180ac3652894ae73822b5ce9842266e4e61529b0b5bfa4deba
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3811 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3812 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm unihash changed to cbdfd793856b25035591e37cd1f6572fc57569f56cfab9a9d55f22849ca45229
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_package: Succeeded
NOTE: Running task 3813 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_packagedata)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_packagedata: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_packagedata unihash changed to 1a032296f7ea2082f5515517961c274bb6df3aac8c56c3af979b69656f5ea657
NOTE: Setscene tasks completed
NOTE: recipe at-spi2-core-2.58.2-r0: task do_configure: Succeeded
NOTE: Running task 3814 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 3815 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3816 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to f78ca19c3022f4dc00de613783b271d5617180c6b44d92d4be125330c8f861f9
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3817 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: Running task 3818 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: Running task 3819 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3820 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: Running task 3821 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3822 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3823 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3824 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3825 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 3826 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: Running task 3827 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3828 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 3829 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3830 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3831 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: Running task 3832 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe tiff-4.7.1-r0: task do_configure: Succeeded
NOTE: Running task 3833 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_compile)
NOTE: recipe tiff-4.7.1-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3834 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3835 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_compile: Succeeded
NOTE: Running task 3836 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_install)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3837 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3838 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: Running task 3839 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to 9412219b4603b3e7ec4dc2e49db1352219567bb1e39dcd91667453ccfcf923e2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata unihash changed to b493605be1f4dd8f4a1cebe70c6276f361b9edb843252a55575d43d914e848ec
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata unihash changed to 0f15a52a0a6cef139aea0c9aa0d517d673c4cf7b4b204f917f2cff6a3f2c0eed
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '21e3335c1ceab6e51f180714b2ff451d354d127d8ad1f4016fcdf522d6b3e08d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 21e3335c1ceab6e51f180714b2ff451d354d127d8ad1f4016fcdf522d6b3e08d -> 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3840 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_install: Succeeded
NOTE: Running task 3841 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_populate_sysroot)
NOTE: Running task 3842 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_package)
NOTE: Running task 3843 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: Running task 3844 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_ipk)
NOTE: Running task 3845 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_deb)
NOTE: Running task 3846 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: Running task 3847 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_qa)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3848 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_ipk)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3849 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_deb)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_package: Started
NOTE: Running task 3850 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_ipk: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_qa: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Started
NOTE: Running task 3851 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3852 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_qa)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3853 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3854 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata unihash changed to 99513540609c070e298067f3455e71760fe41339881eea4051c389a59313a4e2
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '23225aa12938f6456274dc353ae0a880e71015a7690baf749407f63c1264f960', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 23225aa12938f6456274dc353ae0a880e71015a7690baf749407f63c1264f960 -> 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3855 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3856 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe tiff-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 3857 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3858 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3859 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3860 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3861 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3862 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.51-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to ccbea6d9ee51a96c5090726c76dd1321d27dc8dccd3937556707a4fba223a1ed
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '8c52e4edfbabafcf9fcd9fe36d2c7b80990ce6c798c35306031e0dd05adafff5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 8c52e4edfbabafcf9fcd9fe36d2c7b80990ce6c798c35306031e0dd05adafff5 -> 5ac39066a096ee179101026c0621dfac76c435635c1c8f8379ba29137750c8ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3863 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3864 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3865 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.7.1-r0: task do_install: Succeeded
NOTE: Running task 3866 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_package)
NOTE: Running task 3867 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.7.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_qa unihash changed to c29dd29b06d1d71c4c9671703c0a34e518437eb18fb518aa8d0b62e1ee6433a5
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_package: Succeeded
NOTE: Running task 3869 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3870 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_compile)
NOTE: recipe gtk+3-3.24.51-r0: task do_compile: Started
NOTE: recipe tiff-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3871 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx)
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_compile: Succeeded
NOTE: Running task 3872 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_install: Succeeded
NOTE: Running task 3873 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot)
NOTE: Running task 3874 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3875 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3876 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_package: Succeeded
NOTE: Running task 3877 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 3878 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata: Failed
NOTE: recipe gtk+3-3.24.51-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3878 tasks of which 3684 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101095352.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101095352.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-base/1.26.9/temp/log.do_packagedata.1393370
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ka went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-nl went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.8.2-r0 to 0:5.8.1-r0) [version-going-backwards]
ERROR: xz-5.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-basedebug went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dsd went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-base/1.26.9/temp/log.do_packagedata.1393370
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata) failed with exit code '1'

--===============2987653308469965687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============2987653308469965687==--

