Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.13308.1589207965760418481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=r3YmLKoz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id u5so2046035pgn.5
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Wh7Mq6h3EZ3X4DFl1Q9Ez7NRJJUcfF19/GNg4Vwb22s=;
        b=r3YmLKoz3+Peb+pkt7b7vCVs36MUy7YATJxolWUzC/ALXjBjK7ByJwPi8RHRz2nzzD
         boEAxKdMmhlK0hl3m86XRozP9q6Qvfq/ZCa5exmrGQGC6i4PQ/nd9MJBNo3zUqTo6zLd
         cR1Fs0XbP0Tcbr7JxqIHVPfIR62Mo16O3AUDrQT2d6YZlIcSkB4/qYEpLWXTVZoIVZ+f
         xaA35UgE3tJNGh36Bmx2lbKFvDyQvMMcj/0kI1nBov4ZMR5aTOS7WBms1vNytc3cx5Sk
         0c0cB/aETb9uTbrKXdBRe9aU5D+ZVU2pF4801RIxuTUtbUqOcVAfi3c8fmd+LsN5DDlP
         U4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Wh7Mq6h3EZ3X4DFl1Q9Ez7NRJJUcfF19/GNg4Vwb22s=;
        b=MDoJS+y/kaQwdQn2MfeKTmBy9Tlo6KtG7rCpoR4VDQI5F+PvfZBY52KN7wGK22UQVI
         2/61Tv2sskEq1U0RcUvtpKLj41Zj0ZRszmdk3AF3UtyvXaQ2U2vchb3BG5hb7i0KO6kp
         Kk0nO3bfKAqnjS25UsCyXSVseCdhMH5ySk5wNcsYmhk7RPTr2RpQkKrlMh0Vn7WhSP/j
         FnCRHEkar9CUpEtaRxcm9G8If1HFgqfj/AHatfCu+0oRz77+a55infOqHTSo7Z9tp6iK
         MkRB7+UPm3efF1mMlEfyXvO9+EXV8cvxRc4WbdVPqUWH2eqczOlGOwN7HH4UdYMhYpZj
         hywQ==
X-Gm-Message-State: AGi0PuZidfWUl7r6N6qVxeyV2+Wwuv7NHDMj8CMbmCQSsGmSZgMx/dOT
	lnzNAUu/P0IkHYzJ+ADxF/SOYeztCTkekA==
X-Google-Smtp-Source: APiQypKrbSloNl4B8hRRu7Sz9F75YmvvKsdfK6qjSFm444S1ds7An7jFD9ukjOOKesQRLEWWXg8E3Q==
X-Received: by 2002:aa7:948f:: with SMTP id z15mr15795599pfk.129.1589207964665;
        Mon, 11 May 2020 07:39:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 6sm9337202pfj.123.2020.05.11.07.39.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:39:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] timezone: upgrade 2019c -> 2020a
Date: Mon, 11 May 2020 04:38:44 -1000
Message-Id: <365852b55b66ecbe8a8d5654a082a231ee345919.1589207495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589207495.git.steve@sakoman.com>
References: <cover.1589207495.git.steve@sakoman.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

See full changelog https://github.com/eggert/tz/blob/master/NEWS#L11

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 91a5cb3327..32723f3dec 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019c"
+PV = "2020a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,7 +14,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
-SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
-SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
-SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"
+SRC_URI[tzcode.md5sum] = "f87c3477e85a5c4b00df0def6c6a0055"
+SRC_URI[tzcode.sha256sum] = "7d2af7120ee03df71fbca24031ccaf42404752e639196fe93c79a41b38a6d669"
+SRC_URI[tzdata.md5sum] = "96a985bb8eeab535fb8aa2132296763a"
+SRC_URI[tzdata.sha256sum] = "547161eca24d344e0b5f96aff6a76b454da295dc14ed4ca50c2355043fb899a2"
-- 
2.17.1

