Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.37481.1628865101202508330
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pntTZnSA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id nt11so15553885pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xqPHKAD1WXwtOi+OX8NGb4vC70xVIDk8Fu5PIeSwN9Q=;
        b=pntTZnSAZzqAKjMR/sci6EvwcJV+qBUQdkIRw2ECwIMFZOlavaJaf6XVmggn1OcT6G
         ytzFrXlQU6vm+tzVMbTWLpXGoT/rh6iqx0nrOCE4AXhGHxH9m4mjf1TWP2lY8FPYugJA
         +3GCpTLOFNpHOKtXdoOxFHB4YOxREQZd27Pke+bz1UxompnkPzsiXl5OSl3SpMNW6BkA
         rwLUSKuzTL+PARYJHmZllmO3BSYYXxNm6bw7ZeqgECF30ixvKst0gZvSxVko9ouvVKip
         M+JmsE3wnjgM2uIvOcRLBZj+HI+2EBV4aoruMQhXvNuSHsAZB9/cBo7EOWBp71nRomgB
         Tbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xqPHKAD1WXwtOi+OX8NGb4vC70xVIDk8Fu5PIeSwN9Q=;
        b=oHh8aRtgfY4n9TfNQChG/JvbIhqrAzSQHcjnHf9mhA46KFE5TZUDZYX2cjbFqhMlhz
         l9oNhEESQ2CXHoC89JbNN7ivb4V4YWjNqJVymxj7r0asY3daBB8r9GAaopga9yrgj9Qo
         4SmNtQXMNjwMbnaeLNGKPmhcQD7MjY2Fv8wbsZoTp1vuvGi48EVXQoMkM/tBZHkGxhZC
         t8ZcbJDPqPt8wO6rTz0Ns5aRYnBLQVo34cpJrw2JwuEy7tMykF/hOrddgLXGVKvqG3c7
         77rd73X/DtZDR6zR3jufl6C/nUdIAxM26Nq3K470mggu4b/88piwLYh+EEa5WM3fOoUj
         cCqA==
X-Gm-Message-State: AOAM5324hYFhoYbe/ePLswCcmlNgq2dunI7RgKl9HIjRVjmweyhbPZxM
	s7u75SGslMZjUKIiuozZO2Ha/9zcybDibLMt
X-Google-Smtp-Source: ABdhPJwU7cLLZjnEp9YSKzmGTFm7sDyej+eJSlPnlA1zAhbSA6B8c3C2G6iJNcrfzkqgtgkXMlhI/A==
X-Received: by 2002:a17:902:7406:b029:12d:3bc1:3812 with SMTP id g6-20020a1709027406b029012d3bc13812mr2330126pll.67.1628865100293;
        Fri, 13 Aug 2021 07:31:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:31:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/17] ruby: 2.7.3 -> 2.7.4
Date: Fri, 13 Aug 2021 04:29:47 -1000
Message-Id: <9b1a0d63186a64d78de379494fe256087f62770a.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

This release includes security fixes.

CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
CVE-2021-31799: A command injection vulnerability in RDoc

https://www.ruby-lang.org/en/news/2021/07/07/ruby-2-7-4-released/
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/{ruby_2.7.3.bb => ruby_2.7.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.3.bb => ruby_2.7.4.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.3.bb b/meta/recipes-devtools/ruby/ruby_2.7.4.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.3.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.4.bb
index 318b9acdae..dafa7d2f6b 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.4.bb
@@ -9,8 +9,8 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "72ef97685008981de3ddb748d0dab31f"
-SRC_URI[sha256sum] = "8925a95e31d8f2c81749025a52a544ea1d05dad18794e6828709268b92e55338"
+SRC_URI[md5sum] = "823cd21d93c69e4168b03dd127369343"
+SRC_URI[sha256sum] = "3043099089608859fc8cce7f9fdccaa1f53a462457e3838ec3b25a7d609fbc5b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1

