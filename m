Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B57C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 22:36:01 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.951.1754692554436406635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 15:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxIM60xk;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61521cd7be2so3563780a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754692553; x=1755297353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1YOp8cCTzwMpnO01NXcquYVCUN9Dt5Tx4EEXaDnq0YA=;
        b=NxIM60xkm3RvcgujM0rN8z00EOpcH9E199HrQ5BniJlZbR5Jd91zlgTtBUbhhUOpDk
         1Xgstb7pgurt/+VGpoSYIK0Dv9z7syBowNhTRkxbXREVjjV80+bwrulWEIjuSPaIUGdk
         7ApCff3veLdkyD9asRnD61IwwN7C0tDGLV1pgCzNTmjrEOvRsbKmhrMPZ7GItf1jR4FC
         kgnwOA357bmgFEBYYp8o+QUrkjEbYsI7HDqnlOCo6oTTnvNz/4l+WhaVA6oXJwhx7wo6
         r9YcwlGI905zgTLNuVnPDHWdzrBdg+DNAvCKIC3Jws6Qr4BSSphv2JeatfJdl6tXXaq1
         dNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754692553; x=1755297353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YOp8cCTzwMpnO01NXcquYVCUN9Dt5Tx4EEXaDnq0YA=;
        b=KXv7ZommjcBOwcaCJvJE8cKtv1K/noaQ6d3ajLB/NlEXGMf2/GZ5gFWwYGO2kW+bs5
         lDYHv4BmrdFxBxuE5lDt4Ly2SiJPpQqcRKUCtO55B7mD1k8uNZKWJyemaKNsDKALbKpv
         HO2YAzxXAYPZuinmJFEgRBJG09VDlxq6/lR37JJLr5mPLgH7RBzyshdPnnTh0yVx/G0J
         LqC051fSPRNyfaGiL19EIE9fGXQqz+9d8v9Aaz7F+MCwhBxp9onohbbdUlNkQ5balLG/
         ySqg2oDGgt8nBfKYAZ3+gbFHQ6XZzWa1410fH/t/OnoUt3xPoSxZPNYFo4lOG7dfMnUs
         vlag==
X-Gm-Message-State: AOJu0YywNJKM5X+J7Gi+QhfD0IRKKdTpJOE9J+kBf24i/YQTD+OReIJa
	AdVmRJ8bi4IyfnwgCDYfF1Q6P2lUbnWDov2ACCFY/ZU3Gnlv+bVtpkTr9Wsk3TMbedU=
X-Gm-Gg: ASbGncu+aMHI+KHQ3ZM+mQBEkRufCy/v9lAy0WMVFgBEIC218XA9dF00dceqQErGS3E
	bRHAut+ccKmgxO7E7rAtM6qOCcuNNg1Yvx9OCgljz4ob062Hh387i/FSkp4El8j8J/DpRbQevhj
	vB3qQE9gco6zS8aTG1N+X29htONo86Jc2xMTHr8ZwuG5Ix8rLh1WrdJiuBeFHc7XScep0ZYTMX2
	M20i8WSUe7J1GpS/fqVq6+yK98GAolcNDGjPNA3R1kCFPnlm/Vk0Pt21DFEnt3cVbJfrnnM2zpQ
	ro9TvIE7puEaMQNuHHw48ZJWknCIRHTXmM1iiLD8brNJojXPkOwh9T90ca3zCAf2I8ukRkZ33E+
	tSYA9vube16liClGlK7KSQ1qG
X-Google-Smtp-Source: AGHT+IGtBOjcJ13Hp1X5hEdHR/4/vU2kfJQ3G+LcoRw4yIRJ4wI0m0LqAcbZpLBBMJQJmDcYyPzyQQ==
X-Received: by 2002:a17:907:3a52:b0:af9:61d2:9416 with SMTP id a640c23a62f3a-af9c64f4549mr301063766b.39.1754692552490;
        Fri, 08 Aug 2025 15:35:52 -0700 (PDT)
Received: from XPS.. ([2a02:908:1b0:afe0:e795:7a73:85b1:528c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a38aasm1568594066b.37.2025.08.08.15.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 15:35:52 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: robert.joslyn@redrectangle.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] curl: upgrade 8.14.1 -> 8.15.0
Date: Sat,  9 Aug 2025 00:35:04 +0200
Message-ID: <20250808223505.1664029-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 22:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221670

Upgrade curl to the latest release.

Release notes:
https://curl.se/changes.html#8_15_0

This version includes bug fixes and security updates.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 meta/recipes-support/curl/{curl_8.14.1.bb => curl_8.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.14.1.bb => curl_8.15.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.14.1.bb b/meta/recipes-support/curl/curl_8.15.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.14.1.bb
rename to meta/recipes-support/curl/curl_8.15.0.bb
index 08ad9cdb17..809aac8bec 100644
--- a/meta/recipes-support/curl/curl_8.14.1.bb
+++ b/meta/recipes-support/curl/curl_8.15.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd"
+SRC_URI[sha256sum] = "6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.43.0


