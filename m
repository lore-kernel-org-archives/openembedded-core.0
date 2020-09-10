Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.20454.1599740695085293204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aie+4Chl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id s12so6453150wrw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vBGICupXxZUihntGthUsQ8jcUvf+7fN90+YtaNZoSAw=;
        b=aie+4ChlqrfoBxByfNr7GE0innI5kWNa2oUBWIihsQXAzmhmQi6oJMAtn23PFbEN/I
         qkbmL5QZ7NfejjVd6cCxIb5U8OLHILHfhy48B2pJCAgOH4ikaVPLJ2e0KR3k8ptlrMDK
         vEJ90VIrmtRxPp7S+6pJ3aHetSgUxR3MJjf/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vBGICupXxZUihntGthUsQ8jcUvf+7fN90+YtaNZoSAw=;
        b=Vqr6KaPjSz4bs7XzjUHTL1frtmSlc1pfnwO9ZT7MXornNlUJuQ6IhhxelovYOcEAuD
         vERsRSrQnGZlO6x8SOo999pM+LhhIf/obs8IH6TPy1KpPLGVorWn9HQp23j9mUWXPO/K
         HtKGyGc6jdzROeHdNYyJRrp28p2q7Bhv0qcMlJrVTs8Ww9npzwB/XlHXJjwJR5G6qRYM
         FGfsnrrCCNYC+8QRTgeaC24RFtrduKF0nXhrzVaF9PFuT5Sq04BmA0e+i+cikb02y9pc
         j+bKgXJsYQ/QFZHLIBoXBuZ66uFPhPumofjNhUvU6HLfbqRXRy1zZEBdrZ3MaSS8QsZx
         oqUA==
X-Gm-Message-State: AOAM531HbRGkG4sbT8huJqsQZ7v6JWHOa/BNZW5L9UD1E0SdGAZ34ymJ
	uChPsRo/IdLCjLtOpNUJ5SKNDrac4Pp1Pw==
X-Google-Smtp-Source: ABdhPJy97WD9qkise/mdMoJFwt6bg3saUJKRGHfEE8XouyFHxRYt2q2PUlkhogxnEFJiJxomYL+UJw==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr8503509wrt.48.1599740693315;
        Thu, 10 Sep 2020 05:24:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:52 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][thud 20/29] buildtools-extended-tarball: add nativesdk-libxcrypt-dev
Date: Thu, 10 Sep 2020 13:24:24 +0100
Message-Id: <20200910122433.2040293-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

virtual/crypt-native is assume provided in bitbake.conf, so
buildtools-extended-tarball shoud provide crypt since it doesn't
use the host's headers/libraries.

[YOCTO #13714]

(From OE-Core rev: da948b25d5ef452fb35275d108e18d2a2829f4fb)

(From OE-Core rev: bc42406d83310398bc4d4db4244252411eff117d)

(From OE-Core rev: 6f6d7278358b042aca3e911aefd0d6128480f32d)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 32a10198c93..94ed57585b7 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,6 +28,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
     nativesdk-python \
+    nativesdk-libxcrypt-dev \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

