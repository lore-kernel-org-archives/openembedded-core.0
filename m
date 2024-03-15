Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D90C54F22
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1282.1710522014896685249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E3JW/1C1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vDhwxDlL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e430e9dc8-6d62c578-a222-4693-b6aa-9f7634c7363a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522015;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=0jt4Z9jMvDi9nMX3Z2kYbM/N7sNR2WaAWVIS36NKYXU=;
	b=E3JW/1C10tx2Z9IKxn9QSbQcoirqnf7ryg9BisEl8E397pdkncGCD7M6mfyW3xnf
	4rqMV+VSC/eu2ZcLOF7S/qcVnbjq3Jdi+z3yJlTsdjMrJL65GPHhiEBOr7TpHqHqM4H
	HHs7zK+mMdZyWEFPoGy0s2wFZGuFhA2v+I+Qv8nM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522015;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=0jt4Z9jMvDi9nMX3Z2kYbM/N7sNR2WaAWVIS36NKYXU=;
	b=vDhwxDlLVjYcgwA5GvflZmL02G3U4BMdwEZFdIAmHQC0evEspwuB144EBQEf2DwY
	8uhsGjCfaGdAaQEL2223HaHUZGBr/IaQYoix3HGNRjsoh5KGI4EN52kcEgZejJPvMzJ
	9QZSFHRM2Ck5uB0BfUBBa/lqnW5OmxsNYkHlQfUk=
Content-Type: multipart/mixed; boundary="===============9164483718375805488=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xev: upgrading to 1.2.6 SUCCEEDED
Message-ID: <0101018e430e9dc8-6d62c578-a222-4693-b6aa-9f7634c7363a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197220

--===============9164483718375805488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xev* to *1.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xev-upgrade-1.2.5-1.2.6.patch
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
From e181fda7d550c0aac0a5c0247ca1f1df0a820597 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 13:25:37 +0000
Subject: [PATCH] xev: upgrade 1.2.5 -> 1.2.6

---
 meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-app/xev_1.2.5.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.6.bb
index 1d2e66b7b4..182aeff1b7 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
@@ -12,6 +12,6 @@ PE = "1"
 
 DEPENDS += "libxrandr xorgproto"
 
-SRC_URI[sha256sum] = "c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1"
+SRC_URI[sha256sum] = "61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7"
 
 SRC_URI_EXT = "xz"
-- 
2.42.0


--===============9164483718375805488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev: SRC_URI changed from "https://www.x.org/releases//individual/app/xev-1.2.5.tar.xz" to "https://www.x.org/releases//individual/app/xev-1.2.6.tar.xz"
packages/core2-64-poky-linux/xev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-dbg: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-dbg: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-dbg: PKGSIZE changed from 68360 to 67864 (-1%)
packages/core2-64-poky-linux/xev/xev-dev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-dev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-doc: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-doc: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-locale: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-locale: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-src: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-src: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-src: PKGSIZE changed from 46810 to 46902 (+0%)
packages/core2-64-poky-linux/xev/xev-staticdev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-staticdev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev: PKGSIZE changed from 35208 to 35184 (-0%)

--===============9164483718375805488==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xev-upgrade-1.2.5-1.2.6.patch"

RnJvbSBlMTgxZmRhN2Q1NTBjMGFhYzBhNWMwMjQ3Y2ExZjFkZjBhODIwNTk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTM6MjU6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ZXY6IHVwZ3JhZGUgMS4yLjUgLT4gMS4yLjYKCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctYXBwL3t4ZXZfMS4yLjUuYmIgPT4geGV2XzEuMi42LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWFwcC97eGV2XzEuMi41LmJiID0+IHhldl8xLjIuNi5iYn0gKDg0JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV2XzEuMi41LmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hldl8xLjIuNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV2XzEu
Mi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV2XzEuMi42
LmJiCmluZGV4IDFkMmU2NmI3YjQuLjE4MmFlZmYxYjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC94ZXZfMS4yLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL3hldl8xLjIuNi5iYgpAQCAtMTIsNiArMTIsNiBAQCBQRSA9ICIxIgogCiBE
RVBFTkRTICs9ICJsaWJ4cmFuZHIgeG9yZ3Byb3RvIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
Yzk0NjFhNDM4OTcxNGUwZjMzOTc0ZjllNzU5MzRiZGMzOGQ4MzZhMGYwNTliOGRjMDg5YzdjYmYy
Y2UzNmVjMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MWUxYzVlMDA4YWM5OTczYWNhN2NkZGRm
MzZlOWRmNzQxMGU3NzA4M2IwMzBlYjA0ZjRkYzczN2M1MTgwN2Q3IgogCiBTUkNfVVJJX0VYVCA9
ICJ4eiIKLS0gCjIuNDIuMAoK

--===============9164483718375805488==--

