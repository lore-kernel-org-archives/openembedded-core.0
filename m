Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82939D5C0DE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17180.1765872132398807664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=C7E/H8B/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WCLS7x8b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262e6970-4e6a6ef4-0d61-4d0f-9085-69152ad00f2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lC83wtQ9+rqZ+oeHhH/DbbIX5dD4c44JcrLTzy4ZHwA=;
	b=C7E/H8B/EiYMx1fAWTrrdt7/QG5PnZyzOhEXaIcragTfmaardYWG1LmtKJTU77l1
	TkIVbq45MFY5SA8kOgNBCBCP/64hmuN75pgkZBbnLEKXblGGU9WHxIVPyx86BZ3xID9
	GI7sYQ4zg8Bv1qhnYi3fQujY370xutD8eR5UgytI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lC83wtQ9+rqZ+oeHhH/DbbIX5dD4c44JcrLTzy4ZHwA=;
	b=WCLS7x8bf9gKeEtaLt6pmuG9FnFZTccFAgtofru4RCgxiSHXzS7ze5pL8oEKHnL1
	kLg7H7pwgfHdPuUa+dWyIfwWczPOUWruH1Xf7aVtL9zSNz9mearv/X0RvMJKDtNY9r5
	GqU52AgMhnPDHquLbWFnmpsOwF97LES3aSRHNTuk=
Content-Type: multipart/mixed; boundary="===============8632782808516972284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.19 SUCCEEDED
Message-ID: <0101019b262e6970-4e6a6ef4-0d61-4d0f-9085-69152ad00f2c-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227776

--===============8632782808516972284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.18-2.19.patch
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
From 84ecffeb47809dee87f641ee7c479bceaa091f58 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 22:14:28 +0000
Subject: [PATCH] ofono: upgrade 2.18 -> 2.19

