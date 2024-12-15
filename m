Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9B1E77198
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.33343.1734254982070621269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VfrrNYQh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gFIpSuZS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010193c9a6f2b3-c60ec6f4-9a6a-431c-9596-4d1ee7f04b17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r6RoVi3Ce24U+5Uska2RP5ocoSviY2J3zED1lf+b9qk=;
	b=VfrrNYQhbyND2szQDlwr8ZJKxtxGF3jH22s6l6RdV5f/vPamYBZEEUGeNo90Cdcf
	lFfXMbATzHqw2fivdqLZvaBdlwMBr3WkH4hZpqUt/dxljFuQBIiBhpvCQ3pXqkQmVU0
	Sxy8UnOKVYaNgfgPK2xnUGgOBVKYmz1Uf9hsX7QQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r6RoVi3Ce24U+5Uska2RP5ocoSviY2J3zED1lf+b9qk=;
	b=gFIpSuZSVK0T+z5gOd2U6kJAtrNpQGN/aRXtyUCI46/qdguwwvLME8FPtcrY2sUp
	wnxINywtbQ0obRnFdlP1Fdyy+7QnNR9jTSk00AqH+kz9yB6ncfcMBSLs7trOW3WFUQn
	7m6UMiM42YWz5qakAvHogr1HxCUO1HhKhR2oFJyw=
Content-Type: multipart/mixed; boundary="===============8436958734385289463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.14 SUCCEEDED
Message-ID: <01010193c9a6f2b3-c60ec6f4-9a6a-431c-9596-4d1ee7f04b17-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208714

--===============8436958734385289463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.13-2.14.patch
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
From b62a3611e746303d8dc6d1ecb0de63024460e35e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 07:04:08 +0000
Subject: [PATCH] ofono: upgrade 2.13 -> 2.14

---
 .../recipes-connectivity/ofono/{ofono_2.13.bb => ofono_2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.13.bb => ofono_2.14.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.13.bb b/meta/recipes-connectivity/ofono/ofono_2.14.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.13.bb
rename to meta/recipes-connectivity/ofono/ofono_2.14.bb
index 2cc59b5c5a..0a695c978c 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.13.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.14.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "fa813ed74a4658e5702f707033497bf891504ffdc0f1b45d85bc3f092010744f"
+SRC_URI[sha256sum] = "983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40cdc73f941da7ba95f"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.44.1


--===============8436958734385289463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.13.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.14.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 6768640 to 6781944 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PKGSIZE changed from 4705420 to 4714541 (+0%)
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.13 [default] to 2.14 [default]
packages/core2-64-poky-linux/ofono/ofono: PKGSIZE changed from 2275238 to 2279718 (+0%)
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.13" to "2.14"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.13 [default] to 2.14 [default]

--===============8436958734385289463==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.13-2.14.patch"

RnJvbSBiNjJhMzYxMWU3NDYzMDNkOGRjNmQxZWNiMGRlNjMwMjQ0NjBlMzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDc6MDQ6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjEzIC0+IDIuMTQKCi0tLQogLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29mb25vL3tvZm9ub18yLjEzLmJiID0+IG9mb25vXzIuMTQuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi4xMy5iYiA9PiBvZm9ub18yLjE0LmJifSAoOTUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4x
My5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vXzIuMTMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xNC5iYgppbmRleCAyY2M1OWI1YzVhLi4wYTY5NWM5NzhjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE0LmJiCkBAIC0xMSw3ICsxMSw3
IEBAIFNSQ19VUkkgPSAiXAogICAgICR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29yay8k
e0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICBmaWxlOi8vb2Zvbm8gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImZhODEzZWQ3NGE0NjU4ZTU3MDJmNzA3MDMzNDk3YmY4OTE1MDRmZmRjMGYxYjQ1
ZDg1YmMzZjA5MjAxMDc0NGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTgzY2JmZDVlMWUxYTQx
MGJhN2FkMmRiN2Y1MGZhZGM5MWU1MGIyOWYxZWRlNDBjZGM3M2Y5NDFkYTdiYTk1ZiIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1yYy5kIHN5c3RlbWQgZ29iamVjdC1pbnRy
b3NwZWN0aW9uLWRhdGEKIAotLSAKMi40NC4xCgo=

--===============8436958734385289463==--

