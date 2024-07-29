Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F0AC52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:17 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.55944.1722258793886893005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MYVoTJNg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb682fb0cdso1900171a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258793; x=1722863593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DLquk+b7veOUkolkHVCTBrNSJzT0e1OAX3s+UVUzyI=;
        b=MYVoTJNgT831sDQkGjknjP5Ht5iaYXQMMcg7r6co2DWajdS4uu9dTJv+HG8AmHusdt
         DlWVHttRPRStUIFXgC1kLA//NPO5r7iZNGzjcKp5QX6XkMuHKh6Bx+kFPRfFs+MET/H4
         Hf9gdxq0dyJPHWqVBA6pkBFw/5XSTHIQIdvhw1RLndLzzjP+05QedtQsPO/X0Ds6nVAV
         ztcYKsfY+sP6iBeVTycEVq1xzNAm54in62PdTALQbe3jxVPv0trOWyzm3rriEMAamLia
         BLIbj5DQczNQ5+1Mb7BvZCQpDcRdMCFqpKPHPHNV7AzldfwF1w0QhkPM19Bh+S5O55c9
         RSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258793; x=1722863593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DLquk+b7veOUkolkHVCTBrNSJzT0e1OAX3s+UVUzyI=;
        b=BnnAvk/apFpBu0EOwj22f5qULVr2ZyB8CfYDxS0WEeOxe0PNUtFhQh9VXwsD5bPTrZ
         SKmWOTK9q9YsMg0hIaYQThXlb1ixCCo1UZCUCtoTYFT7Hb6SEw/fsm4Jsp0/VK91v9E7
         xZBw54y4jgeLsRIN1cVHGkZ9SL3Lih/cLFSZ10MviywFzO0i1LlBEuMELImwyJKNoS1y
         x1xq6dt6JUOWVolh+50HjT026jfja2XoWQ9YaOvsiDsBaxJb2pYL+O56MXCqLJLHdzj4
         jz/iWwmWx8/5urvCXWn6W0z/nu7WUmcz7ZuQUma/LBXYcfmO3fxpcyIpfkNaQN+HpHwz
         wivw==
X-Gm-Message-State: AOJu0YwqFTQspy4GCstfCuG93VSV5lE1GJk1DrYaTFV+Pj6W8ds8hwht
	a96Orzk7mTrbCojlByBvKhupzDsmu1D7tlfUJdL/HZXIYdBOFd1YcfS5b02vvmekestw5TvMvIQ
	ahlX+JA==
X-Google-Smtp-Source: AGHT+IFnQg1dUTc/CJ52irJIZXPPyJdSj4fQCFldiRaBA/vOsvjxaP26EanqCgUM0cH5pLZJ28JlOw==
X-Received: by 2002:a17:90a:f490:b0:2c9:9b2e:61b4 with SMTP id 98e67ed59e1d1-2cf7e1fadccmr5606661a91.22.1722258793054;
        Mon, 29 Jul 2024 06:13:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/37] maintainers.inc: update self e-mail address
Date: Mon, 29 Jul 2024 06:12:22 -0700
Message-Id: <54134c24e17f28223259eaaba41ff2e2ea5b55d6.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202626

From: Michael Opdenacker <michael@opdenacker.org>

Signed-off-by: Michael Opdenacker <michael@opdenacker.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d4a435141c71710e479b7f49c38aba9f57cd1d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 180dfc1918..12dfab80a8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -31,13 +31,13 @@ RECIPE_MAINTAINER:pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-acpica = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-acpid = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-adwaita-icon-theme = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-alsa-lib = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-plugins = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-state = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-tools = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-lib = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-plugins = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-state = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-tools = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-appstream = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -174,7 +174,7 @@ RECIPE_MAINTAINER:pn-expect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ffmpeg = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-flac = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-flac = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-font-util = "Unassigned <unassigned@yoctoproject.org>"
@@ -301,7 +301,7 @@ RECIPE_MAINTAINER:pn-keymaps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <crg7475@mailbox.org>"
 RECIPE_MAINTAINER:pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-liba52 = "Unassigned <unassigned@yoctoproject.org>"
@@ -776,8 +776,8 @@ RECIPE_MAINTAINER:pn-shutdown-desktop = "Alexander Kanavin <alex.kanavin@gmail.c
 RECIPE_MAINTAINER:pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.34.1


