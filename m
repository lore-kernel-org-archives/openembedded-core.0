Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384ADC87FC9
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1438.1751386811244308341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hIBD2M67;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hG+j4DUx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6ca3d69-58fd88e0-0760-4cc2-b1be-8662efd1b64e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6wgMzE6pWSct0Vh93A3aS+bA0ntdFGJIu47q7LLjohE=;
	b=hIBD2M67lMR8+OjLlq7/AhFyk8KRWE4g96jt6q6bwpg+ho8y8elsSMhboep8iGV6
	YP3Vl5BZcWpMJIkB0JVc869x0QHGQmLZUPIak1AcHoOG+8gUTanbenjX/YRjoCmaoCu
	pFXTsVCy5MJWTxwiDK6QL8YNs0ZVV94MDum/Bw8Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6wgMzE6pWSct0Vh93A3aS+bA0ntdFGJIu47q7LLjohE=;
	b=hG+j4DUxoXvQThuo3oGTAsc0TSP4YMimJtUV2Ik8uCptJwx9oHIr5ns+COBfnZgb
	yoVtuelSskp4Py3xl/sTXXO53QroGAnInw+1qeOI0Vfernt5mxnaVD4yQRCtr56vY/g
	WdoKLZs8X02li4nGcGmwpFewsBExn7UzMQMsUBd4=
Content-Type: multipart/mixed; boundary="===============8908526629610804042=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.56.3 SUCCEEDED
Message-ID: <01010197c6ca3d69-58fd88e0-0760-4cc2-b1be-8662efd1b64e-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219702

--===============8908526629610804042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.56.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.56.2-2.56.3.patch
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
From 4acf21de899bb009f274616677d601253ad382cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 15:39:11 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.56.2 -> 2.56.3

---
 .../atk/{at-spi2-core_2.56.2.bb => at-spi2-core_2.56.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.2.bb => at-spi2-core_2.56.3.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.2.bb b/meta/recipes-support/atk/at-spi2-core_2.56.3.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.2.bb
rename to meta/recipes-support/atk/at-spi2-core_2.56.3.bb
index 59eed4b5ab..dd4929c349 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.2.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.56.3.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e1b1c9836a8947852f7440c32e23179234c76bd98cd9cc4001f376405f8b783b"
+SRC_URI[sha256sum] = "0e41e1fc6a1961b38b4f9c0bea64bad30efff75949b7cdb988d2f2fdab72267a"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============8908526629610804042==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.56.2-2.56.3.patch"

RnJvbSA0YWNmMjFkZTg5OWJiMDA5ZjI3NDYxNjY3N2Q2MDEyNTNhZDM4MmNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNTozOToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF0
LXNwaTItY29yZTogdXBncmFkZSAyLjU2LjIgLT4gMi41Ni4zCgotLS0KIC4uLi9hdGsve2F0LXNw
aTItY29yZV8yLjU2LjIuYmIgPT4gYXQtc3BpMi1jb3JlXzIuNTYuMy5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay97YXQtc3BpMi1jb3JlXzIuNTYuMi5iYiA9PiBhdC1zcGky
LWNvcmVfMi41Ni4zLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2F0ay9hdC1zcGkyLWNvcmVfMi41Ni4yLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0
LXNwaTItY29yZV8yLjU2LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjU2LjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi41Ni4zLmJiCmluZGV4IDU5ZWVk
NGI1YWIuLmRkNDkyOWMzNDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi41Ni4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1z
cGkyLWNvcmVfMi41Ni4zLmJiCkBAIC0xMyw3ICsxMyw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRp
bHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfSIKIAogU1JDX1VSSSA9ICIke0dOT01FX01JUlJP
Un0vJHtCUE59LyR7TUFKX1ZFUn0vJHtCUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImUxYjFjOTgzNmE4OTQ3ODUyZjc0NDBjMzJlMjMxNzkyMzRjNzZiZDk4Y2Q5Y2M0
MDAxZjM3NjQwNWY4Yjc4M2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGU0MWUxZmM2YTE5NjFi
MzhiNGY5YzBiZWE2NGJhZDMwZWZmZjc1OTQ5YjdjZGI5ODhkMmYyZmRhYjcyMjY3YSIKIAogREVQ
RU5EUyA9ICIgXAogCWRidXMgXAotLSAKMi40Ny4xCgo=

--===============8908526629610804042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.25611.1", added "/usr/lib/libatk-1.0.so.0.25612.1"
Changes to packages/core2-64-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.25611.1 to libatk-1.0.so.0.25612.1
  /usr/lib/libatk-1.0.so.0.25611.1 moved to /usr/lib/libatk-1.0.so.0.25612.1

--===============8908526629610804042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-dbg: FILELIST: removed "/usr/lib/.debug/libatk-1.0.so.0.25611.1", added "/usr/lib/.debug/libatk-1.0.so.0.25612.1"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-dbg: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGSIZE changed from 2138768 to 2139216 (+0%)
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-dev: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-dev: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-doc: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-doc: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-af: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-af: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-am: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-am: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-an: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-an: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-as: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-as: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-az: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-az: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-be: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-be: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-da: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-da: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-de: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-de: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-el: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-el: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-es: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-es: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-et: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-et: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-he: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-he: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-id: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-id: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-is: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-is: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-it: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-it: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-km: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-km: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-li: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-li: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-or: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-or: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-si: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-si: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-te: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-te: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-th: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-th: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-src: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-src: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-staticdev: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core-staticdev: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.25611.1", added "/usr/lib/libatk-1.0.so.0.25612.1"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core: PV changed from "2.56.2" to "2.56.3"
packages/core2-64-poky-linux/at-spi2-core/at-spi2-core: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core: SRC_URI changed from "https://download.gnome.org/sources//at-spi2-core/2.56/at-spi2-core-2.56.2.tar.xz" to "https://download.gnome.org/sources//at-spi2-core/2.56/at-spi2-core-2.56.3.tar.xz"
packages/core2-64-poky-linux/at-spi2-core: PKGV changed from 2.56.2 [default] to 2.56.3 [default]
packages/core2-64-poky-linux/at-spi2-core: PV changed from "2.56.2" to "2.56.3"
Changes to packages/core2-64-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.25611.1 to libatk-1.0.so.0.25612.1
  /usr/lib/libatk-1.0.so.0.25611.1 moved to /usr/lib/libatk-1.0.so.0.25612.1

--===============8908526629610804042==--

