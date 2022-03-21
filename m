Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712FAC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:49 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.2519.1647901788858880223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LXybbO9r;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id s8so16657527pfk.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pFUrNh+ShJu8enYXPdE4vGjxo+ggcmq4XggGWwwMZys=;
        b=LXybbO9rEVGJzjncL7/Wl8M1GfYO8wnxlPb9GFjLZE8TmjslKofd2/6PPGUm0FP0w4
         0iNLIBrrsF0ElVpSRm+yX07FrElUF5LF4wlg3o8Caw4PKr9Kxyn4qFzD5QH2fMFfum+h
         knODCFCjc4JAxpQbyZrzKHdxK6Wi8iLb1cBq4uLJbzg50aW0fV/RCYKctldLHK8ioVtc
         bcGGIlqEvfEbEuPzbvPA7BPkP8HQia0n3oZ9D3uK+p6vVks7IoH6vbbwoKNhYQGJr3HM
         1ztIR6HnDGcyzVqbPbNyyhb7App5HQaoqqtNHrpgsO+Uh37oM2pJqtq4W9bTVx6JaX7X
         u/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pFUrNh+ShJu8enYXPdE4vGjxo+ggcmq4XggGWwwMZys=;
        b=bTjeuc8WorSjuP+FEwPUdvkII9MbTbzwT/S9RgGD0SpwgqW4oKtqvPmWLtKvDHZUFP
         49brbeC72CkB5DxdeV504+oNwdQq0yWkZt8x3cZwAy+xjREy0OaYdR2a15KHB7Js1agI
         0oR1jAzVA/nhgTkD9Wh0by4rUwURjsQ8JHaKVZ7gD3NFXknP+3iFaDBhWa4jNN1MwUVw
         P/EHy1SWKS+xSfGFcthKRVvXL7YAmOD+nbx8egvnKm/um22fMSMaptibcqWCDwI/E88j
         /JaMbtaj2E/OzMb8QVdExdtF6MMLbtRt6SFkVoz0vKYfr7dJlkCY/9whXsmlrmB0JT16
         dR7A==
X-Gm-Message-State: AOAM530OAvmezf5IeHKF4CpU3oJJZTH3xQhbJPqDzw/SOM0uwfIn8wA9
	a5YpMX581Qe8QBjU6gzicr4bqfL2EvMZ1l7O0vU=
X-Google-Smtp-Source: 
 ABdhPJy6bJPNqaB0yOqZR1fyCyC8yidRPPEcmzJ8b3FqVEku0OitJUXaq2hcDsDNXhXUizZPx1L1XA==
X-Received: by 2002:a05:6a02:20c:b0:381:f276:98d6 with SMTP id
 bh12-20020a056a02020c00b00381f27698d6mr18970508pgb.39.1647901787961;
        Mon, 21 Mar 2022 15:29:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/13] mobile-broadband-provider-info: upgrade
 20210805 -> 20220315
Date: Mon, 21 Mar 2022 12:29:10 -1000
Message-Id: 
 <9e3758114cbc74d820c5904b81b011e5c4a1715b.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163523

From: Changhyeok Bae <changhyeok.bae@gmail.com>

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed02ee8f20094f598448d58875cb7be8a24a019f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 4246f4dcbd..781b9216c5 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -4,11 +4,12 @@ DESCRIPTION = "Mobile Broadband Service Provider Database stores service provide
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
-PV = "20210805"
+
+SRCREV = "4cbb44a9fe26aa6f0b28beb79f9488b37c097b5e"
+PV = "20220315"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1


