Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E08DC48BEA
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:18 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.4508.1661294177887480332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BwIyfSYz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id r22so13466833pgm.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=aJfTOcfh9/x7BT6Sgx4nd/oZ5SGL4L2xk/mgHwS56yk=;
        b=BwIyfSYzz+skRS4vtPAn36yI4216mdrzGFZmvdl3HmXTbtYvDlDEm0VNxAKMayd0/t
         GM0kpDdBgQrj4eBHiQPPVetzpOXdFbMv/z1zo/5givdy5uKl2v4lfcxm5v2S2gdqeuc/
         SGbRoIJUjKk05nF2dJeNnVG1w1mlKFXxa5MnLYzZh3b0y3akRr1/TekpGCzuI5W3Zh51
         ++WE1e1bH3WvBcIVi61yIroKQSLgcJplOQJgm5cOjO1l1U8rrW7qpkcjYa4e2EL0c7N8
         67xOV0ih+XVSL5yu/Y5CLBm9Bq14Zcn9FdA7c1pXI2BxrUBRw7fo6/o4zZz45FIJ/JWn
         9whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=aJfTOcfh9/x7BT6Sgx4nd/oZ5SGL4L2xk/mgHwS56yk=;
        b=YZmlNZ4OZ35JiN0HB1qgIgnm+LI7JV0OfBbFMW/PdWMmGSLwhuaHIn50hDcOmgt+s1
         BoA1h1f/ljjlobbJQc45tYhdRcMYaSkrIrBSbkkY+sKe/el3jCSeVLju21mxkaXGQgQw
         iS7BO7FZzA7sJyTvCnw888UNbv0P980g6ZAYwj6Dr1Vo6qiz3eShTrDFZg8tl1H6fi1U
         dZl7Erkehp69lxyRHKqf9G+leYmt3cZLzcyfMWVKN2ZOFUSTTXXsJmeKwjtS/xcQ5UxL
         ihGQGVTm4gyzfXkXbTBYviCK8xG7V/RxRdPBNS0SuvUeL1tIrygBfIkfcYCOVuJzlvHN
         oZIw==
X-Gm-Message-State: ACgBeo0shjd4Pp2BcDCjKR5ZkIpglZ15UD/k3uSO+nF0cyC575i/RZU7
	4+nsg1BxSaZf2WvDMIp4MzbPTPZ+XvfASGCh
X-Google-Smtp-Source: 
 AA6agR4BpbsGh8lKdww8lWm88G1QU5vJLZp0gZWjHy2BEG8iKZad37vcUXvgDD3zxyVrhaYwxLAmUA==
X-Received: by 2002:a65:60d5:0:b0:41a:625e:4c44 with SMTP id
 r21-20020a6560d5000000b0041a625e4c44mr21732441pgv.364.1661294176975;
        Tue, 23 Aug 2022 15:36:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/28] libcap: upgrade 2.63 -> 2.64
Date: Tue, 23 Aug 2022 12:35:25 -1000
Message-Id: 
 <b23e43ea7c677b5450969d3586d1f68cc278fc73.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169745

From: wangmy <wangmy@fujitsu.com>

Changes from 2.63:

- Fix memory leak in libpsx at program exit. (Bug: 215551 reported by Kalen Hall)
- Be more resilient to CGo configuration with Go compiler when building tests. (Bug: 215603)
- Fix cap_*prctl() return code/errno handling.  (Bug: 215772 reported by Anderson Toshiyuki Sasaki)
- Minor clarification to cap_get_pid() man page concerning pid value within namespaces. (Bug: 215812)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfbf8f05d1789b8a8a6826b83a21fd09b8e903ad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libcap/{libcap_2.63.bb => libcap_2.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.63.bb => libcap_2.64.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.63.bb b/meta/recipes-support/libcap/libcap_2.64.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.63.bb
rename to meta/recipes-support/libcap/libcap_2.64.bb
index 9e341c4bd0..7690d3e9a5 100644
--- a/meta/recipes-support/libcap/libcap_2.63.bb
+++ b/meta/recipes-support/libcap/libcap_2.64.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f"
+SRC_URI[sha256sum] = "c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


