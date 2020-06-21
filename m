Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.9222.1592707006430008539
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 19:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=U7xhFe8I;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id t74so7717558lff.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 19:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=CxTuuxRPg4ElEcFSJ4nNUW5myBSEy9rvAdkmNNCF5qs=;
        b=U7xhFe8I4+kIoGKUDIB4npekqqGwKjm9W+X+dtp0F312fByYG1uYPbnGn7UaqbyGV6
         1pmsN1sILU5RjTIrgjdo3f76pEemqmwVL1q5dF0FhfVbrY6yzdfykARcdu0oYcdl8Cui
         HlYAFWa1NTXdECvJFPDxJB0UQcz9kVFa0wzzMQLCsSuGYSNn5/4bfsvK3KRRiqVEwd2U
         14iu1Y1ZWV9XQtHXO3GNFwkej0qC1QWGxtWYRKf9emQ/vWhgbkwwADqQMpdhjdoK96PO
         mGDflWkptDt9KNGHtTdNzs3M8WtixshXnElpFTGwtjgvTk4gYx0NouKE9IwywLJwm52j
         06aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CxTuuxRPg4ElEcFSJ4nNUW5myBSEy9rvAdkmNNCF5qs=;
        b=qETIxOJl3USaGAk5PiEmn7vEjcirDhKF1nDREGSNGvTZPFGTg25+Ec+c+kd8PCX+kX
         Gey0f8zRU8g7VpK9gSd6QGgDN+uugrF+WQe85pcCyX5RSVCBZrUl/4e76QpKOqy/dTAF
         9elM+cakjS1+qaGJp4tqmLGFKnnzazd5/GBEAUipSk/wwW03GuGK6FG7ha0AP5B0pwaR
         HN6F7q892v6eyx/vzCBrqkaATMi6mmTzSqGazZsQVlsmveLNh6tOV0ZxsirGo++9RBF4
         aCJ70yNrXq5GT8TcNoM6UvwmLaBlIFiEvgSOweHbr3YTOo1V1uX8Pi49dsnwozOYwzfd
         HDzA==
X-Gm-Message-State: AOAM531e/tNzMSMl8ukObWX7vrJuvX/XDpaSZtA3ZQ7fPy+btFQxMzbg
	m/2IN1USEgQXpUgyDNZBgH35Sahpv6s=
X-Google-Smtp-Source: ABdhPJzi6hj9eVj8R2hgxsyc6oYB4mcGUo10sCPMSgytlpLz7KHAc7HJz1n3C/o9C2yKnUMivg155g==
X-Received: by 2002:a19:7d84:: with SMTP id y126mr6017682lfc.149.1592707003584;
        Sat, 20 Jun 2020 19:36:43 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 144sm2415370lfm.87.2020.06.20.19.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 19:36:42 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.32
Date: Sun, 21 Jun 2020 04:36:40 +0200
Message-Id: <20200621023640.30843-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1

Changelog:
- Fix issue with handling D-Bus watch removal.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.31.bb b/meta/recipes-core/ell/ell_0.32.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.31.bb
rename to meta/recipes-core/ell/ell_0.32.bb
index 1db7131ab0..7772dcddf3 100644
--- a/meta/recipes-core/ell/ell_0.31.bb
+++ b/meta/recipes-core/ell/ell_0.32.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
-SRC_URI[sha256sum] = "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
+SRC_URI[md5sum] = "dde539c9a8d3cce08fd439347a82cce7"
+SRC_URI[sha256sum] = "42fdb9e24ff561a101389d51445cab1ff7d55f5385dc22a05b0493088cf99e30"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1

