Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75339C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:52 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.2453.1647901784522186110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZtXstbQr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id o8so11298611pgf.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rc4OnnoqLFsJAmAPWiKb6Gurzk5jMhjThwM4nEiEo9I=;
        b=ZtXstbQrxD+/YlMEoPgjJXgwpGEJi/paHGJq0VoKSECi4MMporSbeGsdc7ZtFNfTNA
         gJWyDLSC8FJKLdSTnPi2oFQXNFkCqeTcxex0fskcHdapH9XLs+XwdRqEFfQ+8NPqSoAv
         Tz2JFdGlfObQDP4iUEvFQP4KsYOUcQh3aPPzTt5dlBr9iGreZAZzyPjNvx7jhvyLg6ay
         SeMeCYcmpIXKbS8Vz6deD3RE89swdn5wLL65HTOz57afcumuzSrRMvo7vDyZ1P3loJBV
         AiQH0N80AWKCJK2OukEP6Fx4aAXxNfpU0fVuMESLW/wL7kzM2FS/Aaw+AMPe18Nirkcq
         sHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rc4OnnoqLFsJAmAPWiKb6Gurzk5jMhjThwM4nEiEo9I=;
        b=o8WuYW7ILh2frwQCeZU41ShhZPf6ucUBqH5cY/oWCjRT3BF45YmYJyIDwaFNDWvDKM
         /EHjpi+ApY9HaFtzyOXLPgYcWgYshFiKujHpYxcFIk8pUuYsGEbP6llEZjtNrjvZbLN3
         2UTE1kKlLIYRHzxuBockH1z2MWKrgmPOYvmf4TxENl9GAKQp/2YG7++KsGdo1R7n3UdP
         xwyqXs0+UPiEXy2wD+KQ6LbHH2lBTTFiivG/q4DC3lV7BSMqk1WSD58TACBDhtnD+L/3
         NieoXOqXwlHzdopr7MuB/nJH4bVOTEvKceydQ8mNO5k1WQBGgdrHrv3Uhg/+gDjH3HdT
         r7Bg==
X-Gm-Message-State: AOAM531/xISe31eGODVAtHCRObwMhOnbfiUxTK2c0tck2+j+ZnaJzLoJ
	ViKPPy1QFz1lgmxOjsXiMCaotylh77ui1svjdPg=
X-Google-Smtp-Source: 
 ABdhPJw/n+ewDNTE6cWL3ZawBhaByyk/9cSkCzwAeONw74kv/3Juv3XU6xseg04OFLtSsJCsQfddUA==
X-Received: by 2002:a63:4665:0:b0:374:7305:dab4 with SMTP id
 v37-20020a634665000000b003747305dab4mr19824331pgk.256.1647901783622;
        Mon, 21 Mar 2022 15:29:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/13] linux-firmware: upgrade 20220209 -> 20220310
Date: Mon, 21 Mar 2022 12:29:08 -1000
Message-Id: 
 <ca8fa031e79b6893b4b2a9f906134e6ef4fe2b0e.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163521

From: wangmy <wangmy@fujitsu.com>

License-Update:
 year updated to 2022
 Version of some driver files updated
 Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be1b1d204c89035c54a626db46c5054e553b82c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20220209.bb => linux-firmware_20220310.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
index 9cb357fa90..7a6cb1903b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
@@ -72,7 +72,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
+                    file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
                     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ed3d7426e4df06fbadcca24ebf00cc5f \
+                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177"
+SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
 
 inherit allarch
 
-- 
2.25.1


