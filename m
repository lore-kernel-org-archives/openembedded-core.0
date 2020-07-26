Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.35668.1595792540641752340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 12:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=ebw1LkLd;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id h19so14925229ljg.13
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 12:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vXPg4tSh8oQz3D41iVO82OO2wajhQ464ax01zdnypBM=;
        b=ebw1LkLdn1iS6iZFr045pv2vE443EZna6lHRdKRahZ0gnx8BHJmo56ENkSzHsef+1/
         1ti2zcCJmU9tzKwR11KliM37E7GiNdXZhlm5lJ8SLoXl5UgodcKLK8844EZ/WLoVLPt5
         xGWXWuoSXQFVNspG7EE8yUYQfVkDay8Uzd6MNJBs71fczGpDiNKbZ0D2jAichmtKq/5O
         Jdq0GWZLK8pU7SrQfuQ98Jc2pYNOjwR3LWStW87l0+57oOO0IZUyevxCoZgqZBl7zXx+
         /oMTnJmceepl0rT5F6EVJ2VMx/YF1LSHYWfGNQ/Hy77Y3BXv1S45X8BU7vn3F3HYBjOt
         EbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vXPg4tSh8oQz3D41iVO82OO2wajhQ464ax01zdnypBM=;
        b=CS/IZnimlAdR+TWQrqomyaOs7Ud0ABf0b55wKUSWpKBvfIBUN++0Z1MfqqKEjJM3k5
         N/wFLT9vl7bS257a8nxYehorwS/21zm3ZeuZAwolMXHVWoTjVh+Szbwf9U+Qn9eCbO6v
         qxU/2o/5W8INzne8oPknM9IglbBJBBblylflpag4BB7TRnGaf3jZccnjLMUNAi+RFV6Q
         P6G+z2KD8qJbG6+5SBrZMzqnw/VtkXaZ6IOxFrf/dVTVrFnwKPgoGuWkL91YBAU/JLwK
         aB4KAKXjpPlD57z91bEliopKE+atk//PUcxPICYtQ52h0em61kZtkcaUEqnjyURUvoFP
         aaSA==
X-Gm-Message-State: AOAM532fkcsDMpufcYOYiq7dkE1oekEeaHtitp+1kTNU6jeZMQGKhva4
	zhPe2se0xdXU4X19KRjqgYY9Kv0T2gM=
X-Google-Smtp-Source: ABdhPJxHJa/uh8MG30nzA0YPPexxuJh0XxMZS2gRrH7mamxi2YbsljFTejCfAj6WpfvDgEKeiHeCqw==
X-Received: by 2002:a2e:9b8d:: with SMTP id z13mr8485006lji.463.1595792538270;
        Sun, 26 Jul 2020 12:42:18 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id o16sm751238ljc.66.2020.07.26.12.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 12:42:17 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] re2c: update to 2.0
Date: Sun, 26 Jul 2020 21:42:13 +0200
Message-Id: <20200726194213.351746-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/re2c/{re2c_1.3.bb => re2c_2.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/re2c/{re2c_1.3.bb => re2c_2.0.bb} (74%)

diff --git a/meta/recipes-support/re2c/re2c_1.3.bb b/meta/recipes-support/re2c/re2c_2.0.bb
similarity index 74%
rename from meta/recipes-support/re2c/re2c_1.3.bb
rename to meta/recipes-support/re2c/re2c_2.0.bb
index e9053acdf6..b73b024072 100644
--- a/meta/recipes-support/re2c/re2c_1.3.bb
+++ b/meta/recipes-support/re2c/re2c_2.0.bb
@@ -5,10 +5,8 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
-SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz \
-           file://CVE-2020-11958.patch \
-"
-SRC_URI[sha256sum] = "f37f25ff760e90088e7d03d1232002c2c2672646d5844fdf8e0d51a5cd75a503"
+SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "89a9d7ee14be10e3779ea7b2c8ea4a964afce6e76b8dbcd5479940681db46d20"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

