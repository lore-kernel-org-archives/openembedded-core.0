Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1427.1794341066336718008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 12:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ix6ZbyE0;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: montrealtango@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so1575076e0c.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 12:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794341065; x=1794945865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBnl9QVep/wndSn6s7fYNgyUUrrdltri9VzW9PAxEgg=;
        b=Ix6ZbyE0KU/xyw4vnJ9R33ZXYRpO2hqRcYi4RAaUd4zOINMPASwiYkAKLGYyK1+2Z8
         uluPKYKwtqEu5grudJ2cwBfmCEryLEoZRxdA+etA3NVCI48oQvcGTIhmPxa8yxOnHxEq
         WnOgkqZ2iklpWheNFKwPeKZxAAhrKdgiyuP/kZtqyFOx5pxk5YzzDF5u28aR/25oM739
         vPXzWc54q0iCTuOUz+X6EFNvosWVXeKY1Bh4n1Z5xkPZXrhh7MPoYU52WKB8GBLj5ldX
         esum+ZZbYoqWdzM2eBU+/AOHuMHGdm25TOSFF3zySB6MCJI7qNKMQvNmD1XWk6oTjR4w
         YDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341065; x=1794945865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBnl9QVep/wndSn6s7fYNgyUUrrdltri9VzW9PAxEgg=;
        b=IJ5V+khHrjDjBYUutAbTTygTjXUxoyE+/OJFo5JdjwcH70y5QPOuZ/abzTgdat1VWU
         K6hRdVN927uPb90X5KPC1OSmMWA6GvjEGIqpR1jsQgH5MugsOLhGxueFx7gSDd3j8At+
         AH1mTYR8svQg6ZGCaxZRwrjeHVlI1xolwBgT97ryeloccTyECZ086o0ytegq/luVvGBs
         +EEDulD2cN+Zxu1rQsdQGaxMYUd5RXLzATrUy0AnXLAjFFxCgFmUQLwCt/zyfA0ipWcD
         DmJ3YWILfLt54Hj8RjmCcHOQg6haPL0GHwsKl2beF/QX4GY1Rr3GEOIFnep1wvD2xS8y
         0SCQ==
X-Gm-Message-State: APuU4Z8YbPnHnjvdLNUrWFkieecQ0MkRDVnueQPkjXaA6/+pWzFuQ4OL
	uRLhWq3axOP5ay6sbKm1b6RbShg5YXA82/l/idfZ16Jn9VafjbCoeVQNj1nQCcmFsw==
X-Gm-Gg: AYBFou3fs8rS8K5BUcfakz9UrXniie6RPagz9dEx1S0lOwwwUr6yFcNqi7usDD7Xqzg
	ZIphIEY1/BxqyEVd3TVICqylkwJbZ4gmUYvk3BIXmLOD0YlXyMjvpv8XKKhMVULa+FoazrOmoOh
	bRTCLtDfV+h++9XbSdu5oiEn5+JT97L3JqxcKfqok6vUJlckHnywYtyTVSmWmsWQJ12bbYFaZWV
	HoY4Cq8Jys4g9EXwhitNEcMfeeLay8cwtReTUpIovK3xOPF/3YXeIIkow668eH4bTUenG0NUpWz
	W7ypZcKjUdV8zulzG37tYU3wFrn05gqBJJiv4bMuqjvKOTcyDM+rKqjJejFGf/KgkZ+Pl8gAbQX
	QMankSwciGbtd8E5SJaRyAlDte6Pl6PupmPFo8vmWQ/ii/BcAbdcWfpDVPWe9vvHCLidi0HOM9v
	nVY1fJ/Ft5LFKDoh+kial5xEX5fl+wvhaINjjeCevyWJFwE7sP3ilvcaJmeAj1OGcz1ZpdKptru
	wpX0gGrPRO/uDzH9Q6C9M0R1WOP9uLKDDPT2tVgozKhkd14DAggwi3BH4j7G39qoBUW6s0NP6Y/
	q4ngv8NWelLY2KqJ1XW/2vdmfEVq
X-Received: by 2002:a05:6122:2192:b0:5ec:b371:ee45 with SMTP id 71dfb90a1353d-5ee0d180849mr1645505e0c.16.1794341065209;
        Tue, 10 Nov 2026 12:04:25 -0800 (PST)
Return-Path: <montrealtango@gmail.com>
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c58ee8csm2422994e0c.6.2026.11.10.12.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:04:24 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH] linux-firmware: split out rtl8125 firmware
Date: Tue, 10 Nov 2026 15:03:41 -0500
Message-ID: <20261110200341.3435701-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 20:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249933
Content-Type: text/plain; charset="utf-8"

Add a dedicated rtl8125 package, as already done for rtl8168, so that
images for boards with RTL8125 2.5G NICs can install just this firmware
instead of the whole rtl-nic catch-all:

linux-firmware: PACKAGES: added "linux-firmware-rtl8125"
linux-firmware/linux-firmware-rtl-nic: PKGSIZE changed from 132820 to 81364 (-39%)

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---
 .../linux-firmware/linux-firmware_20261019.bb               | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
index 6fe22d9a..01341a81 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
@@ -538,6 +538,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-rtl8261c ${PN}-rtl8261d ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8761 \
+             ${PN}-rtl8125 \
              ${PN}-rtl8168 \
              ${PN}-rtl8822 \
              ${PN}-rtl8192 ${PN}-rtl8710 ${PN}-rtl8812 \
@@ -1689,6 +1690,7 @@ LICENSE:${PN}-rtl8703 = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl8814 = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl-license = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl-nic = "LicenseRef-Firmware-WHENCE"
+LICENSE:${PN}-rtl8125 = "LicenseRef-Firmware-WHENCE"
 LICENSE:${PN}-rtl8168 = "LicenseRef-Firmware-WHENCE"
 
 FILES:${PN}-rtl-license = " \
@@ -1726,6 +1728,9 @@ FILES:${PN}-rtl8821 = " \
 FILES:${PN}-rtl8761 = " \
   ${firmwaredir}/rtl_bt/rtl8761*.bin* \
 "
+FILES:${PN}-rtl8125 = " \
+  ${firmwaredir}/rtl_nic/rtl8125*.fw* \
+"
 FILES:${PN}-rtl8168 = " \
   ${firmwaredir}/rtl_nic/rtl8168*.fw* \
 "
@@ -1781,6 +1786,7 @@ RDEPENDS:${PN}-rtl8852 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8922 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8703 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8814 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8125 += "${PN}-whence-license"
 RDEPENDS:${PN}-rtl8168 += "${PN}-whence-license"
 RDEPENDS:${PN}-rtl-nic += "${PN}-whence-license"
 
-- 
2.53.0

