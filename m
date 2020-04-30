Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.2340.1588286195577467370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZCzIHjN2;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.195, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f195.google.com with SMTP id o7so1202719oif.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KOJUE5tEJKQtYV0LmBPVvlCXUEYPkozYIbRnXLr61u8=;
        b=ZCzIHjN25E/ndkzn0O7JG7ypgqSiYNZFk+Gs0Lhz0Z0Zn8wOrJVAAIrzm5Y40RvXxd
         5P/TYrijySxaOuq+L62MaMiPbWGFzzOYk52r4hC/UZ6FclvzmM7m5i++HLsWxOgTxLW/
         d4RD+NA6C9G6cpLROh+6Ynecm6QaSmDgVUJBAYhjCY6ode7JQ5oIQQs47ALbgqCr9NQu
         j86WpK3j5lUqhICDQQM3QBt0BfKZjapwOZ9OwBiiKsTpthNFz4c8dGAf5ePMRKq489Af
         vSFJVnIj+6vCFVmyUHybQRbUB5Mf10CPoSSdNIdwNaJS6eKKAH55kK0JWBJU1Kp6cX8h
         v/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KOJUE5tEJKQtYV0LmBPVvlCXUEYPkozYIbRnXLr61u8=;
        b=t8P0kiN5Hb+9FNAsvNOofQBBdPpL9TlqSP/36gS0wJC7X9B0z3DTk53TxNLg33FHri
         zTnTD1AnF1TCW6nRlOnxk9x248Wlz4wYRgQaBb8Ir0i2esH5OyVHsF2TuVROTkjcnhen
         MugQ+Ch3BByPplf7YZapZHkiyc+NZ9hX6uX4UrrjGo9jvV7ao6+GATTNUlckLZbCNWfQ
         MAF1iG44Qgq9KB7zqAJv4ru1qMUj4lNXnVTGL5uK2WTHL61lIQf8eq+zp8K+2l7eDuMe
         5z94dtTDSjch+EQHWDIqNQW+plYQZLonYzwL2/+/djcvhWfF5KsXQS7nRbKth/L2ACwB
         MH0Q==
X-Gm-Message-State: AGi0PuaYLgOWeLC6DfYRLPeB0qubw6I/I+W+seekLrLzB8DWr6xt/OQf
	m71oOr36IqvezDAhnpd8dsFyptyMqe0CwQ==
X-Google-Smtp-Source: APiQypLboeOA5mHPH1KnC1WHoaRb3jLHtBx123Zp+UELAXvUafU8zL4lprpU8gHjfKKKpkDXAAAYfg==
X-Received: by 2002:a17:90a:1b0c:: with SMTP id q12mr1222732pjq.116.1588285864475;
        Thu, 30 Apr 2020 15:31:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 05/14] buildtools-extended-tarball: Add libstc++.a
Date: Thu, 30 Apr 2020 12:30:10 -1000
Message-Id: <dfeca4d1e2442192aa40c420648cae2914c30be5.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Jeremy Puhlman <jpuhlman@mvista.com>

Builds like native-openjdk, really wants a to link
some tools against the static version. Since when
using the extended tarball, its the only place to
get it, add the library.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index dd780c5d57..e38967af3f 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
+    nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-- 
2.17.1

