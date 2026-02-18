Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B11E9A058
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1421.1771440099547804679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kI5zgK5Z;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=P7kqJm8C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720f057e-b288e732-e0b1-4740-8a59-bb2c4721cc3a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iDJjiI1vrof5lizaG9arer3a6Qvmv7yIogSL0tu0p74=;
	b=kI5zgK5ZwU1zZrnaMOadRboq49g/lcx2DczQekwPwUYYcrnzwLR+lqsaEF+6qmQP
	2zO4swE1ZMeWsp0oYdKCmGb1LTnoE+XIPu7AhpC59RU5CoS6o65K2CVIuF/jVtsaMoh
	As85QsgZovSvQDJKO2zwnejXaxkaFoTZ+7j2DECM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iDJjiI1vrof5lizaG9arer3a6Qvmv7yIogSL0tu0p74=;
	b=P7kqJm8C3tVYxnSIcTX9PcM3EvLNK0WlMHZo8WS5CqdGqfmpINo1jVYawUmbrKiC
	eAoM+qlE8hqfqAgoewts1mpvNaQS4x8S6TX6inLNYl9oAVW3wdCNKQ6xTINFPxKMo4q
	Pbgi8j/oSiFaT8Zi9I9fbzsK59cdsHnd1UXiCkv8=
Content-Type: multipart/mixed; boundary="===============3370063548466674923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sbc: upgrading to 2.2 SUCCEEDED
Message-ID: <0101019c720f057e-b288e732-e0b1-4740-8a59-bb2c4721cc3a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231397

--===============3370063548466674923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sbc* to *2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sbc-upgrade-2.1-2.2.patch
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
From df14b45f11344f22af3ed2cb900e9985fac53af1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 16:18:03 +0000
Subject: [PATCH] sbc: upgrade 2.1 -> 2.2

---
 meta/recipes-multimedia/sbc/{sbc_2.1.bb => sbc_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/sbc/{sbc_2.1.bb => sbc_2.2.bb} (90%)

diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-multimedia/sbc/sbc_2.2.bb
similarity index 90%
rename from meta/recipes-multimedia/sbc/sbc_2.1.bb
rename to meta/recipes-multimedia/sbc/sbc_2.2.bb
index 8b91e7e65b..ace764d5d3 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2"
+SRC_URI[sha256sum] = "a1ada76ef35e5af9c2fbd063754dc9e37a8d989417c6eb1ecebb089b1383ae9e"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============3370063548466674923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sbc/sbc: FILELIST: removed "/usr/lib/libsbc.so.1.3.1", added "/usr/lib/libsbc.so.1.3.2"
Changes to packages/x86-64-v3-poky-linux/sbc (sysroot):
  /usr/lib/libsbc.so.1 changed symlink target from libsbc.so.1.3.1 to libsbc.so.1.3.2
  /usr/lib/libsbc.so changed symlink target from libsbc.so.1.3.1 to libsbc.so.1.3.2
  /usr/lib/libsbc.so.1.3.1 moved to /usr/lib/libsbc.so.1.3.2

--===============3370063548466674923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-sbc-upgrade-2.1-2.2.patch"

RnJvbSBkZjE0YjQ1ZjExMzQ0ZjIyYWYzZWQyY2I5MDBlOTk4NWZhYzUzYWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTY6MTg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
YmM6IHVwZ3JhZGUgMi4xIC0+IDIuMgoKLS0tCiBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9zYmMv
e3NiY18yLjEuYmIgPT4gc2JjXzIuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9z
YmMve3NiY18yLjEuYmIgPT4gc2JjXzIuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9zYmMvc2JjXzIuMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L3NiYy9zYmNfMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL3NiYy9zYmNfMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9zYmMvc2JjXzIuMi5iYgppbmRleCA4YjkxZTdlNjViLi5hY2U3NjRkNWQzIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9zYmMvc2JjXzIuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9zYmMvc2JjXzIuMi5iYgpAQCAtMTUsNyArMTUsNyBAQCBERVBF
TkRTID0gImxpYnNuZGZpbGUxIgogCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGlu
dXgvYmx1ZXRvb3RoLyR7QlB9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQyNjYz
M2NhYmQ3Yzc5ODIzNjQ0MzUxNmRmYTgzMzViNDdlMDA0YjBlZjM3ZmYxMDdlMGM3ZWFkMzI5OWZj
YzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTFhZGE3NmVmMzVlNWFmOWMyZmJkMDYzNzU0ZGM5
ZTM3YThkOTg5NDE3YzZlYjFlY2ViYjA4OWIxMzgzYWU5ZSIKIAogaW5oZXJpdCBhdXRvdG9vbHMg
cGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============3370063548466674923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sbc: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/sbc-2.1.tar.xz" to "https://cdn.kernel.org/pub/linux/bluetooth/sbc-2.2.tar.xz"
packages/x86-64-v3-poky-linux/sbc/sbc-dbg: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc-dbg: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc-dbg: FILELIST: removed "/usr/lib/.debug/libsbc.so.1.3.1", added "/usr/lib/.debug/libsbc.so.1.3.2"
packages/x86-64-v3-poky-linux/sbc/sbc-dev: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc-dev: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc-doc: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc-doc: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc-examples: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc-examples: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc-locale: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc-locale: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc-src: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc-src: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc-src: FILELIST: directory renamed /usr/src/debug/sbc/2.1/sbc -> /usr/src/debug/sbc/2.2/sbc, directory renamed /usr/src/debug/sbc/2.1/src -> /usr/src/debug/sbc/2.2/src
packages/x86-64-v3-poky-linux/sbc/sbc-staticdev: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc-staticdev: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc: PKGV changed from 2.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/sbc/sbc: PV changed from "2.1" to "2.2"
packages/x86-64-v3-poky-linux/sbc/sbc: FILELIST: removed "/usr/lib/libsbc.so.1.3.1", added "/usr/lib/libsbc.so.1.3.2"
Changes to packages/x86-64-v3-poky-linux/sbc (sysroot):
  /usr/lib/libsbc.so.1 changed symlink target from libsbc.so.1.3.1 to libsbc.so.1.3.2
  /usr/lib/libsbc.so changed symlink target from libsbc.so.1.3.1 to libsbc.so.1.3.2
  /usr/lib/libsbc.so.1.3.1 moved to /usr/lib/libsbc.so.1.3.2

--===============3370063548466674923==--

