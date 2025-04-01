Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9005C369AE
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18042.1743511391543488936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WTeQg+ZE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cuOm9nxI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010195f160883a-5d005751-e0bb-4079-9e6a-ea34be356095-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x5fJQOjOFl00zMI9QXSku1M/muwgqjL7FqCPShryb/E=;
	b=WTeQg+ZEPC5zkc4QtDmB6tfUltMOZ4VhyjsOMBfEJ58Hr3hg7ulaY0ydQworT70t
	+Bga6Pr51LjvxZFtbcR9PF9aufHScQOBkFPsanC0QQU0UgccMF19beqtOMb6smVF+cL
	xB8jwpU4I1RHmlgoUwMCPBqGBILv2jhnHHhPlI3o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x5fJQOjOFl00zMI9QXSku1M/muwgqjL7FqCPShryb/E=;
	b=cuOm9nxI7E5QQ69/Td0ewBml8cyQ+dd9VIbSUgAS/RvmRTfbKZ0UTzy/S5O/N1mi
	s9rMGwTNB65HzP2YJyZfnTwigeuEemtTx5UKkcbRPqRjrKSqXKBPEEWVjJdTko/JejT
	vwSPOY46dWpw++Q1r9X5JJid0Wv2MXmL0YtnDb5o=
Content-Type: multipart/mixed; boundary="===============6973601046215947477=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.16 SUCCEEDED
Message-ID: <01010195f160883a-5d005751-e0bb-4079-9e6a-ea34be356095-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214040

--===============6973601046215947477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.15-2.16.patch
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
From 04dc92b0468f0188aa1f283c5cbeb51cc7575293 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 07:20:02 +0000
Subject: [PATCH] ofono: upgrade 2.15 -> 2.16

