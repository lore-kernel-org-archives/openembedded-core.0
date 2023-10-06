Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D7FE81DED
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 12:32:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.11502.1696595559176836585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 05:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDecX8+C;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c60cec8041so15031555ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696595558; x=1697200358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI5szylhXhwe+cJMQhDlUaQP0foB+kuvHJvldg6q+Io=;
        b=jDecX8+CH3HE8rsVNpPX6VnLgbg4tuGsr+RFBX53HuV/QsCPR82M8AhJ74XsDyjv9Q
         zAiIVJHAUMnDANS8tscYi6bdypwFRDw5JrsX2/Cx31MZrI7Hf2u83rC9IJ8PcePxOzIr
         4N1g3oJTLt9P0EunEO+O3WLznroPJSJcbLlQksentkFox7j17qrSPVOMl2Yve51shehO
         W8NjIPvetlBXOGU/eXu4+rXZ5xpqOv1X6y46aAo3iNqRfFrYJOaMiFezY8B5CpVtjO/f
         h1v1K38q6zx5xifNviuPvTzH+C2MkHAtml/OVLF0RcWGypuNhvjNdbUcaDxlbUnvx5Zu
         OpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696595558; x=1697200358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI5szylhXhwe+cJMQhDlUaQP0foB+kuvHJvldg6q+Io=;
        b=ZL10WYqHC41p75Qo8/AZfTgKwdVvthWUCXzy4mbnQ/iQ1NoeHQ2bKhar+NZTYgOY4t
         8M0IY/hE9KLfEgljBhjZhDpJGzxg/LgFxetcgaYm2LCtGWh1vTmxXxEkVcS20lcd5vf+
         tpn6bkNHUMKTu8QpSsZyH6VvyltrIOEIafbd1k93bRs6jL1DSDJuvtPjnbumM5gYUKTb
         g3wEq7c9vUnchs5gBb48KNhnqQtwNgDrne0ETKHpjq/MEo2i8qVjpLKlkjRwtdAF4Tj8
         hI/s/Ek97MlT/wZ9i/uiTE5LZHKImAw7DKyvRbqBEyN26Ja1uIxuo8hm3sIlLSCDJs0A
         hNEQ==
X-Gm-Message-State: AOJu0YxaQe+NHKGjXE19mZDMGG5N/7z7mI//1eXocC7ozE2DS+SI7Q/b
	RDUlc8V27O/xJmcAkQfOT8LdHJN7YNg=
X-Google-Smtp-Source: AGHT+IHnlWRjre4Vwxl1twHCaLSFtCujutPAo5L32XCaqE7NcVU2NdEg6m5FJ9QaHYJPlnM07tstUg==
X-Received: by 2002:a17:902:d50c:b0:1bb:94ed:20a with SMTP id b12-20020a170902d50c00b001bb94ed020amr9435387plg.24.1696595558312;
        Fri, 06 Oct 2023 05:32:38 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:57cc:1de:b13:e0c1:7141:5706])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001a9b29b6759sm3720482plf.183.2023.10.06.05.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:32:37 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-core@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [OE-core][dunfell][PATCH] openssl: Upgrade 1.1.1v -> 1.1.1w
Date: Fri,  6 Oct 2023 18:02:13 +0530
Message-Id: <20231006123214.57198-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 12:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188763

From: Sourav Pramanik <sourav.pramanik@kpit.com>

https://www.openssl.org/news/openssl-1.1.1-notes.html

Major changes between OpenSSL 1.1.1v and OpenSSL 1.1.1w [11 Sep 2023]

* Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 .../openssl/{openssl_1.1.1v.bb => openssl_1.1.1w.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1v.bb => openssl_1.1.1w.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1v.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
index d1222dc470..8a53b06862 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
@@ -26,7 +26,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "d6697e2871e77238460402e9362d47d18382b15ef9f246aba6c7bd780d38a6b0"
+SRC_URI[sha256sum] = "cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


