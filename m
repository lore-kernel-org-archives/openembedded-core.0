Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA618C52D1F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.18603.1718475798752928871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BI1ngnSf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=naiTs2TK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101901d23b5cc-c19bc076-b3a5-40f1-9db1-38ebbae6a44b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rhIinXJer1ZiU3zRbv3ThwK0em88RaG6xMr2/X1Lj/c=;
	b=BI1ngnSfE7gf5d69Pi7zjzjlLMSe26uu4OnrQF2M/LVjmoisMr0DGiAA4o6SR029
	X+qqJy02iTEhwS63k3c8mqmAmVcRBtKPRwuswQDturByVGpT6uD8cR/yCJY3WdpD9RH
	ZVSxvEB6omML9s/2YIbKhbgH0HqOexpOUd19LQiE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rhIinXJer1ZiU3zRbv3ThwK0em88RaG6xMr2/X1Lj/c=;
	b=naiTs2TKrdYz93gJe0QXBcZ/7PcyYInKqDCXlmab4mABr3z+z/fLywPbrPVaFyQF
	HfrP3sROBtmesvyqXxh+odw6EemJ0dIqv1Fd0Jf55zxVkniwtw7U1JsGUe0rHYDo6i5
	MoA9wVaGam2UqPxOgkQYkZnEhEnXw9xobR0MXLjA=
Content-Type: multipart/mixed; boundary="===============2549277629637412743=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.8 SUCCEEDED
Message-ID: <010101901d23b5cc-c19bc076-b3a5-40f1-9db1-38ebbae6a44b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200674

--===============2549277629637412743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.7-2.8.patch
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
From 1e21fa06db70c42d1b7f35a2b348f6f4c2595174 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 05:57:34 +0000
Subject: [PATCH] ofono: upgrade 2.7 -> 2.8

