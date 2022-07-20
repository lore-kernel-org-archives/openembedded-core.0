Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2BCCCA486
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:45 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.51546.1658306739785277803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VSx45zSj;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id y4so22851623edc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q0JtSJqgDjwJednG7rhudcCizE47ZskJ9EN//S/oJmM=;
        b=VSx45zSjid3b5Kj1aWv2I6b2wdWjbYmwKv/eYAOFMysPs2u+SMsfOpAX+SEjkmCBEd
         rN8CKFpZB4k1jPHaLZphemVifJYUaZspoT54scSecpC4WnTwyd3S3KHEDTIhCXPbL9gV
         7CRYsdSSJ8LYhM03yN/SRJsm9WoJyjEcKcFCGR92dTPt7g1ZSKkVyCkx+n9MnGo8B7t8
         4ZbBE0Hoyv5WgwUqxU/+7KZ5kp7y6QGA/pYVQzsz6LtD7+LQfKKr5mmee5/c0tQ1a7NQ
         pfe9q9VZ/eDBD5VHk8YEuH+ZyKjpJOoyEcvnmnsEy6MGMNHXU1BFmukrS3RBw16CNwuz
         CbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q0JtSJqgDjwJednG7rhudcCizE47ZskJ9EN//S/oJmM=;
        b=PvMt0IA7cN+mU3+XIQgyfM2ots7G0NrdV3BO0seuPvsgqNuzN/nu3daSWJzuVG43tf
         C9WSNJgeoggB4JtTvuXJD/AU9CQ/CyVo4yf3mfpF3iNoqRyeaKEVmOuwSzYwZWALGGag
         29DDU28nUs6gzKDrgQ6qQdnHd5x/PBNA48tAiX5L+y4J5atekTxuc92iJsz+vFi1zN6v
         8M45KsCpQy6cV5YqCoIy5aG8Sa3XWXQZc7I+9V2OBuy9bU+3Xlj8PfJmKez0rWsvhsEy
         /G9TuVLaQ9xsLEoHNbnmuKMCWXAFKb3KK2L4CTXjp/0x9y9SZwFkE8BMM3A9mn+Hqetj
         eiwg==
X-Gm-Message-State: AJIora8dRww/GxKeWaqzzV1qfNIDlC5iqCHcL0G+DwWr3W0Bt/BzwUF9
	oKPHebm9P9LLtUL+7qOfCHIuuHlclDo=
X-Google-Smtp-Source: 
 AGRyM1u+pIeKx8VSNO/TeH9UyXAgQgqH2hkp3sWBGtbe90s0sOAT+psPqQADVwgYcFod5MLd2TeWpQ==
X-Received: by 2002:a05:6402:e96:b0:43a:f21f:42a0 with SMTP id
 h22-20020a0564020e9600b0043af21f42a0mr50074876eda.382.1658306738238;
        Wed, 20 Jul 2022 01:45:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 49/51] webkitgtk: upgrade 2.36.3 -> 2.36.4
Date: Wed, 20 Jul 2022 10:44:40 +0200
Message-Id: <20220720084442.2940187-49-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/168343

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkit/{webkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
index 83b6f8a6ee..df4ff63121 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "732fcf8c4ec644b8ed28b46ebbd7c1ebab9d9e0afea9bdf5e5d12786afc478d1"
+SRC_URI[sha256sum] = "b6bebe1f85a479d968c19e44a4704622ef8cef61636ad1b2406b77d16ae2e2a8"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.30.2


