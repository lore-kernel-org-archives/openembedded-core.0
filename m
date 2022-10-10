Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E92C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 19:27:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.1978.1665430031695389462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Re0LE7nC;
 spf=pass (domain: mvista.com, ip: 209.85.210.172,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id f140so11599028pfa.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tkf+Jo2Y8SyC7b8k0w/KDPakhpJe9jZYqf6+duywAsk=;
        b=Re0LE7nCaL9BO6VKgpmMHzyhuu28k4mB5ziDeKRDYK63X/L8qc7KrHadU4QV9tDtPj
         3/V3xYRgl8Lpbqfa6sZ8MlueYSPjrpE5yrkEL2CCvKXc5HF25HuIdBNMCd95xYvbOSUZ
         g8fhb9+KWiA9jnfOar5B1S2Im+T15QeZr4/fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkf+Jo2Y8SyC7b8k0w/KDPakhpJe9jZYqf6+duywAsk=;
        b=QCmny3Ohs8hCGDrZLRxGakX1ezIV5Rf3t6xQTfPns7n224YGpOxBY2fvgnlSyGyBz9
         J0YKGrYgQ2HwvItg/SGjXwquUVT69tWgqt70mI5lE/77/t/o1fOK6lnuVT7pOW2sc///
         ur+ThOvfiIhDRSZf59bs74mq03zuCgDdW3xwDUCLTc0r7cR7dci/GnKc1TwzDH5xIfwU
         C5XVZ+zEkieaCBxWBeJIEAugiL3O05zHXOpHiTcb1TJfEh9YYT/wdijAG5sJ629ElVX+
         XAhGNOW8a+BFdGJqSB4zSxsjfnZlr8H7TJ3W+ExdgfLcs3gh2KkdAt45biaf3Y2gW8Ij
         1LQg==
X-Gm-Message-State: ACrzQf14/xWbyxdd6rsalgtBk2snw9ZBIvXV0I8DGM1CDYvApw1YXnI9
	fZ1to6EyUNSQfTeQ6BoC2APjlLgnEEcpjQ==
X-Google-Smtp-Source: 
 AMsMyM5NjOGQTqzPnVv4NqmVaGZNgJJUeXhSshyCQdpboaCC0xRyb9k+u1zn5uxWOFFcnZlbAeMwTA==
X-Received: by 2002:a63:db49:0:b0:439:246e:8091 with SMTP id
 x9-20020a63db49000000b00439246e8091mr18152480pgi.295.1665430030757;
        Mon, 10 Oct 2022 12:27:10 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 o18-20020a170903211200b0017828ae6310sm7004804ple.2.2022.10.10.12.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:27:04 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Mon, 10 Oct 2022 12:27:02 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [master|langdale|kirkstone][PATCH] qemu-native: Add PACKAGECONFIG
 option for jack
Date: Mon, 10 Oct 2022 12:26:55 -0700
Message-Id: <20221010192655.3930156-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 19:27:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171580

Source: MontaVista Software, LLC
MR: 122826
Type: Defect Fix
Disposition:  Needs submitting to poky
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


