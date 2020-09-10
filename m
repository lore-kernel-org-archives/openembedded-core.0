Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.20766.1599740692867378839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QvEr/fBV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id x14so6444483wrl.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fHV3iYFnZ8Jg4hByrnDg2yZrXFNW3zZSCaGxNPfdBaM=;
        b=QvEr/fBVJy6jGaHPZJfQ1pBfcQC0DuSrEVSF0hMonfygg96xsynMiT9IlnXvQwebUv
         ANp6tw+QdCwX3U2YdRvCK9FnZ7nJFQh4UCFhcA3BapGF79Pt3vBIT8Gd8ZQHuw/mD2Js
         oWGzntsnNBu0W4kt8eh9z5/KbBhG3rMJPORbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fHV3iYFnZ8Jg4hByrnDg2yZrXFNW3zZSCaGxNPfdBaM=;
        b=RIzfHn/Cf3AUJiwjoaxt6+6c0abEZdf1szaMIXBY6e7ll0I93jS0463Nj5aadx0V4b
         z+8lKAgVmuAiH3bW3uV1UX5ab+qqCdtV6PGxzhJHfStQ21a8K55k0bsWjznODPu2kbF5
         DzmjCf6CjvsxWUeza/WC/zSqPj1PMyuuTaWE423oVIuyU1gEQxu70dAWGVU0klGFCpGE
         /gPaTYUJdUNlStpq24dmoDeVgjs+S+qYnHTaILbkpmxsZ1uWqAZR8tID8tCXBnpkfcfN
         7YbtUukNsgKepbNAzTJSgE6MH7OCw6EdTkk3q900cOmvkR7tcE/FqGwH61B6wtdAnH6r
         LezA==
X-Gm-Message-State: AOAM530RTiuhpWhsmZVzDNvIcyUQjeOibB4SxgFGadqPVvjEn6NDau+m
	48vIUOC1kIuW+bmOHWRRx6WMLSsiii2MJg==
X-Google-Smtp-Source: ABdhPJwFhz6tcGVGxFAESdqEI2q+ErsU1d9hj6ZYPsKsSt3LIKbhN6zSW1rNiw3JlM2chNm1oxOeGg==
X-Received: by 2002:adf:f6c2:: with SMTP id y2mr8590458wrp.79.1599740691152;
        Thu, 10 Sep 2020 05:24:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:50 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][thud 18/29] buildtools-tarball: add nativesdk-python
Date: Thu, 10 Sep 2020 13:24:22 +0100
Message-Id: <20200910122433.2040293-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

(From OE-Core rev: 6467eb4461f3cab16cab2ba63154c92fc2adacef)

(From OE-Core rev: 848c61a07f691638fa529bbe0f0ff1dfded4a967)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 37f97056139..32a10198c93 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -27,6 +27,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
+    nativesdk-python \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

