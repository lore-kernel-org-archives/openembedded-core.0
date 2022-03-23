Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE304C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:42:33 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.56.1648053752522892763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LpOdEAcq;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id jx9so2250105pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EwN2pJA9kWji816xNGuuhuuwG7TUsrFUleFO2/F8mng=;
        b=LpOdEAcqAl2S53IyBkxlMNQWOangQl+w3h9eqWSOX+vkqUAh+ColdYdxK0+5Y38f0+
         V//6q5ga1ttqWz068+76Fghi3+iTYUARR5S0mSjfTvDCQo0JHa+c8UaisFmwZqMVs6Ww
         bo5xrMOdkFu0X5m24LHKnU1z7hfaWarwXUpr0DyicfJcyFvaDBc+bfeMpB0UM76qtvoz
         2YvpELMueiIoz3Xfg3yBAYznXUKuxF4olQrkhdJ7d6K5ZcOKhEwDAgP+bxx/XGTYahtr
         /yX3p6cgmTL+MMZAr44gP1m6pnNZnWyBHdYE6vkkmvdGgJ7en4FHUwy9SpKccjSod9jh
         bY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EwN2pJA9kWji816xNGuuhuuwG7TUsrFUleFO2/F8mng=;
        b=ppXck20qKX9p0vwxgiYNuUmSJHu4ZjMHoLULO7IMZa1Txm1viexhtNwBWfJNtrYq+M
         tUzC4VRcXjW2jLChnbbZYZ0ti2G5jufFeyX3VQoSuAt9ZhEWB40yJfiSXm9FpJlGKSM8
         qe2xABvLpsLYk9RBCvsv5cD+9sP/eOcrwo64H5FzD3FbwN7brZdO+zeWYahpF3PJd9So
         ivrYHOdwV10IRKOIB2FPJROFGPofGoGMurrv/L/tou9+lbaL4iGjmgRPa7xHvSblSONO
         Ow64/dx/wg9ovyrNSxoRrhQftSbt+ycy43GaKYbbszJsThd+nzEOdCiyA6U7Lz8DrXMY
         V9xA==
X-Gm-Message-State: AOAM532hisv4jmvEtui/h6Y34bIPu85RZYdqZEPSx+LMmHyFQgNOtRnF
	JBfsWhAeitejFLRMIZFZFN6Zqyj1CFeNbg==
X-Google-Smtp-Source: 
 ABdhPJxK0SGbHSnDwwU9yk+Su48+V91fWK/VfViJq8OffNzIxZ+lWBR3Dl9GZoIFx2vjQeFVh1VkzQ==
X-Received: by 2002:a17:90b:3a86:b0:1c6:5971:5980 with SMTP id
 om6-20020a17090b3a8600b001c659715980mr12980910pjb.68.1648053751516;
        Wed, 23 Mar 2022 09:42:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 t2-20020a63a602000000b0038062a0bc6fsm280361pge.67.2022.03.23.09.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 09:42:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] qemu: Depend on virtual/egl
Date: Wed, 23 Mar 2022 09:42:28 -0700
Message-Id: <20220323164228.1412729-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 16:42:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163590

- This abstracts on GL/GLES implementations
- Rename packageconfig to epoxy to match what code it doing underneath

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rename packageconfig to epoxy as it matches code

 meta/recipes-devtools/qemu/qemu.inc      | 6 +++---
 meta/recipes-devtools/qemu/qemu_6.2.0.bb | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 78aea71cc05..a0d65a9354e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -142,8 +142,8 @@ do_install:append() {
 # END of qemu-mips workaround
 
 # Disable kvm/virgl/mesa on targets that do not support it
-PACKAGECONFIG:remove:darwin = "kvm virglrenderer glx gtk+"
-PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer glx gtk+"
+PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
+PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
@@ -165,7 +165,7 @@ PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = "--audio-drv-list=default,,alsa-lib"
-PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
+PACKAGECONFIG[epoxy] = "--enable-opengl,--disable-opengl,virtual/egl"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
index c7eef0a9d5e..92857adf9c3 100644
--- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
@@ -17,9 +17,9 @@ EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)
 PACKAGECONFIG ??= " \
     fdt sdl kvm pie \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
 PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
-- 
2.35.1


