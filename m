Return-Path: <goledhruva@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C91C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 17:38:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.50298.1638121096926022098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 09:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7YZJUAX;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: goledhruva@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id k4so10198526plx.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnhbW18GfQ3sbTdtetQMf7tzl1DKNqwTTga0NO+spEE=;
        b=i7YZJUAXZXnwiK9dl2T1W06ErPGCXLFqc0FvLrdY2Wt5osLfGkGnxp+pIxLkP1pjN1
         KzEf/Pps433yFD+wk6YJSEnixmzHtd/Nl54lsbsIsLv+tIms//ORUVvLS58U0WGaf/3T
         OUyzg7zfPXUF3cekdkxqeqHvjCHMAcJC2lo3CX0/hlwiH2kgTwat/wN712isT+/UqUMq
         Pr4Jco3VU46rv2gOg9VzMWdWOist10EavYq1CE/4G6GtlguUiQ9xso7wPC66l6n4Vzh2
         1IX3150+ZI10eKLedcQsSKA/6DaEvh9Yqbtw2PLxBbKMKRIH/jxs3GgJmGBBML6YUUZE
         c6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnhbW18GfQ3sbTdtetQMf7tzl1DKNqwTTga0NO+spEE=;
        b=BkxFlZ6OdhpNb60kyKfPU/TOMQ7XZxAV6DvAGDQ49CGjOJhfsv0BZ035IVE9FGOtC8
         gqtZ4Hj/4Q/F2L2bxUtRiBIW6nu7/70+KRRBAiR4X0HiDx/YXaDN2vqK0HWzsLuuorjH
         Vv/NORI3bPff54MhMHKh9JiFFanwMEFyJGx0zvErRXeOU9eiDqQOZwuLIH3GN91UkAGL
         nH0ShveyPCvL+WkN0gqZ4rrhxSvFQ2afK4QQQ0o6swnd1BIC3GSElNw2PiEyCOz1M62M
         yBeZEi9p8KiMkFkA59tDWthfrK8Dn4bf9V17x04BqDCx1zSLHZp3q3G0bW/dBnW0ETlO
         4ftg==
X-Gm-Message-State: AOAM532idpEIV/NMhk8bJf/p1BN9HQZCVZUkHhXiybb+AFgKErKOGmyX
	oL+DHqwBYRSQlLHgeYTKwIy6sCXl3c//kHi2
X-Google-Smtp-Source: 
 ABdhPJwSbYwl1OgETv2S+rmapf6/lk/PQVg7XOg2haAcZj7HL+SLclcYbHBRRF935tkdh5GtrvIYNg==
X-Received: by 2002:a17:902:8544:b0:142:66e7:afbb with SMTP id
 d4-20020a170902854400b0014266e7afbbmr53326234plo.62.1638121096284;
        Sun, 28 Nov 2021 09:38:16 -0800 (PST)
Received: from pop-os.localdomain ([103.226.237.223])
        by smtp.gmail.com with ESMTPSA id
 mz7sm16096931pjb.7.2021.11.28.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:38:16 -0800 (PST)
From: Dhruva Gole <goledhruva@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dhruva Gole <goledhruva@gmail.com>
Subject: [PATCH] common.py: Fixed a minor grammatical error
Date: Sun, 28 Nov 2021 23:08:08 +0530
Message-Id: <20211128173808.17675-1-goledhruva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 17:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158881

Signed-off-by: Dhruva Gole <goledhruva@gmail.com>
---
 scripts/lib/checklayer/cases/common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index b82304e361..4495f71b24 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -14,7 +14,7 @@ class CommonCheckLayer(OECheckLayerTestCase):
         # The top-level README file may have a suffix (like README.rst or README.txt).
         readme_files = glob.glob(os.path.join(self.tc.layer['path'], '[Rr][Ee][Aa][Dd][Mm][Ee]*'))
         self.assertTrue(len(readme_files) > 0,
-                        msg="Layer doesn't contains README file.")
+                        msg="Layer doesn't contain a README file.")
 
         # There might be more than one file matching the file pattern above
         # (for example, README.rst and README-COPYING.rst). The one with the shortest
-- 
2.25.1