---
 .../recipes-connectivity/ofono/{ofono_2.15.bb => ofono_2.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.15.bb => ofono_2.16.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.15.bb b/meta/recipes-connectivity/ofono/ofono_2.16.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.15.bb
rename to meta/recipes-connectivity/ofono/ofono_2.16.bb
index 40eeb3a086..64635775dc 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.16.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "1af93ab72a70502452fe3d0297a6eaea13750cacae1fff3b643dd2245a6408ca"
+SRC_URI[sha256sum] = "6fa2e168e74e1d1879008806537eff2f0b3c86eb5412fbc093f4236e2a15c9ef"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.47.1


--===============6973601046215947477==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.15-2.16.patch"

RnJvbSAwNGRjOTJiMDQ2OGYwMTg4YWExZjI4M2M1Y2JlYjUxY2M3NTc1MjkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNzoyMDowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9m
b25vOiB1cGdyYWRlIDIuMTUgLT4gMi4xNgoKLS0tCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8ve29mb25vXzIuMTUuYmIgPT4gb2Zvbm9fMi4xNi5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18yLjE1LmJiID0+IG9mb25vXzIuMTYuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE1
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE2LmJiCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9u
by9vZm9ub18yLjE2LmJiCmluZGV4IDQwZWViM2EwODYuLjY0NjM1Nzc1ZGMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTYuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJkYnVzIGdsaWItMi4wIHVkZXYgbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRl
ci1pbmZvIGVsbCIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9uZXR3b3Jr
LyR7QlBOfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vb2Zvbm8gXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWFmOTNhYjcyYTcwNTAyNDUyZmUzZDAyOTdh
NmVhZWExMzc1MGNhY2FlMWZmZjNiNjQzZGQyMjQ1YTY0MDhjYSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI2ZmEyZTE2OGU3NGUxZDE4NzkwMDg4MDY1MzdlZmYyZjBiM2M4NmViNTQxMmZiYzA5M2Y0
MjM2ZTJhMTVjOWVmIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLXJjLmQg
c3lzdGVtZCBnb2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YQogCi0tIAoyLjQ3LjEKCg==

--===============6973601046215947477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.15.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.16.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7329312 to 7331160 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono-src: FILELIST: directory renamed /usr/src/debug/ofono/2.15/gisi -> /usr/src/debug/ofono/2.16/gisi, directory renamed /usr/src/debug/ofono/2.15/drivers/swmodem -> /usr/src/debug/ofono/2.16/drivers/swmodem, directory renamed /usr/src/debug/ofono/2.15/src -> /usr/src/debug/ofono/2.16/src, directory renamed /usr/src/debug/ofono/2.15/linux -> /usr/src/debug/ofono/2.16/linux, directory renamed /usr/src/debug/ofono/2.15/gril -> /usr/src/debug/ofono/2.16/gril, directory renamed /usr/src/debug/ofono/2.15/drivers/speedupmodem -> /usr/src/debug/ofono/2.16/drivers/speedupmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/hsomodem -> /usr/src/debug/ofono/2.16/drivers/hsomodem, directory renamed /usr/src/debug/ofono/2.15/drivers/ifxmodem -> /usr/src/debug/ofono/2.16/drivers/ifxmodem, directory renamed /usr/src/debug/ofono/2.15/gatchat -> /usr/src/debug/ofono/2.16/gatchat, directory renamed /usr/src/debug/ofono/2.15/drivers/mbimmodem -> /usr/src/debu
 g/ofono/2.16/drivers/mbimmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/xmm7modem -> /usr/src/debug/ofono/2.16/drivers/xmm7modem, directory renamed /usr/src/debug/ofono/2.15/drivers/isimodem -> /usr/src/debug/ofono/2.16/drivers/isimodem, directory renamed /usr/src/debug/ofono/2.15/plugins -> /usr/src/debug/ofono/2.16/plugins, directory renamed /usr/src/debug/ofono/2.15/include -> /usr/src/debug/ofono/2.16/include, directory renamed /usr/src/debug/ofono/2.15/drivers/iceramodem -> /usr/src/debug/ofono/2.16/drivers/iceramodem, directory renamed /usr/src/debug/ofono/2.15/drivers/quectelmodem -> /usr/src/debug/ofono/2.16/drivers/quectelmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/gemaltomodem -> /usr/src/debug/ofono/2.16/drivers/gemaltomodem, directory renamed /usr/src/debug/ofono/2.15/drivers/calypsomodem -> /usr/src/debug/ofono/2.16/drivers/calypsomodem, directory renamed /usr/src/debug/ofono/2.15/drivers/mbmmodem -> /usr/src/debug/ofono/2.16/drivers/mbmmodem,
  directory renamed /usr/src/debug/ofono/2.15/drivers/stemodem -> /usr/src/debug/ofono/2.16/drivers/stemodem, directory renamed /usr/src/debug/ofono/2.15/gdbus -> /usr/src/debug/ofono/2.16/gdbus, directory renamed /usr/src/debug/ofono/2.15/drivers/ztemodem -> /usr/src/debug/ofono/2.16/drivers/nwmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/telitmodem -> /usr/src/debug/ofono/2.16/drivers/telitmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/ubloxmodem -> /usr/src/debug/ofono/2.16/drivers/ubloxmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/qmimodem -> /usr/src/debug/ofono/2.16/drivers/qmimodem, directory renamed /usr/src/debug/ofono/2.15/drivers/rilmodem -> /usr/src/debug/ofono/2.16/drivers/rilmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/dunmodem -> /usr/src/debug/ofono/2.16/drivers/dunmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/hfpmodem -> /usr/src/debug/ofono/2.16/drivers/hfpmodem, directory renamed /usr/src/debug/ofono/
 2.15/drivers/atmodem -> /usr/src/debug/ofono/2.16/drivers/atmodem, directory renamed /usr/src/debug/ofono/2.15/drivers/huaweimodem -> /usr/src/debug/ofono/2.16/drivers/huaweimodem, directory renamed /usr/src/debug/ofono/2.15/drivers/nwmodem -> /usr/src/debug/ofono/2.16/drivers/simcommodem, directory renamed /usr/src/debug/ofono/2.15/drivers/simcommodem -> /usr/src/debug/ofono/2.16/drivers/ztemodem, removed "/usr/src/debug/ofono/2.15/ell/queue.h /usr/src/debug/ofono/2.15/ell/string.h /usr/src/debug/ofono/2.15/ell/file.h /usr/src/debug/ofono/2.15/ell/idle.h /usr/src/debug/ofono/2.15/ell/timeout.h /usr/src/debug/ofono/2.15/ell/hashmap.h /usr/src/debug/ofono/2.15/ell/settings.h /usr/src/debug/ofono/2.15/ell/strv.h /usr/src/debug/ofono/2.15/ell/utf8.h /usr/src/debug/ofono/2.15/ell/uuid.h /usr/src/debug/ofono/2.15/ell/main.h /usr/src/debug/ofono/2.15/ell/gpio.h /usr/src/debug/ofono/2.15/ell/util.h /usr/src/debug/ofono/2.15/ell/netlink.h /usr/src/debug/ofono/2.15/ell/path.h /usr/src/debug/
 ofono/2.15/ell/sysctl.h /usr/src/debug/ofono/2.15/ell/log.h /usr/src/debug/ofono/2.15/ell/io.h /usr/src/debug/ofono/2.15/ell/uintset.h /usr/src/debug/ofono/2.15/ell/rtnl.h", added "/usr/src/debug/ofono/2.16/ell/utf8.h /usr/src/debug/ofono/2.16/ell/io.h /usr/src/debug/ofono/2.16/ell/strv.h /usr/src/debug/ofono/2.16/ell/string.h /usr/src/debug/ofono/2.16/ell/util.h /usr/src/debug/ofono/2.16/ell/netlink.h /usr/src/debug/ofono/2.16/ell/uintset.h /usr/src/debug/ofono/2.16/ell/time.h /usr/src/debug/ofono/2.16/ell/sysctl.h /usr/src/debug/ofono/2.16/ell/settings.h /usr/src/debug/ofono/2.16/ell/main.h /usr/src/debug/ofono/2.16/ell/hashmap.h /usr/src/debug/ofono/2.16/ell/timeout.h /usr/src/debug/ofono/2.16/ell/log.h /usr/src/debug/ofono/2.16/ell/path.h /usr/src/debug/ofono/2.16/ell/rtnl.h /usr/src/debug/ofono/2.16/ell/gpio.h /usr/src/debug/ofono/2.16/ell/uuid.h /usr/src/debug/ofono/2.16/ell/queue.h /usr/src/debug/ofono/2.16/ell/idle.h /usr/src/debug/ofono/2.16/ell/file.h"
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PKGSIZE changed from 4715074 to 4720002 (+0%)
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.15" to "2.16"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.15 [default] to 2.16 [default]
packages/core2-64-poky-linux/ofono/ofono: PKGSIZE changed from 2279718 to 2280199 (+0%)

--===============6973601046215947477==--

