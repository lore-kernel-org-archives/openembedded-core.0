Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC444C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.470.1660894069618602835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SERnjRvu;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e20so3686823wri.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vS8FD+ApqCXqB7e8Y+cH4eTkSPW2fzymsq7pJstWAIk=;
        b=SERnjRvubu/JSt0MN9O45LaqXxmyrcWeKa3Q9S6MVLpymMUf6FPu6hLkHuCpiMUU8R
         Fpfo4VDOngodZ3X3fk9AUj4VuC4EMw+YiHRmZNsKSfTmoCYwGyLxkyhywXMa5QXSjXOL
         HQQHm/HNQZxwdL2/IAmZmtK4G+rWQt9HjNpka8IjSxCyx0hhyce+8HWvw8B60MN6G+ZD
         O0w2qCjxkg77wAHY2javLVU0CXF4WILe83Hzq7hqs2zMtqFwaQCv/7mDpZwmp5+ZMht6
         251p7HQvoogCVbeZg8vJcuRJTdTKgreQgHi1GOjahwcrVFVJ/YJ93YUubgNLi+RakLmY
         RXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vS8FD+ApqCXqB7e8Y+cH4eTkSPW2fzymsq7pJstWAIk=;
        b=mCTulHtxZT9TnJZr1AVmITOSeUwWmVh8nMe7tsDYKf3yEdKDBcT926cuLpRW3OioIs
         M1izzZxNYZxreQC0ACHumL/Q4Aq/lqpn2x0/gsth5YU4L0PAG603ArhOGxH1nopXMDIY
         36vqMb3j5xVBTKUM4waR0npaMZAUp8n0vY865qW2kIOjaxGLmAgnkqk/XnH6N6OPxWfP
         04FRzDQS7dfoSR9ppCt2zkGoPL6KchFaWKaYKx5bl1b+dvYmwayuuqms4chek35MHuG+
         0DYx6tjlcvIrMZ+Qd3AzcCIc2KRVFjUrfi3MAwO/U13O62TsslNAOrtcCoJDHRyyzYEZ
         eOrw==
X-Gm-Message-State: ACgBeo0Lv5e+gIhiwhh+XdxaIseQs0S76vBrA0WaJ5HrbXc2EjufRVxc
	ehrQ3q+AF9shVDHT8LKzBI7dYdACLEQ=
X-Google-Smtp-Source: 
 AA6agR4dTYpGTczsUKrbH57/WnmOUVAvLTlq+o+BpDiE6QHgTtMCL2ELWSlMRrYMpQQdxM370uZrww==
X-Received: by 2002:a05:6000:2c9:b0:220:5ffc:f159 with SMTP id
 o9-20020a05600002c900b002205ffcf159mr3448457wry.712.1660894096083;
        Fri, 19 Aug 2022 00:28:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/42] python3-pytz: upgrade 2022.1 -> 2022.2.1
Date: Fri, 19 Aug 2022 09:27:18 +0200
Message-Id: <20220819072727.2236928-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169604

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pytz_2022.1.bb => python3-pytz_2022.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2022.1.bb => python3-pytz_2022.2.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2022.1.bb b/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2022.1.bb
rename to meta/recipes-devtools/python/python3-pytz_2022.2.1.bb
index a4bb4f5c8f..bb7aeeec35 100644
--- a/meta/recipes-devtools/python/python3-pytz_2022.1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "1e760e2fe6a8163bc0b3d9a19c4f84342afa0a2affebfaa84b01b978a02ecaa7"
+SRC_URI[sha256sum] = "cea221417204f2d1a2aa03ddae3e867921971d0d76f14d87abb4414415bbdcf5"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.30.2