---
 .../recipes-connectivity/ofono/{ofono_2.18.bb => ofono_2.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.18.bb => ofono_2.19.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.18.bb b/meta/recipes-connectivity/ofono/ofono_2.19.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.18.bb
rename to meta/recipes-connectivity/ofono/ofono_2.19.bb
index e2666b3e7e..136c13fbeb 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.18.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00"
+SRC_URI[sha256sum] = "d554525ad2db1ccd2fe3ed733e437d76997e7f443c085b87e6be1fded020bc8f"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.47.1


--===============8632782808516972284==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.18-2.19.patch"

RnJvbSA4NGVjZmZlYjQ3ODA5ZGVlODdmNjQxZWU3YzQ3OWJjZWFhMDkxZjU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjI6MTQ6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjE4IC0+IDIuMTkKCi0tLQogLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29mb25vL3tvZm9ub18yLjE4LmJiID0+IG9mb25vXzIuMTkuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi4xOC5iYiA9PiBvZm9ub18yLjE5LmJifSAoOTUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4x
OC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xOS5iYgpzaW1p
bGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vXzIuMTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xOS5iYgppbmRleCBlMjY2NmIzZTdlLi4xMzZjMTNmYmViIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTguYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE5LmJiCkBAIC0xMCw3ICsxMCw3
IEBAIERFUEVORFMgPSAiZGJ1cyBnbGliLTIuMCB1ZGV2IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlk
ZXItaW5mbyBlbGwiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29y
ay8ke0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL29mb25vIFwKICAgICAg
ICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3NGMzYmJhN2ViYWM0ODhmZWQ3YmNmYTYx
MTNiMGUzOWU3MjNkMmUxYTI0YjUzZjc5YzlmMThhMWM4NWRkMDAiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDU1NDUyNWFkMmRiMWNjZDJmZTNlZDczM2U0MzdkNzY5OTdlN2Y0NDNjMDg1Yjg3ZTZi
ZTFmZGVkMDIwYmM4ZiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1yYy5k
IHN5c3RlbWQgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEKIAotLSAKMi40Ny4xCgo=

--===============8632782808516972284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ofono: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.18.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.19.tar.xz file://ofono"
packages/x86-64-v3-poky-linux/ofono: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono-dbg: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7313736 to 7310656 (-0%)
packages/x86-64-v3-poky-linux/ofono/ofono-dbg: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono-dev: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-dev: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono-doc: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-doc: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono-locale: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-locale: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono-src: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-src: PKGSIZE changed from 4726431 to 4726571 (+0%)
packages/x86-64-v3-poky-linux/ofono/ofono-src: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono-src: FILELIST: directory renamed /usr/src/debug/ofono/2.18/gisi -> /usr/src/debug/ofono/2.19/gisi, directory renamed /usr/src/debug/ofono/2.18/linux -> /usr/src/debug/ofono/2.19/linux, directory renamed /usr/src/debug/ofono/2.18/gatchat -> /usr/src/debug/ofono/2.19/gatchat, directory renamed /usr/src/debug/ofono/2.18/drivers/dunmodem -> /usr/src/debug/ofono/2.19/drivers/dunmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/hfpmodem -> /usr/src/debug/ofono/2.19/drivers/hfpmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/hsomodem -> /usr/src/debug/ofono/2.19/drivers/hsomodem, directory renamed /usr/src/debug/ofono/2.18/drivers/ifxmodem -> /usr/src/debug/ofono/2.19/drivers/ifxmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/isimodem -> /usr/src/debug/ofono/2.19/drivers/isimodem, directory renamed /usr/src/debug/ofono/2.18/drivers/mbmmodem -> /usr/src/debug/ofono/2.19/drivers/mbmmodem, directory renamed /usr/src/debug/
 ofono/2.18/drivers/qmimodem -> /usr/src/debug/ofono/2.19/drivers/qmimodem, directory renamed /usr/src/debug/ofono/2.18/drivers/rilmodem -> /usr/src/debug/ofono/2.19/drivers/rilmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/speedupmodem -> /usr/src/debug/ofono/2.19/drivers/speedupmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/stemodem -> /usr/src/debug/ofono/2.19/drivers/stemodem, directory renamed /usr/src/debug/ofono/2.18/include -> /usr/src/debug/ofono/2.19/include, directory renamed /usr/src/debug/ofono/2.18/gril -> /usr/src/debug/ofono/2.19/gril, directory renamed /usr/src/debug/ofono/2.18/gdbus -> /usr/src/debug/ofono/2.19/gdbus, directory renamed /usr/src/debug/ofono/2.18/drivers/xmm7modem -> /usr/src/debug/ofono/2.19/drivers/xmm7modem, directory renamed /usr/src/debug/ofono/2.18/drivers/mbimmodem -> /usr/src/debug/ofono/2.19/drivers/mbimmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/huaweimodem -> /usr/src/debug/ofono/2.19/drivers/huaweimod
 em, directory renamed /usr/src/debug/ofono/2.18/drivers/simcommodem -> /usr/src/debug/ofono/2.19/drivers/quectelmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/ztemodem -> /usr/src/debug/ofono/2.19/drivers/simcommodem, directory renamed /usr/src/debug/ofono/2.18/src -> /usr/src/debug/ofono/2.19/src, directory renamed /usr/src/debug/ofono/2.18/drivers/quectelmodem -> /usr/src/debug/ofono/2.19/drivers/ztemodem, directory renamed /usr/src/debug/ofono/2.18/ell -> /usr/src/debug/ofono/2.19/ell, directory renamed /usr/src/debug/ofono/2.18/drivers/atmodem -> /usr/src/debug/ofono/2.19/drivers/atmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/nwmodem -> /usr/src/debug/ofono/2.19/drivers/nwmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/swmodem -> /usr/src/debug/ofono/2.19/drivers/swmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/calypsomodem -> /usr/src/debug/ofono/2.19/drivers/calypsomodem, directory renamed /usr/src/debug/ofono/2.18/drivers/gemal
 tomodem -> /usr/src/debug/ofono/2.19/drivers/gemaltomodem, directory renamed /usr/src/debug/ofono/2.18/drivers/iceramodem -> /usr/src/debug/ofono/2.19/drivers/iceramodem, directory renamed /usr/src/debug/ofono/2.18/drivers/telitmodem -> /usr/src/debug/ofono/2.19/drivers/telitmodem, directory renamed /usr/src/debug/ofono/2.18/drivers/ubloxmodem -> /usr/src/debug/ofono/2.19/drivers/ubloxmodem, removed "/usr/src/debug/ofono/2.18/plugins/mbim.c /usr/src/debug/ofono/2.18/plugins/upower.c /usr/src/debug/ofono/2.18/plugins/huawei.c /usr/src/debug/ofono/2.18/plugins/udevng.c /usr/src/debug/ofono/2.18/plugins/bluez5.c /usr/src/debug/ofono/2.18/plugins/isiusb.c /usr/src/debug/ofono/2.18/plugins/rildev.c /usr/src/debug/ofono/2.18/plugins/sierra.c /usr/src/debug/ofono/2.18/plugins/bluez5.h /usr/src/debug/ofono/2.18/plugins/sim900.c /usr/src/debug/ofono/2.18/plugins/stemgr.c /usr/src/debug/ofono/2.18/plugins/gobi.c /usr/src/debug/ofono/2.18/plugins/telit.c /usr/src/debug/ofono/2.18/plugins/n900.
 c /usr/src/debug/ofono/2.18/plugins/smart-messaging.c /usr/src/debug/ofono/2.18/plugins/phonesim.c /usr/src/debug/ofono/2.18/plugins/samsung.c /usr/src/debug/ofono/2.18/plugins/sim7100.c /usr/src/debug/ofono/2.18/plugins/xmm7xxx.c /usr/src/debug/ofono/2.18/plugins/mbm.c /usr/src/debug/ofono/2.18/plugins/wavecom.c /usr/src/debug/ofono/2.18/plugins/ril.h /usr/src/debug/ofono/2.18/plugins/ste.c /usr/src/debug/ofono/2.18/plugins/dun_gw_bluez5.c /usr/src/debug/ofono/2.18/plugins/hfp_ag_bluez5.c /usr/src/debug/ofono/2.18/plugins/hfp_hf_bluez5.c /usr/src/debug/ofono/2.18/plugins/allowed-apns.c /usr/src/debug/ofono/2.18/plugins/alcatel.c /usr/src/debug/ofono/2.18/plugins/cinterion.c /usr/src/debug/ofono/2.18/plugins/novatel.c /usr/src/debug/ofono/2.18/plugins/hso.c /usr/src/debug/ofono/2.18/plugins/infineon.c /usr/src/debug/ofono/2.18/plugins/quectel.c /usr/src/debug/ofono/2.18/plugins/g1.c /usr/src/debug/ofono/2.18/plugins/ril.c /usr/src/debug/ofono/2.18/plugins/ril_intel.c /usr/src/debug/
 ofono/2.18/plugins/zte.c /usr/src/debug/ofono/2.18/plugins/palmpre.c /usr/src/debug/ofono/2.18/plugins/nokia-gpio.c /usr/src/debug/ofono/2.18/plugins/qrtrqmi.c /usr/src/debug/ofono/2.18/plugins/u8500.c /usr/src/debug/ofono/2.18/plugins/ublox.c /usr/src/debug/ofono/2.18/plugins/droid.c /usr/src/debug/ofono/2.18/plugins/icera.c /usr/src/debug/ofono/2.18/plugins/linktop.c /usr/src/debug/ofono/2.18/plugins/nokia-gpio.h /usr/src/debug/ofono/2.18/plugins/nokia.c /usr/src/debug/ofono/2.18/plugins/push-notification.c /usr/src/debug/ofono/2.18/plugins/speedup.c /usr/src/debug/ofono/2.18/plugins/calypso.c /usr/src/debug/ofono/2.18/plugins/gemalto.c /usr/src/debug/ofono/2.18/plugins/ifx.c /usr/src/debug/ofono/2.18/plugins/connman.c", added "/usr/src/debug/ofono/2.19/plugins/n900.c /usr/src/debug/ofono/2.19/plugins/allowed-apns.c /usr/src/debug/ofono/2.19/plugins/samsung.c /usr/src/debug/ofono/2.19/plugins/bluez5.c /usr/src/debug/ofono/2.19/plugins/huawei.c /usr/src/debug/ofono/2.19/plugins/isi
 usb.c /usr/src/debug/ofono/2.19/plugins/mbim.c /usr/src/debug/ofono/2.19/plugins/nokia-gpio.h /usr/src/debug/ofono/2.19/plugins/g1.c /usr/src/debug/ofono/2.19/plugins/rildev.c /usr/src/debug/ofono/2.19/plugins/cinterion.c /usr/src/debug/ofono/2.19/plugins/sierra.c /usr/src/debug/ofono/2.19/plugins/nokia-gpio.c /usr/src/debug/ofono/2.19/plugins/ril_intel.c /usr/src/debug/ofono/2.19/plugins/palmpre.c /usr/src/debug/ofono/2.19/plugins/dun_gw_bluez5.c /usr/src/debug/ofono/2.19/plugins/hfp_ag_bluez5.c /usr/src/debug/ofono/2.19/plugins/hfp_hf_bluez5.c /usr/src/debug/ofono/2.19/plugins/bluez5.h /usr/src/debug/ofono/2.19/plugins/calypso.c /usr/src/debug/ofono/2.19/plugins/gemalto.c /usr/src/debug/ofono/2.19/plugins/sim7100.c /usr/src/debug/ofono/2.19/plugins/alcatel.c /usr/src/debug/ofono/2.19/plugins/novatel.c /usr/src/debug/ofono/2.19/plugins/quectel.c /usr/src/debug/ofono/2.19/plugins/push-notification.c /usr/src/debug/ofono/2.19/plugins/hso.c /usr/src/debug/ofono/2.19/plugins/ste.c /usr
 /src/debug/ofono/2.19/plugins/wavecom.c /usr/src/debug/ofono/2.19/plugins/phonesim.c /usr/src/debug/ofono/2.19/plugins/sim900.c /usr/src/debug/ofono/2.19/plugins/stemgr.c /usr/src/debug/ofono/2.19/plugins/ifx.c /usr/src/debug/ofono/2.19/plugins/udevng.c /usr/src/debug/ofono/2.19/plugins/upower.c /usr/src/debug/ofono/2.19/plugins/ril.c /usr/src/debug/ofono/2.19/plugins/mbm.c /usr/src/debug/ofono/2.19/plugins/ril.h /usr/src/debug/ofono/2.19/plugins/xmm7xxx.c /usr/src/debug/ofono/2.19/plugins/gobi.c /usr/src/debug/ofono/2.19/plugins/zte.c /usr/src/debug/ofono/2.19/plugins/linktop.c /usr/src/debug/ofono/2.19/plugins/speedup.c /usr/src/debug/ofono/2.19/plugins/infineon.c /usr/src/debug/ofono/2.19/plugins/qrtrqmi.c /usr/src/debug/ofono/2.19/plugins/icera.c /usr/src/debug/ofono/2.19/plugins/nokia.c /usr/src/debug/ofono/2.19/plugins/smart-messaging.c /usr/src/debug/ofono/2.19/plugins/telit.c /usr/src/debug/ofono/2.19/plugins/u8500.c /usr/src/debug/ofono/2.19/plugins/ublox.c /usr/src/debug/o
 fono/2.19/plugins/connman.c"
packages/x86-64-v3-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-staticdev: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono-tests: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-tests: PV changed from "2.18" to "2.19"
packages/x86-64-v3-poky-linux/ofono/ofono: PKGV changed from 2.18 [default] to 2.19 [default]
packages/x86-64-v3-poky-linux/ofono/ofono: PKGSIZE changed from 2292855 to 2292785 (-0%)
packages/x86-64-v3-poky-linux/ofono/ofono: PV changed from "2.18" to "2.19"

--===============8632782808516972284==--

