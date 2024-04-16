Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E0EC32719
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.13580.1713248037100329977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YOGXj1U8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rkxIl8Jz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a6632-8df8aba7-2c22-49da-895a-8cce8928cc82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sosUy25c94r9rbzs30anDyOW647mJqPZsdk2By83kr8=;
	b=YOGXj1U89irYK7yWRjmGgXJU8Uc7Vdc6T1nfgEyRJ0AAwXG3YG1Q13aUtKAeYL6w
	uoedHOSp3ufK+XBTr8VPxnbOzVAxxgGXg+jv3C99psqHSsrCzQS+BzNnnCCNn783mNm
	bIZQsdWCye52rGUaG6uSEh6Yrb1LxOsg4vOt2TIo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sosUy25c94r9rbzs30anDyOW647mJqPZsdk2By83kr8=;
	b=rkxIl8JzySUntIcOv8TPdk+uo5vzt/ouyXlMP/xn1cGEUrJ0EX0YvOpY2l6DRsTs
	5bwZVZjCODlze7Jg45lsqjrZ8NRQUEsjMbxGHxTdoH2O7QSQa7IIhP85DilNvA8Tt53
	mQNAV2J6lXhORgagjkNsw6WoOnDdb68FicNaSKwM=
Content-Type: multipart/mixed; boundary="===============9034193371875997185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.5 SUCCEEDED
Message-ID: <0101018ee58a6632-8df8aba7-2c22-49da-895a-8cce8928cc82-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198251

--===============9034193371875997185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.4-2.5.patch
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
From 6312a19bb6919900908fa488e4672c2052b6c42a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 17:31:04 +0000
Subject: [PATCH] ofono: upgrade 2.4 -> 2.5

---
 ...-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch | 5 +----
 ...bim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch | 4 ++--
 .../ofono/{ofono_2.4.bb => ofono_2.5.bb}                     | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.4.bb => ofono_2.5.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
index 8a5a300adc..a8447bd0cd 100644
--- a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
@@ -1,4 +1,4 @@
-From 22b52db4842611ac31a356f023fc09595384e2ad Mon Sep 17 00:00:00 2001
+From 0ef97b8fc4d35bd8b9031ac1908b0051aa7a87a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 May 2019 18:11:22 -0700
 Subject: [PATCH] mbim: add an optional TEMP_FAILURE_RETRY macro copy
