Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3237DC3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:22 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.33439.1743021019962535018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=frknSN/y;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff64550991so273722a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021019; x=1743625819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz336LxZ/SKzmkvtOaOulE9apgTyp+2HWoa0qh2X6CE=;
        b=frknSN/yQZci0CvSuvW7I2es2DaGxg699PLNMvwDFsreS2Ov4uaT2ZIz1Rlzz7Hpb0
         yGAD8qw2x2gSub4+mtUV6Ey/xtFjzgegZDPVCPbPCbInmYK6Qu4ect0BAVUEjowq8W3P
         iwqfzYLgH/JvplicAAEbwdocmgQwe0Lei9jGGIUqcJIVBX0+zWP35LJ+RSsqn6RnZM+P
         gGu/ClHeB2bRjkSkuLhaX7wgw/+SUeRaRftWaLJeedLEMgBLsdz6evLZekzYtAMJgvTN
         48BaG/IEYRSmrcoJx72yXzbq+ge5iSpI2tjuSjsGX69HqaH0w6KQUqb5HMVZ7EqaJyHW
         zrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021019; x=1743625819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz336LxZ/SKzmkvtOaOulE9apgTyp+2HWoa0qh2X6CE=;
        b=rxHagPBwJh9vla1b0IVfvP9ufmDy9vzD1XZyx/7rhGeKB4RerKAQMFmkaetNqzrrSJ
         rPjdapHL+CPkIR3PL0Av+eHGPHjiVljU4x90qZQGhxEcCTAQ/FDJ0WHjlL1vJCKKJ8FG
         KQRdD4EWS6UpvHfgvKTaOty3kRgtKVhLonUHHJaRDcEIyjloOGg4UfDjW+lkuBFgYuhq
         JVqrmwY/iztuMhrjD92tLi8o7KPYfo4ELx6SfGHvD/cR+sydco9uZTeKmGk0m1vxLF7T
         7feEHJrr+Y12CqOi+HjJQiOAT+MDE6D4J0PwtHtpohNctPcD5MD3UccA/YH/SOhyrYjC
         x/Aw==
X-Gm-Message-State: AOJu0YxMCJAx28ku6xHPgT3hpRV3W5TQxAKwOdFCpFp5fBCelhzMO9Gk
	rGZKPKOr8FOvWGyF9A+JRPcom9YhywsDMWiWNPQ/jV1DIbWETaAUWwwNgBMZ
X-Gm-Gg: ASbGncswNIeTzADcr9iyiAv7u6X8SYdNp+lk3D48gg6YyLLfSOgxCqGVRhvEuk0lNGL
	gnkiZlf/Za2+3hpDrGeh1ag/rmJ5KGx6csp8+otdT5dKb8DpU0NwgqKAgb00AmZ06HO9LZdeqjX
	oWMfgChwXTHXm+qGSEoxNNA8nG/FnjJJDNg3rgTdTPUZIjwa/rO9LeEtC7yQb3Vy9Rp4Enb8DA5
	BxjZ/TQbTc6cFgioWSCiv6NQ0adpDwd7WQG5j2HGo3Y0VMbVJALE75skA40OzLRFU+r/UG1jppJ
	6ghLFb8TAR+QzZ+obYefMMcX+JvbmTE7uJATidJZTzvJ96cIcgoHZlFtnZv2W3vcqzs=
X-Google-Smtp-Source: AGHT+IHN9bwWgWRpu2oE0yCKQtI86HhHWZATOfS8Z0M8MpNWamPYzLddm+fXlaOi0ymYo2EkBWHN8g==
X-Received: by 2002:a17:90b:39cc:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-303a85c19dcmr1233699a91.26.1743021018831;
        Wed, 26 Mar 2025 13:30:18 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:18 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Zoltan Boszormenyi <zboszor@gmail.com>
Subject: [styhead][PATCH v2 29/31] linux-firmware: Fix packaging of some subpackages
Date: Wed, 26 Mar 2025 17:28:15 -0300
Message-Id: <20250326202817.64437-30-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213689

From: Zoltan Boszormenyi <zboszor@gmail.com>

