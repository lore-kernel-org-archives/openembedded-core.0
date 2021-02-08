Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web09.35216.1612792413214594428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qHOCM0ww;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id l3so5679702oii.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZcwDtHTwE3o4M/SGwOxgfwPmI/f/oCP9vjCONEucAfc=;
        b=qHOCM0wws2j3uonXAcCCE0+qS6Y3JgPWSqsfY9OapcitwhMOK3KHGGQ3zKZHKprRsD
         RjAXdY7sqdqOkIUnM5Sx22W59x42SFXngVS5yGOcSu08xZJtrm+DyTvec2zhqpfUeMOO
         i0pCkPYm3QE3n5unohQFGwHHxM7oCm6AWIjIpFhLis1g30NleE0ybjQ8SSHTOwj4Pblk
         536ueIS2p1M3zjeD/jK7CXijIb8Wt/f5lndEtM2xcnG8neay1r6pWOVAFZTG+4s6ulHD
         uLIoY35XFKYnHiaVohFL9FsletiqT8he5pHqadMEQcqxD0wli53eTz3vKnhdRo733pt/
         uYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcwDtHTwE3o4M/SGwOxgfwPmI/f/oCP9vjCONEucAfc=;
        b=Z/TUDvxyhH7FI92ZZlarraloAAxJ080Kv2BFzS0lkUCr9a6BnnJUneII7z9Z8t2gGX
         pXcBT9AZ2Gkdokl1FJWoQyktL94BLp/nRcfaTYl3ti0la+yyAvutj/gpTKL9sV1OqRfc
         lHMHBkS+lKEEh+j74hZ8SvlGwbIhfBX7Dft6jGLO8CRLrRg1QeD6Fo1UklzwfH8+jSug
         1BD91V5U5a45HOOf/iU5mUJZ9JFwipVcJD/o6nGqoYPALgLxG9xcqlRHNF5inSlHTWxT
         W0NfdZoeaX/g/0wYh1x08/Q5AfBCDRD6JmCVa3QJrMGOL740yO/ELbsUuFHkKsrWf5+O
         gRew==
X-Gm-Message-State: AOAM531WK345vUoLCA5Tx3PPUHMXlG3+YwefRydYayMFa8nyAKbdPMlK
	9WJuL7uKdq7mGaaQackPpo45ifMxKtIwYNXfyPI=
X-Google-Smtp-Source: ABdhPJymrMce8Q3vJSCohCoMhMVJV2Eo3K8ca8pHfc0fcohj0ENm+0ABEQD/sObtqSfNNVCUDjt8gg==
X-Received: by 2002:a05:6808:65a:: with SMTP id z26mr6365520oih.87.1612792412001;
        Mon, 08 Feb 2021 05:53:32 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:31 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/28] openssl: set CVE_VERSION_SUFFIX
Date: Mon,  8 Feb 2021 03:52:00 -1000
Message-Id: <b2feaf6826f4ead7b7ea141bdd27e9c96147b6f2.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17df664a32a74f17baaef8c31ac23adec2d6255f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index c2db596f03..5d22c511aa 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -210,6 +210,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
 
+CVE_VERSION_SUFFIX = "alphabetical"
+
 # Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
 # Apache in meta-webserver is already recent enough
 CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.25.1

