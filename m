Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web12.182.1630174442840343847
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xgM8Bh0T;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.45, mailfrom: steve@sakoman.com)
Received: by mail-io1-f45.google.com with SMTP id b7so13566407iob.4
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pVWcIuToFQncIdg9BhuhSOgsIQa76lLExoyAYObvS4Y=;
        b=xgM8Bh0TA6sqn1kYVQv53S7dECel4LXzan2RjQKUK+Rp6SOdlmM/fNvaX+8wsITLhk
         XdTeh/Sg58yI0f1u0K3R6ZEus2Z63Ts5rpuKsCnvoiKKnNxdYknnhvDfCYQl6MPK3WPK
         SFRgFC2j1ePD6w3UHZIfu6Uy5KhgEfo2pomyiJU+b13DXYTKrVcguTQSSSK9fbrjmktc
         XyQ09GlLsoY7GCx9ZRKI9AzyHSrzFk84LOO9xxxXjvVkpyPIu9jSI3bYUWO6hes0CbCC
         LYHYNWA2Y3JAaxrxDA0rGhg8amWSSvUF4+JLtdWiwv8RMA+8TLJtdi0eKuvSGEnPvTfU
         VrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVWcIuToFQncIdg9BhuhSOgsIQa76lLExoyAYObvS4Y=;
        b=qVC2+SDms/V8+y8Oc0muDjrDJACfMLlnQZuPHikiJ3dG83ui6r1ustfpzyR3LYt/h1
         am+CyA83/+TU1F0HPcXaYhs43T13QT0TWsk6x4bpRn3avFjoz2uRz43CqQyyN0d255g3
         zSMqVIB16ikXs0G0oZvlyERP34Bk4S2hPgvSLpxRSSu18Tu+9/OJkVpzuACeyJHMMlQl
         oY8yzkDW930HUdUVNQQqeJLmBveI3RUMtA3ezJhPCIFvha+2aL75SVkUFetAQPepmBxe
         RahJNMQCdlilmT+JbVLzoWDOIixy4ARzK3n6xZ1LM8Vt8zZTxVteSBNwsLXj0nQfB6oo
         DelA==
X-Gm-Message-State: AOAM532NLmKXIBSOJC9sLEJ6P6ibJ7UAwHqxiCMYnRnDQ3obVqicCl9N
	/QO4CD4M8JpibHc/6YTNoRC3J+MxV152bt5l
X-Google-Smtp-Source: ABdhPJxa41jCAP6WVUmSuX3/q3KF5pcbE5Oi5fBp9kHoXLjj/o/kFn+oXAv2mXntOLvxohLxd6F9Bg==
X-Received: by 2002:a05:6638:3789:: with SMTP id w9mr13386755jal.131.1630174440813;
        Sat, 28 Aug 2021 11:14:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/36] openssl: update from 1.1.1k to 1.1.1l
Date: Sat, 28 Aug 2021 08:11:13 -1000
Message-Id: <e26bc21f09ed1631437fc990cbda86c8659d4738.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Changelog shows only security fixes for CVE-2021-3711 and CVE-2021-3712:
https://www.openssl.org/news/cl111.txt

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index 5f281197c9..9412b19fa5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
+SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1

