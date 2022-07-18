Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945A4C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:30:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.21795.1658104246065502511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ypcDNfHH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id y15so2956603plp.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1lOiRryxMkmFNrDPdPgo8HfWBeyMRXg5N0pT9xAUEG8=;
        b=ypcDNfHHZFd6/eM9Giqa9bp/q0rctiquEHCG4zTrwgQneP1lg9uoTjtg3UxmhtNSRE
         F/p0LLaqI71NNqba3xR7zVvju0FaIeG/9PBs0Hjdv32cH9C5z5ohEdbJm5GITOcgwHXD
         jBH79Bf7NV/kWhA5pzoBpwgYpS2uC5pDL+6z/ki6aTFpsk1Ld9Dfvy3XWdLJTXK1tpTO
         2LFx0xnypKXpA6XaZzOgPkibwxD11OZDiqtxKo22yvmMTw8XpzS2GOL0E9UDqDXXpki3
         YJEFexQe3iyFn+tkzX8UUsFoo9e6lUgfpedU+GK2svY6AHfb+4to88rq/xq7z+tc3lVA
         eMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1lOiRryxMkmFNrDPdPgo8HfWBeyMRXg5N0pT9xAUEG8=;
        b=tRSQQjX+DvCfbXSBIdCHyqNZTDvyW8rI8Ccu0vf1i2XnFCle5xWKyC+yDYsoOd2L6g
         RWDq+4FgKj/hBdzHWtkwrhthLFgnKK/9JtxgeQS4gRvnD1A49DUYtzIiGV/YUgpOH2yY
         PvsIVrG7qfcRqotC1BKejhmqqdoo+h8fYU5Hr8wZmCgrnPzho+Ui0SpAzjO0Gr0n4QHs
         9fQi48ERe61FU8g8VDAt0ecEWpQBmr12zYR5YqEKuTIGG/kNUIwsRNJ3JHa0Bw5SsHwo
         Nua2e2NRw98Q6vhXyY3d28Ply+IiCSHJElLg6OIArGeoWO3WV67487wx6UQqJF0emeNs
         wPgw==
X-Gm-Message-State: AJIora+FUp1S2smYeDn5k7Jo7uL3lnmLWOL+tcmX8tLJ92W712tdIvXB
	j8ZZh7e4kFCw+N7yMaM1Qql6hMfuGzPsTZnu
X-Google-Smtp-Source: 
 AGRyM1tdJpwi315XhDn2YN3JeYeFYmJGlk3gHYHr6ztJchTQSGrFtHfKu3Wmo6xU94ER3XnzPq8zZQ==
X-Received: by 2002:a17:90b:2bd3:b0:1ef:9ac7:d90c with SMTP id
 ru19-20020a17090b2bd300b001ef9ac7d90cmr29159861pjb.53.1658104244969;
        Sun, 17 Jul 2022 17:30:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.30.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:30:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/23] qemu: Add PACKAGECONFIG for brlapi
Date: Sun, 17 Jul 2022 14:30:03 -1000
Message-Id: 
 <5a892e2202c70939944bc99ce192a4e4462ba2c8.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168167

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 482471a617e5f682416b7ec1a920dfaeac65f1a3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e1b5b2e5d3..63f0569d06 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -203,6 +203,7 @@ PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
+PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