@@ -31,6 +31,3 @@ index e159235..51693ea 100644
  enum mbim_control_message {
  	MBIM_OPEN_MSG = 0x1,
  	MBIM_CLOSE_MSG = 0x2,
--- 
-2.21.0
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
index 3655b3fd66..d3f42f24c9 100644
--- a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
@@ -1,4 +1,4 @@
-From 76e4054801350ebd4a44057379431a33d460ad0f Mon Sep 17 00:00:00 2001
+From d41b3a035deaccd81e19a112af233bbbb7106e01 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 21 Apr 2021 11:01:34 +0000
 Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely macro
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-private.h
-index 51693eae..d917312c 100644
+index 51693ea..d917312 100644
 --- a/drivers/mbimmodem/mbim-private.h
 +++ b/drivers/mbimmodem/mbim-private.h
 @@ -30,6 +30,10 @@
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.5.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
rename to meta/recipes-connectivity/ofono/ofono_2.5.bb
index dae5cc3c25..b68eb99fa5 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
+SRC_URI[sha256sum] = "0f4e0386318adba6a6a6135143fb5821ad3dfda4ffb7fa3786c7433f005b273f"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.42.0


--===============9034193371875997185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.4.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.5.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch"
packages/core2-64-poky-linux/ofono: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 6531120 to 6578840 (+1%)
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGSIZE changed from 115920 to 116127 (+0%)
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-src: FILELIST: directory renamed /usr/src/debug/ofono/2.4/drivers/rilmodem -> /usr/src/debug/ofono/2.5/drivers/rilmodem, directory renamed /usr/src/debug/ofono/2.4/src -> /usr/src/debug/ofono/2.5/src, directory renamed /usr/src/debug/ofono/2.4/drivers/atmodem -> /usr/src/debug/ofono/2.5/drivers/atmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/xmm7modem -> /usr/src/debug/ofono/2.5/drivers/xmm7modem, directory renamed /usr/src/debug/ofono/2.4/drivers/nwmodem -> /usr/src/debug/ofono/2.5/drivers/nwmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/mbimmodem -> /usr/src/debug/ofono/2.5/drivers/mbimmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/stemodem -> /usr/src/debug/ofono/2.5/drivers/stemodem, directory renamed /usr/src/debug/ofono/2.4/include -> /usr/src/debug/ofono/2.5/include, directory renamed /usr/src/debug/ofono/2.4/drivers/swmodem -> /usr/src/debug/ofono/2.5/drivers/swmodem, directory renamed /usr/src/debug/o
 fono/2.4/drivers/hfpmodem -> /usr/src/debug/ofono/2.5/drivers/hfpmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/hsomodem -> /usr/src/debug/ofono/2.5/drivers/hsomodem, directory renamed /usr/src/debug/ofono/2.4/gisi -> /usr/src/debug/ofono/2.5/gisi, directory renamed /usr/src/debug/ofono/2.4/gril -> /usr/src/debug/ofono/2.5/gril, directory renamed /usr/src/debug/ofono/2.4/drivers/telitmodem -> /usr/src/debug/ofono/2.5/drivers/telitmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/ubloxmodem -> /usr/src/debug/ofono/2.5/drivers/ubloxmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/mbmmodem -> /usr/src/debug/ofono/2.5/drivers/mbmmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/iceramodem -> /usr/src/debug/ofono/2.5/drivers/iceramodem, directory renamed /usr/src/debug/ofono/2.4/gatchat -> /usr/src/debug/ofono/2.5/gatchat, directory renamed /usr/src/debug/ofono/2.4/linux -> /usr/src/debug/ofono/2.5/linux, directory renamed /usr/src/debug/ofono/2.4/driv
 ers/gemaltomodem -> /usr/src/debug/ofono/2.5/drivers/gemaltomodem, directory renamed /usr/src/debug/ofono/2.4/drivers/calypsomodem -> /usr/src/debug/ofono/2.5/drivers/calypsomodem, directory renamed /usr/src/debug/ofono/2.4/drivers/dunmodem -> /usr/src/debug/ofono/2.5/drivers/dunmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/quectelmodem -> /usr/src/debug/ofono/2.5/drivers/quectelmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/huaweimodem -> /usr/src/debug/ofono/2.5/drivers/huaweimodem, directory renamed /usr/src/debug/ofono/2.4/drivers/speedupmodem -> /usr/src/debug/ofono/2.5/drivers/speedupmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/isimodem -> /usr/src/debug/ofono/2.5/drivers/isimodem, directory renamed /usr/src/debug/ofono/2.4/drivers/ifxmodem -> /usr/src/debug/ofono/2.5/drivers/ifxmodem, directory renamed /usr/src/debug/ofono/2.4/gdbus -> /usr/src/debug/ofono/2.5/gdbus, directory renamed /usr/src/debug/ofono/2.4/drivers/ztemodem -> /usr/src/de
 bug/ofono/2.5/drivers/ztemodem, removed "/usr/src/debug/ofono/2.4/drivers/qmimodem/ctl.h /usr/src/debug/ofono/2.4/drivers/qmimodem/util.h /usr/src/debug/ofono/2.4/drivers/qmimodem/dms.h /usr/src/debug/ofono/2.4/plugins/nokia-gpio.h /usr/src/debug/ofono/2.4/drivers/qmimodem/network-registration.c /usr/src/debug/ofono/2.4/plugins/nokia-gpio.c /usr/src/debug/ofono/2.4/plugins/infineon.c /usr/src/debug/ofono/2.4/plugins/cinterion.c /usr/src/debug/ofono/2.4/plugins/mbm.c /usr/src/debug/ofono/2.4/drivers/qmimodem/voicecall.c /usr/src/debug/ofono/2.4/plugins/ril_intel.c /usr/src/debug/ofono/2.4/drivers/qmimodem/gprs-context.c /usr/src/debug/ofono/2.4/drivers/qmimodem/qmi.c /usr/src/debug/ofono/2.4/drivers/qmimodem/qmi.h /usr/src/debug/ofono/2.4/plugins/wavecom.c /usr/src/debug/ofono/2.4/plugins/samsung.c /usr/src/debug/ofono/2.4/plugins/sim7100.c /usr/src/debug/ofono/2.4/plugins/speedup.c /usr/src/debug/ofono/2.4/plugins/quectel.c /usr/src/debug/ofono/2.4/plugins/alcatel.c /usr/src/debug/o
 fono/2.4/plugins/calypso.c /usr/src/debug/ofono/2.4/plugins/bluez5.c /usr/src/debug/ofono/2.4/plugins/connman.c /usr/src/debug/ofono/2.4/plugins/gemalto.c /usr/src/debug/ofono/2.4/plugins/n900.c /usr/src/debug/ofono/2.4/plugins/huawei.c /usr/src/debug/ofono/2.4/plugins/rildev.c /usr/src/debug/ofono/2.4/plugins/bluez5.h /usr/src/debug/ofono/2.4/plugins/telit.c /usr/src/debug/ofono/2.4/plugins/ste.c /usr/src/debug/ofono/2.4/plugins/ril.h /usr/src/debug/ofono/2.4/drivers/qmimodem/netmon.c /usr/src/debug/ofono/2.4/plugins/ril.c /usr/src/debug/ofono/2.4/plugins/zte.c /usr/src/debug/ofono/2.4/drivers/qmimodem/sms.c /usr/src/debug/ofono/2.4/plugins/droid.c /usr/src/debug/ofono/2.4/plugins/phonesim.c /usr/src/debug/ofono/2.4/plugins/u8500.c /usr/src/debug/ofono/2.4/plugins/ublox.c /usr/src/debug/ofono/2.4/plugins/icera.c /usr/src/debug/ofono/2.4/plugins/nokia.c /usr/src/debug/ofono/2.4/plugins/push-notification.c /usr/src/debug/ofono/2.4/drivers/qmimodem/nas.c /usr/src/debug/ofono/2.4/drive
 rs/qmimodem/wms.h /usr/src/debug/ofono/2.4/plugins/dun_gw_bluez5.c /usr/src/debug/ofono/2.4/plugins/hfp_ag_bluez5.c /usr/src/debug/ofono/2.4/plugins/hfp_hf_bluez5.c /usr/src/debug/ofono/2.4/drivers/qmimodem/nas.h /usr/src/debug/ofono/2.4/drivers/qmimodem/sim.c /usr/src/debug/ofono/2.4/drivers/qmimodem/radio-settings.c /usr/src/debug/ofono/2.4/drivers/qmimodem/wds.h /usr/src/debug/ofono/2.4/plugins/smart-messaging.c /usr/src/debug/ofono/2.4/drivers/qmimodem/gprs.c /usr/src/debug/ofono/2.4/drivers/qmimodem/lte.c /usr/src/debug/ofono/2.4/drivers/qmimodem/sim-legacy.c /usr/src/debug/ofono/2.4/plugins/ifx.c /usr/src/debug/ofono/2.4/plugins/g1.c /usr/src/debug/ofono/2.4/drivers/qmimodem/voice.h /usr/src/debug/ofono/2.4/plugins/novatel.c /usr/src/debug/ofono/2.4/plugins/linktop.c /usr/src/debug/ofono/2.4/plugins/palmpre.c /usr/src/debug/ofono/2.4/drivers/qmimodem/devinfo.c /usr/src/debug/ofono/2.4/plugins/sierra.c /usr/src/debug/ofono/2.4/plugins/sim900.c /usr/src/debug/ofono/2.4/plugins/s
 temgr.c /usr/src/debug/ofono/2.4/plugins/xmm7xxx.c /usr/src/debug/ofono/2.4/plugins/udevng.c /usr/src/debug/ofono/2.4/drivers/qmimodem/ussd.c /usr/src/debug/ofono/2.4/plugins/upower.c /usr/src/debug/ofono/2.4/plugins/isiusb.c /usr/src/debug/ofono/2.4/plugins/hso.c /usr/src/debug/ofono/2.4/drivers/qmimodem/location-reporting.c /usr/src/debug/ofono/2.4/plugins/gobi.c /usr/src/debug/ofono/2.4/plugins/caif.c /usr/src/debug/ofono/2.4/plugins/mbim.c /usr/src/debug/ofono/2.4/drivers/qmimodem/uim.h /usr/src/debug/ofono/2.4/plugins/allowed-apns.c", added "/usr/src/debug/ofono/2.5/drivers/qmimodem/ctl.h /usr/src/debug/ofono/2.5/drivers/qmimodem/util.h /usr/src/debug/ofono/2.5/drivers/qmimodem/dms.h /usr/src/debug/ofono/2.5/plugins/nokia-gpio.h /usr/src/debug/ofono/2.5/plugins/xmm7xxx.c /usr/src/debug/ofono/2.5/drivers/qmimodem/network-registration.c /usr/src/debug/ofono/2.5/plugins/nokia-gpio.c /usr/src/debug/ofono/2.5/plugins/infineon.c /usr/src/debug/ofono/2.5/plugins/cinterion.c /usr/src/d
 ebug/ofono/2.5/plugins/mbm.c /usr/src/debug/ofono/2.5/drivers/qmimodem/voicecall.c /usr/src/debug/ofono/2.5/plugins/ril_intel.c /usr/src/debug/ofono/2.5/drivers/qmimodem/call-settings.c /usr/src/debug/ofono/2.5/drivers/qmimodem/gprs-context.c /usr/src/debug/ofono/2.5/drivers/qmimodem/qmi.c /usr/src/debug/ofono/2.5/drivers/qmimodem/qmi.h /usr/src/debug/ofono/2.5/plugins/gemalto.c /usr/src/debug/ofono/2.5/plugins/samsung.c /usr/src/debug/ofono/2.5/plugins/sim7100.c /usr/src/debug/ofono/2.5/plugins/speedup.c /usr/src/debug/ofono/2.5/plugins/quectel.c /usr/src/debug/ofono/2.5/plugins/wavecom.c /usr/src/debug/ofono/2.5/plugins/alcatel.c /usr/src/debug/ofono/2.5/plugins/calypso.c /usr/src/debug/ofono/2.5/plugins/bluez5.c /usr/src/debug/ofono/2.5/plugins/connman.c /usr/src/debug/ofono/2.5/plugins/n900.c /usr/src/debug/ofono/2.5/plugins/huawei.c /usr/src/debug/ofono/2.5/plugins/rildev.c /usr/src/debug/ofono/2.5/plugins/bluez5.h /usr/src/debug/ofono/2.5/plugins/telit.c /usr/src/debug/ofono/2
 .5/plugins/ste.c /usr/src/debug/ofono/2.5/plugins/ril.h /usr/src/debug/ofono/2.5/drivers/qmimodem/netmon.c /usr/src/debug/ofono/2.5/drivers/qmimodem/call-barring.c /usr/src/debug/ofono/2.5/plugins/ril.c /usr/src/debug/ofono/2.5/plugins/zte.c /usr/src/debug/ofono/2.5/drivers/qmimodem/sms.c /usr/src/debug/ofono/2.5/plugins/droid.c /usr/src/debug/ofono/2.5/plugins/phonesim.c /usr/src/debug/ofono/2.5/plugins/u8500.c /usr/src/debug/ofono/2.5/plugins/ublox.c /usr/src/debug/ofono/2.5/plugins/icera.c /usr/src/debug/ofono/2.5/plugins/nokia.c /usr/src/debug/ofono/2.5/plugins/push-notification.c /usr/src/debug/ofono/2.5/drivers/qmimodem/nas.c /usr/src/debug/ofono/2.5/drivers/qmimodem/wms.h /usr/src/debug/ofono/2.5/plugins/dun_gw_bluez5.c /usr/src/debug/ofono/2.5/plugins/hfp_ag_bluez5.c /usr/src/debug/ofono/2.5/plugins/hfp_hf_bluez5.c /usr/src/debug/ofono/2.5/drivers/qmimodem/nas.h /usr/src/debug/ofono/2.5/drivers/qmimodem/sim.c /usr/src/debug/ofono/2.5/drivers/qmimodem/radio-settings.c /usr/sr
 c/debug/ofono/2.5/drivers/qmimodem/wds.h /usr/src/debug/ofono/2.5/drivers/qmimodem/call-forwarding.c /usr/src/debug/ofono/2.5/plugins/smart-messaging.c /usr/src/debug/ofono/2.5/drivers/qmimodem/gprs.c /usr/src/debug/ofono/2.5/drivers/qmimodem/lte.c /usr/src/debug/ofono/2.5/drivers/qmimodem/sim-legacy.c /usr/src/debug/ofono/2.5/plugins/ifx.c /usr/src/debug/ofono/2.5/plugins/g1.c /usr/src/debug/ofono/2.5/drivers/qmimodem/voice.h /usr/src/debug/ofono/2.5/plugins/novatel.c /usr/src/debug/ofono/2.5/plugins/linktop.c /usr/src/debug/ofono/2.5/plugins/palmpre.c /usr/src/debug/ofono/2.5/drivers/qmimodem/devinfo.c /usr/src/debug/ofono/2.5/plugins/sierra.c /usr/src/debug/ofono/2.5/plugins/sim900.c /usr/src/debug/ofono/2.5/plugins/stemgr.c /usr/src/debug/ofono/2.5/plugins/udevng.c /usr/src/debug/ofono/2.5/plugins/upower.c /usr/src/debug/ofono/2.5/drivers/qmimodem/ussd.c /usr/src/debug/ofono/2.5/plugins/isiusb.c /usr/src/debug/ofono/2.5/plugins/hso.c /usr/src/debug/ofono/2.5/drivers/qmimodem/loc
 ation-reporting.c /usr/src/debug/ofono/2.5/plugins/gobi.c /usr/src/debug/ofono/2.5/plugins/mbim.c /usr/src/debug/ofono/2.5/drivers/qmimodem/uim.h /usr/src/debug/ofono/2.5/plugins/allowed-apns.c"
packages/core2-64-poky-linux/ofono/ofono-src: PKGSIZE changed from 4737332 to 4759394 (+0%)
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono: PKGSIZE changed from 2195132 to 2206756 (+1%)

--===============9034193371875997185==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.4-2.5.patch"

RnJvbSA2MzEyYTE5YmI2OTE5OTAwOTA4ZmE0ODhlNDY3MmMyMDUyYjZjNDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTc6MzE6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjQgLT4gMi41CgotLS0KIC4uLi1tYmltLWFkZC1hbi1vcHRpb25hbC1U
RU1QX0ZBSUxVUkVfUkVUUlktbWFjcm8tY29weS5wYXRjaCB8IDUgKy0tLS0KIC4uLmJpbS1GaXgt
YnVpbGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaCB8IDQgKyst
LQogLi4uL29mb25vL3tvZm9ub18yLjQuYmIgPT4gb2Zvbm9fMi41LmJifSAgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi40
LmJiID0+IG9mb25vXzIuNS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29mb25vL29mb25vLzAwMDEtbWJpbS1hZGQtYW4tb3B0aW9uYWwtVEVNUF9GQUlM
VVJFX1JFVFJZLW1hY3JvLWNvcHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vLzAwMDEtbWJpbS1hZGQtYW4tb3B0aW9uYWwtVEVNUF9GQUlMVVJFX1JFVFJZLW1h
Y3JvLWNvcHkucGF0Y2gKaW5kZXggOGE1YTMwMGFkYy4uYTg0NDdiZDBjZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby8wMDAxLW1iaW0tYWRkLWFuLW9w
dGlvbmFsLVRFTVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1U
RU1QX0ZBSUxVUkVfUkVUUlktbWFjcm8tY29weS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MjJiNTJkYjQ4NDI2MTFhYzMxYTM1NmYwMjNmYzA5NTk1Mzg0ZTJhZCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gMGVmOTdiOGZjNGQzNWJkOGI5MDMxYWMxOTA4YjAwNTFhYTdhODdhOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiBEYXRlOiBUaHUsIDIzIE1heSAyMDE5IDE4OjExOjIyIC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIG1iaW06IGFkZCBhbiBvcHRpb25hbCBURU1QX0ZBSUxVUkVfUkVUUlkgbWFjcm8gY29weQpA
QCAtMzEsNiArMzEsMyBAQCBpbmRleCBlMTU5MjM1Li41MTY5M2VhIDEwMDY0NAogIGVudW0gbWJp
bV9jb250cm9sX21lc3NhZ2UgewogIAlNQklNX09QRU5fTVNHID0gMHgxLAogIAlNQklNX0NMT1NF
X01TRyA9IDB4MiwKLS0tIAotMi4yMS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAwMi1tYmltLUZpeC1idWlsZC13aXRoLWVsbC0wLjM5LWJ5
LXJlc3RvcmluZy11bmxpa2VseS1tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
Zm9uby9vZm9uby8wMDAyLW1iaW0tRml4LWJ1aWxkLXdpdGgtZWxsLTAuMzktYnktcmVzdG9yaW5n
LXVubGlrZWx5LW0ucGF0Y2gKaW5kZXggMzY1NWIzZmQ2Ni4uZDNmNDJmMjRjOSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby8wMDAyLW1iaW0tRml4LWJ1
aWxkLXdpdGgtZWxsLTAuMzktYnktcmVzdG9yaW5nLXVubGlrZWx5LW0ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby8wMDAyLW1iaW0tRml4LWJ1aWxkLXdp
dGgtZWxsLTAuMzktYnktcmVzdG9yaW5nLXVubGlrZWx5LW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDc2ZTQwNTQ4MDEzNTBlYmQ0YTQ0MDU3Mzc5NDMxYTMzZDQ2MGFkMGYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGQ0MWIzYTAzNWRlYWNjZDgxZTE5YTExMmFmMjMzYmJiYjcx
MDZlMDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJ0aW4gSmFuc2EgPE1hcnRp
bi5KYW5zYUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIxIEFwciAyMDIxIDExOjAxOjM0ICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIG1iaW06IEZpeCBidWlsZCB3aXRoIGVsbC0wLjM5IGJ5IHJlc3Rv
cmluZyB1bmxpa2VseSBtYWNybwpAQCAtMTIsNyArMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBNYXJ0
aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYmltbW9kZW0vbWJpbS1wcml2YXRl
LmggYi9kcml2ZXJzL21iaW1tb2RlbS9tYmltLXByaXZhdGUuaAotaW5kZXggNTE2OTNlYWUuLmQ5
MTczMTJjIDEwMDY0NAoraW5kZXggNTE2OTNlYS4uZDkxNzMxMiAxMDA2NDQKIC0tLSBhL2RyaXZl
cnMvbWJpbW1vZGVtL21iaW0tcHJpdmF0ZS5oCiArKysgYi9kcml2ZXJzL21iaW1tb2RlbS9tYmlt
LXByaXZhdGUuaAogQEAgLTMwLDYgKzMwLDEwIEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuNC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb2Zvbm8vb2Zvbm9fMi41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi40LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuNS5iYgppbmRleCBkYWU1Y2MzYzI1
Li5iNjhlYjk5ZmE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25v
L29mb25vXzIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25v
XzIuNS5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vMDAwMS1t
YmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxVUkVfUkVUUlktbWFjcm8tY29weS5wYXRjaCBc
CiAgICAgZmlsZTovLzAwMDItbWJpbS1GaXgtYnVpbGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3Jp
bmctdW5saWtlbHktbS5wYXRjaCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTM1ODBhZGMx
YWZkMTg5MGRjNTE2ZWZiMDY5ZGUwYzVjZGZlZjAxNDQxNTI1NmRkZmIyOGFiMTcyZGYyZDExZCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwZjRlMDM4NjMxOGFkYmE2YTZhNjEzNTE0M2ZiNTgyMWFk
M2RmZGE0ZmZiN2ZhMzc4NmM3NDMzZjAwNWIyNzNmIgogCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcgdXBkYXRlLXJjLmQgc3lzdGVtZCBnb2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YQogCi0t
IAoyLjQyLjAKCg==

--===============9034193371875997185==--

