Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E33FC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:07 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.1170.1652811900313843359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gXTDpJY5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id h186so3592pgc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4dWD0bFQOWxx46y8r6uWxstVDBaYsEWi1r9Alv1hS3w=;
        b=gXTDpJY52Hq+nqevotbEwlOS3AwSj7GjmA6+vZf2GqdD/yAfBDribdU6x7dY7Fg5Bn
         Y4ist2juCMeYC2CsVZ/pZdxHjQItjK0yXFDANYzTPwkS5L4L31KPhv7Ukt6qdb9mKo0+
         H6zNFdAd1bVYk1DuYl9c4ZKGgXjsNoBCmfu0xqTVmz66AdRzLPkkzVzX8ZejX77VZzAM
         MAH+JRU3N/5w5URqcNrVWzbaBZ68fuilfSjzv4JQjAMafsmAJdAx6z0/8tc6a+rehgRf
         6AHTDbFuBco2kVxK+4fjWfqAAFWf7G4ekf/151tTpILr9KD3Jii3gv/UD8ton6NaZkZt
         QOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4dWD0bFQOWxx46y8r6uWxstVDBaYsEWi1r9Alv1hS3w=;
        b=HqY+FJVOyVyn5h/v2iJgNTcBBTHsAPV+4uDKaPcBTm4LPO0ULEIls67NEiLXvH2+kP
         rX+erLgJdRoGc0e7WYMIc8vBNKCf1WC8fMzNZKyfw1YT4ATl+y7Q12oRmVJUP2NyRQOj
         LDY5lPE1+UOv+tPk7kMpCUNJMflDfT5uxTiAuq9BS4uKpaW3W37w+KOpK8tOUpaAeqgP
         W4Vg5ak4VmVxnvNlWocrGdcwfbc1Ad1Ia1xNyewBGY3hect4PmT1HuQsKvMe/y5jaEZc
         gfXr9rUXvzfex1pYQLcsfhRTg/ME58vchqIiyHCWnNFZUOw5VbELjncWAPhjW23j4nxq
         WYgg==
X-Gm-Message-State: AOAM533haHJRDz8JEQb3LITgAkefDIS/EcSBP94ephc3+HUz9Asv1QlL
	2U5AhXn2rgQ9T5Vjq7Rs+hA2EbKnfIy4N5NS
X-Google-Smtp-Source: 
 ABdhPJzB6IhRL5y6UVU8GGC44GJEdjeaDS9Vn2JPP2VDNRwMRnJhV+ePGlXKJUQZo4ojjiud4JTdhw==
X-Received: by 2002:a63:c58:0:b0:3f5:cc48:c6ad with SMTP id
 24-20020a630c58000000b003f5cc48c6admr2909897pgm.467.1652811899085;
        Tue, 17 May 2022 11:24:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.24.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:24:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/31] cronie: upgrade 1.6.0 -> 1.6.1
Date: Tue, 17 May 2022 08:23:56 -1000
Message-Id: 
 <251a5ec8d9694caa9e35690198604f6ee4bad537.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165755

From: Alexander Kanavin <alex.kanavin@gmail.com>

Release 1.6.1

crond: Fix regression of handling ranges (x-y) in crontab

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4bcd528050c01a1e7a3d1a847379833672900ad9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cronie/{cronie_1.6.0.bb => cronie_1.6.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.6.0.bb => cronie_1.6.1.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.6.0.bb b/meta/recipes-extended/cronie/cronie_1.6.1.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.6.0.bb
rename to meta/recipes-extended/cronie/cronie_1.6.1.bb
index d2f08c9af0..6d150dd3c7 100644
--- a/meta/recipes-extended/cronie/cronie_1.6.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.6.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "3f7cc263d21838b53a9943eb2a26b862059e2ae36c3f11789ac33cd6818e3628"
+SRC_URI[sha256sum] = "2cd0f0dd1680e6b9c39bf1e3a5e7ad6df76aa940de1ee90a453633aa59984e62"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.25.1


