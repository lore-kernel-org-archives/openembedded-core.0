Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web08.789.1607374617712662364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 12:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=NnHplT37;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.67, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qv1-f67.google.com with SMTP id l7so1874001qvt.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 12:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:organization
         :content-transfer-encoding;
        bh=ATh2OPuOmCxTn0mBHqUhQScqPz+vL4+Ypdo3XqlZPHg=;
        b=NnHplT37mTMyz5gG96J5Mx7mtQHyjlyYRCtghGQ4c2vzqmry0g022vMpMiJrFmtjsW
         Uua/BvtNg8tVP0aYCSMuvXWAyeRVjqXNMxHTHWrMYNqiPXdQ3iH74N2/JilQVfjGoCj4
         hhLpSxafGMjQaSDMt52oJKGRUSMT0/n3u8aWSiVlyxkpmPj/m4wNM0pLO6o41yJnn7ZG
         6fjXmCMEUSz5V8nKz/mvlLOdRj1zP0FmmLfjkjUex3ilBb6U1Ywcgqe00RgI1EtFhSqT
         JPp0NXSB2ba5CeqbF9+lOs/Uw7M0P9nANsh02NUtV2DftyB7NFQ+UZU6zCRSJVmxC5xs
         e19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=ATh2OPuOmCxTn0mBHqUhQScqPz+vL4+Ypdo3XqlZPHg=;
        b=E5Ix8hwPF2Ps8J3hwotC2BhzcoeZuyWlpxoczMZKUoo4em7H+mmLbDjAmBBjkgd0BK
         xijNSCVOKn7ZWFKt/DGSlpZApJ+jKpcAA029lRvb25d1PuhWD3M9Bi9KoLaYZj4JXCYk
         f542cr9hlJHe/OKnoYiDngSclcYgrow3PssdJM46icOZE9C6FQpTycfhcAHrodehl0zZ
         7E+Uh3VdHs6CPFKxGNdGP/Kjpt5734ObyryAsvqJF75KbKavUDw0aEvqDiqyrla9+P4+
         9LAzHObpLJHl94zbFfiGxtRzt7lptSNrLASUCPwK7PQFcV4sO5iScX2hH/e5DaFDAbf6
         YtvQ==
X-Gm-Message-State: AOAM533X4IQd0O0wWYFi7PoG2gnFf6F6iITueKW7A+n1cNVJ3lisV2e/
	y2gEdPEuzQqWlXDbgcCWDjPNwuPVMFbhgA==
X-Google-Smtp-Source: ABdhPJzp95zY/B2IW2QeGf8QIax82jzXhMPIofipjtxPX9HbccRqpzSx+3X++dJavTZFlEtrIr0aAA==
X-Received: by 2002:ad4:45a9:: with SMTP id y9mr12330169qvu.15.1607374616432;
        Mon, 07 Dec 2020 12:56:56 -0800 (PST)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from pikachu.lab.ossystems (200-180-244-15.user3p.brasiltelecom.net.br. [200.180.244.15])
        by smtp.gmail.com with ESMTPSA id u26sm20243qke.57.2020.12.07.12.56.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:56:55 -0800 (PST)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: Update 20.2.1 -> 20.2.4
Date: Mon,  7 Dec 2020 17:56:46 -0300
Message-Id: <20201207205646.2660675-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

This commit adds the changes of 20.2.2, 20.2.3 and 20.2.4 bug fix
releases.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../mesa/{mesa-gl_20.2.1.bb => mesa-gl_20.2.4.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.2.1.bb => mesa_20.2.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.2.1.bb => mesa-gl_20.2.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.2.1.bb => mesa_20.2.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.2.1.bb b/meta/recipes-graphics/mesa/mesa-gl_20.2.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.2.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.2.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a6652b0ddb..7956d95fc1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch \
            "
 
-SRC_URI[sha256sum] = "d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a"
+SRC_URI[sha256sum] = "0572dc6015d2e1c50f67823edd16855ae9b6feded0a1470598404e75e64aa092"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.2.1.bb b/meta/recipes-graphics/mesa/mesa_20.2.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.2.1.bb
rename to meta/recipes-graphics/mesa/mesa_20.2.4.bb
-- 
2.29.2

