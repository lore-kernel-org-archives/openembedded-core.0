Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C817C4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.7394.1653489002211546535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mvpHLIas;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id f21so7026109pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JbgVrUHQsdq6VhXWw1xAe8L8zEqr48/yPwp5YnneYF4=;
        b=mvpHLIasNFy3vIjMZY6Z7eTopC1VvqmbJ80p5gA+7Ycy9eYQftJPg9Y7gKVz111E0o
         ofpO4Rt/hMcGBwZELl331UhW7yhZ//iSbQiQg8zYgW9RhtClceyMHeGrjQhIwd6YmiWE
         SNc6ljji9bHI5C+6WB1OIglAoMDfYdN5C/oWEkZNB/YX2Eh8zHNmI1aW0zcYT8jk+qdU
         RIXh3gyyA+Kq76AcDQlTzzweZZn+mu6+JiRs8IjhP54Q+iFyYgCVS+NstDTidQY+gevP
         OCeGSSbxntS++ijFgWRCWvC8YMiR3zq2gAsaoae4JYag9m9Eh7Zbth5Z55+Ap8u3igkS
         8gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JbgVrUHQsdq6VhXWw1xAe8L8zEqr48/yPwp5YnneYF4=;
        b=ZB4CTg/jHUq5QMSdqkTbpI/70FE7H/5Q8jAVQL2SjP3FARFbgLv6ryATPV4JSiFtwP
         Js564d6Pxsr5a6AC3aBniw1CG8+KDn/2IBxXTcXzweTqdhcfyetKhKcJ+l4acAFuq5uD
         Z/cK6oUtf33aGvxCRrVxfOONxOAL8MXImlEvitsfyijPPcYoDB7/6DeJ/gKH631TckEw
         Sm23Zit+2AbQlB0T+K0cIGH2Xk8AbLXQENkQg78H/4HdAuAsjj2SMMwmRd/9yRI8/ANC
         GDjabg4PPqhYTizwzVouAQAqR2zt9qHWTE0b3EjvbpfA9GTX3VVouj2p1QXlS3SQUqV/
         lkCQ==
X-Gm-Message-State: AOAM533GyBt4Rg4Z9V22leu0/iyX85CLjx5umQhL+5pleoIAD+eDChZi
	kRukM9WpBSbHsZibV7OWs2hx5tjvadJXmn4n
X-Google-Smtp-Source: 
 ABdhPJwAFUbSkTrTO5cc0phD/SOp2edEl8t8u0e/jKbNy0I+rmGdUmRUEUY9/tb6QW5Zk+iTiTi6kQ==
X-Received: by 2002:a65:6bc4:0:b0:3c2:2f7c:cc74 with SMTP id
 e4-20020a656bc4000000b003c22f7ccc74mr28848821pgw.307.1653489033961;
        Wed, 25 May 2022 07:30:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/19] gstreamer1.0: upgrade 1.20.1 -> 1.20.2
Date: Wed, 25 May 2022 04:29:41 -1000
Message-Id: 
 <e779fb1773b2b6e63739e668cd892e196be224e8.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166139

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

devicemonitor: clean up signal handlers and hidden providers list
Leaks tracer: fix pthread_atfork return value check leading to bogus warning in log
Rust plugins: Not picked up by the plugin loader on macOS
Failed to use plugins of latest GStreamer version 1.20.x installed by brew on macOS
ptpclock: Allow at least 100ms delay between Sync/Follow_Up and Delay_Req/Delay_Resp messages. Fixes problems acquiring initial sync with certain devices
meson: Add -Wl,-rpath,${libdir} on macOS
registry: skip Rust dep builddirs when searching for plugins recursively

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb113caee72db30124f6cf8aa12fbaa14277fab5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
index 81b94928d9..3aa9aa7048 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "de094a404a3ad8f4977829ea87edf695a4da0b5c8f613ebe54ab414bac89f031"
+SRC_URI[sha256sum] = "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.25.1


