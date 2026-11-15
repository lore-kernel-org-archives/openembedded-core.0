Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15473.1794779809811607790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=k0whmIb0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261115215646aa03b6a90a000207ca-j0bhdl@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261115215646aa03b6a90a000207ca
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:56:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sODf0mTcFW7XyCeQhyK284YDHGvi85XPxfsb3/Al2dE=;
 b=k0whmIb0QdX1qcmcC4hWw20hPEIXNhxiLHnCWuXnGT/cVACv5lfU1bt4QTIb4zumdHITR3
 N132TLnIm6wdkqASnuYOtrhBFVNuZ+RLqRHSx5GUs78KmHL0ytIaupJ2D9PSEFWh9dGPX0Gr
 KOo3mMENG8FmgPwfxminfEtv1mEa62CsEik9W7I2bUP5GXOIgqlq7Bc3sjOSZF0oS6pTSAzk
 JUkq5IAIG9jlDos7s8GfTf8tIK7+2/R3jTRY3FEwy+JxWL+9xqnpWdqiLXn47QkKw5WwCoe9
 AhIJwYQTwNqO+RfPKgB6Q6xL5i6j/NhxtobZv38c5qufouy/pbZ3/kKg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] libXi: upgrade 1.8.3 -> 1.8.4
Date: Sun, 15 Nov 2026 22:56:31 +0100
Message-ID: <20261115215631.1679815-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250299
Content-Type: text/plain; charset="utf-8"

From: Omkar Patil <OmkarAbaji.Patil@windriver.com>

Security and bug-fix point release;

Fixes the following CVEs:
*CVE-2026-93541: Out-of-bounds read in libXi's XQueryDeviceState().
*CVE-2026-93542: Out-of-bounds read in libXi's XI2 class parsing via size_classes()
                 and copy_classes().
*CVE-2026-93543: Out-of-bounds read in libXi's XI2 class parser.
*CVE-2026-93544: Out-of-bounds read in libXi's XI2 XIQueryDevice reply parsing.
*CVE-2026-93545: Out-of-bounds read in libXi's XListInputDevices().
*CVE-2026-94281: Out-of-bounds read in libXi's XListInputDevices() class parsing.
*CVE-2026-94282: Out-of-bounds read in libXi's XI2 enter/leave/focus cookie conversion.
*CVE-2026-109089: libXi XGetDeviceControl Control Type Mismatch Heap Buffer Overflow
*CVE-2026-109090: libXi XGetDeviceControl DEVICE_ENABLE Heap Buffer Overflow

Reference:
https://lists.x.org/archives/xorg-announce/2026-October/003752.html
https://lists.x.org/archives/xorg-announce/2026-October/003754.html

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: b6c5754865ea76ccb565c7209989352deaea2f3a)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xorg-lib/{libxi_1.8.3.bb => libxi_1.8.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.3.bb => libxi_1.8.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
index 240215379fe..fb89e3e5262 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "7ad60056f01af4f786cfe93b3a7707447711626fc8da2637bec71a90409babe5"
+SRC_URI[sha256sum] = "ddd6057b89a91903bc2f884d55c8467440906945e482c36547260dff28661afc"
 
 BBCLASSEXTEND = "native nativesdk"
