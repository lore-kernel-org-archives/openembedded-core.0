Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.502.1621543749431199766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KLCtYRFz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j14so17221256wrq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A3HeEu8qSouHpsblzE9M9ef37MXh1t397jsbCoelO2M=;
        b=KLCtYRFzvOyprlzVwOAY+74dT6eP0fK3gzBE9AsvJBKj896g7UeksU0R3CFsbtTGqj
         3qqJxtQvzKHnUjZX8Qo4QYNoA9RO8E2CDnKlekRiweQPdKQhot1ZKTbKQbGcsgtxOKvK
         YZDCn/iJn9ZWt1BUPvjHbpsZ5ViOeF0UXkbJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3HeEu8qSouHpsblzE9M9ef37MXh1t397jsbCoelO2M=;
        b=GC0jxmvLMLuJ80N4OL9vDPvJzQ11pz1C0EgrP23CZ6Q7Mtl+XtaGywCudEwz+PYA3b
         lWBeGCwgMWcpbK5B6V3tFj7Eo44sJ3Jooq0oCtIt1kbUMpSpP+dizHIoiOqcmPIUnhup
         ZOcsidp9hs8YF4MZ4ztCB7F6F9BvNJVE9WSReoXVp/vOHWlO4dXb5r1LE+q+Jwnwk/8D
         OFDC7bnEb5CkXgF6RkwcSGvOJ3x1kah1OCh2wQ4WhztS2BuODqNiAidikTA8BeGR17xa
         X4JnuVNUYD6P4cTrLF3pu/sVb+OQeS/TeV5TGTxW8+nmxnto0H4fZ58rsZRu29V+CUWJ
         pwmA==
X-Gm-Message-State: AOAM530j85J8EiLFxZI8iroEuF7c+VodnyR5zVUhQJ+PkihnynOZ4csF
	bW4XPHZe0VXIzyJ0L1nus1h6BX7p6Dbs6Q==
X-Google-Smtp-Source: ABdhPJwqBk/ziIh1V1cFiuFEjVXXURwA0cvD+yuMWUHCn71Ek+ReTx1ns9d9Y+EsmXVXneVzvM2J/A==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr6046630wrm.25.1621543747763;
        Thu, 20 May 2021 13:49:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 09/28] glibc: Document and whitelist CVE-2019-1010022-25
Date: Thu, 20 May 2021 21:48:43 +0100
Message-Id: <20210520204902.2527687-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These CVEs are disputed by upstream and there is no plan to fix/address them. No
other distros are carrying patches for them. There is a patch for 1010025
however it isn't merged upstream and probably carries more risk of other bugs
than not having it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc_2.33.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 5e0baa53e8d..75a1f36d6bf 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -3,6 +3,19 @@ require glibc-version.inc
 
 CVE_CHECK_WHITELIST += "CVE-2020-10029"
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024
+# Upstream glibc maintainers dispute there is any issue and have no plans to address it further.
+# "this is being treated as a non-security bug and no real threat."
+CVE_CHECK_WHITELIST += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025
+# Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow
+# easier access for another. "ASLR bypass itself is not a vulnerability."
+# Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=22853
+CVE_CHECK_WHITELIST += "CVE-2019-1010025"
+
 DEPENDS += "gperf-native bison-native make-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.30.2

