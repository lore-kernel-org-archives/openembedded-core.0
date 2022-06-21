Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9387EC3F2D4
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:06 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.47958.1655842619321299712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tz0x0pli;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id o9so11673810edt.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+rjCXpo/UwfVhJdUh/gfjZ4KGoZQ43L/Kkbz+efjgnc=;
        b=Tz0x0plixrysy54zTpKjyGtN0PPLvHSQo2BtKOpL055Qr1Ec8h5AUl98srW3fQTwFD
         PvGJ2quFiIjD/ieKGmLT9sNkT6rM3tecNPK8OhXa/AJkxI9g++dcbeknYOunEaVBW6GF
         AoRFOmQyuyHrr//pIgJOio1llQ7UqiRmSxEI5Ya4bihhmxcILoBOPt9EfweGPHD3B99T
         FwiXUus1/pTEH2T+dcOwaVCzoTL/qAcpBdfitJ/gq/PzogAvTBdukStyOfJ/WHEPmGDQ
         e7P9Pw7aQaZE60v8EWvMF7BhkNisuRA9IIR414kZcFGNavmqcaC3X3zAKyCRjcbknsN2
         vNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rjCXpo/UwfVhJdUh/gfjZ4KGoZQ43L/Kkbz+efjgnc=;
        b=SBdVfAB5RUkJ45psZFqF6/5bGBqBfoF1oVn0IyThuIudNXhs3yfhsfCAVtNO8fM2wJ
         iYc+WVEf8waCJmwuvZknJiEqScGurhdPX0dNVWMspS/aDBanfX4VDCQf+1GvwX+j4Cf/
         lyW5KFibADmwkBQHd/ar1afrI2hg5nFIQ4Nm5dH2wFje0xISsX/w8bTt2ieF9QZfjT/f
         +IMuwIS4MpfYvCX8ds6ngbseUXXfveEsiF5CWWWghe4sAhdU94yHOP3B0TeTQnY6kg7Q
         oPZSkcPhcjhNBE1Ao/Ub1djSyJTBrH4dJwOt3cSDBuqZPbI/uTcIrSLwQBenH8ABOcdR
         tSoA==
X-Gm-Message-State: AJIora+isXEfTwBP7Jao5S2nq1tCN2n9VItbn+QChpFvH7PIrBYdYwvS
	WIPXHGRCFyOaIrQhz8fZ+bW09YHTKnb2Aw==
X-Google-Smtp-Source: 
 AGRyM1stqrmTycgVqtyJPPaejSAqcXlxYck7MrBR/2T8jVg4KAGHqsSrpQOeBvM95hBOohtBBFxYeg==
X-Received: by 2002:a05:6402:3592:b0:42d:fb03:319c with SMTP id
 y18-20020a056402359200b0042dfb03319cmr37028867edc.137.1655842617858;
        Tue, 21 Jun 2022 13:16:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/18] librsvg: upgrade 2.54.3 -> 2.54.4
Date: Tue, 21 Jun 2022 22:16:32 +0200
Message-Id: <20220621201637.1378306-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167181

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../librsvg/{librsvg_2.54.3.bb => librsvg_2.54.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.3.bb => librsvg_2.54.4.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
index 3578898692..cc7fb9bbdf 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "66158f2ef46dde260026846c4da102e4a9dd4e5293010f30949c6cc26dd6efe8"
+SRC_URI[archive.sha256sum] = "ea152a243f6a43c0e036a28c70de3fcbcdea5664c6811c78592bc229ecc24833"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.30.2


