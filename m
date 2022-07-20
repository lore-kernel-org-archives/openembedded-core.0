Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C2CC3F2D4
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.51547.1658306741785600990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iWhGKxBw;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id w12so22820439edd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zehYR/2ZWpJ0tA1/ZdWLMIicMK5Myxxh+rOL8KTApfU=;
        b=iWhGKxBwg2wzN13Kec9wk3KIFGKID8x/4l9vb81SmXiziRD1I/S3hDxVI98Ez5qiZi
         DiAmTRwzXFRUAfO6X/koEzzXfdRZBHU38f/F3jfMVaRKBw+ipEMmp/fCV8rJza9imSnp
         7hr2a8tdXcZ+IwcjyBVR6GvF0boa+vwpNPAjFgVjG0dIwKWJI8HM9qv1RnZLL4FNFu33
         gELDmYDFXZQV46UdOuoQstDKmvX49780VuDB/6TGC1Qz1RrY8k0XNWqb7GGz7kDbzTlp
         +nyFalWzx/ccN+fI3ef8zhHx9LdCy7tj8Ac1BqHZKzIrzZgbx28T2i7qW0qdWCqJHm0f
         BS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zehYR/2ZWpJ0tA1/ZdWLMIicMK5Myxxh+rOL8KTApfU=;
        b=BKciL8s7KS2Z5ElUJoTxTiBs213MBXCRNLRpbE6qY3Tj2o0ZhrDdy5TIdefUx8Iyy4
         qGzA8dZU0Jyc718lRgzg8RHqAKtITbLtXqqVa6sfoR9K5E1ib2Mr/8chPe4wPZkZRJ6P
         rvsi/46oFrwfEpHf1V6Imr2cgENh6+BWcfyrx6FJmFGBUv4KcEDNG9ViePX4jkTG/TPB
         /Xwaz+R8gzYZChtM2KO+tt9K/JylrH+tfJmTDec6bi6vrSC/0nF92d1Q62B7eR5vbcSF
         tEgfgezZ1I9O5AdC757AsgAAsFJQSoRE84Qae4zETG+0crP3cYKU/om0WASk8sS3u1EV
         JGnA==
X-Gm-Message-State: AJIora/03GAXtwYo27u0jBufznBS/zmFLJH9cva6H7aEQRsZQqcAh6+r
	ZNnxougFEaPh4JKuh3+nQUz5WJH1AtA=
X-Google-Smtp-Source: 
 AGRyM1tqegA4pKQzbSkegG3bQUZOt6n+tJXqk8iuyoCqAtsM5D1yIFrfTSgC5RNRugGy5YBBJ6EnCA==
X-Received: by 2002:a05:6402:214e:b0:43b:6bd9:319 with SMTP id
 bq14-20020a056402214e00b0043b6bd90319mr16063239edb.308.1658306740349;
        Wed, 20 Jul 2022 01:45:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 51/51] epiphany: upgrade 42.2 -> 42.3
Date: Wed, 20 Jul 2022 10:44:42 +0200
Message-Id: <20220720084442.2940187-51-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168345

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_42.2.bb => epiphany_42.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.2.bb => epiphany_42.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.2.bb b/meta/recipes-gnome/epiphany/epiphany_42.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.3.bb
index dc1b34ac92..f9d60ff2a9 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.3.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "92c02cf886d10d2ccff5de658e1a420eab31d20bb50e746d430e9535b485192d"
+SRC_URI[archive.sha256sum] = "7316d3c6500e825d8e57293fa58047c56727bee16cd6b6ac804ffe5d9b229560"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.30.2


