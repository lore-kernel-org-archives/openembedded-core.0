Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.197.1588040167940376253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MFmeq16K;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 18so9938941pfx.6
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 19:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yB0QQgMlMoQPHP+Zoxod2xi1aTyzZxJaZtvabplcGn0=;
        b=MFmeq16KF4qpfBkDNVjjWISr6vHVLjw5E6u+oEu0hrcIB7eHt2Ci+8MD8r7SDfSVVc
         Y5KRsCFMNahoxq6SgGnYyBMAs+maza02bIrZmkir+tCXQ4vvJvxK6aoF+NWOY3cg9eQ3
         1oTYCkXFn3iKAfsEZ0GHvHPNDDxjJ1ZzIj9JH9ucaOjy9X5enqQvKr84kVTf0XkwbBaa
         UjxPYkScZaFYBeA4vFpOP45smrh8KEv/RlDSGE0f09EAFXlrRxffQ5pyUsdJvRFhrUIU
         rNZxJ8OmOnT47N7NMini4SeaLz/WHN+6y5VFSweUUnEP+xJDduGWShMJ/CtvqU8AtX9R
         cBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yB0QQgMlMoQPHP+Zoxod2xi1aTyzZxJaZtvabplcGn0=;
        b=KcVGIz2S4Ary+tYD9rC3/7bZRROCMAG00i1M4X0f/sCAbtWFg4RDdIpHBgeIPM5Cge
         2mymU/YDDNvx5fwKIWJxCq2I7MFBriEsMO3W33Lo381dv9H00qs8C5jT9dL68oFzXX34
         4IHjijFhwcXreuKukswHZ90y8iiybPINPaEPIsazhltrE3zcolR4rHvpcO5UnrEopbE0
         KV+UWL6i7RTiWGVTNzidiAhFcm/wbPaOe5l0xOvlSmJNJoiY+5j5cIljA4K3W6FTARWa
         jDd4jcdR43cDvZ+FtYZ+RytBev8fBCIHLN9fv5B2DhpB4LAvoB83YdT75xz0CBjTA/2x
         GPeQ==
X-Gm-Message-State: AGi0Pub+JPb5myC8FZmd132Eypt3ZeGV/jJFkD81KQzVsgq+ToK094vl
	1iYJqhcJGomTwbJkXCzQmIGz1Pzr
X-Google-Smtp-Source: APiQypI1ogdAwI5plLurvI9VGcB9TMQlNv7iU2YLNhPrMBu0tmYiEFObR7MkxmWXBN6sUCcE+wNYYw==
X-Received: by 2002:a65:6417:: with SMTP id a23mr7951706pgv.204.1588040167268;
        Mon, 27 Apr 2020 19:16:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1bf:759e:e8cd:49cd])
        by smtp.gmail.com with ESMTPSA id 6sm12328390pgz.0.2020.04.27.19.16.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:16:06 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus 7/7] openssl: update to 1.1.1f
Date: Mon, 27 Apr 2020 19:15:56 -0700
Message-Id: <bd3e0d724004a346921a25defa6d812d48d6108a.1587931177.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This also un-breaks python3 ptest which got broken
with 1.1.1e update.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4ddf5b9d8cd769b7026663f93c8bc69b55d8cbf)
[AK: bugfix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
index e5c62cc9bf2..aa4ef6f48a6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "694f61ac11cb51c9bf73f54e771ff6022b0327a43bbdfa1b2f19de1662a6dcbe"
+SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.17.1

