Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.25217.1591602505652821958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EWeRReC+;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id t21so9889599edr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DljYB5zqHfLmNalA/FrsHcSb12gz6gnUE0qP0QIknVE=;
        b=EWeRReC+E6GeMrxZBHLD/geI6MIc4UgMOcQwZMbBIrb4VeWlCpk9W/5Ec2bJbnhYDk
         ILqXEHHc+YZBE0igobnSuyTTKLeolhTeeQzflWTMlAagkgsDYrDNOh6qAFH/HbsCCbls
         mwlWZo4GN2LXov5Nk3tUWS49hLHgWIqK1VxAwj7DYlEm5bhIULhOH0L7OAio3Qhm2cMJ
         CAgHDpo2CDo9yDoBDYFu1fHh79Gbh0UgmU+xlNk/LYz8VQ3NIAegkY4brAIPflsz2zdD
         JwK8Hn9czXW3FzLp5ZlH4i/nwXsW7gE+ZR0s/wx8UhTk9lZFqo0bmI7ByEvAkYNNJxi7
         pazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DljYB5zqHfLmNalA/FrsHcSb12gz6gnUE0qP0QIknVE=;
        b=SydCLxyWU1MvDQ2sCqIRESfT5njw/arhzZYXqe6yhY9l1apF5SwJCjD0nlOwXcHF3O
         NWJt6B+nm6xK25ZWF6R6cPg1Far8FIHVBNITzJaTdvWqmDwbDulH+cYV8xD3X0u6ox3m
         e0nyKmQubvLTWvKZ2WPOqGbX3E9a1PNg/sr4Qg6CrxJUkXbhPpepByvxgbfQTZn/gDaA
         s1a0RyGkdLF4kJdsGNCbagylkbZ0HyG1orAqefSUrjOkY1HAInAE/GzP3voRGgxDensz
         b+HfX+UtfkXYV6lL1a+s2qwkc5dig2fgSt3oSB6HT/Sso8O+w4j2OguFSMgg0DcPGvCw
         rIIA==
X-Gm-Message-State: AOAM533957b4+TSQpzKM7bVDOFvPe0qtarT/8thP7w8h3CXp8dSk/c0n
	bTcYAyVpsxidLGRWecJbYc+LwvnDEck=
X-Google-Smtp-Source: ABdhPJzEi+VoUkLkamkWjd0SE7FqMacrEO+Nd58l+P8IjnOmA3MpiGrWiK13aXY9GGVaNQaA4SlFTQ==
X-Received: by 2002:aa7:d9d6:: with SMTP id v22mr21663621eds.66.1591602504001;
        Mon, 08 Jun 2020 00:48:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/42] man-db: upgrade 2.9.1 -> 2.9.2
Date: Mon,  8 Jun 2020 09:46:29 +0200
Message-Id: <20200608074659.7051-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-db/{man-db_2.9.1.bb => man-db_2.9.2.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.9.1.bb => man-db_2.9.2.bb} (92%)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.1.bb b/meta/recipes-extended/man-db/man-db_2.9.2.bb
similarity index 92%
rename from meta/recipes-extended/man-db/man-db_2.9.1.bb
rename to meta/recipes-extended/man-db/man-db_2.9.2.bb
index 87149dcb2e..53ebc85922 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.2.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "593f4f0a26ab4f66f5b81cf6c0c7364c"
-SRC_URI[sha256sum] = "ba3d8afc5c09a7265a8dabfa0e7c1f4b3ab97df9abf1f6810faa8f301056c74f"
+SRC_URI[sha256sum] = "7b383f26c67525205f96a4a3bfb27993396992794adda6fe05ad565f369f047c"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
-- 
2.26.2

