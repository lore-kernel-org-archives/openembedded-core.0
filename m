Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE4AC54795
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11251.1747312304778815564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wYxqdiz5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jNUVx1eI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010196d3eded05-76dba61c-03d2-4860-83b9-65531fd1a376-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wwBa2ZuVAmcsRzzLBC4FdkYGEAVQgwnN7nUAAhIRx0A=;
	b=wYxqdiz5mBVPv8hFcNh4n3sQGn80ekFCaIDf/Oo/eO8763q1aHP1amXBy6xIZwkl
	QkjLg2pE/jmVJEu2gRVBfW+BlLek0kJ1nZsql7mrubsjxYFumzsFsMRMUErLrpC1U+J
	J3TcTZeo0r3h7lWJ62cWyIwM/BKzMvvEdnv+3WGc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wwBa2ZuVAmcsRzzLBC4FdkYGEAVQgwnN7nUAAhIRx0A=;
	b=jNUVx1eIf4SVj5PQQLju7Kg1z+ueQ0bg6Fd6trdVll7qUZU12P8rxDokq6CExrCA
	3PUeHLnAJfM+hsVwyoDVSoDvKUHpPFWe1vMJx8+wuaipzvYYvdnsYvDJIb+oBREkDuX
	6NQquDxN8hW8zt9erFdzPINvI3CE+VkdG3sLjTbE=
Content-Type: multipart/mixed; boundary="===============0361229854433855191=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.17 SUCCEEDED
Message-ID: <01010196d3eded05-76dba61c-03d2-4860-83b9-65531fd1a376-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216584

--===============0361229854433855191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.16-2.17.patch
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
From 77f3cf2db029f37f487586284d17506aba7694ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 06:54:45 +0000
Subject: [PATCH] ofono: upgrade 2.16 -> 2.17

---
 .../recipes-connectivity/ofono/{ofono_2.16.bb => ofono_2.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.16.bb => ofono_2.17.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.16.bb b/meta/recipes-connectivity/ofono/ofono_2.17.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.16.bb
rename to meta/recipes-connectivity/ofono/ofono_2.17.bb
index ea3120974c..36bbe9439a 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.16.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.17.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "6fa2e168e74e1d1879008806537eff2f0b3c86eb5412fbc093f4236e2a15c9ef"
+SRC_URI[sha256sum] = "70bb50997d3a7657edf133355677f8e04b2158bcb031118a67b296107f6ea73e"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.47.1


--===============0361229854433855191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.16.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.17.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7303160 to 7304152 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.16 [default] to 2.17 [default]

--===============0361229854433855191==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.16-2.17.patch"

RnJvbSA3N2YzY2YyZGIwMjlmMzdmNDg3NTg2Mjg0ZDE3NTA2YWJhNzY5NGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDY6NTQ6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjE2IC0+IDIuMTcKCi0tLQogLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29mb25vL3tvZm9ub18yLjE2LmJiID0+IG9mb25vXzIuMTcuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi4xNi5iYiA9PiBvZm9ub18yLjE3LmJifSAoOTUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4x
Ni5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNy5iYgpzaW1p
bGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vXzIuMTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xNy5iYgppbmRleCBlYTMxMjA5NzRjLi4zNmJiZTk0MzlhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTYuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE3LmJiCkBAIC0xMCw3ICsxMCw3
IEBAIERFUEVORFMgPSAiZGJ1cyBnbGliLTIuMCB1ZGV2IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlk
ZXItaW5mbyBlbGwiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29y
ay8ke0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL29mb25vIFwKICAgICAg
ICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZmYTJlMTY4ZTc0ZTFkMTg3OTAwODgwNjUz
N2VmZjJmMGIzYzg2ZWI1NDEyZmJjMDkzZjQyMzZlMmExNWM5ZWYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNzBiYjUwOTk3ZDNhNzY1N2VkZjEzMzM1NTY3N2Y4ZTA0YjIxNThiY2IwMzExMThhNjdi
Mjk2MTA3ZjZlYTczZSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1yYy5k
IHN5c3RlbWQgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEKIAotLSAKMi40Ny4xCgo=

--===============0361229854433855191==--