Since commit c0fedbc7 ("linux-firmware: Upgrade to 20241017 and
allow compressing firmware") more firmware files were added and
some subpackages have been split further.

Some of these new subpackages do not use the correct globbing so
when FIRMWARE_COMPRESSION is set, the firmware files end up in
a different subpackage than they were intended.

For example, linux-firmware-amdgpu-aldebaran and others are empty
and everything ends up in linux-firmware-amdgpu-misc.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5299816c59ea01905cfb73c72421bb8f11149426)
---
 .../linux-firmware/linux-firmware_20250211.bb | 208 +++++++++---------
 1 file changed, 104 insertions(+), 104 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index aec36a7a7fcc..68e0a3b1e4ae 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -662,89 +662,89 @@ ALLOW_EMPTY:${PN}-ath12k = "1"
 ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
 FILES:${PN}-qca-qca61x4-serial = " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin* \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin* \
 "
 FILES:${PN}-qca-qca61x4-usb = " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin* \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin* \
 "
 FILES:${PN}-qca-qca6390 = " \
-  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
-  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
+  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/htnv20.bin* \
 "
 FILES:${PN}-qca-qca6698 = " \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpbtfw21.tlv \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b206 \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207 \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b206* \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207* \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin* \
 "
 FILES:${PN}-qca-wcn3950 = " \
-  ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv \
-  ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv \
-  ${nonarch_base_libdir}/firmware/qca/cmnv12.bin \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13.bin \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13s.bin \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13t.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv12.bin* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13.bin* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13s.bin* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13t.bin* \
 "
 FILES:${PN}-qca-wcn3988 = " \
-  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
-  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
-  ${nonarch_base_libdir}/firmware/qca/apnv10.bin \
-  ${nonarch_base_libdir}/firmware/qca/apnv11.bin \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/apnv10.bin* \
+  ${nonarch_base_libdir}/firmware/qca/apnv11.bin* \
 "
 FILES:${PN}-qca-wcn399x = " \
-  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv \
-  ${nonarch_base_libdir}/firmware/qca/crnv21.bin \
-  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv \
-  ${nonarch_base_libdir}/firmware/qca/crnv32.bin \
-  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/crnv21.bin* \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/crnv32.bin* \
+  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin* \
 "
 FILES:${PN}-qca-wcn6750 = " \
-  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn \
-  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.bin \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.b09 \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn* \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.bin* \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a* \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b09* \
 "
 FILES:${PN}-qca-qca2066 = " \
-  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.301 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.302 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.309 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111 \
+  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.301* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.302* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.309* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
 "
 FILES:${PN}-qca-wcn7850 = " \
-  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112 \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin \
+  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f* \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112* \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin* \
 "
 FILES:${PN}-qca-misc = "${nonarch_base_libdir}/firmware/qca/*"
 # -qca is a virtual package that depends upon all qca packages.
@@ -912,45 +912,45 @@ LICENSE:${PN}-amdgpu-vega12 = "Firmware-amdgpu"
 LICENSE:${PN}-amdgpu-misc = "Firmware-amdgpu"
 
 FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
-FILES:${PN}-amdgpu-aldebaran = "${nonarch_base_libdir}/firmware/amdgpu/aldebaran_*.bin"
-FILES:${PN}-amdgpu-carrizo = "${nonarch_base_libdir}/firmware/amdgpu/carrizo_*.bin"
-FILES:${PN}-amdgpu-cezanne = "${nonarch_base_libdir}/firmware/amdgpu/green_sardine_*.bin"
-FILES:${PN}-amdgpu-fiji = "${nonarch_base_libdir}/firmware/amdgpu/fiji_*.bin"
-FILES:${PN}-amdgpu-hawaii = "${nonarch_base_libdir}/firmware/amdgpu/hawaii_*.bin"
-FILES:${PN}-amdgpu-navi10 = "${nonarch_base_libdir}/firmware/amdgpu/navi10_*.bin"
-FILES:${PN}-amdgpu-navi14 = "${nonarch_base_libdir}/firmware/amdgpu/navi14_*.bin"
-FILES:${PN}-amdgpu-navi21 = "${nonarch_base_libdir}/firmware/amdgpu/sienna_cichlid_*.bin"
-FILES:${PN}-amdgpu-navi22 = "${nonarch_base_libdir}/firmware/amdgpu/navy_flounder_*.bin"
-FILES:${PN}-amdgpu-navi23 = "${nonarch_base_libdir}/firmware/amdgpu/dimgrey_cavefish_*.bin"
-FILES:${PN}-amdgpu-navi24 = "${nonarch_base_libdir}/firmware/amdgpu/beige_goby_*.bin"
-FILES:${PN}-amdgpu-navi31 = "${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_0_*.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_sos.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_ta.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_0.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_0.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin \
+FILES:${PN}-amdgpu-aldebaran = "${nonarch_base_libdir}/firmware/amdgpu/aldebaran_*.bin*"
+FILES:${PN}-amdgpu-carrizo = "${nonarch_base_libdir}/firmware/amdgpu/carrizo_*.bin*"
+FILES:${PN}-amdgpu-cezanne = "${nonarch_base_libdir}/firmware/amdgpu/green_sardine_*.bin*"
+FILES:${PN}-amdgpu-fiji = "${nonarch_base_libdir}/firmware/amdgpu/fiji_*.bin*"
+FILES:${PN}-amdgpu-hawaii = "${nonarch_base_libdir}/firmware/amdgpu/hawaii_*.bin*"
+FILES:${PN}-amdgpu-navi10 = "${nonarch_base_libdir}/firmware/amdgpu/navi10_*.bin*"
+FILES:${PN}-amdgpu-navi14 = "${nonarch_base_libdir}/firmware/amdgpu/navi14_*.bin*"
+FILES:${PN}-amdgpu-navi21 = "${nonarch_base_libdir}/firmware/amdgpu/sienna_cichlid_*.bin*"
+FILES:${PN}-amdgpu-navi22 = "${nonarch_base_libdir}/firmware/amdgpu/navy_flounder_*.bin*"
+FILES:${PN}-amdgpu-navi23 = "${nonarch_base_libdir}/firmware/amdgpu/dimgrey_cavefish_*.bin*"
+FILES:${PN}-amdgpu-navi24 = "${nonarch_base_libdir}/firmware/amdgpu/beige_goby_*.bin*"
+FILES:${PN}-amdgpu-navi31 = "${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_0_*.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_sos.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_ta.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_0.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_0.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin* \
 "
