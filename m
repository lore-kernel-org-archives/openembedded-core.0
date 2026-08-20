Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24811C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 16:34:36 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2213.1787243668782822097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 09:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LnuMJ0kq;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2871100a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243668; x=1787848468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/DE7R8GgmP/Vvl7IaKxkfeG+vuWQbUX6CyNSINDiq8=;
        b=LnuMJ0kqMP+D+jhIP6O47PduueFpIwJLs7VNlb8MoIVrtPAEQARZeqYC8W0J1KSQNr
         5IBQ5M3I67xG8XZ1iTeiMwDc119vxaq6T/03Wndyp51wd0DNomdcu31VROHwqeT7OBWW
         b4VFAshXjl10XfERkTpKiOhTrA1p632I8Apf1pFhZwfR6AeNWhhmx6+XFtkND8jeicu/
         G0wXsLZ2DaMUjdjhhEcXO+s7Q1z97FER0+fD+IomRprjcpdxHHStGYBplll6QcsLIqmX
         tFrHY3xNAiCPO8656Dd00rXPp1QlWf7+yLa/NESb1uwdlcMI+4wXOmFLXO2aJ+EAX0bO
         YPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243668; x=1787848468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/DE7R8GgmP/Vvl7IaKxkfeG+vuWQbUX6CyNSINDiq8=;
        b=dkT4rUSJ6PyBaQpZw0B1V0bYOimPvn55JJph4MEzLTmdNSeAxn95UytIh0/VrITv9+
         nJAGe9uHGu2lyP9aOVVzYdInz+Jk1BcW39Bhrpb8kUK5RFfuiAmE+K0163sonfKAxjh1
         2pdnI9ZBbEb2vvCDx0iJWZe8wlPgLgadcajebO1uZZ48uQ+CmCW9lVgGYtD9AfqP+dMb
         +1vddkz8EsJdf23WwTlF+zqHFeMcTGJ4psrm4N3sVrhCiWYb/rN9rfwhTIxtpSbyOiDn
         HLK4I7OhXz2vvfSorKNql1YXX2i60FfKVtIblu9XbPlpHd5oQmB/UwblYAKOQDQE1Kx5
         R7Bw==
X-Gm-Message-State: AFuF++mAUhy0TJYtrfdRa9aINFk7LIQ3MA73jTmHVrJCi59k/v9ttyM9
	wm1TDDT+Nfjmff1XYH8lKIeNtD6C8NDHEHiX9lI8eGIHHvdRNLwxz91ravGZNg==
X-Gm-Gg: AR+sD12xQk402sleYVlKVH2r294og/jXPfpoMSVNZqgIvAA6nT+OX+fDipkzHfK6UrG
	mfFJl4/bwKqLPcO1A5XMIRwVZ1lct6ujpXmgeS9OhnvoU0/x/RT9ELw45Y0dPg+EnS/pe/PCQAf
	a6ZtmDg35c8RKUvNmfuLMmd+7HHL2vBc4XXZJz3dNAx94JiVa2JvAnWAKwZ85CLFn13zLkEB5vO
	Qe/vo9DrhOUYBfmklroyBse8AGJzd8Pr00HrzWpJ9AfwilrPPVSm3X7zbMPy94pxlp0RwRtasWq
	Bo0VFwSwtp62mhn7jttbv35ZDJ62QTCfbkfitc1kIr8aF2cg55ieIOlSTNfJ2AASWvVh5ZIHp4H
	QsVYOQC76ZM+PgW1bdx46BinTPGjsxTXAo20Nfn0oN9kHE0JKBM5yLmREFSX597SGE6Q5acQL5u
	I9Rpi+LZHbyX12YUkmozvgjmhkKkoTtDvZt0kc0o7PsKWOMw6l2naqmc4/sSqJgSmZXts1MPVue
	42yvQ==
X-Received: by 2002:a17:90b:2241:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-39581228dbdmr24608637a91.16.1787243668040;
        Thu, 20 Aug 2026 09:34:28 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:22e6:6458:e81c:b916])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad699c9sm18125719c88.8.2026.08.20.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:34:27 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [wrynose][PATCH] mesa: align x86 mesa config with LLVM graphics
Date: Thu, 20 Aug 2026 22:03:42 +0530
Message-ID: <20260820163342.12213-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 16:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243871

This change makes the x86 and native mesa PACKAGECONFIG appends conditional
on the same DISTRO_FEATURES check used by LLVM.

As a result, graphics-related Mesa and LLVM options are only added when the
distro explicitly enables a graphics stack, while leaving non-graphics
minimal images unchanged.

(cherry picked from commit 2cf81caa69474c5ec2397ca37622c86519791d44)

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 66c8f9c372..a646c16af7 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -13,10 +13,10 @@ PACKAGECONFIG = " \
 	zlib \
 "
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
+PACKAGECONFIG:append:x86 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:x86-64 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:i686 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:class-native = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm amd nouveau svga', '', d)}"
 
 GLPROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
-- 
2.43.0


