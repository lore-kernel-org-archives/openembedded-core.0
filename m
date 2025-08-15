Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FB4CA0FE9
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11412.1755263222122243765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gOE0/ovh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GZuiBvof;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010198add73e7a-11ee7fe8-d048-4c9e-9bc6-78aa3695d3cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SMhvpBK+cqLJCreeeJSZ9RWuCttZFRFfOQ6Cwn0YaG4=;
	b=gOE0/ovh70PiWyMxmaOEuENEqDqs9vEIGJiZcJUY7GWLt9XiWBmj9d/AS/d9WGUW
	NVM2GAAyE9V95uFlR3Kbt4gcEEK93S/maVAVK/mQew/uZV9KnUdhkzq/U9eNqNX0OH5
	wjJd4/RHB5l3KWbyFK5QP4V7IcL3YkYtFVnciO5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SMhvpBK+cqLJCreeeJSZ9RWuCttZFRFfOQ6Cwn0YaG4=;
	b=GZuiBvofbuccCmA8Wn3lXT6/OctLpXgEB+2S/ypdvE5hSwT0TVj48MQl9P9kLD3u
	zJA18wsd1iRxfuzlq9104erIe3Tn41QQ4aeU361eRzDw1GEcgupjviAFuy2X0wn9RWg
	ftTXOM7lY4nyPbXsk0hfmmuXgz3RQvBHFgIWIjfs=
Content-Type: multipart/mixed; boundary="===============5866388310408158552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.18 SUCCEEDED
Message-ID: <01010198add73e7a-11ee7fe8-d048-4c9e-9bc6-78aa3695d3cf-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221897

--===============5866388310408158552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.17-2.18.patch
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
From 3cd3dc793f52d4fb8729250b5cb99f898025cba9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:14:12 +0000
Subject: [PATCH] ofono: upgrade 2.17 -> 2.18

---
 .../recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.17.bb b/meta/recipes-connectivity/ofono/ofono_2.18.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.17.bb
rename to meta/recipes-connectivity/ofono/ofono_2.18.bb
index 36bbe9439a..e2666b3e7e 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.17.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.18.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "70bb50997d3a7657edf133355677f8e04b2158bcb031118a67b296107f6ea73e"
+SRC_URI[sha256sum] = "f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.47.1


--===============5866388310408158552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.17.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.18.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7316928 to 7326808 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.17" to "2.18"
packages/core2-64-poky-linux/ofono/ofono: PKGSIZE changed from 2280199 to 2284663 (+0%)
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.17 [default] to 2.18 [default]
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.17" to "2.18"

--===============5866388310408158552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.17-2.18.patch"

RnJvbSAzY2QzZGM3OTNmNTJkNGZiODcyOTI1MGI1Y2I5OWY4OTgwMjVjYmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6MTQ6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjE3IC0+IDIuMTgKCi0tLQogLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29mb25vL3tvZm9ub18yLjE3LmJiID0+IG9mb25vXzIuMTguYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi4xNy5iYiA9PiBvZm9ub18yLjE4LmJifSAoOTUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4x
Ny5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xOC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vXzIuMTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xOC5iYgppbmRleCAzNmJiZTk0MzlhLi5lMjY2NmIzZTdlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTcuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE4LmJiCkBAIC0xMCw3ICsxMCw3
IEBAIERFUEVORFMgPSAiZGJ1cyBnbGliLTIuMCB1ZGV2IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlk
ZXItaW5mbyBlbGwiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29y
ay8ke0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL29mb25vIFwKICAgICAg
ICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcwYmI1MDk5N2QzYTc2NTdlZGYxMzMzNTU2
NzdmOGUwNGIyMTU4YmNiMDMxMTE4YTY3YjI5NjEwN2Y2ZWE3M2UiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZjc0YzNiYmE3ZWJhYzQ4OGZlZDdiY2ZhNjExM2IwZTM5ZTcyM2QyZTFhMjRiNTNmNzlj
OWYxOGExYzg1ZGQwMCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1yYy5k
IHN5c3RlbWQgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEKIAotLSAKMi40Ny4xCgo=

--===============5866388310408158552==--

