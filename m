Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ACC48BE4
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.56.1659106067033231790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rknO1LHb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id w185so4836283pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FKsUvY2H+e8/1srBpjG24drKDlQWuwDiwvpMxh4Gz+8=;
        b=rknO1LHbSZaYEaF2afBt+iNHwzNu3Qj68ArwhiHXTeP4rcUHPgVDq2YXkXHLhJmGXX
         YOXgDj3T4asl47Ab6C1pY9KyieL16iXDwjNEgmcUZO+1fLVKMJMueloBd2gHbrkOC8OS
         AeCdOK9mUaT6i2QrPTmRhPmnsp3q5ar+E+gVk0hc3C8YrbXgfjRXMT4shO30jlzXVxQK
         +T2xYCF6paWxxsSURhkFu6MHv0O971z4CQtKePEGjYFLr1IxRHUXz7iTp1vnTtM7SANn
         p5UoXu9aNPuCz3ps6Jahch4Pf1M130mzXUfrDsr2/bQ2y8DFkpzSC4BdsweDOKDhTAWl
         jZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FKsUvY2H+e8/1srBpjG24drKDlQWuwDiwvpMxh4Gz+8=;
        b=Zr6qkVYTHaC6vIi4AWhUc+NQNHNu+q2MbmpN/uMVbi4N96/M6NGsFAlGWKNktm27IM
         2HqK4eMeRNkPgAu8mi5VmAVpItL+Vbw6lwycVZFSZUl77KCKgc0bb7lLFPAGHQCeeNxb
         gaTmygd6SKrzpJuJFh7jnItsAOsbSqLq6ztPSl5dfNKr4Wn+I8x2xMXo9zX/jDr80PAJ
         dEJ184E8UbU+09XZZ+VsFADeQRH9frVedSspRioapnv24yRFJOujltHiDV4JzxYQHG5y
         QS0Bq+UR/p7RftKV9dq3lSckBK0SaRcbTOvuaus4ocgYYDuzA8tQGCWbqxXohgLIegU3
         02eQ==
X-Gm-Message-State: ACgBeo1Yi0IsQ1IF6U1wlqhvl+aa1gfmX90BajZz+cD5iMNlgg3X8lU6
	2S1I8LyTJJ9spvShlp0ZCaC2k+M4+xoZQW84
X-Google-Smtp-Source: 
 AA6agR669X0JpPlIJg+RMFelr1EUKFr5gEC7wCbC1O5+xjK/SBqBS4turh1Vr1v3X90iXiem1P9/6Q==
X-Received: by 2002:a65:6c10:0:b0:41b:ab8f:ff71 with SMTP id
 y16-20020a656c10000000b0041bab8fff71mr802158pgu.308.1659106066033;
        Fri, 29 Jul 2022 07:47:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/29] font-util: update 1.3.2 -> 1.3.3
Date: Fri, 29 Jul 2022 04:46:26 -1000
Message-Id: 
 <cf4e2a091ea18fff45a4444759fe3d70f751887f.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168645

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

      ucs2any: avoid segfaults if SLANT property is missing
      ucs2any: handle NULL returns from zquotedcpy()
      gitlab CI: add a basic build test
      Build xz tarballs instead of bzip2
      Fix spelling/wording issues

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 461b464eafa14719e1dbc087aad8cfbc8d1cf62e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-font/{font-util_1.3.2.bb => font-util_1.3.3.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.3.2.bb => font-util_1.3.3.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
index b3e832756b..64c705770d 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
@@ -16,7 +16,8 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "3d6adb76fdd072db8c8fae41b40855e8"
-SRC_URI[sha256sum] = "3ad880444123ac06a7238546fa38a2a6ad7f7e0cc3614de7e103863616522282"
+SRC_URI[sha256sum] = "e791c890779c40056ab63aaed5e031bb6e2890a98418ca09c534e6261a2eebd2"
 
 SYSROOT_DIRS_IGNORE:remove = "${datadir}/fonts"
+
+SRC_URI_EXT = "xz"
-- 
2.25.1