---
 .../ofono/{ofono_2.7.bb => ofono_2.8.bb}      | 56 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.7.bb => ofono_2.8.bb} (47%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.7.bb b/meta/recipes-connectivity/ofono/ofono_2.8.bb
similarity index 47%
rename from meta/recipes-connectivity/ofono/ofono_2.7.bb
rename to meta/recipes-connectivity/ofono/ofono_2.8.bb
index bc1f3efd04..6f831190c2 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.7.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
@@ -1,17 +1,69 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/ofono.h
+# +++ src/ofono.h
+# @@ -1,20 +1,20 @@
+#  /*
+# + * oFono - Open Source Telephony
+# + * Copyright (C) 2008-2011  Intel Corporation
+#   *
+# - *  oFono - Open Source Telephony
+# - *
+# - *  Copyright (C) 2008-2011  Intel Corporation. All rights reserved.
+# - *
+# - *  This program is free software; you can redistribute it and/or modify
+# - *  it under the terms of the GNU General Public License version 2 as
+# - *  published by the Free Software Foundation.
+# - *
+# - *  This program is distributed in the hope that it will be useful,
+# - *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+# - *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# - *  GNU General Public License for more details.
+# - *
+# - *  You should have received a copy of the GNU General Public License
+# - *  along with this program; if not, write to the Free Software
+# - *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+# - *
+# + * SPDX-License-Identifier: GPL-2.0-only
+#   */
+# +
+# +#include <glib.h>
+# +#include <ell/ell.h>
+# +
+# +#define OFONO_API_SUBJECT_TO_CHANGE
+# +
+# +#include <ofono/types.h>
+# +
+# +const struct l_settings *__ofono_get_config(void);
+# +void __ofono_exit(void);
+# +
+# +int __ofono_handsfree_audio_manager_init(void);
+# +void __ofono_handsfree_audio_manager_cleanup(void);
+# +
+# 
+#
+
 SUMMARY = "open source telephony"
 DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
 HOMEPAGE = "http://www.ofono.org"
 BUGTRACKER = "https://01.org/jira/browse/OF"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
+                    file://src/ofono.h;beginline=1;endline=20;md5=5edd2126537851842453c61fbf551851 \
+                    "
 DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
+SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.44.0


--===============2549277629637412743==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.7-2.8.patch"

RnJvbSAxZTIxZmEwNmRiNzBjNDJkMWI3ZjM1YTJiMzQ4ZjZmNGMyNTk1MTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDU6NTc6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjcgLT4gMi44CgotLS0KIC4uLi9vZm9uby97b2Zvbm9fMi43LmJiID0+
IG9mb25vXzIuOC5iYn0gICAgICB8IDU2ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCA1NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb2Zvbm8ve29mb25vXzIuNy5iYiA9PiBvZm9ub18yLjguYmJ9ICg0NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjcu
YmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuOC5iYgpzaW1pbGFy
aXR5IGluZGV4IDQ3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25v
L29mb25vXzIuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9v
Zm9ub18yLjguYmIKaW5kZXggYmMxZjNlZmQwNC4uNmY4MzExOTBjMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjcuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjguYmIKQEAgLTEsMTcgKzEsNjkgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBzcmMvb2Zvbm8uaAorIyArKysgc3JjL29mb25vLmgKKyMgQEAg
LTEsMjAgKzEsMjAgQEAKKyMgIC8qCisjICsgKiBvRm9ubyAtIE9wZW4gU291cmNlIFRlbGVwaG9u
eQorIyArICogQ29weXJpZ2h0IChDKSAyMDA4LTIwMTEgIEludGVsIENvcnBvcmF0aW9uCisjICAg
KgorIyAtICogIG9Gb25vIC0gT3BlbiBTb3VyY2UgVGVsZXBob255CisjIC0gKgorIyAtICogIENv
cHlyaWdodCAoQykgMjAwOC0yMDExICBJbnRlbCBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyMgLSAqCisjIC0gKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgLSAqICBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcworIyAtICog
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorIyAtICoKKyMgLSAq
ICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwKKyMgLSAqICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0
aGUgaW1wbGllZCB3YXJyYW50eSBvZgorIyAtICogIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyMgLSAqICBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAtICoKKyMgLSAqICBZb3Ugc2hvdWxk
IGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQor
IyAtICogIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVl
IFNvZnR3YXJlCisjIC0gKiAgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3QsIEZpZnRo
IEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgLSAqCisjICsgKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisjICAgKi8KKyMgKworIyArI2luY2x1ZGUg
PGdsaWIuaD4KKyMgKyNpbmNsdWRlIDxlbGwvZWxsLmg+CisjICsKKyMgKyNkZWZpbmUgT0ZPTk9f
QVBJX1NVQkpFQ1RfVE9fQ0hBTkdFCisjICsKKyMgKyNpbmNsdWRlIDxvZm9uby90eXBlcy5oPgor
IyArCisjICtjb25zdCBzdHJ1Y3QgbF9zZXR0aW5ncyAqX19vZm9ub19nZXRfY29uZmlnKHZvaWQp
OworIyArdm9pZCBfX29mb25vX2V4aXQodm9pZCk7CisjICsKKyMgK2ludCBfX29mb25vX2hhbmRz
ZnJlZV9hdWRpb19tYW5hZ2VyX2luaXQodm9pZCk7CisjICt2b2lkIF9fb2Zvbm9faGFuZHNmcmVl
X2F1ZGlvX21hbmFnZXJfY2xlYW51cCh2b2lkKTsKKyMgKworIyAKKyMKKwogU1VNTUFSWSA9ICJv
cGVuIHNvdXJjZSB0ZWxlcGhvbnkiCiBERVNDUklQVElPTiA9ICJvRm9ubyBpcyBhIHN0YWNrIGZv
ciBtb2JpbGUgdGVsZXBob255IGRldmljZXMgb24gTGludXguIG9Gb25vIHN1cHBvcnRzIHNwZWFr
aW5nIHRvIHRlbGVwaG9ueSBkZXZpY2VzIHRocm91Z2ggc3BlY2lmaWMgZHJpdmVycywgb3Igd2l0
aCBnZW5lcmljIEFUIGNvbW1hbmRzLiIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cub2Zvbm8ub3Jn
IgogQlVHVFJBQ0tFUiA9ICJodHRwczovLzAxLm9yZy9qaXJhL2Jyb3dzZS9PRiIKIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
ZWI3MjNiNjE1MzlmZWVmMDEzZGU0NzZlNjhiNWM1MGEgXAotICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vc3JjL29mb25vLmg7YmVnaW5saW5lPTE7ZW5kbGluZT0yMDttZDU9M2NlMTdkNTk3OGVm
MzQ0NWRlZjI2NWI5ODg5OWMyZWUiCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvb2Zv
bm8uaDtiZWdpbmxpbmU9MTtlbmRsaW5lPTIwO21kNT01ZWRkMjEyNjUzNzg1MTg0MjQ1M2M2MWZi
ZjU1MTg1MSBcCisgICAgICAgICAgICAgICAgICAgICIKIERFUEVORFMgPSAiZGJ1cyBnbGliLTIu
MCB1ZGV2IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mbyBlbGwiCiAKIFNSQ19VUkkgPSAi
XAogICAgICR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29yay8ke0JQTn0vJHtCUH0udGFy
Lnh6IFwKICAgICBmaWxlOi8vb2Zvbm8gXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRhYmY2
ZWYwNmI5NGJlYWFkNjUyNTMyMDBhYmUzODg3MDQ2YTRlNzIyZjRmZTM3M2M0MjY0ZjM1N2FlNDdh
ZDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjVhZWY0NTViM2EzNzRjZTQzYmFkNDNjMmFkZTlk
MDQzMGQ5YzBkMjg5NTIzODVjNDRhYzdkMGRjOTMzYmJiOCIKIAogaW5oZXJpdCBhdXRvdG9vbHMg
cGtnY29uZmlnIHVwZGF0ZS1yYy5kIHN5c3RlbWQgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEK
IAotLSAKMi40NC4wCgo=

--===============2549277629637412743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ofono/ofono-dev: PKGSIZE changed from 116596 to 91357 (-22%)

--===============2549277629637412743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.7.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.8.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 6673824 to 6684112 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono-dev: PKGSIZE changed from 116596 to 91357 (-22%)
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PKGSIZE changed from 4860837 to 4654429 (-4%)
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono-src: FILELIST: directory renamed /usr/src/debug/ofono/2.7/drivers/swmodem -> /usr/src/debug/ofono/2.8/drivers/swmodem, directory renamed /usr/src/debug/ofono/2.7/plugins -> /usr/src/debug/ofono/2.8/plugins, directory renamed /usr/src/debug/ofono/2.7/gril -> /usr/src/debug/ofono/2.8/gril, directory renamed /usr/src/debug/ofono/2.7/gisi -> /usr/src/debug/ofono/2.8/gisi, directory renamed /usr/src/debug/ofono/2.7/drivers/atmodem -> /usr/src/debug/ofono/2.8/drivers/atmodem, directory renamed /usr/src/debug/ofono/2.7/linux -> /usr/src/debug/ofono/2.8/linux, directory renamed /usr/src/debug/ofono/2.7/drivers/nwmodem -> /usr/src/debug/ofono/2.8/drivers/nwmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/iceramodem -> /usr/src/debug/ofono/2.8/drivers/iceramodem, directory renamed /usr/src/debug/ofono/2.7/drivers/telitmodem -> /usr/src/debug/ofono/2.8/drivers/telitmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/ubloxmodem -> /usr/src/
 debug/ofono/2.8/drivers/ubloxmodem, directory renamed /usr/src/debug/ofono/2.7/gdbus -> /usr/src/debug/ofono/2.8/gdbus, directory renamed /usr/src/debug/ofono/2.7/drivers/xmm7modem -> /usr/src/debug/ofono/2.8/drivers/xmm7modem, directory renamed /usr/src/debug/ofono/2.7/drivers/huaweimodem -> /usr/src/debug/ofono/2.8/drivers/huaweimodem, directory renamed /usr/src/debug/ofono/2.7/drivers/simcommodem -> /usr/src/debug/ofono/2.8/drivers/simcommodem, directory renamed /usr/src/debug/ofono/2.7/gatchat -> /usr/src/debug/ofono/2.8/gatchat, directory renamed /usr/src/debug/ofono/2.7/drivers/mbimmodem -> /usr/src/debug/ofono/2.8/drivers/mbimmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/ztemodem -> /usr/src/debug/ofono/2.8/drivers/ztemodem, directory renamed /usr/src/debug/ofono/2.7/include -> /usr/src/debug/ofono/2.8/include, directory renamed /usr/src/debug/ofono/2.7/drivers/speedupmodem -> /usr/src/debug/ofono/2.8/drivers/speedupmodem, directory renamed /usr/src/debug/ofono/2.
 7/drivers/quectelmodem -> /usr/src/debug/ofono/2.8/drivers/quectelmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/gemaltomodem -> /usr/src/debug/ofono/2.8/drivers/gemaltomodem, directory renamed /usr/src/debug/ofono/2.7/drivers/calypsomodem -> /usr/src/debug/ofono/2.8/drivers/calypsomodem, directory renamed /usr/src/debug/ofono/2.7/drivers/hfpmodem -> /usr/src/debug/ofono/2.8/drivers/hfpmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/dunmodem -> /usr/src/debug/ofono/2.8/drivers/dunmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/hsomodem -> /usr/src/debug/ofono/2.8/drivers/hsomodem, directory renamed /usr/src/debug/ofono/2.7/drivers/ifxmodem -> /usr/src/debug/ofono/2.8/drivers/ifxmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/isimodem -> /usr/src/debug/ofono/2.8/drivers/isimodem, directory renamed /usr/src/debug/ofono/2.7/drivers/mbmmodem -> /usr/src/debug/ofono/2.8/drivers/mbmmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/qmimodem 
 -> /usr/src/debug/ofono/2.8/drivers/qmimodem, directory renamed /usr/src/debug/ofono/2.7/drivers/rilmodem -> /usr/src/debug/ofono/2.8/drivers/rilmodem, directory renamed /usr/src/debug/ofono/2.7/drivers/stemodem -> /usr/src/debug/ofono/2.8/drivers/stemodem, directory renamed /usr/src/debug/ofono/2.7/src -> /usr/src/debug/ofono/2.8/src, removed "/usr/src/debug/ofono/2.7/ell/strv.h /usr/src/debug/ofono/2.7/ell/io.h /usr/src/debug/ofono/2.7/ell/main.h /usr/src/debug/ofono/2.7/ell/gpio.h /usr/src/debug/ofono/2.7/ell/sysctl.h /usr/src/debug/ofono/2.7/ell/log.h /usr/src/debug/ofono/2.7/ell/settings.h /usr/src/debug/ofono/2.7/ell/queue.h /usr/src/debug/ofono/2.7/ell/uintset.h /usr/src/debug/ofono/2.7/ell/netlink.h /usr/src/debug/ofono/2.7/ell/timeout.h /usr/src/debug/ofono/2.7/ell/rtnl.h /usr/src/debug/ofono/2.7/ell/util.h /usr/src/debug/ofono/2.7/ell/string.h /usr/src/debug/ofono/2.7/ell/uuid.h /usr/src/debug/ofono/2.7/ell/idle.h /usr/src/debug/ofono/2.7/ell/file.h /usr/src/debug/ofono/2.
 7/ell/utf8.h /usr/src/debug/ofono/2.7/ell/hashmap.h", added "/usr/src/debug/ofono/2.8/ell/strv.h /usr/src/debug/ofono/2.8/ell/io.h /usr/src/debug/ofono/2.8/ell/main.h /usr/src/debug/ofono/2.8/ell/gpio.h /usr/src/debug/ofono/2.8/ell/sysctl.h /usr/src/debug/ofono/2.8/ell/path.h /usr/src/debug/ofono/2.8/ell/log.h /usr/src/debug/ofono/2.8/ell/settings.h /usr/src/debug/ofono/2.8/ell/queue.h /usr/src/debug/ofono/2.8/ell/uintset.h /usr/src/debug/ofono/2.8/ell/netlink.h /usr/src/debug/ofono/2.8/ell/timeout.h /usr/src/debug/ofono/2.8/ell/rtnl.h /usr/src/debug/ofono/2.8/ell/util.h /usr/src/debug/ofono/2.8/ell/string.h /usr/src/debug/ofono/2.8/ell/uuid.h /usr/src/debug/ofono/2.8/ell/idle.h /usr/src/debug/ofono/2.8/ell/file.h /usr/src/debug/ofono/2.8/ell/utf8.h /usr/src/debug/ofono/2.8/ell/hashmap.h"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-64-poky-linux/ofono/ofono: PKGSIZE changed from 2238150 to 2242318 (+0%)
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.7" to "2.8"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.7 [default] to 2.8 [default]

--===============2549277629637412743==--

