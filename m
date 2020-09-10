Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.20446.1599740686472285582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I8U5rHhe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id q9so5454283wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2ARvnDDeXj3jBVZgdlZpzyDOKSocCopqHqQxNZx8jK8=;
        b=I8U5rHhen3n7E3dLMRMmhhS6MNGtw3cHCmQceiGuN7ib824xccMmsKDe5LB+zFdNtl
         I090350CDVO9bekfbJW0lvQ3K9WT8etuTlbxGgLjUAYS7HdXD3QLTfUGowTUvilWn1Iy
         I6YfchUgUEN1ISSrCTtKA4EVqW1k9wRzAZcrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ARvnDDeXj3jBVZgdlZpzyDOKSocCopqHqQxNZx8jK8=;
        b=Ik1YiWHm1SM4HPGMYTrVS3nPNGV/4xIEyUKWPYkQ+uvBNladpU+pYl5fo9gHE5R9Zv
         w735LgbnipcV9kH2ApTcWTHINABC579PhcvuTcQsEGhQOg/EGrXxzYznFSRpEaASDrz3
         rlT1w+074Y16vjrqsKZE6O1nl/SkNuSJMdnpLJQSAcY/VWlpC0xFqs4eDX3/6JdbDN5f
         kiQoZ1hXAr+c0/KrzKN38shzmjFCtLrTcaotprTapM705coD9ScBbKfak8DDkN+Kk2bw
         7Fa3cbM/VZ4/L3LN8liezeuHTj6xZFsgE47RSMCHVAuGLdb4IF3tAFr7XCV8tYvymNr+
         1xrQ==
X-Gm-Message-State: AOAM530y/XsaSLDk1jRihNfOT6Cb6orfp9VB+TipR5OIUkRdMtVf3cg7
	JTS9z1NDP8TFpAH3ipD9BPDnZvA9AM960w==
X-Google-Smtp-Source: ABdhPJxUN24WtGNw5cR6r3aCqhPB1RB3buZwZ9n6QdbVY0nyPVpZcMwaO9zRKrlcIwEP7bFOdujmLw==
X-Received: by 2002:a1c:1fcc:: with SMTP id f195mr7930944wmf.127.1599740684743;
        Thu, 10 Sep 2020 05:24:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:44 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 12/29] binutils: Install non-alternatives links for nativesdk
Date: Thu, 10 Sep 2020 13:24:16 +0100
Message-Id: <20200910122433.2040293-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SDK we need the plain symlinks and don't use alternative providers.
When these are missing the toolchain can work incorrectly so fix this.

(From OE-Core rev: 0c06cfaa016d06cc56d80dc1c244a938f3d38a3c)

(From OE-Core rev: 0d299c5dc04407d2d54574157f4014f50f2d0468)

(From OE-Core rev: aa37b5fe0620122e47f36165f5c7a07d3328dba3)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.31.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.31.bb b/meta/recipes-devtools/binutils/binutils_2.31.bb
index 3dcc837c787..625e18c787f 100644
--- a/meta/recipes-devtools/binutils/binutils_2.31.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.31.bb
@@ -48,4 +48,7 @@ FILES_libbfd = "${libdir}/libbfd-*.so"
 
 SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
 
+USE_ALTERNATIVES_FOR_class-nativesdk = ""
+FILES_${PN}_append_class-nativesdk = " ${bindir}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

