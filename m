Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44E3CD3421
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.27149.1694943562279010810
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/DLDFIN;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so467876a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943561; x=1695548361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxyUW+il14rNrqpOmg6VBCwsR9NxiELaSK1VW6aIf4E=;
        b=c/DLDFINjLu/nqivCtAo6Od6SMMhcvPTW+UDby7ReT+W62gY/yA2IUDeJOZH267DWI
         r7af30+c2zoP1rdaxMYBXnDzMT3TpjwQN9/4Yie3fDQgIygrMQYeqQXZTJGWC9y2obDT
         Zi1xB1FuRamJelSQL4PwZT1gbrBRmDMPfafJEOPXSTFJDK8X7jmfcSFtoIheov/5TTf3
         r/2oITxQp58zSkiZuvdPG5L2mrFps4xf9T/yrRi9TvHmhI4u1uxFYu1Qvs+tXhfFicaZ
         SNPuv5BdHPhCoGLJOkB4xwrPDKibFMwTuqHeys2hg6w8/STGOULqtccFI/hnUPhsoF1H
         5/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943561; x=1695548361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxyUW+il14rNrqpOmg6VBCwsR9NxiELaSK1VW6aIf4E=;
        b=TWz/IwL8PcDrW9JUWf6YqHlCECbdUnWbIYK+4phd8tZV3QEcbRPS/IbubDrZpqmeDg
         HQsRodmV/0o9lxghCiS4nDqVPPCXoscV+pCvhh1oFpmyj75OpccH7zxxBdNnDGydgPbK
         UQA96LCWBSdvk7/jlgTmu+gMeCNDWH4CNqD3FYTwe6nFV1cs0CfS2aD82X0+FCbpg1W5
         4u1AAy/vcCFHkBlAJtmGNEibOFXMUYTFKhBmxTsipp6rDmBJHHHzpWXbRtRrAO5L2TWN
         lpSPuQTNHQmMph/cRDKgolaB1lLCN+AI/m3lDXw3nMfoAgSpvghXeQ/c987KH50d0gPG
         bmjQ==
X-Gm-Message-State: AOJu0YyDfi027OIjVgu31cECKbZJXloEHXSd0RcHqLVPKOFmfXrdUOWC
	Oo+SKHsWyohUozMGXKclmp/iitv3wRc=
X-Google-Smtp-Source: AGHT+IEbiK6clSPFXES6AGygohFll3ZFsqM38Y2rhoVgc3WUdIHklVREZG2fyR13BjKuvNvix8819g==
X-Received: by 2002:a17:906:cc4d:b0:9a2:26e4:a5e2 with SMTP id mm13-20020a170906cc4d00b009a226e4a5e2mr9259939ejb.25.1694943560763;
        Sun, 17 Sep 2023 02:39:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/29] libva-utils: update 2.19.0 -> 2.20.0
Date: Sun, 17 Sep 2023 11:38:59 +0200
Message-Id: <20230917093901.428214-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187800

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libva/{libva-utils_2.19.0.bb => libva-utils_2.20.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.19.0.bb => libva-utils_2.20.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.19.0.bb b/meta/recipes-graphics/libva/libva-utils_2.20.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.19.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.20.0.bb
index acb25a3f0d8..2e1fd094068 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.19.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.20.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.19-branch;protocol=https"
-SRCREV = "5bf107ec4f7b18a6457d23abf57560dfb382a751"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.20-branch;protocol=https"
+SRCREV = "0c8373e62af3e4d9a3831334c5402ad255797e67"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.30.2


