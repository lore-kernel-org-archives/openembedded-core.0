Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AF9C47088
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.13.1668103988122902521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JxvxLU50;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 187-20020a1c02c4000000b003cf9c3f3b80so4062432wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBRD/vPQOYP90BCCN6vLKqN2WpojLRtmqZYMOW+jglE=;
        b=JxvxLU50h5yfNYniSKg4iMpbchOevOq4LiLMYXI8KZKlWIAJIr0vLR8oK6IYKWw47E
         RKg4TSp4u1XBVy8l3s5VgcIachQsrMSZOMPa3J/Gjli9VbmVPJnB51pAGp3n+MqKfN/W
         3aPhbEa6V5YefFtaCUDkplIgVr1USDhCeyeOz2BquiOdJE6+3c5L0tQxMg+8WJAvnd49
         52ZN8z7PHS4eiT5gXvHXDY0PbkXuMwQgSsUlHtBCJR3ysxLcDT0b+NfqSpTMZP9Cg3Gm
         bs5nnarvYclwCUU3M6Y22KRTcrcb21+3cCq9ws/JIaS3uJ5Ts1obMz60ryekp6voAouC
         pAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBRD/vPQOYP90BCCN6vLKqN2WpojLRtmqZYMOW+jglE=;
        b=S+/jzunvuNVw5k1kwpE3eWpFzO9VF3TTxxCPftCWhS2fe4OrdH0z67C1rhiUuaIBBh
         j9RRs1gLhsl5FQwTvALvNiONhU+guRJwOtB/BnkRSOzkxyQ5/hrFAuF2s6VZBUVuSLVo
         G+kv+5Ow9gTQoYky31kdC8BpGSih+p+gg9JqUJ3GEfcU3QPs3YzD7bG7r680Yec2clDN
         Y9UXL5bkJU0NWg9hkctVqVKjzq1axl9u3h4/7n04X3yhJRzhE+X4MCT4hibnskyxFl8w
         +aqr6ySRxi2rP0o5GL8AwEqzCH61nIbmIs8stDOTp8pqApdk4mGXuyfcnDRNbxvIvPTV
         EZuw==
X-Gm-Message-State: ACrzQf0pfkvA5JCADrioE9Tx9ZTfmKGIBBX3q/w0wXFLWhhFlYyerOkf
	k04q99tY1H7PqF8qKiZVcMh7k9DArzQ=
X-Google-Smtp-Source: AMsMyM4nbv/FJ39tLyFBoSnJ6WAj9+Si03tqVWY2gMD6WsEthrk67IDotUQD0YKq4Hk8Bxo/pIJo7A==
X-Received: by 2002:a05:600c:1d9c:b0:3cf:6ab3:49ce with SMTP id p28-20020a05600c1d9c00b003cf6ab349cemr1078240wms.137.1668103986601;
        Thu, 10 Nov 2022 10:13:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/19] libxext: update 1.3.4 -> 1.3.5
Date: Thu, 10 Nov 2022 19:12:40 +0100
Message-Id: <20221110181249.1240200-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173094

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/xorg-lib/a              | 33 +++++++++++++++++++
 .../{libxext_1.3.4.bb => libxext_1.3.5.bb}    |  7 ++--
 2 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/a
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.4.bb => libxext_1.3.5.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/a b/meta/recipes-graphics/xorg-lib/a
new file mode 100644
index 0000000000..a5a08000df
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/a
@@ -0,0 +1,33 @@
+libdmx_1.1.4.bb
+libfontenc_1.1.6.bb
+libice_1.0.10.bb
+libpciaccess_0.17.bb
+libsm_1.2.3.bb
+libx11_1.8.1.bb
+libx11-compose-data_1.6.8.bb
+libxau_1.0.10.bb
+libxcomposite_0.4.5.bb
+libxcursor_1.2.1.bb
+libxdamage_1.1.5.bb
+libxdmcp_1.1.3.bb
+libxext_1.3.4.bb
+libxfixes_6.0.0.bb
+libxfont_1.5.4.bb
+libxfont2_2.0.6.bb
+libxft_2.3.6.bb
+libxi_1.8.bb
+libxinerama_1.1.5.bb
+libxkbfile_1.1.1.bb
+libxmu_1.1.4.bb
+libxpm_3.5.13.bb
+libxrandr_1.5.2.bb
+libxrender_0.9.11.bb
+libxres_1.2.1.bb
+libxscrnsaver_1.2.3.bb
+libxshmfence_1.3.1.bb
+libxt_1.2.1.bb
+libxtst_1.2.4.bb
+libxv_1.0.11.bb
+libxvmc_1.0.13.bb
+libxxf86vm_1.1.5.bb
+xtrans_1.4.0.bb
diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
index a0ba54d184..d4d4119485 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
@@ -11,7 +11,7 @@ extensions."
 require xorg-lib-common.inc
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=879ce266785414bd1cbc3bc2f4d9d7c8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4234bb3b2f1521ea101e4e9db7c33c69"
 
 DEPENDS += "xorgproto virtual/libx11"
 PROVIDES = "xext"
@@ -19,8 +19,7 @@ PROVIDES = "xext"
 PE = "1"
 
 XORG_PN = "libXext"
-
+XORG_EXT = "tar.xz"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "f5b48bb76ba327cd2a8dc7a383532a95"
-SRC_URI[sha256sum] = "59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b"
+SRC_URI[sha256sum] = "db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca"
-- 
2.30.2


