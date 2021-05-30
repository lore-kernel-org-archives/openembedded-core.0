Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.37089.1622412540436392073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZW/oXqro;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l2so1456647wrw.6
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9rrICDSnxgE4vC0fjGs7wxh/gNFpb7o0TvBIUnewSac=;
        b=ZW/oXqroYfbzKgRbOvFxsqfDdFD3+CRNfrwMOY9gNobeyd8LUmqZhHJrXdV835A4Kl
         SIM6j2FSD+OM0NDQ1GdGUC5YJZX65x/kExXthWIvkSduU5sfwg0x/bCVWVODLwWaCviK
         tzl5pHFxP5JjNMgFE7i6tyMrb98lcZYiNxo/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9rrICDSnxgE4vC0fjGs7wxh/gNFpb7o0TvBIUnewSac=;
        b=Kwy2ivmL5KqYuYtKINHasKRerp/QWlJ8ssS4EMqwhScB/Dg2QFYjSPgUmcf273xi0l
         5YcKgv+CVcHv2aenWdJjs7xgD/uRFGRmtthkKMMR6VccplT+Go39fk/UyGA+oT08PMT/
         UEFmdxwi2EIRsMYaqsML2NDDi+IcNH/UDz8/0SHtnrCPQUmZ9N/v0SwcyvZReiLHor37
         YeKTg5PcZ6TeTxJnQLt+ziBHLMAiylrW3corB3QDAKWyLlwF8dkp9974+H26EOTL6vHx
         /mvUsq2lpenQtV55+WzwcTNCWAZzMfJ/iTK+8MvTkRPXWOvyYnP7EJRMpSFPZa/nvSON
         m9ww==
X-Gm-Message-State: AOAM530fRei/UZNVdt68QGWEPrWaBJnpyhsvI37ej26fk5ivQMsbuvZB
	py0na2I43oht994EZgJ4m0cVjOteev2ROw==
X-Google-Smtp-Source: ABdhPJxOPZG+Sptc4DH3M7UapIo96WpxowTyDtfi8H7HlL63UURTkZcSWDJ6E93XcjTULfsKMxHmhQ==
X-Received: by 2002:adf:d204:: with SMTP id j4mr4411224wrh.3.1622412538661;
        Sun, 30 May 2021 15:08:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/16] python3-hypothesis: upgrade 6.12.0 -> 6.13.7
Date: Sun, 30 May 2021 23:08:45 +0100
Message-Id: <20210530220856.2830501-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ython3-hypothesis_6.12.0.bb => python3-hypothesis_6.13.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.12.0.bb => python3-hypothesis_6.13.7.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
index a8a749cd16b..7688ff6d18c 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a24b2ccb7b84860762df3fabb8faa196bf627cbee62917a5095f3de8ff71050b"
+SRC_URI[sha256sum] = "262bb8cee0293ad06c453e78cf89bddcb613b91f82ea5587f3787611ee62861b"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.30.2

