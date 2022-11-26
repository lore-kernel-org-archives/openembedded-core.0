Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10935C47089
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.70831.1669472129956938808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=j8zF7SXo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id y10so6310443plp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1acOStbn1jY36BTD6DG7ImG2tAx9w6/OoWKVTKibuuY=;
        b=j8zF7SXozczl1bgV1qtnOUNjhm0A0H+cyHJlTDe7bht9TwfFqP+aim03jAhFGrmge0
         3x4Rgsin/07HxWbb5h83k4AcHBCQ+V9ZcmKCGMtsEQCb/F0JEzfGe0nmLAR+XZM+GuH4
         YEoBg9Djv1CCopm9PIIxF1LIBoz+BgX3B+H0B6SbKavWJOj+MUGotdSRRfDSpj/jye32
         Ow9GvRUo9A7kE3UkBz9nEhBiTV0XZwessd1af0wQHxufoZU+DXqRLQTJrKTtDJyunl0O
         X9wCSbIFLQmekuMeGx8ehT1VGisHM9EKOZvE/emT/vyv10rB3KQDwRzPblfSoVyzEV3M
         Pqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1acOStbn1jY36BTD6DG7ImG2tAx9w6/OoWKVTKibuuY=;
        b=D+3QPFq68wz2kRCLFMUf7TmCBdwkYvV2qULj19HTEFpqY3Znd8VAWksdnjkmUT2rnO
         wUdRIS6lLvOhN+/PbkHjMTjJb5Ho9cwMqGc4cEv03VJxaUmiFz69S8iE2/aCB79ybLrn
         ZA2JMhNvXhSP2v1uWChGvjUVMON8jwyhOX9MOEfBVfDhhyU21R3zmJa10kIdkWA958ze
         SJSbeEim4NPZYmnJnpZFp7F5CnBZUqiTBP7bRl6k7wDKyt7jQHf3dTIie4sNQB7qAfRp
         1K9xRfHxz4j9tC8K0tCLvl0lZF0yHKupw8AgBgBMVatfGSRtFvIDvBkrpMgOnDbIAucZ
         MGSg==
X-Gm-Message-State: ANoB5pmuAM/lyUTAAFJwJXQC0U3tZIHDdsGU6IVDmETDVJDZMtvE7Ykn
	CeE8XiEWeFV7phc0IU+KO+7JqSvkpi+wGTC5ZQA=
X-Google-Smtp-Source: AA0mqf4X5UktyJ450PV+au8Ib71Yq2U/sclVHiiNmFGMCaBEn3rIQnqkugbPNd4GRm60Ao1fOUARzg==
X-Received: by 2002:a17:90a:9f03:b0:211:59c6:6133 with SMTP id n3-20020a17090a9f0300b0021159c66133mr45879371pjp.238.1669472128839;
        Sat, 26 Nov 2022 06:15:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/37] pango: upgrade 1.50.10 -> 1.50.11
Date: Sat, 26 Nov 2022 04:14:14 -1000
Message-Id: <c1c3a2f3d4bb002be241d37cde688c6e9d8c0bea.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173803

From: Alexander Kanavin <alex.kanavin@gmail.com>

Overview of changes in 1.50.11, 03-10-2022
==========================================
- Don't crash for lack of fonts
- Avoid a crash in shaping

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a330e75f90841cd230180d8a9b37e58d7d69c495)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pango/{pango_1.50.10.bb => pango_1.50.11.bb}          | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.10.bb => pango_1.50.11.bb} (84%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.10.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
similarity index 84%
rename from meta/recipes-graphics/pango/pango_1.50.10.bb
rename to meta/recipes-graphics/pango/pango_1.50.11.bb
index 95209889a8..f545689811 100644
--- a/meta/recipes-graphics/pango/pango_1.50.10.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
 
-SRC_URI[archive.sha256sum] = "7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966"
+SRC_URI[archive.sha256sum] = "8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
@@ -41,6 +41,12 @@ do_configure:prepend() {
     chmod +x ${S}/tests/*.py
 }
 
+# https://gitlab.gnome.org/GNOME/pango/-/issues/713
+do_install:append() {
+    mkdir -p ${D}/${libexecdir}/installed-tests/pango/nofonts/
+    install ${S}/tests/nofonts/fonts.conf ${D}/${libexecdir}/installed-tests/pango/nofonts/
+}
+
 LEAD_SONAME = "libpango-1.0*"
 
 FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
2.25.1


