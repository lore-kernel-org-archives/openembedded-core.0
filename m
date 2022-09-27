Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE4CC6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:54:25 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.14132.1664301262224597602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uh1a3aKP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id v186so10328579pfv.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Ia9gOZ0ZHEtx05qivFKLyezttBpoVzZOBOqJ2cPxEoI=;
        b=uh1a3aKPiU7Eaji5pMq3Q7GGRRCaRRI6f6repv12DMoBVMYsT8vwPolOEJMPAwWeMY
         RyKm2sEFyFWTmb4wtBau/JMuOqMA+q+XALX25nm7wFdx/Z3bUejKXX7hiRQpnxXJM1KI
         yUWznhqQZNM3SU+RcYhvfeinzk3JwwFJxBB+VkTjjyBvhP+z4GgO48NQKxjoI+fz0VRm
         NOMdtP5uo3yPUPLZKreC9OZuf2+XWqi6h5vnLWhgcuWkEFs00trQ/Gito2HHyDqTD8IK
         zkqpzaLFS0pgi1K2YnFieqi74kdfMJIEtnqCP5WEf+sVarkTqQY1OQN+erjA0l/sZyQA
         AEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ia9gOZ0ZHEtx05qivFKLyezttBpoVzZOBOqJ2cPxEoI=;
        b=fEEFmMw57XRng6PIUgtxbyhUCUSl7oUIOEE+YQkeiN4nD4R/fUquRxeu7UjCA3qvAj
         Yc0NDdRqLTHwdXIt1IJeVqzyOFAjYFzyrYVcxyg0DT29CiexeFaa6+wuF9N7A8lAg2fi
         y2JbZpvb6aXN9I7e9W8GcTUw7HomQEzhXCotfCiIF/ofSoWsPyNZN93Y7lSorXUTiE6F
         k55ttRceh8DCQWHqGof1NzDPB/s8qWWzeDy8Kh7qIh52Jk/UR/ukNSNb7TDX6QL7b9fn
         q1E/xxFcVsqrwAHiZz3tL7TZs7C5KrblVc7gJTrepJvNw3iV8wj9VseVSqf+FVZcAloI
         R4TA==
X-Gm-Message-State: ACrzQf3piJShygl0x5QO7YxRlkAJuU9eFpDEJqiOaGXszPb8JTIBg4lz
	a+PLYi3D/ZrTaii0STDDLClNwCXToWZ3tjPC
X-Google-Smtp-Source: 
 AMsMyM7Szq2FcM3ytu7HHo2jdH5XhSsR5nBye+9tWnbV/GiOXp/Fxop3q4q2yGumL/nvMJ8qxGNPpA==
X-Received: by 2002:a63:6206:0:b0:439:54e1:c220 with SMTP id
 w6-20020a636206000000b0043954e1c220mr25157659pgb.445.1664301261190;
        Tue, 27 Sep 2022 10:54:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w189-20020a6262c6000000b0054094544ae7sm2051468pfb.60.2022.09.27.10.54.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:54:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] linux-firmware: upgrade 20220708 -> 20220913
Date: Tue, 27 Sep 2022 07:53:57 -1000
Message-Id: 
 <a8efbea09f851e9ef72a1ec387077d9eda5335c6.1664301116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664301116.git.steve@sakoman.com>
References: <cover.1664301116.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171120

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68ce822b765a7b67f8cc8590688860cc2530cf04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20220708.bb => linux-firmware_20220913.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220708.bb => linux-firmware_20220913.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 27146154be..683da1c411 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "def08711eb23ba967fb7e1f8cff66178"
+WHENCE_CHKSUM  = "98ecc3d3223df7ebdc23b0ec56aafb20"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "0abec827a035c82bdcabdf82aa37ded247bc682ef05861bd409ea6f477bab81d"
+SRC_URI[sha256sum] = "26fd00f2d8e96c4af6f44269a6b893eb857253044f75ad28ef6706a2250cd8e9"
 
 inherit allarch
 
-- 
2.25.1


