Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE0CD4A5E6
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:05 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1428.1768526743617480580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UC+qtKNr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SLvR/wpp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019bc468b4e3-f75c8548-0a0b-438c-bb15-b30ece8d0533-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GqtfmlpudwGdf4THQtD2m4RAhh+swDDQGempGF5Wafo=;
	b=UC+qtKNrHFe6n8M8dm81xI2VlBX+BbkNFE6Wa+VnCkziysYuEh8t7j5/Y/ozmw1b
	9wY5Ui7QJbFUC9hIvJmjnk5Sl4u93/QKvc4CCwH3dFcFbQTq1ahSfPM9VcwEejeU6As
	Z16ZsD8nE7XLnP0tSKnl5r97ZzVpLuTLIKjP2pi8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GqtfmlpudwGdf4THQtD2m4RAhh+swDDQGempGF5Wafo=;
	b=SLvR/wpprbXCyLgxOrTTAsUMs2KC/yHzGcEYRzcFKGDHDyq88BekzB7r15WDNRO7
	cAwA36pvDqWwd4jEMM2TAp+AfcEKTLrXQLZeVXx0FMhAqY6+/j1ajls8PJetCyeul5+
	hiCfnvEBSBSL0hhsD2OJC3JTivNCedq7M9VovAXY=
Content-Type: multipart/mixed; boundary="===============7910526079632406990=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-lib: upgrading to 1.2.15.3 SUCCEEDED
Message-ID: <0101019bc468b4e3-f75c8548-0a0b-438c-bb15-b30ece8d0533-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229495

--===============7910526079632406990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-lib* to *1.2.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-lib-upgrade-1.2.15.1-1.2.15.3.patch
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
From c108011cbafb9d63bc0e27e9822f751cfac1bc10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:16:20 +0000
Subject: [PATCH] alsa-lib: upgrade 1.2.15.1 -> 1.2.15.3

---
 .../alsa/{alsa-lib_1.2.15.1.bb => alsa-lib_1.2.15.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.1.bb => alsa-lib_1.2.15.3.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index f3dfd3f35d..fec4b2c1a9 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b91737a08bb03f566c"
+SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============7910526079632406990==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-lib-upgrade-1.2.15.1-1.2.15.3.patch"

RnJvbSBjMTA4MDExY2JhZmI5ZDYzYmMwZTI3ZTk4MjJmNzUxY2ZhYzFiYzEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MTY6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLWxpYjogdXBncmFkZSAxLjIuMTUuMSAtPiAxLjIuMTUuMwoKLS0tCiAuLi4vYWxzYS97YWxz
YS1saWJfMS4yLjE1LjEuYmIgPT4gYWxzYS1saWJfMS4yLjE1LjMuYmJ9ICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNhLWxpYl8xLjIuMTUuMS5iYiA9PiBhbHNh
LWxpYl8xLjIuMTUuMy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4xLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
YWxzYS9hbHNhLWxpYl8xLjIuMTUuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4zLmJiCmlu
ZGV4IGYzZGZkM2YzNWQuLmZlYzRiMmMxYTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4yLjE1LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuMTUuMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hOTE2NDY3YjkxMDc2ZTYzMWRkOGVkYjc0
MjQ3NjljNyBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3
dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi9saWIvJHtCUH0udGFyLmJ6MiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI3Zjk4M2NhODljYTQyMDg3MmNhMTZlOGE5ZjhmOTdmYjYzZGI2YzFjNmUy
NTg1YjkxNzM3YTA4YmIwM2Y1NjZjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdiMDc5ZDYxNGQ1
ODJjYWRlN2FiOGRiMjM2NGU2NTI3MWQwODc3YTM3ZGY4NzU3YWM0YWMwYzg5NzBiZTg2MWUiCiAK
IGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============7910526079632406990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGSIZE changed from 4024288 to 4025512 (+0%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: FILELIST: directory renamed /usr/src/debug/alsa-lib/1.2.15.1/include/sound/uapi -> /usr/src/debug/alsa-lib/1.2.15.3/include/sound/uapi, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src -> /usr/src/debug/alsa-lib/1.2.15.3/src, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/include -> /usr/src/debug/alsa-lib/1.2.15.3/include, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/rawmidi -> /usr/src/debug/alsa-lib/1.2.15.3/src/rawmidi, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/seq -> /usr/src/debug/alsa-lib/1.2.15.3/src/seq, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/hwdep -> /usr/src/debug/alsa-lib/1.2.15.3/src/hwdep, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/mixer -> /usr/src/debug/alsa-lib/1.2.15.3/src/mixer, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/timer -> /usr/src/debug/alsa-lib/1.2.15.3/src/timer, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/ucm -> /usr/sr
 c/debug/alsa-lib/1.2.15.3/src/ucm, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/aserver -> /usr/src/debug/alsa-lib/1.2.15.3/aserver, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/topology -> /usr/src/debug/alsa-lib/1.2.15.3/src/topology, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/pcm -> /usr/src/debug/alsa-lib/1.2.15.3/src/pcm, directory renamed /usr/src/debug/alsa-lib/1.2.15.1/src/control -> /usr/src/debug/alsa-lib/1.2.15.3/src/control
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGSIZE changed from 3600495 to 3601598 (+0%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib: PV changed from "1.2.15.1" to "1.2.15.3"
packages/x86-64-v3-poky-linux/alsa-lib: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.15.1.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.15.3.tar.bz2"
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PV changed from "1.2.15.1" to "1.2.15.3"

--===============7910526079632406990==--

