Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.19369.1621260900482964287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QKHFaUUw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d16so5015391pfn.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jWFYTSwBBtHsGInCgiP0ZVXK7qb3vh9blyEtScS4tBU=;
        b=QKHFaUUwmBaPxIoOw93Y3id6VNEORt1agcNJHLeH3ureK3FBRT2u4lflYzbfXueBRl
         SERASy4ggO5DIB6fnAbGkditv6uI4BSCpmE2aLABdx6ryWYe8U1Mb7za7EgLKtrqJ9Li
         4vQaYOpn0Ir+x1XpJvswCYQMyFEtDxX5ondZS6td60oLSIwCkhNnuFBGJNn9bFTUnhFv
         xOTB9i5VIGiybB2KBcbyNRwfk3tH94gIRyl4RfjG+cciMBjvtns+broapysB9dU05x5E
         H92RzJnPG1Dibib9R4pWZx9yQB7eNuXJvvpgmJwOysBZROcmCR8SBjIzL4rmfN5DLm4d
         k9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jWFYTSwBBtHsGInCgiP0ZVXK7qb3vh9blyEtScS4tBU=;
        b=K4jTfezyEY+vZSme30Qp0VyvbZkIEiFBaxB9PvyJpw/LhWY/4QUKEYXRHksNQ8S1Zg
         LCwdNKsQp9izanayQ6z3lZBfo1/v50PEgI2+gYyFWgfxJ/+Pb9evNgE+u7pSxJ3qEq3A
         jQ6Dg7f/5vXEBnPyTDzX+LXy1XDVff9jYlO6bOQu4JKdp/WvNcK0Syr6qrme2nCLdMCR
         oBR6Xa68HiT899QZXw2G4C2QTB9D98FDd3tyCWWntp0G6IwC1hxdWa6Due8QJCWSATA+
         7Z/m4fMyMFVhdijk5nyC6XeuxeGyvjBzFcRJ3DHgzL0yYBb0V/5NkypocT5b1BD3n8nt
         HrGQ==
X-Gm-Message-State: AOAM531vkDNFjNetGWPxxgaehHmF/BiUfOVePRfYWANsX6E8r/KFacTa
	1rbpGTJJxRn7CmZRZ4p0rspBISF3XWqkueGxCEg=
X-Google-Smtp-Source: ABdhPJwE9Gz+sHj02/rEIAyTdAEB3NwT/+cwDXg9jisq82jE0HfiycyKVqatVtF9UtHLjXCR70+pvQ==
X-Received: by 2002:a63:cc43:: with SMTP id q3mr61685604pgi.50.1621260899625;
        Mon, 17 May 2021 07:14:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/35] db: update CVE_PRODUCT
Date: Mon, 17 May 2021 04:13:34 -1000
Message-Id: <753e6510df01fb4d71f46639bef06e1361f87170.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Update CVE_PRODUCT to also include 'berkeley_db'. For example,
CVE-2020-2981 uses 'berkeley_db'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 9cb57e6a53..b2ae98f05c 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
 LICENSE = "Sleepycat"
 RCONFLICTS_${PN} = "db3"
 
-CVE_PRODUCT = "oracle_berkeley_db"
+CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
 CVE_VERSION = "11.2.${PV}"
 
 PR = "r1"
-- 
2.25.1

