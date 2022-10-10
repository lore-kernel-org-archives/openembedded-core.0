Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813E1C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 19:55:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.2366.1665431727276404149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j7Yh9FVJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.177,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id i6so6220925pli.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WeWqWLyEhhG+/ayFM3lvysJo7yI+fbYC/jJZ10n+x0c=;
        b=j7Yh9FVJIl83ldLd0pPtdg0V9xAGqIPSacLAwAEgjPolP20AnNQfcfZPyLkC+uItjJ
         ZKIEsd7U7LPXnVi2qJtmm8FLCUcu2xNkMlJ0M2Ay9GvMBIx5gyHWgoiZaVxf+qrBtFjI
         g5Zv3QDpFjjgMrFWoRNojGSEEmCYiKzmeK498=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeWqWLyEhhG+/ayFM3lvysJo7yI+fbYC/jJZ10n+x0c=;
        b=n4T5K6ONumrLS0LmgJDhF5zNOFZIcdLdHa70rc3PXXw43vEuH6lKUnoxUFT7QfyhzJ
         OlYiCxpVZPOWe2Zg6zURItYvFimp6Zh8ac01QJBeQga0hR/BdRk+DiiOkpmXCIz7OBUN
         uVkCfAqLC9S6GILMnt4TCXLKCmEKpG/jl8P8l69tWs+491oeXSX9nTohlZ0rcx+I31ET
         Ns17I6I4i5lsEAeMuh+273v69c4UsbbBdi7s/78y1MPeEShiz8CgijulwHa01fkD89FT
         xxDkZR+vrk8UN+AnrLtzuN5/DMZ+Q+c3uh+80VtDA80z14zdgisaeoRpQp+ytwx3huNF
         VVGw==
X-Gm-Message-State: ACrzQf1L9jecnc/iL11oRoyctv5ZlNxyajc3TgEnp/dkI/Bn+ic0WDMI
	JPOHKb9JHh9KqHwJoCNdS82Ahl/6xIM8Uw==
X-Google-Smtp-Source: 
 AMsMyM74DOcgUZ7Xwj/DKGAHztRtGVHa3fOxCrZETtx3tI4N76DmsWXsAMeACDC64wnzbC2OEm3k3Q==
X-Received: by 2002:a17:90b:1b4f:b0:20d:363d:7943 with SMTP id
 nv15-20020a17090b1b4f00b0020d363d7943mr9242092pjb.106.1665431726374;
        Mon, 10 Oct 2022 12:55:26 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a1709027e0500b001754064ac31sm7015649plm.280.2022.10.10.12.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:55:17 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Mon, 10 Oct 2022 12:55:15 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [master|langdale|kirkstone][PATCH V2] qemu-native: Add PACKAGECONFIG
 option for jack
Date: Mon, 10 Oct 2022 12:55:12 -0700
Message-Id: <20221010195512.3932101-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 19:55:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171583

Source: MontaVista Software, LLC
MR: 122826
Type: Defect Fix
Disposition: Submitted to openembedded-core
ChangeID: ecf4ddeb82db6fbb5c6c803e5e80c333587b9c9c
Description:

With libjack-devel or jack-audio-connection-kit-devel, qemu-native
detects the library/header and tries to build with it. Since its
missing from the sysroot, it fails to build.

 -O2 -fPIE -D_REENTRANT -Wno-undef -MD -MQ libcommon.fa.p/audio_jackaudio.c.o
-MF libcommon.fa.p/audio_jackaudio.c.o.d -o libcommon.fa.p/audio_jackaudio.c.o
-c ../qemu-6.2.0/audio/jackaudio.c
| ../qemu-6.2.0/audio/jackaudio.c:34:10: fatal error: jack/jack.h: No such file
or directory
|    34 | #include <jack/jack.h>
|       |          ^~~~~~~~~~~~~
| compilation terminated.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 612abd240a..711982ba8d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -198,6 +198,7 @@ PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.35.4


