Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E485FCCA482
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:04 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.51381.1658306697466712698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fi1RGzud;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id y4so22849531edc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DLe6g56u48+wD6CN5pnahs2xPkmJwj9O/NJKMpTzWHg=;
        b=fi1RGzudNgo9/beOK3grIK4I1YDs93uNA9jW2Hzj+KOUJqyr1IxkAVumYPcCrFKTGg
         J8qQHcNnA/s6chySx8FK5kjjPuTBZU5XVdaMD6ApZnmGUh5jkoHjXUzEepyY16SYzSwO
         wBCH2wWofcOSxHvPDUVCVhyQWDvBPTatK1k/eN6gvBp9rLqr7EjGFX4pakC99FAKaLjR
         USYTql+eNoJl7TedDN7HcsUKSE3mQ3i6kg8vGPN0Vnau+CTbG+N/cnKp4xl92o3gg8w4
         I1OERlxLBfcMsEFwgX+jSrxvgR1YTKIoN/+MZ83barECAzsD19RpFz/acUIde7zBbFfE
         oH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DLe6g56u48+wD6CN5pnahs2xPkmJwj9O/NJKMpTzWHg=;
        b=1m8bRGJouBce51eMX3HrY8PiR6898v3fG98v++BBQRc6imJ/xhYO+cRcIDABNjrDaU
         bK4Xa6e4VCT477yMKyRszf9bAE9/tKAdNpGuRkSw9xSackyPpAujLHmLcCMOyODY4yoj
         1pwAkAYHNmodVrK5kXuhyr/g1i8a85GXDtrehfuAc/JFihOxUUUtvqmxfAL7nwZYnlr7
         65X2qDB6Xn5kvh0WcRnWf3yN6Z03JhQakLzZ0ACnNvhAYKWQrlKLZ0SOdNExJBDnAJA1
         pkFxSVPiWhYhsFa/d3/8lUqyPC92yikYDmTA75Lqg7aYpWTO7c8LkbvI7UbmA4WXqm10
         fT0Q==
X-Gm-Message-State: AJIora/puq4vmuOxyEWPh56MehW52oB5Lq3h1f7zq8EsVcheBMpxUbbm
	A7IgVZMsgZ0cxhDKwo1AoEM3KLiLOmk=
X-Google-Smtp-Source: 
 AGRyM1t9tK/lFQPmnXR9a4ilp/kgwhRRIXg/J/mSmXTDXj4playA7OiI/04mcR+KyiKossr2NLRJ/w==
X-Received: by 2002:a05:6402:4488:b0:43a:7b6e:4b04 with SMTP id
 er8-20020a056402448800b0043a7b6e4b04mr48938727edb.202.1658306696002;
        Wed, 20 Jul 2022 01:44:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/51] libva-utils: update 2.14.0 -> 2.15.0
Date: Wed, 20 Jul 2022 10:43:58 +0200
Message-Id: <20220720084442.2940187-7-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/168301

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libva/{libva-utils_2.14.0.bb => libva-utils_2.15.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.14.0.bb => libva-utils_2.15.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.14.0.bb b/meta/recipes-graphics/libva/libva-utils_2.15.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.14.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.15.0.bb
index b816b5e96d..4c46c386ec 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.14.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.15.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.14-branch;protocol=https"
-SRCREV = "9cf21686ad9cacef53ee6b3f13c02b830cf0c7a3"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.15-branch;protocol=https"
+SRCREV = "be203c8b85b07e1f7a3faedd13057b0a8cabd3c3"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.30.2


