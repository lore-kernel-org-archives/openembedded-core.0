Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188B5C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 22:18:17 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7256.1678918686701104502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 15:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KqpUu+zB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id y14so5970669wrq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678918685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0reFpTzqsRluCh649IYapqfybiMJWmebgVMsiVM304=;
        b=KqpUu+zB1XAULxCR3ZmyiGnab8chLjnoSGmT0nlRs1Tc9yvQ+XXo4W7579hm3OW7ul
         Uoz31UYv2+LKSDrm8M5olboGrLtc8nbK73nYFLOE/M18yLhEmurW53uCzH4D3HAJaKic
         a7oGkEgaUIcpz4MkdPrT1gdc6K84MFXKjMP5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678918685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0reFpTzqsRluCh649IYapqfybiMJWmebgVMsiVM304=;
        b=IKwz0xIzusZJzhWuGF+nldSDvIcqrpGY1TKbSagKXWp7/1n9Qh9RHMp7t+NEEvYO9o
         mDSpw2yH/FTWBbfhQMfugzBWSRfaGTJhuFctlkLUaFecCVlcKUd2RB1iKzuAhpDDtHS5
         BD5Z/w/U++/7zmDUqHSauHvJWJtRsMDqJuC2ODUuBpKSY4bzTYPH6k/6pJrA/5iG9Vqf
         jpLFVnFLqNEwOxR0InEAhiWqdH0hAPiAjqPXf5X+exBLRY6NuSSZl/v/xkUV93KuhjGm
         Iifb2D2IGGzUTcIva4k25Vcx7gKsgACPjVgkIfq43k8lDeftCNNClGk8qQU8mBBFsFRy
         sNgg==
X-Gm-Message-State: AO0yUKVFAzPdATCCU/+DTncajnFclVubuyxgfu82GUDA9jHemHLYvsEK
	Y+S/M1P2FrEESr+TlMmdv29hnjEPKBvdZcvKa6c=
X-Google-Smtp-Source: AK7set+KuFc8yOkXDYP5x2mIZC7BRdKxfemZmZIKFBayJz/Sgbv9PsXWWC2iKAlG+yZS4C7r6JRQ6A==
X-Received: by 2002:adf:f0d0:0:b0:2cf:ea5d:f60a with SMTP id x16-20020adff0d0000000b002cfea5df60amr3511026wro.3.1678918684899;
        Wed, 15 Mar 2023 15:18:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b002cfefad9c1dsm4258160wrq.66.2023.03.15.15.18.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 15:18:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] matchbox-panel-2: Update 2.11 -> 2.12
Date: Wed, 15 Mar 2023 22:18:00 +0000
Message-Id: <20230315221803.4189345-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
References: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 22:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178658

License changes were the addition of SPDX license headers and license
header fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{matchbox-panel-2_2.11.bb => matchbox-panel-2_2.12.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/matchbox-panel-2/{matchbox-panel-2_2.11.bb => matchbox-panel-2_2.12.bb} (90%)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
similarity index 90%
rename from meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
rename to meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index 3dec68b9638..29a1a36e129 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://matchbox-panel/mb-panel.h;endline=10;md5=0b7db28f4b6863fb853d0467e590019a \
-                    file://applets/startup/startup.c;endline=22;md5=7cbcea60b667f609495222faf3e07917"
+                    file://matchbox-panel/mb-panel.h;endline=10;md5=f007add2f09d6a1920ee5a28645e9ce1 \
+                    file://applets/startup/startup.c;endline=22;md5=9ee7a4192e53cc00041ef445d4ff6909"
 
 DEPENDS = "gtk+3 startup-notification dbus dbus-glib dbus-glib-native"
 DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
@@ -16,8 +16,7 @@ DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 # The startup-notification requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-# SRCREV tagged 2.11 plus some autotools fixes
-SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
+SRCREV = "39fdbc40888c1c75cd7bfd9fd341e6ad58487fce"
 
 RPROVIDES:${PN} = "matchbox-panel"
 RREPLACES:${PN} = "matchbox-panel"
-- 
2.38.1


