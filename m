Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20BEC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:42:36 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.11300.1635021755184679135
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=BT4sGbAi;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id o11so8553594ljg.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UbxPWJKPHtOZuzhYPsYPZYO9NY4SY3OA8pz1nWjPm00=;
        b=BT4sGbAiZ++zCgii5+BHtjiZ3tyWE5J9Z/LTSxfmnZKVfEZPYfZPfXJwyGYZzjHSA0
         43knL9CPD0qAaCWuWAgtzzu8/5peUJKGDGaRHDutU4HP/ZqFSxca28niWtPPW7GKV93r
         FTP998rJSWaFvseXf8dTVXKkemfM2zFXUihw0FoRi07s1yJpiKfFK/WFfZ7xDE/c4XAz
         oFquWf0pCCZK/W7e0zo2pPP2skl8WRJ3w/AQn0dTNiMhwiAEQMd6Z9WoVBQoLotB85MB
         ju7Ds6x9+aqayO5LRMBdeKMhQ+cB2vxpfvJvEK6/mvRP72io8NZPC+TOFQFuNJJD3jgP
         xj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UbxPWJKPHtOZuzhYPsYPZYO9NY4SY3OA8pz1nWjPm00=;
        b=HnpSGAsW/ipV5tcP4CP7SJ5VSHOem3qPzTeS4iI3kRl10xUC5vpXSdHNG7a1jMlS/v
         SoK9L9jYTUlwBKS/oe0G/NjQppsdzA2YBwGOvWcuh9AYNGLz78ETNj7IDRUGpZYONYn8
         /y8fcZ5UA/Ppl1Cvh4ICXhxwFK6VM/j4SeXp6AkBvrQ7pfr7HG5E42s4BCOLxiikEZZY
         dCamf54ZMY1qMhqfJ9o95ezGB92K+fQVcbRnSF/5gOeD81gJB44GClpx7qM4Ta1VYl0l
         U1O05KCEnEVETDLtuGQdVV9SkD/Wrwq4/2ZekQRNTHb4RmqGKFFHc1XAPyRQEePFh6Ep
         tX4Q==
X-Gm-Message-State: AOAM530OQOthdByoyQEyMhp23rtsEUXHO38KgaKMeEsd59pJb9UTA0Zc
	uMXKrZghGl51d7p4aYaOt0s2pQkuyOaD8C/t
X-Google-Smtp-Source: 
 ABdhPJyFMWHnDs4pqhTbbk1sXBncxRJif8+mmPYGby46VDI9NJXA8UR31LkMU93qzSn2xbTmPAcAAg==
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr8593780ljj.302.1635021752990;
        Sat, 23 Oct 2021 13:42:32 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 d20sm1259409ljg.20.2021.10.23.13.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:42:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pyparsing: update to 3.0.0
Date: Sat, 23 Oct 2021 22:42:31 +0200
Message-Id: <20211023204231.1661303-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 20:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157312

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb     | 3 ---
 .../{python-pyparsing.inc => python3-pyparsing_3.0.0.bb}    | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb
 rename meta/recipes-devtools/python/{python-pyparsing.inc => python3-pyparsing_3.0.0.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb b/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb
deleted file mode 100644
index d0c3d0b424..0000000000
--- a/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-pyparsing.inc
-
diff --git a/meta/recipes-devtools/python/python-pyparsing.inc b/meta/recipes-devtools/python/python3-pyparsing_3.0.0.bb
similarity index 75%
rename from meta/recipes-devtools/python/python-pyparsing.inc
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.0.bb
index 330bf7e39a..f1f6b0df14 100644
--- a/meta/recipes-devtools/python/python-pyparsing.inc
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.0.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[md5sum] = "f0953e47a0112f7a65aec2305ffdf7b4"
-SRC_URI[sha256sum] = "c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1"
+SRC_URI[sha256sum] = "001cad8d467e7a9248ef9fd513f5c0d39afcbcb9a43684101853bd0ab962e479"
+
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-inherit pypi
+inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
-- 
2.25.1


