Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3249.1594933716277193476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U/mUX12X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z2so8623660wrp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nta3y52XxoNiEE+sjf31zILUFKrBrgAt/86S5PJVPJE=;
        b=U/mUX12Xog7PC+K1wDAVVCZlF6A3dvK4OeToEClZK9awVFwHHmZde4yoBTenhzL6+b
         s3x8m6Qbc2HjJcLGL9gNH9Y4B07Bcg7UPoAnsao3JiBus4gzsKLm/ujDNOxvKIGfBEMb
         veDJCCgkZNA9goldgd80P41e2OylXDIitvXuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nta3y52XxoNiEE+sjf31zILUFKrBrgAt/86S5PJVPJE=;
        b=E2WzH70jZaY+RRegSNmW/t0tQYT+Mmt1EabxCh6F2Lc+oKx0M0gGZ1/lac5RDfCDRS
         trd5aO1gOzx4zjjXW/e1u276hDZjvmHJb7EIYz/i2ARnzD9xNPL+aorzlzNsuGhef/72
         wm0Is3jX45K7Vaj6OLys/h6a9sPFzUOpCKpwuEOYiFTVGExHp6ZUFyH0ITFEPrhNUp3H
         SzHefWt8hP9uEH4ScIy8Wg/B6GIA5nIo/UxHYxdCkju2XtZInAehJhrXrh/w/3ChOb/8
         elSBpEUtfeFpFYYfzjp3k6Eobf/GpBijFxilWx4qJN7DEBQr2DOdtTADas/cNVnpn+Oz
         +aPQ==
X-Gm-Message-State: AOAM531zZhll8M1v1qZkcGg1Ejq6sqcP53IExHYGsrYAb3wbf98riLSx
	J6bar8Il8+bmcqI5DUnd94sFPK4wgRPu6g==
X-Google-Smtp-Source: ABdhPJxoLyj3Upf9dPw8K+VpzYl2HFSXfORfEA84xiLHs3IppKS7JnEs8iy2Xopr+RIt0asBk+8mjw==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr7112834wrq.357.1594933714588;
        Thu, 16 Jul 2020 14:08:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/20] mpfr: upgrade 4.0.2 -> 4.1.0
Date: Thu, 16 Jul 2020 22:08:08 +0100
Message-Id: <20200716210808.7438-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/mpfr/{mpfr_4.0.2.bb => mpfr_4.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr_4.0.2.bb => mpfr_4.1.0.bb} (79%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.0.2.bb b/meta/recipes-support/mpfr/mpfr_4.1.0.bb
similarity index 79%
rename from meta/recipes-support/mpfr/mpfr_4.0.2.bb
rename to meta/recipes-support/mpfr/mpfr_4.1.0.bb
index 00c2dc2fe99..82b5516f267 100644
--- a/meta/recipes-support/mpfr/mpfr_4.0.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.1.0.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[md5sum] = "320fbc4463d4c8cb1e566929d8adc4f8"
-SRC_URI[sha256sum] = "1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a"
+SRC_URI[sha256sum] = "0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.25.1

