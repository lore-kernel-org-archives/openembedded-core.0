Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B37CCA488
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:04 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.51615.1658306699694263100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zw20HtT+;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id m13so12682222edc.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mgjbrDCwe1Vk8SAavNwaJ19/FEe9bpKn4CFthDkO/0=;
        b=Zw20HtT+RiION5lhZtEoXji07DLkgzg8ZfsZ1UT0tq3WcvPz1s1qcB55EYV+A2OohS
         IS4g3nWMBQNg3GRboz7D6/LlV11DdcuMPJ5w6gYSd5AszHa5nRMmjLJb5/EhZTVNJ7Ih
         3EdDTnmb+mrocqDIeNwl8foLBkWXaxm5Cn1rMEFpshZFJZ06NJzxvZ5P98d1r00slTfH
         +rDJX/mrxLMTsIoy+IzDo++dBlbUURyP70m8eQtwfNtjCRH/8XTpaK2yGKOv2nMNnj5w
         ZV2uJRp00nJkaT7H367DJv+8gj5BJqAdSHKLGoCTshEFl3ErZRtnCRt3/ww6X7TKaReG
         8mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mgjbrDCwe1Vk8SAavNwaJ19/FEe9bpKn4CFthDkO/0=;
        b=VYgZz/cUjfJw3V2OeotrV1OA/djQ31bj4noUMITLNPu0B2LUM+BKE729pa0oCpKe2W
         ATUuaAGUb3Wsbzr8PLf0s8u6RxM5Aqp6iESJ2lGoBliBjorfc6/vEOEP+vMTqX8u4zAj
         6rWMkp9uwfMaNmhFDpSa5FD4F3zlEkw6q75wHU1GI6R+90mR2bokSKxVtn8wk0myuiWj
         V9JLl3+5ZnJukvkQ2EnxOfk9D5n0nAvpWeKK+yWOPDCDxKuL8MBkriGoCpB/CnLSQdZV
         saNvmQWA747sdwFjZQ13DxRxuhLcJKp/awovPregDNSQSW1GZtwI8GzB/Ezfc5UjvFhh
         X9CA==
X-Gm-Message-State: AJIora8+EqwdE+iYYFB71BsVoF7MOFi38C9ugWXXifS/fzcXQ/K2obHd
	dWlbzWwkGUKZwX0nqKCG6SaLg0Xu17Y=
X-Google-Smtp-Source: 
 AGRyM1ubbPz6SqT3rJx0btVoMktoZ/vQAkmz2GpDjaZEcUkse0hk/DinmPgvJxtEaSIDsSf1lZexZw==
X-Received: by 2002:a05:6402:3551:b0:43a:a5c0:2fbc with SMTP id
 f17-20020a056402355100b0043aa5c02fbcmr48315759edd.288.1658306698267;
        Wed, 20 Jul 2022 01:44:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/51] xmodmap: update 1.0.10 -> 1.0.11
Date: Wed, 20 Jul 2022 10:44:00 +0200
Message-Id: <20220720084442.2940187-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168303

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
index 7dedb03a2b..dc955aa977 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
@@ -12,5 +12,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
 
 PE = "1"
-SRC_URI[md5sum] = "51f1d30a525e9903280ffeea2744b1f6"
-SRC_URI[sha256sum] = "473f0941d7439d501bb895ff358832b936ec34c749b9704c37a15e11c318487c"
+SRC_URI[sha256sum] = "9a2f8168f7b0bc382828847403902cb6bf175e17658b36189eac87edda877e81"
+
+SRC_URI_EXT = "xz"
-- 
2.30.2


