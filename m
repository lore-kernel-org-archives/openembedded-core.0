Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51356C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.11524.1634657691494644009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cqj+AnS2;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso3343846wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g3DO+TOF4LgfzKQLq7f/vKd+g4796b43ZhjvXrp98ys=;
        b=Cqj+AnS2r1Y1vISYhDUqFeEkqU92Cjtd8lym/pdMUA3AxNqEmn5j1HOcx3sJvwnjnY
         Puxip6tyM+oAjXc1YPViJJusEfXJuCiCWQTgfJX2hSE5ha6dcWzToHpqxU0mepsRcNs6
         HVFO73rk26PT6lGkscJNOPp1wEuJLfmUknJkjL+5CtKuJx6p1RcMo7f5D5dmb5PdR4Qz
         ZE4fSVJN//GeIPKFIOUJJ+VELzikfl8IUexX/deHbG/Laqpas9rffhjaKkqCzoSm+eld
         4AgTzsi4VSDMsmMqtZHjLFWDU5BIaZkBfibOaYxOvbHidNS6jF9ajCQonwv0a6W9gFAv
         U/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g3DO+TOF4LgfzKQLq7f/vKd+g4796b43ZhjvXrp98ys=;
        b=Ki/biU9/kfDPU7GKWxsPCCQax5rwE3w9vxgEHTej+ZJ0xn/Uh5GrcZArPX8qDnktHi
         CUjwtF17YJwB+G2EsiUqXdTM1+QjZC2yEio7jSI4KeKQV4bX3275JXYp08FywlfAqJ5c
         d91bWIysy2B3Xcdvm/pjDYFVtGrztHcxJxX+z9095rULiX+ZPbc67nX/e3O0Iw7B1B/j
         st0IVWeSAc+FTYS1t0u8vxo3agl9+jITkLYPjzMJDjCAAvgL/jWzzzANxGndv508uJDi
         sSfdtoZLjImbcyk1pTN7K78C4MSuZtuuRJUJ6eV+WzdErGvEsy0PxVLd5+lm8U7qgWwA
         o8dQ==
X-Gm-Message-State: AOAM532caqYmsoJArdvj/cSylRPv81cV5ZQ//+TT0DM/RrglH8a/WTjF
	YHj4bIVqNCsvzJyNR+eKJK/ZKeqQw68=
X-Google-Smtp-Source: 
 ABdhPJx/BSt1QDgOtrpHbCuqVEbNjh92gciS6tRZ1n1QUS3tUDef3mvZzolRlnvOV4KL8SaeMsUfuA==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr6875099wma.106.1634657690164;
        Tue, 19 Oct 2021 08:34:50 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/65] vala: upgrade 0.52.5 -> 0.54.2
Date: Tue, 19 Oct 2021 17:33:51 +0200
Message-Id: <20211019153419.3319802-37-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157156

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.52.5.bb => vala_0.54.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.52.5.bb => vala_0.54.2.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.52.5.bb b/meta/recipes-devtools/vala/vala_0.54.2.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.52.5.bb
rename to meta/recipes-devtools/vala/vala_0.54.2.bb
index 2f78c4a447..faaf76148d 100644
--- a/meta/recipes-devtools/vala/vala_0.52.5.bb
+++ b/meta/recipes-devtools/vala/vala_0.54.2.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "84a1bb312b3e5dcae4b7b25c45598d375e2cb69233cefb59a15d2350c76bdd91"
+SRC_URI[sha256sum] = "884de745317d4d56e4e8cede993dc8f04d50cfca36cf60d2f2f278c30c2b1311"
-- 
2.20.1


