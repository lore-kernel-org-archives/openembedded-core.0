Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085A3C4167B
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:27 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.5891.1651048820920107953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E0VaP+A6;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id p4so1135708edx.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wkwfxTnN8UrwIlZfhsbf3JyL5wT66zNEAoQJrwFJ+/Q=;
        b=E0VaP+A6fpqoqTdnqgDF1hzrKdq7ttg9Q3wHtoK+6BsIAVQ4VgIJacJPSqMR8sTC/J
         b8KibWWV9ebGNWN7/HJ7BRvn4BZrsKO5lTAGlDhiArnOWjEojrAyx3uZEH25NWKkAqrr
         F3rGZOdidHi3ctPuwRuqOXB9QCeAaNo/nAwvrspFPgDtNFp2D7LVakeAMoIlDYDg09C3
         9+ejp3AHAXOCymW6oJlEvLQ0F56zLknkkn6Mv1tnNZoVW2TNC994qzegR4dn68jtZFUR
         2FLRUPwEHyb0Z3SF5YnJuseMp4WvyZjIKXnKi98wC4kn9SnpJ0OpaB1Tb2y2K1FSLilb
         pPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wkwfxTnN8UrwIlZfhsbf3JyL5wT66zNEAoQJrwFJ+/Q=;
        b=7ifhwncd+yfLChH01ZSGFavlGjgEmn6AkP5SDn9g1dY4bHetvmxfNa+4JHQqHqfoGZ
         aoa9d0gHy6UjvujK4CZW/8D+jD8r95s9aQw2MmyfPigBYvinCBRenIJhIYi7pmqEv7q9
         XgFWEHbAGTp06aQmSWvJb2NcqkYZqzkHMGXKBokaZPp7BeaBkg5vKalt1woj8CEHKSDT
         8vFpWoHO3sLCPtKIs/Ajb8crGzMh3b4zxatcdpNOQJ+ElVd92pHnhwXSZQkILRohe74F
         ruat3AOf5urY3WXIJWBnMWA7nY9NExVfrHBMj9X8DbEI2N57TBedJzCVbyafLEgh7XEq
         geTA==
X-Gm-Message-State: AOAM5329hMJBx1D/NeLo64FUBr7fXHz7Tu9Aq6CKDQcmw8d2l/nDLej/
	WRkI1brkDCcFxOpLLyYaatd6cOYraGc=
X-Google-Smtp-Source: 
 ABdhPJzzj6L3IbbAqU4oY0DxSGEOh96rQc52WbmxCNtEQn3Dv1pUGQbgs197aNu8FLHvw15k7k7v1w==
X-Received: by 2002:a05:6402:11d0:b0:425:c32d:8bb8 with SMTP id
 j16-20020a05640211d000b00425c32d8bb8mr26222688edw.27.1651048819449;
        Wed, 27 Apr 2022 01:40:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/18] python3-pyparsing: upgrade 3.0.7 -> 3.0.8
Date: Wed, 27 Apr 2022 10:39:59 +0200
Message-Id: <20220427084009.3406717-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164899

Upstream has transitioned to flit from setuptools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-pyparsing_3.0.7.bb => python3-pyparsing_3.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.7.bb => python3-pyparsing_3.0.8.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb
index 9c3896918f..30be4bb87c 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb
@@ -10,11 +10,11 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea"
+SRC_URI[sha256sum] = "7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
-- 
2.30.2


