Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCC8C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:37 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.5852.1651048828141671355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VHCazB/1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l18so1951201ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SUF6ObAJE09peQNS7rbAb3R0OYB0rI/IgjYHxR+SzSw=;
        b=VHCazB/162rXqOPVEzFILQMooWeHWuclUCCFPVWXr9lFz0DU2mLfO8TYH/khuxrV0o
         aOsFGwKrwTk3VKRkMe1hyTgULVpkfqQUdhKouGGe82dfsZghZ3ORCSxHuCD55oTu92O1
         Rq+YXAaV8RYw/xYYa/Llm46RWh8MJy8ivdQVO6n7JZIHvLpzoBZSjhwlmQuWAhWBb3G3
         DXupbgx1s+gGPwpQaLHLYrCjpDZbu6xmKTisY90oDVN+c+3k455ccs82aV7uu90QLOrQ
         fbeWVYj4Zy14/QrxCx1GsibTSu0R4Pj+H3SETwSTD9B7bYeb4lbFZsWyTQ2Fke6HpxjP
         KZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SUF6ObAJE09peQNS7rbAb3R0OYB0rI/IgjYHxR+SzSw=;
        b=MXlXjz4ms/FOc9oTB3/4GqTufaIWAN8aFdXWOUEnuc0p6PO51+1cD9H51CRtUTrK0g
         cPX4E2jp0odQz7R+sIQ1hXwY7gObt+YaFjt54wNdRUf/5aan5StPHoOGtbosl+q2SHV1
         6m2tPiZ0VBBGHEMjNq0qtdzsX/OfdUx2hSEowWD0+Ytawc4sCs/wWOd5EN63/9pWHF50
         hNkruzfYAoyCkapCace82+5w0yVC04hR76SOwssLilhwKLYWb6PKdfR3/43Qor+ywOTu
         PgL5MTcN0SMZcqmbp+WeuQS68QeUnYZf5oTlFpuid0RQ4CByvlgCEA97y+LNtqO1S7kp
         Gqig==
X-Gm-Message-State: AOAM530c90B94jiUOhghgVbKz90qgFCNb1J0KoGbyJrkFCNH6XyJJuFI
	QpbDwHQRbIgWCPCXqUV4NgJTI5nza88=
X-Google-Smtp-Source: 
 ABdhPJxT3bcZCM6GzV2pUEowvleitrzwHY3/Moohurj3viWwjLvHPsHPKOOwGnK6buxx15qw4I0gYA==
X-Received: by 2002:a17:907:7252:b0:6df:75cc:615e with SMTP id
 ds18-20020a170907725200b006df75cc615emr25525385ejc.683.1651048826734;
        Wed, 27 Apr 2022 01:40:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/18] libgpg-error: 1.44 -> 1.45
Date: Wed, 27 Apr 2022 10:40:07 +0200
Message-Id: <20220427084009.3406717-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164907

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgpg-error/libgpg-error/pkgconfig.patch       | 13 +++++++------
 .../{libgpg-error_1.44.bb => libgpg-error_1.45.bb}  |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.44.bb => libgpg-error_1.45.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 6b9b623b54..82bb4cdb47 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From 52aae746760ce5b88e61ce994f5055e4ce809821 Mon Sep 17 00:00:00 2001
+From 0214d886d0153f7288f81213c47dc50f3b9fde20 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
@@ -14,14 +14,14 @@ Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
 ---
- src/gpg-error.m4 | 160 +----------------------------------------------
- 1 file changed, 3 insertions(+), 157 deletions(-)
+ src/gpg-error.m4 | 161 +----------------------------------------------
+ 1 file changed, 3 insertions(+), 158 deletions(-)
 
 diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index 56a5d07..28920ae 100644
+index 4b5cd40..c9978d6 100644
 --- a/src/gpg-error.m4
 +++ b/src/gpg-error.m4
-@@ -27,157 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
+@@ -27,158 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -137,6 +137,7 @@ index 56a5d07..28920ae 100644
 -    fi
 -  elif test "$GPG_ERROR_CONFIG" != "no"; then
 -    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-    unset GPGRT_CONFIG
 -  fi
 -  if test "$GPG_ERROR_CONFIG" != "no"; then
 -    req_major=`echo $min_gpg_error_version | \
@@ -182,7 +183,7 @@ index 56a5d07..28920ae 100644
      fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-@@ -193,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -194,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.45.bb
index f5b482f4c9..ff3a673df2 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "8e3d2da7a8b9a104dd8e9212ebe8e0daf86aa838cc1314ba6bc4de8f2d8a1ff9"
+SRC_URI[sha256sum] = "570f8ee4fb4bff7b7495cff920c275002aea2147e9a1d220c068213267f80a26"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.30.2


