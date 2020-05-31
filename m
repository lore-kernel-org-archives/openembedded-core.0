Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.17648.1590940447004141936
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T/DXi9Wr;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id x1so6857452ejd.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26PCv2audfaw4GWsT8e18qoSAqFh4HWExYivflaLvcU=;
        b=T/DXi9Wrr00OQlC8cibG+jRjiFSSUGakROkJCv4pxE+jdEjXZE+JJmJJSCVgjX8Nfn
         7a1iQyO4iNHmf6xN7NJ2KTh5aGiCIkYX87EuYx8vdp//szRPqTC48oBzn4ADUqekjhfu
         e5ixNHu7KwU715rdoulqJzfKdxPxVaMWbColdH7bxpujIeT9kwW+/s11TwsiTmqRhln/
         xhhAIbk5PmxVV70tsEQJAmZhyPGX3SKsx05WAEYWe8E5bEIUFGQwqDIctLwDZRMUZNkz
         CavnN40QnbVUo94qbJyBZCboz0Ug0CL8FwRIO5PNocEx6RV8I+Di4okvERDjdQHa92cm
         dq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26PCv2audfaw4GWsT8e18qoSAqFh4HWExYivflaLvcU=;
        b=WWEDRDs2EP4WZpIGzKoJzWjJeoE4TKNoiqp0tUO8O+koNTPH8ZcgnCgfXxrXZsC6EF
         2N6rmH0GK6/YaurBDoCpGXUqmZITIV8QUJr2+N23AyoNMj82FWh3xZvAQxxuWK9M/oOy
         b0mFLhaFszWJ1a1+6vIR5z4uB7LrQTJh8/h790H7dAEos/t1BBH6iC9ELCqaGXdSiafA
         84xPfhRfUYcvusJgbVC7i1bog0mP9mH0deXvsMqSpFwm+yIgTdcYFdrVlspCF5FyZxyr
         vScE/GgmR3loc09pj6zcsbkMiNO2rMHL/3zLqaLMCzD9p1KKgod+gWdh9YkaQEk5mvn1
         HrGg==
X-Gm-Message-State: AOAM5309h+39wsM6Dcvnb+7ccSdPQhppg3qApPLOdsHtLqAoCLqMHFEv
	EG8QQ7DLjBrWFCm6LgNnxX4wQj18
X-Google-Smtp-Source: ABdhPJyfbVUd6gh1/Qh7xrdbtGrUsXhbKVw/cEqJKxzkK5stdZU3Lz3hHODSmdLJE56piXvJ4qL5iA==
X-Received: by 2002:a17:906:d111:: with SMTP id b17mr6568609ejz.267.1590940445394;
        Sun, 31 May 2020 08:54:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 44/70] libical: upgrade 3.0.7 -> 3.0.8
Date: Sun, 31 May 2020 17:52:28 +0200
Message-Id: <20200531155254.10283-44-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libical/{libical_3.0.7.bb => libical_3.0.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.7.bb => libical_3.0.8.bb} (93%)

diff --git a/meta/recipes-support/libical/libical_3.0.7.bb b/meta/recipes-support/libical/libical_3.0.8.bb
similarity index 93%
rename from meta/recipes-support/libical/libical_3.0.7.bb
rename to meta/recipes-support/libical/libical_3.0.8.bb
index a50473e9ec..efb9433412 100644
--- a/meta/recipes-support/libical/libical_3.0.7.bb
+++ b/meta/recipes-support/libical/libical_3.0.8.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-Use-our-hand-build-native-src-generator.patch \
 "
-SRC_URI[md5sum] = "8a5d07a7fba9e73a85e67f76258bf042"
-SRC_URI[sha256sum] = "0abe66df1ea826e57db7f281c704ede834c84139012e6c686ea7adafd4e763fc"
+SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
+SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.26.2

