Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.712.1613094071531907346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 17:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=WNCH6YM+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id b2so11035909lfq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 17:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDlcEnksJw5CZYB1mcN5Pl2NGkrFpQdaprow0TBijg0=;
        b=WNCH6YM+aHrd5DOl7LMQ298y4LpcxHW8dY50/PEX2GAMidx1/Ilo8TmRo+N6x9s/DC
         RItu+OptU0jjq90h4zqXcqx7DSlQCfAaIJjZISSBuOL54w6SHNyH+8xehX4kSCvuod1y
         pUG1bcCFMDEujK/iz/44nWcDQVb2oc8AMONrBLJ3UmPxCQvFn1Ohz9p8d9UiR5v/RT1o
         KeYXA5QfeT1MCoRos9G0BMLHeJESe+JZAR3kCQLSUTkNVgkNk43ym+q8bBu4n61vmKmT
         NKNAJDwVYuULIvf+nxFmr84d1qzTPGVyIhLQ4ZGzg2mgJJDuFFKrOEEDBekFd7PJeOAF
         bjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDlcEnksJw5CZYB1mcN5Pl2NGkrFpQdaprow0TBijg0=;
        b=Ro9MG3qi888wJKEjrE+ze9pRp0W/oawxreqDZoigwQPMUj88t5yNtGk/3n6Kf/rBN9
         RkTFxuXcPx6DW87+1pFM3Ms0oGQ+pBws270Jzv3HhbgAE8wwVBXBEy8lvtM5r9E65vAm
         AbhmByWL1QsFtbXxauyH4yuQoA/Ngk4r6tQZPs53R3hhRJ+JjjbvJEzP0tEy8DeLpz/F
         JBRGUX08Sr3CJNbWILuo5DMyLVsK4qdx5OiOg8Mkub1tgSvt7Qm+XvoKIiFSyUnKlhD9
         8v4nhUTkD+RFjnj8jiRNvDYP2XDKjtEZr+sHOCDHCGZU9qgffKUeOmwPf6n575b4bqbZ
         f8Ig==
X-Gm-Message-State: AOAM531SHpiZC4r4q+4m8LpFTGh/z1V2BuzvJdu8SlPPXo/66AOsyyzB
	Lu9O0ZjzRO+UZOfCtp7QBp8zXZLy4+Ty7EPI
X-Google-Smtp-Source: ABdhPJwkdzzrKlfXbSbjs4xEphsMfBioTaTEaregUb6OTLfj6Jgsk9KwIJwM1o423UGYhIXgkcb7CQ==
X-Received: by 2002:ac2:57c9:: with SMTP id k9mr364902lfo.165.1613094068894;
        Thu, 11 Feb 2021 17:41:08 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q15sm835415lfc.60.2021.02.11.17.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 17:41:08 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] cryptodev: upgrade to 1.12
Date: Fri, 12 Feb 2021 02:41:01 +0100
Message-Id: <20210212014101.2356815-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{cryptodev-linux_1.11.bb => cryptodev-linux_1.12.bb}        | 0
 .../{cryptodev-module_1.11.bb => cryptodev-module_1.12.bb}      | 0
 .../{cryptodev-tests_1.11.bb => cryptodev-tests_1.12.bb}        | 0
 meta/recipes-kernel/cryptodev/cryptodev.inc                     | 2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.11.bb => cryptodev-linux_1.12.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.11.bb => cryptodev-module_1.12.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.11.bb => cryptodev-tests_1.12.bb} (100%)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.11.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.11.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.11.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.11.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.11.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.11.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index c050eda49e..fbbba2dcf4 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
            "
-SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
+SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

