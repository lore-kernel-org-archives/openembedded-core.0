Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.46851.1617566719230873664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 13:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=pr8vPNx1;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id m12so14670908lfq.10
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Apr 2021 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hPGGD9aPwQKlFHrxbqEangPrSOF7uL+db0MTBc5FwLY=;
        b=pr8vPNx1WPu1DZ9kgQoXedqVnNWDNeB6lpYbV1VPFBH+2oyBX3c2l97Wlgp5nour4a
         oCrfTh6w9wRqj665EF8SctKhK3/pa2QgOtLbClDUdfRzRRtsBqijU490Zer883/sdkiz
         464MyVS7+cln7AyD5Xz2AiZpgwKPl81YBfNl1qZb+Je8Low91dzO3FuV5n7yZmbxcTJ7
         i1mD03DIsiswHsX12H8q5j7rWk4tQcyfELQEWItnQCP1TNQao6Gt2il1p7WYjK0SWXK+
         oNs0yVJQsJ04xpLZZ4VJ2NlxyTritbrfU/hJu1rywm+x89Al6LyuzS8gqowvwWeJr7Ud
         wrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hPGGD9aPwQKlFHrxbqEangPrSOF7uL+db0MTBc5FwLY=;
        b=ltTumgSm55PMfEhVnTl2q0ee4cvETiSzIkII0rjZIUG9VJ2Dnt7tSXkR0Z5WJutN9N
         RXKc07GgjYXleEj06U0pLGHXPj3VBFK1cycWfxEHkl/4+U3StHQ/n69QEUxmDQl6CnF3
         YQO/EzY7sHlBz7AM9XEba7i9E2t/UsU+amVfn6ueLgSnAzVD3Do4k5zk7W4osrcx7ExY
         mca83nJINKGe0f2nVcv2ulLcWqLsO4Ed49QgBp9X0CdWCl5GACpII66J1X2EcFy3KWaP
         Kko+Ddl0V0MZV0a7EOKzi+iRMIeQDBZY6B2xU9r1Zzc1/wf0zzK7C/7RjYimDJk4SIp6
         TAmw==
X-Gm-Message-State: AOAM530p669lYRGBgC4nUegMYlojr0qTufk4X4UImwJd7sZJmbc4kypc
	7T+/Sz4UyL8cD/5efsPQW3jxyajyBMd7Kc6i
X-Google-Smtp-Source: ABdhPJykBzHkvU1O+tkTrnv3O6vB1afW3qS3xqDzptai8QIT8tl9exhYXer4krek+KfQxDngz7QNyw==
X-Received: by 2002:a05:6512:3e0e:: with SMTP id i14mr15431210lfv.641.1617566716936;
        Sun, 04 Apr 2021 13:05:16 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id v129sm1537527lfa.43.2021.04.04.13.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 13:05:16 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.39
Date: Sun,  4 Apr 2021 22:05:13 +0200
Message-Id: <20210404200513.581466-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Add support for serialized test execution framework.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.39.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.38.bb
rename to meta/recipes-core/ell/ell_0.39.bb
index 7d3a339978..68ec4cb4a4 100644
--- a/meta/recipes-core/ell/ell_0.38.bb
+++ b/meta/recipes-core/ell/ell_0.39.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
+SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1

