Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F3CEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 11:23:08 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.56392.1688469784390050199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 04:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UjH7yiP2;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6b752cf3832so1130738a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688469783; x=1691061783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/TFCERRnjIZfuvJDbKhFhZVN3Gc74rO16nOMEjecvs=;
        b=UjH7yiP2rDnSyn92LZxBWxWPLtSQYCmeZ9mnPY3uiRnFD2f90p9V91TMl9v4hXXgkt
         N2ycLDeHUEhdc2t6S+of7i9JsIkey1A7gQmW6yaOGReIUrAxk60y9v0j95ofPnVhVNHf
         jdSnU77oAvCfEUz/uksXHVHm4JFOVp2TwjCq81+jPvnEDTO0ZFKCd8L9H7DnOR5dYtvY
         qv+aDfDhRRzGshh3UT8jditIE3SXfCYAZhmZeUpuL7QZVKBFDA7VRuI7PM/+rDjpLjjC
         yaQLWi+DitGJ4tCRB3wejhv8t8pCtlYJIkd7UJrxojX3n2Qbm6GJKN467DmezanpNg+/
         b8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688469783; x=1691061783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/TFCERRnjIZfuvJDbKhFhZVN3Gc74rO16nOMEjecvs=;
        b=V4r2ZgklUaD0hpOMGWUYNrL3/m7sM83aB4ZgaXUi2lgLcGmRBCx5aFOKB04uuf1zaS
         MeY67HlSFdt4GBR0aaRO46kKla13pEBdtCx8x9d4upLPoR4y9aAjrdA0eVg0lwBDM950
         0zvl8lASkTu1ZJHsEZyVrH/myF3VEZNe2/vrMKScQiThKLR+2/CdVdtmBFIxaQWX7mWx
         5cx4vZ0nXfaE0erPI4S7v2OQIRVD+HvFU0/qcBZ2uI+IyM7sdQgs4z+CaAGIIxc+ZZ0r
         nTBjr1Ndc1NOwLyT4Rob3/HQgvvlFrfHqxfN+RB1PLFlEvXEWLZ943vwPq8V9kFZQkvY
         fAKQ==
X-Gm-Message-State: AC+VfDwJzUjJXkPlAKpgap+rV7kcNbRWofVOaHNBuXGaxXLa6uIp3RDD
	JXjjSohUgD8HEovf6qnSSSvQ+ThYVoS0tQ==
X-Google-Smtp-Source: ACHHUZ5c//hg78JQvg4uoD51SurPotCD9aHYmBu6ctL6f9h66Ccha3kKKRsSpAcLlJbmq8DP9e6GKA==
X-Received: by 2002:a05:6830:a94:b0:6b4:6145:dfb2 with SMTP id n20-20020a0568300a9400b006b46145dfb2mr8910411otu.1.1688469783294;
        Tue, 04 Jul 2023 04:23:03 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5eeb:c8fb:6587:eb13])
        by smtp.gmail.com with ESMTPSA id h13-20020a9d6a4d000000b006b73c264e30sm9300123otn.17.2023.07.04.04.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 04:23:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Update Upstream-Status
Date: Tue,  4 Jul 2023 08:22:54 -0300
Message-Id: <20230704112254.1337362-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 11:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183830

From: Fabio Estevam <festevam@denx.de>

The patch to fix the mkimage path length error has landed in
U-Boot upstream.
    
Update the Upstream-Status accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../files/0001-mkimage-Use-PATH_MAX-for-path-length.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch b/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
index 9f38736bcdab..5c6708e66674 100644
--- a/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
@@ -7,7 +7,7 @@ Fixed when build xilinx_zynqmp in long directory ( >256):
   |  /buildarea1/testtest/wr_build/wr1023test_secureboot/test1-what/test2-what/test3-what/test4-what/test5-what/test6-what/test7-what/test8-what/test9-what/test10-what/test11-what/test12-what/build/tmp-glibc/work/xilinx_zynqmp-wrs-linux/u-boot-xlnx/1_v2023.01-xilinx-v2023.1+gitAUTOINC+40a08d69e7-r0/build/fitImage-linux: Image file name (uboot-mkimage) too long, can't create tmpfile.
   | Error: Bad parameters for FIT image type
 
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/uboot/patch/20230619062250.3244894-1-mingli.yu@eng.windriver.com/]
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/99d430f344bfdb0641022fd3efa26c29c957df02]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
-- 
2.34.1


