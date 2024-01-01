Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E189C47DD3
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4584.1704114719302880607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VI8DQCLa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GG6iGGDM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018cc5270cff-a6c4cddd-b20f-4d40-a8d0-a65c246c06a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GZT7n/2JfSSEL99vvYPYRhkthZ011avVrpdJf4k6sHs=;
	b=VI8DQCLasKdU4jIaeyLBlS59yCUBH+IoJD+BN1kuZZr3EBd56EUh9la0g6aI4tuu
	9UXwK/ZZvA0vO+0CzbB1vaqvEZLH35ZgVO8vRmT8edQwmMKau/Ux3FAFJ2UymR8E1z5
	8xoD2FP5RIXIgbT61eHYmQRMG2KG5RkqNTPfHSCk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GZT7n/2JfSSEL99vvYPYRhkthZ011avVrpdJf4k6sHs=;
	b=GG6iGGDMaVecS4DQobtXj7cU2ueMxCe8w4KsbQdDaf0H/NlLLaltgZ/cTkrI4jOO
	r/LL1owoCXl3i1IOVnu0i850RM3k3u21v/cktetoniw+OYsYse5Zsiv8ZHz4+nDkWF7
	0//WiG9rosWfLHtAzAL99UIEO9ma1skukSyfbciA=
Content-Type: multipart/mixed; boundary="===============0606017263124150114=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.15p5 SUCCEEDED
Message-ID: <0101018cc5270cff-a6c4cddd-b20f-4d40-a8d0-a65c246c06a1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193161

--===============0606017263124150114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.15p5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.15p2-1.9.15p5.patch
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
From 678fbf893b9b4d65f0b0557a9f16208f45fa216f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 08:47:44 +0000
Subject: [PATCH] sudo: upgrade 1.9.15p2 -> 1.9.15p5

---
 .../files/0001-sudo.conf.in-fix-conflict-with-multilib.patch    | 2 +-
 .../sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 041c717e00..becccc9539 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From f442e569f321618a7720da829f9c932bde1616f1 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.15p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 431dfba3c2..8e542015ad 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
+SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.42.0


--===============0606017263124150114==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.15p2-1.9.15p5.patch"

RnJvbSA2NzhmYmY4OTNiOWI0ZDY1ZjBiMDU1N2E5ZjE2MjA4ZjQ1ZmEyMTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwODo0Nzo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
ZG86IHVwZ3JhZGUgMS45LjE1cDIgLT4gMS45LjE1cDUKCi0tLQogLi4uL2ZpbGVzLzAwMDEtc3Vk
by5jb25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoICAgIHwgMiArLQogLi4u
L3N1ZG8ve3N1ZG9fMS45LjE1cDIuYmIgPT4gc3Vkb18xLjkuMTVwNS5iYn0gICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8ve3N1ZG9fMS45LjE1cDIuYmIg
PT4gc3Vkb18xLjkuMTVwNS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8uY29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0
aWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5j
b25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCmluZGV4IDA0MWM3MTdlMDAu
LmJlY2NjYzk1MzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVz
LzAwMDEtc3Vkby5jb25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5jb25mLmluLWZpeC1j
b25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZTgzNTM1
MGI3NDEzMjEwYzQxMGQzNTc4Y2ZhYjgwNDE4NmI3YTRmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBmNDQyZTU2OWYzMjE2MThhNzcyMGRhODI5ZjljOTMyYmRlMTYxNmYxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUdWUsIDE3IE5vdiAyMDIwIDExOjEzOjQwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHN1ZG8uY29uZi5pbjogZml4IGNvbmZsaWN0IHdpdGggbXVsdGlsaWIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE1cDIuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xNXA1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE1cDIuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE1cDUuYmIKaW5kZXggNDMx
ZGZiYTNjMi4uOGU1NDIwMTVhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1
ZG8vc3Vkb18xLjkuMTVwMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRv
XzEuOS4xNXA1LmJiCkBAIC03LDcgKzcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LnN1ZG8u
d3MvZGlzdC9zdWRvLSR7UFZ9LnRhci5neiBcCiAKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9zdWRv
LnBhbSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE5OWMwY2RiZmE3ZWZjZmZmYTljODg2ODRh
OGUyZmIyMDZhNjJiNzBhMzE2NTA3ZTRhOTFjODljODczYmJjYzgiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNTU4ZDEwYjlhMTk5MWZiM2I5ZmE3ZmE3YjA3ZWM0NDA1YjdhZWZiNWIzY2IwYjA4NzFk
YmM4MWUzYTg4ZTU1OCIKIAogREVQRU5EUyArPSAiIHZpcnR1YWwvY3J5cHQgJHtAYmIudXRpbHMu
Y29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdwYW0nLCAnbGlicGFtJywgJycsIGQpfSIKIFJE
RVBFTkRTOiR7UE59ICs9ICIgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycs
ICdwYW0nLCAncGFtLXBsdWdpbi1saW1pdHMgcGFtLXBsdWdpbi1rZXlpbml0JywgJycsIGQpfSIK
LS0gCjIuNDIuMAoK

--===============0606017263124150114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sudo: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.15p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.15p5.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 5749928 to 5750152 (+0%)
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-dbg: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-dev: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-doc: PKGSIZE changed from 3236514 to 3242721 (+0%)
packages/core2-64-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-doc: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-lib: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-id: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-id: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-src: PKGSIZE changed from 3603650 to 3605431 (+0%)
packages/core2-64-poky-linux/sudo/sudo-src: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-src: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo-sudo: PV changed from "1.9.15p2" to "1.9.15p5"
packages/core2-64-poky-linux/sudo/sudo: PKGV changed from 1.9.15p2 [default] to 1.9.15p5 [default]
packages/core2-64-poky-linux/sudo/sudo: PV changed from "1.9.15p2" to "1.9.15p5"

--===============0606017263124150114==--

