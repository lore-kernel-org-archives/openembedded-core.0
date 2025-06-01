Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2725FC71143
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.27774.1748786127856618930
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TbDV0o5R;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LSvI29eQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6a15b-7f47117b-0ad1-42d6-ab3c-f186e7894654-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rZSsLQvrocbz8sAUpTo5u/YeDV89jtTL/9gUU2ZwZPc=;
	b=TbDV0o5RAATAJLp9jkqvAf2CaDaG1d6vCxPaQkdjvo9Nbak6RUqv7Ww/GsaOUHcB
	4xMyKUIUGCBS4HTB2Buw8PNTZqz55AQY1jWnAF7hAq6Vmf3L34fvXfQfe6MM4oj/1OZ
	4+ezCEJqKrHdJq//3zyNwUYFifnVIZ9m9T8KQcG0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rZSsLQvrocbz8sAUpTo5u/YeDV89jtTL/9gUU2ZwZPc=;
	b=LSvI29eQWZdhmp0dTStbwd5qJ64GQt67HeKvTeBB2W5d9VWo8kKbxj0m02bz6ADN
	NAJSRNhgSqgPLvq8A7/l+NR2P6CHbj2DEGbw75Mg6jinUvcnkeipDGwa7ai5npiZ3uM
	iStv8wl1XIvJ7FUra0CpSXGc3Wunc/QRQvF0Swzs=
Content-Type: multipart/mixed; boundary="===============8123660912403842995=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.17 SUCCEEDED
Message-ID: <010101972bc6a15b-7f47117b-0ad1-42d6-ab3c-f186e7894654-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217577

--===============8123660912403842995==
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
From cc2b7cfae645b226f6f2e6099449f38d5c8c5eb1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 08:09:57 +0000
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


--===============8123660912403842995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.16 [default] to 2.17 [default]
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.16.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.17.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.16" to "2.17"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7303160 to 7304152 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.16 [default] to 2.17 [default]
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

--===============8123660912403842995==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.16-2.17.patch"

RnJvbSBjYzJiN2NmYWU2NDViMjI2ZjZmMmU2MDk5NDQ5ZjM4ZDVjOGM1ZWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwODowOTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9m
b25vOiB1cGdyYWRlIDIuMTYgLT4gMi4xNwoKLS0tCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8ve29mb25vXzIuMTYuYmIgPT4gb2Zvbm9fMi4xNy5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18yLjE2LmJiID0+IG9mb25vXzIuMTcuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE2
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE3LmJiCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9u
by9vZm9ub18yLjE3LmJiCmluZGV4IGVhMzEyMDk3NGMuLjM2YmJlOTQzOWEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTcuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJkYnVzIGdsaWItMi4wIHVkZXYgbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRl
ci1pbmZvIGVsbCIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9uZXR3b3Jr
LyR7QlBOfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vb2Zvbm8gXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmZhMmUxNjhlNzRlMWQxODc5MDA4ODA2NTM3
ZWZmMmYwYjNjODZlYjU0MTJmYmMwOTNmNDIzNmUyYTE1YzllZiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3MGJiNTA5OTdkM2E3NjU3ZWRmMTMzMzU1Njc3ZjhlMDRiMjE1OGJjYjAzMTExOGE2N2Iy
OTYxMDdmNmVhNzNlIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLXJjLmQg
c3lzdGVtZCBnb2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YQogCi0tIAoyLjQ3LjEKCg==

--===============8123660912403842995==--

