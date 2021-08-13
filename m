Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.37403.1628865148689491687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fmxgO/3K;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so20902278pjr.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tWpJrECbYtqSRtMCgdR6AmzI8fAZ/Wy1Wl/2aC3l/vc=;
        b=fmxgO/3K8c2UT7xo8hoYSeqU94U6E1/JvJXbVwudDXsno5mV1+xcN/KKIYs0v55wZD
         eAuHaU/wvhCtuFDdXj9fxrCnlX6bIBYnVS/0t6+LM6K/N8pq4DKAIphRnz+bdb0JPY+t
         fLji4vsGMlhoKkrxbwjy6zKr0XUsPH7oeh9y6DcnFzqZrCMhQUkWE767iagOnywsx7kT
         zsm2pfMS07spcH5N393R8uY2/+msXoBh3R+hYhdNNaJgMB19+v4WWcukrER2pwGRSNG0
         gzI0syI7Zjxa9oyRaW9jt7MlWMG0uym8brQm47Uo4vYIBygKYoaC3ufT30JTXEOlPJ65
         OAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWpJrECbYtqSRtMCgdR6AmzI8fAZ/Wy1Wl/2aC3l/vc=;
        b=NVfo0Oc65GYs84ygDhW9m7GLaBCpgZ9WDLWrB64+2b1gPmbcpTxv3Kx6Wr2OcQcbH2
         csRjQ7Uzl21oT+4oH6sCFmxV1JSh5+mTKP68NOi2jHqBzq4k3fyXHAlweB2UwRNVRXxP
         oRrCI1hH3g1rZeh/4L39YmPROhVa0GjUD7T6rknQzyBioOX06pgH4jrKnv0zwY1LKFeq
         d3w+Qlw1wB2WdSdPbd6JIYyjKUpVAOCDbjj4CvMlqKnN5mkfkwoUDv3mjKMkE6mMTvNP
         e2hrQgh73EvphgqIgV6QbOFSCXrEFeCFWuHntwsTJe7F+vuNV44lNSREEEe0Zepkri/C
         l8cA==
X-Gm-Message-State: AOAM532yK/PPZCMK1XsVA0sBviJ/lA17uyMudWFgbbYtaOsIi4LIKkv4
	roWLjnbMweEMfwQlsvP9F3J9h0/KEafQqdQ8
X-Google-Smtp-Source: ABdhPJwcxcoUHaXF5oQ3Cwrjq9FigUsPDjsVSCgEbOBa31RCHawogpO3OamEYqHNPpNXs+Xkyr6AJA==
X-Received: by 2002:aa7:8c56:0:b029:3c2:ca37:800 with SMTP id e22-20020aa78c560000b02903c2ca370800mr2719950pfd.54.1628865147861;
        Fri, 13 Aug 2021 07:32:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/17] cve-check: update link to NVD website for CVE details
Date: Fri, 13 Aug 2021 04:29:54 -1000
Message-Id: <6a1760c93c3185c1968df28083c54f47d87d994a.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The old URL schema
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-ID
now redirects to
https://nvd.nist.gov/vuln/detail/CVE-ID

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57adb57a9d9b08c08ab606ec7b561792e4f4ff2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 03aafc5a54..df6ebfd29d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -355,7 +355,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     if include_layers and layer not in include_layers:
         return
 
-    nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
+    nvd_link = "https://nvd.nist.gov/vuln/detail/"
     write_string = ""
     unpatched_cves = []
     bb.utils.mkdirhier(os.path.dirname(cve_file))
-- 
2.25.1

