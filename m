Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.57883.1595862628089948241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Rl/r0AJl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id 1so9211135pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hDy/kMyVZB80XEu0oTdh+EbdeHjoKZvZ+1HPhHD5xLw=;
        b=Rl/r0AJlrHqwroQPXXIxgn7mmGlOQwQTqxPNc44J3/wmRwYiqfZH5I+GcMcM/gxGHo
         iDYFl1cpy/7vuXvkay7m7xKwf1rcqH3HNBZtsz4/vFQsHMF3+n9+kOgeXRyJW2PVOnMS
         2FrcZPfD5JAOT80Rum4qcJEUzh7TjjmZKVgzqiSrxpNmJVq2O87QJ3W54vJMkf633waT
         EjchWvsQLcBmQPn4tJPnzI1iJD0p8u1c96NzD12los398aTFzQPC6YbapMHt95nnQBtN
         4dPrClUlEFL6RbIHbUfn2n2AKvGNu3J6Yu4Wl2FWXUnF9Nt4ITbuqcDATfPzgvMo/VC4
         YPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hDy/kMyVZB80XEu0oTdh+EbdeHjoKZvZ+1HPhHD5xLw=;
        b=QSVxTkjrd1+ymAM7aiEUj3b8N+Mi+OHTve7/9wHsW/kTsZ/cUqftVk5gbfeN8XlGd2
         tMmmW8ivNqczTWEyGBBI80qP3Z2Wm804Z1tk4OD0CN+UK9PhdqJSuonlS5pM6YILo1T4
         Oki+YO5KgAOfyl2dnafww2dULYfiatP+ZcsnL9130aRmkFijSTcoNfshmyCG3iHSOla5
         QQ3JIKMIXoJHS1UV+7FTaWCntpw0t5+EGrzwugs8vJyoKMD7qo7l0tu49X6Kl31ux43A
         WJTn6QfPhxG9t4caKcotjVcEPlJ5j8xdLWKRf3ujbvDri/N+iF15i4Knqt5wk2Jr+67P
         62oQ==
X-Gm-Message-State: AOAM531Jz0CnngqzJJGm8Fg/Pb1G3hj0WT5yPpl4uMUqKArK2cBgw38z
	lAdW1Dz7lhFqq4uKOfyREYy+e8WNvJ0=
X-Google-Smtp-Source: ABdhPJxETH4OtMASdRVDQzrGGr/ycPMM/ol5NZ5UNnCCKnlm6n3vLvZvkg71FGaGdQ2koyTs//Rdeg==
X-Received: by 2002:a62:3587:: with SMTP id c129mr20822300pfa.212.1595862627128;
        Mon, 27 Jul 2020 08:10:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/18] openssl: openssl-bin requires openssl-conf to run
Date: Mon, 27 Jul 2020 05:09:45 -1000
Message-Id: <2a4980cd8bfd829bab1ba081588eb0bdbd285b97.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ dnf install openssl-bin
$ openssl req -new -x509 -keyout lighttpd.pem -out lighttpd.pem -days 365 -nodes -batch
Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e93cd3b83a255294c9ab728adc7e237eb1321dab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 47ed6b7640..815955837b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -204,6 +204,8 @@ CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
 
+RDEPENDS_${PN}-bin += "openssl-conf"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
-- 
2.17.1

