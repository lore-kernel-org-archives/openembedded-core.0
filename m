Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11171D10DDE
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.149806.1733047559256529005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TmN52v+J;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fYF/41mO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019381af31e7-acc5d0f9-e43e-4825-8e68-6629ff0d3951-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NQHO3+uoMn8EUcGLx3MespKZl073Y/WNFpUTCjw3/Lk=;
	b=TmN52v+JXKiO+488v3XU8BUv0D+Oqgu9b05zdvHxVyy0UHqRvT0vvlPQ6n+bAMsE
	ENcqQjIVLLOT340RW7EgDeBcexrVHgFrD9oB2+nmGHdyzk0DvmB+YABNhzCSnuHT/wq
	rsVgavO7cKhI60Cv/k9V50VAmFar/qxqQtBi0MHA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NQHO3+uoMn8EUcGLx3MespKZl073Y/WNFpUTCjw3/Lk=;
	b=fYF/41mOMmapNGiKa+Hf+Pp9Zigxcen9AbF+GxiN3JBTKAm57i7fqOx7hEubfiMk
	2S6JjYu7JHhnU0JPaN/q8Cc7Ml53pTc7YVNCaVE+zSuyxPLW5N/H/af5BE43nqSC0Uv
	z/5sjrdIWMnEsFSZy381Y/jyc9qc1ouqlALun/XQ=
Content-Type: multipart/mixed; boundary="===============0726019296982708043=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.16p2 SUCCEEDED
Message-ID: <0101019381af31e7-acc5d0f9-e43e-4825-8e68-6629ff0d3951-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208085

--===============0726019296982708043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sudo* to *1.9.16p2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.16p1-1.9.16p2.patch
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
From 75e689034d8356c943070f5aa2d83a4338646df4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 07:53:45 +0000
Subject: [PATCH] sudo: upgrade 1.9.16p1 -> 1.9.16p2

---
 .../files/0001-sudo.conf.in-fix-conflict-with-multilib.patch    | 2 +-
 .../sudo/{sudo_1.9.16p1.bb => sudo_1.9.16p2.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.16p1.bb => sudo_1.9.16p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index ec0384e257..3adb808c2f 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 61ae82a2ba502492b6a78f248258abb71daeb227 Mon Sep 17 00:00:00 2001
+From 96e53f30e73b8f17301f97d4cebd98148e74076b Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
diff --git a/meta/recipes-extended/sudo/sudo_1.9.16p1.bb b/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.16p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.16p2.bb
index 5907b0556d..fbe507ad32 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.16p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "404994e23ae8bcf4be59ed6fd3759ad70a8cefa9bcf71640b33f176afec243b0"
+SRC_URI[sha256sum] = "976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.44.1


--===============0726019296982708043==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.16p1-1.9.16p2.patch"

RnJvbSA3NWU2ODkwMzRkODM1NmM5NDMwNzBmNWFhMmQ4M2E0MzM4NjQ2ZGY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNzo1Mzo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
ZG86IHVwZ3JhZGUgMS45LjE2cDEgLT4gMS45LjE2cDIKCi0tLQogLi4uL2ZpbGVzLzAwMDEtc3Vk
by5jb25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoICAgIHwgMiArLQogLi4u
L3N1ZG8ve3N1ZG9fMS45LjE2cDEuYmIgPT4gc3Vkb18xLjkuMTZwMi5iYn0gICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8ve3N1ZG9fMS45LjE2cDEuYmIg
PT4gc3Vkb18xLjkuMTZwMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8uY29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0
aWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5j
b25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCmluZGV4IGVjMDM4NGUyNTcu
LjNhZGI4MDhjMmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVz
LzAwMDEtc3Vkby5jb25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5jb25mLmluLWZpeC1j
b25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MWFlODJh
MmJhNTAyNDkyYjZhNzhmMjQ4MjU4YWJiNzFkYWViMjI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA5NmU1M2YzMGU3M2I4ZjE3MzAxZjk3ZDRjZWJkOTgxNDhlNzQwNzZiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUdWUsIDE3IE5vdiAyMDIwIDExOjEzOjQwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHN1ZG8uY29uZi5pbjogZml4IGNvbmZsaWN0IHdpdGggbXVsdGlsaWIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE2cDEuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xNnAyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE2cDEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE2cDIuYmIKaW5kZXggNTkw
N2IwNTU2ZC4uZmJlNTA3YWQzMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1
ZG8vc3Vkb18xLjkuMTZwMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRv
XzEuOS4xNnAyLmJiCkBAIC03LDcgKzcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LnN1ZG8u
d3MvZGlzdC9zdWRvLSR7UFZ9LnRhci5neiBcCiAKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9zdWRv
LnBhbSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQwNDk5NGUyM2FlOGJjZjRiZTU5ZWQ2ZmQz
NzU5YWQ3MGE4Y2VmYTliY2Y3MTY0MGIzM2YxNzZhZmVjMjQzYjAiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTc2YWE1NmQzZTNiMmE3NTU5MzMwNzg2NDI4OGFkZGI3NDhjOWMxMzZlMjVkOTVhOWNj
Njk5YWFmYTc3MjM5YyIKIAogREVQRU5EUyArPSAiIHZpcnR1YWwvY3J5cHQgJHtAYmIudXRpbHMu
Y29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdwYW0nLCAnbGlicGFtJywgJycsIGQpfSIKIFJE
RVBFTkRTOiR7UE59ICs9ICIgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycs
ICdwYW0nLCAncGFtLXBsdWdpbi1saW1pdHMgcGFtLXBsdWdpbi1rZXlpbml0JywgJycsIGQpfSIK
LS0gCjIuNDQuMQoK

--===============0726019296982708043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.16p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.16p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-64-poky-linux/sudo: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-dbg: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 6061624 to 6062312 (+0%)
packages/core2-64-poky-linux/sudo/sudo-dev: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-dev: PKGSIZE changed from 11980 to 12092 (+1%)
packages/core2-64-poky-linux/sudo/sudo-doc: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-doc: PKGSIZE changed from 3304845 to 3308101 (+0%)
packages/core2-64-poky-linux/sudo/sudo-lib: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-lib: PKGSIZE changed from 987764 to 991860 (+0%)
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-id: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-id: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-src: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-src: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-src: PKGSIZE changed from 3586578 to 3588497 (+0%)
packages/core2-64-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo-sudo: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]
packages/core2-64-poky-linux/sudo/sudo: PV changed from "1.9.16p1" to "1.9.16p2"
packages/core2-64-poky-linux/sudo/sudo: PKGV changed from 1.9.16p1 [default] to 1.9.16p2 [default]

--===============0726019296982708043==--

