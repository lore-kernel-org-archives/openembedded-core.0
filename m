Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.4120.1609193807801843428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i+Gz5NnL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id e2so6237938plt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wdaKnptAeiBhwvfmMeHra3d9/G5GJVRQHV/QRsUdp6c=;
        b=i+Gz5NnL93XDFpRYrItRYK+pV3O19SSCSMtrSs9qz18wYmbg21h5AExhNkZ6+2Plil
         C1Wh7RNiRuT2qpIslM86QYePDYcwOC4gy9nbbmZb8E/5+viNxyA2EA+4DZBHlSea3H2z
         +5JbzjVZPjwXkc1IGQQcaowJWjzMjBIhSeiWEwXuEhhklStFtdqXshA3VDBxsOZumH15
         hNrW+2iQxGKK1okZM471h7EIZtwxUb9zbQoCifKqNOntuxTzwJBbZodA51Th9Aa21tcu
         joUOM20q6F0pkpC5KxjxDffDAns8zpst/K3nyJ5IRva04L9xHKODbBdt2JvPrxYlmwTm
         mMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wdaKnptAeiBhwvfmMeHra3d9/G5GJVRQHV/QRsUdp6c=;
        b=SRaVdXuq+th401QF5EOHMs6cq+ViVvb/D31ClT5G+FabA98uipxLMLYH4l3nKTvr2B
         klADtgsV4JOGTGz1AclfxxN2x+2FYZEM/96zpy5f8R0C6p+ynObMnPH9UL/36DwtV32z
         Lf+4sGO5T1N3gVsxd2NP8IsXflkakmXV9fd8+U6QDns5AxRyKcA0H919/chT6NnvQ3TK
         SOoLRtPbWKQR4E5DxA9VfutoQmk9dhzBPTsLnVDFv7N6S21lN6wyNBODk6MbhzeJgBvH
         U6DsstFrLfBnSt/t4o/CB9uaj5Q0hmqcKl+gEGrWDMkFL0XSR1Z2Fk/pnefYxjTd5/RS
         TkWA==
X-Gm-Message-State: AOAM533YIuqTfiLl/iybd4ew0OPwJqaGAYmjP3OhhC+8iyFGwF92evTd
	hRwiQ/Vg32TPAYNvVHec7O1faSW6OP2rDZnZTUI=
X-Google-Smtp-Source: ABdhPJyvwr04hfz0+qzvx0BMdbTkZws16sYknrd7T3eqLxINfmrxDJEkW8pgkdtYdpbVyQF42HX4UA==
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id j3-20020a1709026903b02900daf458798cmr46407018plk.68.1609193807031;
        Mon, 28 Dec 2020 14:16:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/17] cups: Mark CVE-2008-1033 as a non-issue
Date: Mon, 28 Dec 2020 12:15:53 -1000
Message-Id: <1cac97f880ed1b203b7f41e0842024169484054d.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It only applies to MacOS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cad1162f41c4c060744b98109514f761aa64d34a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 509c80c313..f6d54c7cf2 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# Issue only applies to MacOS
+CVE_CHECK_WHITELIST += "CVE-2008-1033"
 # Issue affects pdfdistiller plugin used with but not part of cups
 CVE_CHECK_WHITELIST += "CVE-2009-0032"
 # This is an Ubuntu only issue.
-- 
2.17.1

