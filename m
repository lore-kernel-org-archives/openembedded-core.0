Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.19365.1621260888225673096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wfdfrQwJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id 69so3210669plc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tmx5bYwijBCOvlEKTEJWaOjMvQqaIMuLZESVeSRlRSI=;
        b=wfdfrQwJtsx2f4SWHZwq40sgB0mf92vjLvyKvtGWYrebl+yPd+SedDbNVKdajpOIhV
         n/cn3G9jNaR09MCs7x5mBtPzfHOoAB2dBKlHEa9gcN0Iq9XhCLQt28xmvRuz3q0yKlEA
         eX5qtyVOsENGz/WOYo79fotUxK7nXSmd8fxObQuEbfOiPkrOREfsXcrH8KjAUKBLVU+L
         hgyjw+M5FX36kepLJg18ecfnxL/N3lrAugHrfIXCItcA1dZz4kEQr28seolbWSx9evix
         aEHopcLf6wqbzYeHnvkvnCbIZlUyV36CSgkivat6amZx9Kt6uMksIzmc0AI2/f+wD5ua
         WKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tmx5bYwijBCOvlEKTEJWaOjMvQqaIMuLZESVeSRlRSI=;
        b=Sm//1Zmm7kXw73pTDEmeUlLgjWhxUB9cVX/gL5UdzcuqIU3Jh/H3+r6zMGGaGd087E
         vHN95TiTb0PZ5cfkpPgyUhxWi4CGYKetE2pv/H+/2saQODdjVeWFWYLvjjUQK/mLs4qI
         a3G183MtVbI2u3Fi4VwsNIqeJFoC/a2F21/MBi4UKRtFoeGMReMXiUK6945ytqrc+Dqo
         2KQyf3NJNhZ+HfPRSd/x5Sbmqj/mV9rrJihU5fDmv/ClsS9XhJ6sIZVZzAJC2ua1pwxp
         bOZ6cvg5ybFszXQQ3YTKXMf8/jJrTlI9/E+Pfi1h2F9tekbT/O3hMO9vA2835nUQZOXa
         VmRQ==
X-Gm-Message-State: AOAM532M2xd3VnMIsT9lLCKTHxtWbnD7jxzIeF6UXRSga7lWbjD3124L
	rzXJxlY7Lo5dWHQy5ufQzUWibKvfrXQASsKbeBk=
X-Google-Smtp-Source: ABdhPJxKtxnad+ykiweUNpQK84K+kwVEM+RA5jdS2zzBuDqSDldYUBhnizrWWuNi+eXEmzvgw5d3uQ==
X-Received: by 2002:a17:90b:4b0f:: with SMTP id lx15mr5006843pjb.184.1621260887418;
        Mon, 17 May 2021 07:14:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/35] librsvg: Exclude CVE-2018-1000041 from cve-check
Date: Mon, 17 May 2021 04:13:28 -1000
Message-Id: <9b214d503f3237fa7cd96c20686e610b09994823.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Issue only affects windows.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a90d3b056992346003d96765fc8639f5235cca55)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
index 237aec6062..ef1dae0a69 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
@@ -25,6 +25,9 @@ SRC_URI += "file://gtk-option.patch \
 
 SRC_URI[archive.sha256sum] = "f7628905f1cada84e87e2b14883ed57d8094dca3281d5bcb24ece4279e9a92ba"
 
+# Issue only on windows
+CVE_CHECK_WHITELIST += "CVE-2018-1000041"
+
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
 PACKAGECONFIG ??= "gdkpixbuf"
-- 
2.25.1