-FILES:${PN}-amdgpu-navi32 = "${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_3_*.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_sos.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_ta.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_3.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_10.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin \
+FILES:${PN}-amdgpu-navi32 = "${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_3_*.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_sos.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_ta.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_3.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_10.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin* \
 "
-FILES:${PN}-amdgpu-oland = "${nonarch_base_libdir}/firmware/amdgpu/oland_*.bin"
-FILES:${PN}-amdgpu-polaris10 = "${nonarch_base_libdir}/firmware/amdgpu/polaris10_*.bin"
-FILES:${PN}-amdgpu-polaris11 = "${nonarch_base_libdir}/firmware/amdgpu/polaris11_*.bin"
-FILES:${PN}-amdgpu-polaris12 = "${nonarch_base_libdir}/firmware/amdgpu/polaris12_*.bin"
-FILES:${PN}-amdgpu-raven = "${nonarch_base_libdir}/firmware/amdgpu/raven_*.bin"
-FILES:${PN}-amdgpu-rembrandt = "${nonarch_base_libdir}/firmware/amdgpu/yellow_carp_*.bin"
-FILES:${PN}-amdgpu-renoir = "${nonarch_base_libdir}/firmware/amdgpu/renoir_*.bin"
-FILES:${PN}-amdgpu-stoney = "${nonarch_base_libdir}/firmware/amdgpu/stoney_*.bin"
-FILES:${PN}-amdgpu-tonga = "${nonarch_base_libdir}/firmware/amdgpu/tonga_*.bin"
-FILES:${PN}-amdgpu-topaz = "${nonarch_base_libdir}/firmware/amdgpu/topaz_*.bin"
-FILES:${PN}-amdgpu-vega10 = "${nonarch_base_libdir}/firmware/amdgpu/vega10_*.bin"
-FILES:${PN}-amdgpu-vega12 = "${nonarch_base_libdir}/firmware/amdgpu/vega12_*.bin"
+FILES:${PN}-amdgpu-oland = "${nonarch_base_libdir}/firmware/amdgpu/oland_*.bin*"
+FILES:${PN}-amdgpu-polaris10 = "${nonarch_base_libdir}/firmware/amdgpu/polaris10_*.bin*"
+FILES:${PN}-amdgpu-polaris11 = "${nonarch_base_libdir}/firmware/amdgpu/polaris11_*.bin*"
+FILES:${PN}-amdgpu-polaris12 = "${nonarch_base_libdir}/firmware/amdgpu/polaris12_*.bin*"
+FILES:${PN}-amdgpu-raven = "${nonarch_base_libdir}/firmware/amdgpu/raven_*.bin*"
+FILES:${PN}-amdgpu-rembrandt = "${nonarch_base_libdir}/firmware/amdgpu/yellow_carp_*.bin*"
+FILES:${PN}-amdgpu-renoir = "${nonarch_base_libdir}/firmware/amdgpu/renoir_*.bin*"
+FILES:${PN}-amdgpu-stoney = "${nonarch_base_libdir}/firmware/amdgpu/stoney_*.bin*"
+FILES:${PN}-amdgpu-tonga = "${nonarch_base_libdir}/firmware/amdgpu/tonga_*.bin*"
+FILES:${PN}-amdgpu-topaz = "${nonarch_base_libdir}/firmware/amdgpu/topaz_*.bin*"
+FILES:${PN}-amdgpu-vega10 = "${nonarch_base_libdir}/firmware/amdgpu/vega10_*.bin*"
+FILES:${PN}-amdgpu-vega12 = "${nonarch_base_libdir}/firmware/amdgpu/vega12_*.bin*"
 FILES:${PN}-amdgpu-misc = "${nonarch_base_libdir}/firmware/amdgpu/*"
 # -amdgpu is a virtual package that depends upon all amdgpu packages.
 ALLOW_EMPTY:${PN}-amdgpu = "1"
@@ -1500,8 +1500,8 @@ FILES:${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43362-sdio.*"
 FILES:${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43430-sdio.*"
-FILES:${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin \
+FILES:${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin* \
 "
 FILES:${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
-- 
2.39.5


