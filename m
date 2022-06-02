Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFAEC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:03 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.1537.1654188773760435436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bXjAnIqP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id s12so5027302plp.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8qMFFYEGxwEJHSRapfF023MhFo2It8jzp8d2swBHbmQ=;
        b=bXjAnIqP09tuOvCItB1ieXi8OKcDWxifaZKt3Z02gErylphgFk54C1vHCLI9lm3+V7
         xjk/xnYxNrOeKdQ4a4beQDbP/DeBRFSam6CM0lSTL7qadFf92OLxZ1Gh0yvAcRT3tSkS
         ecpLgK+KVaH7c9hib1lFpPNbmmLWlX+Fi55/ck8ewQ6IvXZxR6ebbnjC9yPWhstaLRRG
         CdawRA2agWqGDKNC+w+iNormc8+/yDoZmblxBroGzmTm/wIHvbD1A+S0wmheML2YbMs0
         9aFo+kCR9lcJsXI/LwKQqONwpC9juhpxgPdkGRGCqm2p1JicGqNE9T8ZULbt6aSpVBnd
         5PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8qMFFYEGxwEJHSRapfF023MhFo2It8jzp8d2swBHbmQ=;
        b=xE2EuwmLkR4Jj7qKEqOZHagbxDHZax4En/ZXMqoSQJOfdMKDrBADENXa15yaadSbj2
         gPcb5zaSiem6GDfJ1YOOS4Hs3xM+xNgHdKM5i7LcWKKgXY74JNhr4EprEQLVrvhB/9WI
         vEODezimwDQC65HBA5yv1xwmBRxGpi3R+1cgXJYvngrMlw3mLFsE/H8/89tocaDGlNAD
         axsTq95jmEI3wTqUUBLh3II8Esy3LbvZxh7G6OKzRiUFFy9ie0pdrm1G1FoHYwM2DCfI
         8FoBv8NQ0taJGHFBgs6YN56MC3r5xBL0137qzDTYWgNhpKGInGfeNy42423R5mjoSLOF
         gHDA==
X-Gm-Message-State: AOAM5306Rf1GbpdHZlUTgcdYYYYnr8JXo1QSayDnzXUHuY6psBGIg8hl
	qml6YG18UJhRMOvoLaqU7GksUj/7UVebh3Er
X-Google-Smtp-Source: 
 ABdhPJzaDsbxVcwQY0nGA8EqtTaYPlmhKfRdW0GyV+S5qMTN09Dwg+NJyLDArhXafzFaJ11nWgUDGQ==
X-Received: by 2002:a17:90b:1b49:b0:1e6:a23:69c6 with SMTP id
 nv9-20020a17090b1b4900b001e60a2369c6mr6219885pjb.124.1654188772684;
        Thu, 02 Jun 2022 09:52:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/26] libseccomp: Add missing files for ptests
Date: Thu,  2 Jun 2022 06:51:49 -1000
Message-Id: 
 <b34aaa9acbe865f61be0a598b8df2735b1bc76cd.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166494

From: Joerg Vehlow <joerg.vehlow@aox.de>

pfc files are used e.g. in 38-basic-pfc_coverage.sh
valgrind_test.supp is required, when valgrind is installed, otherwise
all valgrind tests fail

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 32ba67bc37b5ca73f7d29cb6c7de281ab8f824bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
index e6260a7754..d47200e01c 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
@@ -37,6 +37,10 @@ do_install_ptest() {
     for file in $(find tests/*.tests -type f); do
         install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
     done
+        for file in $(find tests/*.pfc -type f); do
+        install -m 644 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    install -m 644 ${S}/tests/valgrind_test.supp ${D}/${PTEST_PATH}/tests
     for file in $(find tools/* -executable -type f); do
         install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
     done
-- 
2.25.1


