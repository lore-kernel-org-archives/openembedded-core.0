Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30259C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.13921.1645301747102474844
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OZ8wbq7z;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id m27so8346615wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSHX3yHYtP3P4zYftMXh61hxLQCmhBtbTOouQv5IFWw=;
        b=OZ8wbq7zp1Wib1QH7+nOABjdbtiRbWJsg5r7gDpsanGIbI64+0A+oqCX8KI8sGXmzs
         lDfkNIIB7izHaUpJEwmbjsTx6zMA3QNd6WUEjRpQbb1G9z5IFb0y4T59Bkdt3+Q5JqKv
         75BlTFculWsJvXVTxF3RArVrMaGZpMP8AtIal7vEGM+SLuWLvl5EYsCa3eO/Rz2QetPq
         FAkSIYe4hAZQvYq8+/zEXmtaNC51m9OkS4VAiug2f/WuD11mZsUGhGKrgBQxf+yg7LJ6
         BgB/tBDfv+DOJwwwr86fM8YwfzHvURmm+xbcApwYY6BKdXjw6OxQwwUim2Lx1906RZDY
         Zmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSHX3yHYtP3P4zYftMXh61hxLQCmhBtbTOouQv5IFWw=;
        b=0NYbRVZM8sOE3qzbiq+TWB4wIP+YtG5bYhlHhjmn5CXdMzhTP264qBM106asD9VxLM
         5Im63vDX9YCZdtABRzNj4SI6DF1Sw4ZBI0Mx8BIJHNBHRS2Nt16qWk+JvYAeMaV8y6/P
         qcr7q7KqTe1EQnzikX+5Uci61jDVaoOYyKSWUP0n4CmXoj7kU5mGRinzvdPpYFvZMB2J
         w1cZEODtYhGIUGF8lIJ5pGK3Uka2Wy8N2WCgz6FlZp/mYzOqMLI+7B5ZVDRGO+m8XWWr
         FXTgbfQMOpZrlme+Oecppjw6Opvfn0ZkERm8IT85EiCZ2hS53hKk11pUAsoSHZO63DTV
         gYfw==
X-Gm-Message-State: AOAM532wO7aVe0Y8UStNKaiIZ1MhB2LBjhFwZC4pJCudBj19GfLIHGlO
	0srsWILD96Pyy/iprudf9TL+EmoWWug=
X-Google-Smtp-Source: 
 ABdhPJyw4SeD06WvfdWlN+pPHrsFhJlSS32RmgtzS+0OjqElpIzTWsU3e/Nm4n8UqbFygxnm00oGbw==
X-Received: by 2002:a5d:6d4e:0:b0:1e3:3636:b104 with SMTP id
 k14-20020a5d6d4e000000b001e33636b104mr10662832wri.605.1645301745099;
        Sat, 19 Feb 2022 12:15:45 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:44 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 01/12] gstreamer1.0: 1.18.5 -> 1.18.6
Date: Sat, 19 Feb 2022 20:15:03 +0000
Message-Id: <20220219201514.1551306-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161965

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
index 0d82dd338c..4bf89ed109 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0006-tests-use-a-dictionaries-for-environment.patch \
            file://0007-tests-install-the-environment-for-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
+SRC_URI[sha256sum] = "4ec816010dd4d3a93cf470ad0a6f25315f52b204eb1d71dfa70ab8a1c3bd06e6"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.35.1


