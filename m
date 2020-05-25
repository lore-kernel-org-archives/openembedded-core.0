Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.40991.1590446276308639461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=K2IE0A+E;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id x11so6892561plv.9
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OJCveq/vWJ+Jz5gguHWnTpWagaLjn4BjUvGg7wKQKPE=;
        b=K2IE0A+ExUH2wJFQzQq1fhU6ibM5PV5xN2dbdvlUqWCHjbPN9+SEtMX/bq4AGj+9Pj
         xhBD1C2tzDgFdXRsTDFoNEzXlewoEB3nYWUJc2fOCUIP1SyknVJ9fqf1x31R/Mq2gOos
         iUN/qvcNFag6f1z+7FzlemGm/koyKloM3eyFbYSzXg3EYSmoVPT4It+72DhDHV/4zr+J
         VDj3ZCElymjxWUOItDV59Pl63aOqA1R0eivCIexlOPCVJL5By5fr03FoEp6aXwhzLsjg
         RzrNbQWdMo/tH8XnBxCP/00FYVO1CDYqYX3aZ8cauiewus4dhELE0qeaQihiPM9nm3UA
         8uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OJCveq/vWJ+Jz5gguHWnTpWagaLjn4BjUvGg7wKQKPE=;
        b=Ek+JrS/qcYWmSSEqip6hhaZur4Zlw7+OQBe/G5SwB6KCyja0Kk4dWb/BFcUqXsyvFT
         e7vDjEwFi18NdQOzEIh/Ykh+JVLOEOBLCm3xzCIqBxnbrqUBQ/k/HfXeVBnGpCEUCDA+
         m8n4D1sgs6y4Ux+I6vz/r/qgZ6G6I1WcwxiP+W+r3NeZcRg6IosC0c76IpCkMnpL53I1
         bqcjcoRqUqL3W/NDJOWYfjmwQWZVAEmwwXqukbxLEXo/Waw1iApZJlYfboTyE/5g/d0M
         P92b1nOyObQ+UJuZ+vFnP3Vbt4f5ILT/Pm7R9E+s9QOOU6mx928qJInJjQM2ai+H+CYW
         usww==
X-Gm-Message-State: AOAM533yquXWFWYZpNCpqjK8Y8FgOtmU7TFtteYfEcAaMT45kSf4qt5+
	BvFVGDwDYreeZBD9HBe592QPp03+JOk=
X-Google-Smtp-Source: ABdhPJykNLRuVZPMaAfIDX0O2YCzX+QPQBjjzonvFV77JqsuyGkI7vwLT2z7CBDTww0q9l2WuZGQzg==
X-Received: by 2002:a17:90a:33ad:: with SMTP id n42mr21977404pjb.168.1590446274935;
        Mon, 25 May 2020 15:37:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/17] newlib: Upgrade to latest yearly release 3.3.0
Date: Mon, 25 May 2020 12:37:00 -1000
Message-Id: <c93720849b68369f9c01c620581226dbfe200303.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Alejandro Hernandez <alejandro@enedino.org>

Upgrade to the latest snapshot, also drop md5sum while were at it.

(From OE-Core rev: d73aa359e42e707dbc7cfa29c55a2fc8e6bb938a)

Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb}            | 0
 meta/recipes-core/newlib/newlib.inc                            | 3 +--
 meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb}  | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb} (100%)
 rename meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb} (100%)

diff --git a/meta/recipes-core/newlib/libgloss_3.2.0.bb b/meta/recipes-core/newlib/libgloss_3.3.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/libgloss_3.2.0.bb
rename to meta/recipes-core/newlib/libgloss_3.3.0.bb
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 5edea8aba1..96e230f985 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -16,8 +16,7 @@ LIC_FILES_CHKSUM = " \
 		"
 
 SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
-SRC_URI[md5sum] = "afb3a01c8c82b6717ea55659a4de30ec"
-SRC_URI[sha256sum] = "f7b2322964a1e3b37bec0768da20f50dfb62247d729110974dd95756a53bb6d4"
+SRC_URI[sha256sum] = "58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc"
diff --git a/meta/recipes-core/newlib/newlib_3.2.0.bb b/meta/recipes-core/newlib/newlib_3.3.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/newlib_3.2.0.bb
rename to meta/recipes-core/newlib/newlib_3.3.0.bb
-- 
2.17.1

