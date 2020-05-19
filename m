Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.13197.1589899888939721869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WZ7Ae/Uk;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id q9so1548179pjm.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PlmiWkLysb4r+D6yjQ0ZeFIVpfZiZ5nnjkaDY6DCpAs=;
        b=WZ7Ae/UkhRAMK3yyXDV45VuHV//bK+f7BD3bXSLh2qCySflfqJBMf3H9iRYg9IM6R7
         /+s+WuLpxWPBegXGXxbmUtOFTTAw7+cG5E+TLVZkph5m7yVsNKn1+u5qVHnyxjef+oBu
         azjUTkqHSBMq2KMjfMHF1oJ0jxQTc/jphfeDA5/5+WaPVFV/YAV/MHblWxnye7E2yB+q
         +5ikU7KXDOmKVkPt/gf8sIJzNHWnXRqxYY2STSqby/5uaKiNyydRJ5VwGyrDO358EUjw
         wk/b4z/MEvG29osMvf7Xnf1t3CeIQvQ7mBBSEy/gvDuc7EpvrB3aNETQ1OufMi99uIgB
         jAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PlmiWkLysb4r+D6yjQ0ZeFIVpfZiZ5nnjkaDY6DCpAs=;
        b=T+m9XfUCkIhR037dHvJ002VfVJQUKz0Zx4QxI3MBYCeIqBtlY5tR+yDWXJABkrSpYl
         nONSehQFEtb2TrAh7D2OQo3UpaZ0L/cK4h/tq/DhwHjuFYFLmAoryTdXXoFmsSqjZ1V3
         3ysq70kXgcqNVyRPOk/ao5SnSAW6+/9+lW/jLCswLalJYYRkE0isLhSG/6gmH9FrJ/R2
         kRsETaU98J8SMpx6wO8mCTuzYsNUPCLClOSrBsjO0nUwr89fDSwNT3a9/r1do+hhDLmh
         IwjBYktxyyv/fXJ8TN/o1MN+CJTJROPvKLgSuJjQXHj+lpVOtEi4riSb9lyr6A7eYoxd
         g8Ag==
X-Gm-Message-State: AOAM5303HlPO+h30Oh3RMC/CpylWWvlsPV6lUjyZyVTzzqWsECs6+zcS
	FZHAAbZiTTMFn9XqkvfS5mOybcRM
X-Google-Smtp-Source: ABdhPJzyIQgHpC/MqTHDh3wbes8SK+ivYGIwpwvKfmQXApsEX5i+1fKKVT2W5fr44ODf0+mqNr3uXQ==
X-Received: by 2002:a17:90a:ee4f:: with SMTP id bu15mr2904081pjb.16.1589899888148;
        Tue, 19 May 2020 07:51:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 7/8] openssl: upgrade 1.1.1f -> 1.1.1g
Date: Tue, 19 May 2020 07:51:14 -0700
Message-Id: <620d69e7ad0d0c40ecd135e48f96aaf368c7f242.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589899663.git.akuster808@gmail.com>
References: <cover.1589899663.git.akuster808@gmail.com>

From: Jan Luebbe <jlu@pengutronix.de>

This also fixes CVE-2020-1967.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 204dc7c6fe..a57e09c802 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
+SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1

