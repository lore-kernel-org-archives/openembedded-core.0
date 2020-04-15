Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.7257.1586917935626778280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 19:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RPXFQERG;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: jpuhlman@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id q204so12278523oia.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 19:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qx7Sk/AGUMBPyVSfz/DPpeI1WA55cmXZABncpDKXI3Q=;
        b=RPXFQERGHfa2b+TwFAwYTzAcYfBKNWWMsmrsZttjWOcAFAfQgCfDw1+3vC8qR7MZL7
         Xs8OfKhEkaE6y/MSOBRD16hMaYhkC2XuMe/uOnQqcYYgnilTZZnQWqtMdVkmmkaQm5wG
         lVIVFwnsN4ItOl2ZyCkAlb3vLRqh4qtF9UC4226LMe1NjqRvNLMFsPYWdNKcQv/ILGRk
         2ahdhXroE29zAr0YuBtbchegm4vvNM3fuHijFmKHwT4I6AClaDEGPtxAQAPqqJCbOzV0
         egxDu82WKw1esFjy9wdq98RbY+6dbI8rLCCoFjAYAcsKKVASJbACl+1vsqnrnTf+OUvP
         oDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=qx7Sk/AGUMBPyVSfz/DPpeI1WA55cmXZABncpDKXI3Q=;
        b=LFdOK4JlbD3pbhu+/XkaNidS25aBVy9Tf1QPgmaTjebU/hlX26XsZ92j5TIF3IQYw1
         Mfr9QfAisRYmCsNx2doxJ+VCwljvy6PzNUDUaXCI3RdkMnUPnpx5AKv5sPkLNIH47WtE
         vwKPP4a2worscjtzNBhtqWEV8Z2qsgoaXb9EuFFbJ9dDcEPZhpzWZHU8NmpYKMvVgLxz
         Roc2swUTTFou2k77myXWFxzXMo9hO47JpkJy7SR4VFg0COIg9bua8Q+ItBCSEVAQIZJE
         wmvIm3+eiKQkQxk+BuAKGQIvqIcAMtHipuisbs4DYCiFZqAEUv2Xc09tb7SVpn9ZQ38v
         tjkw==
X-Gm-Message-State: AGi0PuZSLZIYKNCWFXGOhS1ThEpelOnr2U9l1Am9Yke2apPbvHBw/uqe
	xs1kxEGDV49jA5UJ2o7z4wh6XLbv
X-Google-Smtp-Source: APiQypKlbioNIxfK7LdoZKbDdm7SlqLRZZhAUrhQuwl93edDfrg4MGybq1KtWKtRr+IOwRTPxOwp6w==
X-Received: by 2002:aca:447:: with SMTP id 68mr9702192oie.94.1586917934484;
        Tue, 14 Apr 2020 19:32:14 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id 89sm5912437otj.66.2020.04.14.19.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 19:32:13 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 029B12A0479; Tue, 14 Apr 2020 19:32:11 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH 1/2] nativesdk-gcc-runtime: enable building libstdc++.a
Date: Tue, 14 Apr 2020 19:32:04 -0700
Message-Id: <20200415023205.26050-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 771f344ac0..ace706dbf4 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -22,6 +22,8 @@ EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
 
+DISABLE_STATIC_class-nativesdk ?= ""
+
 # Newlib does not support symbol versioning on libsdtcc++
 SYMVERS_CONF_libc-newlib = ""
 
-- 
2.20.1

