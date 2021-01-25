Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.365.1611586411803093709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LkPaeuCl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id md11so8561516pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DOMe8+RjgOW00vj5XMx4UK1hS+Kjz90Z1z72g0mOo1Q=;
        b=LkPaeuClppPIguvMLbd/ZnlG+iFoOJVpm8i5k/3thYFVnwegwkr3gfxzQDl9xibVAp
         nAJjTEGi/loLngKLUKp/tsfGvbfQKYGEAATJUyPBRD1D8I17vefz0k/FPGjrUpRGu7Zs
         9113ua1fTKCc/JwAThXSQ7zyv5PwRBZgDx4/3Wvbk6kft7IF4BgzKQpjYQyqXne4OsrT
         S6JYnAq2OeICi8lOIHgVAZOQYpOBA6Kt7yLKGTiv3ARPK0wqvRvh1BBxxhzFA6X92LGj
         9aZ1pGDpsIlHDiDtHRwZnPFi8fDIxi4R97oHpDb09ksrFfcRC+Ffdk/VtPAll+qzcE80
         OyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOMe8+RjgOW00vj5XMx4UK1hS+Kjz90Z1z72g0mOo1Q=;
        b=SZgiTTyvr3uxY/ntalMEFbIPlePrCSjR0xRet6FnSw+ZxuSRtHuPJ0pPqcs9FiJfYh
         uK2hMZGqIQihrhz3CNSC4lZz5UH1oDlEwgrt6qetkIWiyCL+JEzkyMax1hVDCpSL7SKu
         S0vHPS79JthMeD5MHiiKyrV6ghgSvC0yzME+VD3C76VOgOl7sstTktVxUWI1QOpgjrKw
         U0EWd7H8BdvW6bgXjNhSBcedaAZSar7b0G4f4nhjPmh9SO0wRUSTrROR3neFAxebVHyJ
         cUXjjG8RKeaoMIJjarJXZBbBbXvBKk1z4/rAd8AKnhl5uV2UXsfLKArIx55NDQzLdJDy
         OzzQ==
X-Gm-Message-State: AOAM531wZEwMUu2MHbF9x4GbDhntBwE5BAzH11PHMfZS1M7Sts80yeBF
	kLXOM85F8Jzy94RcEgMWJ/uurxrmPsb+LcViuTM=
X-Google-Smtp-Source: ABdhPJwHV/vU0lduuyw+INCenUg2oPKHnwaOWMmqOXd4IrMhvJEXo3+GxfhD7wnYNruRNvLpFj335Q==
X-Received: by 2002:a17:90b:1997:: with SMTP id mv23mr555250pjb.177.1611586410933;
        Mon, 25 Jan 2021 06:53:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 39/47] pseudo: Update for arm host and memleak fixes/cleanup
Date: Mon, 25 Jan 2021 04:51:11 -1000
Message-Id: <314c12dee3a5a8d332a41b85d1c759fe414e3f5a.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in:

makewrappers: support architecture-overrides in wrapper modifiers
makewrappers: fix Python 2 hangover
Fix some memory leaks
Disable deprecated function warnings
Silence switch block warnings
pseudo_util: don't overrun strings when looking for keys

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11a3a9203ad595e7fa92acf442a7f3216d6e3830)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7fa11a54e7..29fa9152e2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0b"
+SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

