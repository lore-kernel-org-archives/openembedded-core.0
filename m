Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3C5C3527C
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.7214.1651727151601613171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mYHbEBF+;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id a21so3919616edb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qguPXMsobjGh0gMrjKWiwBtEMZfs8M/EiXrBJsK6sgw=;
        b=mYHbEBF+dK4y9BAddlpSBPrRKHmwTzdb3F91fBcz+zxrADKFw7tb8+CNNyMjI9pmJP
         Iy63YbrDoUmsXWEg+trTAEVx9oWloSRgM4JJyntxDG7P5Wd8lRtr4w14Jp9kiFemkqYs
         mDWeD87CeYHbENSwaAjYb7bPIJ29VshPkHgtASXSb7mCIlU6o+2BetW5Y34YiGdSTKA1
         w4panx9W4N7rGeqToZryXpw5hAi9SXgJY6/pNBoL8BAjo/7sAWLqSJ1yECdq+e07XEhj
         owrZngRF6XW2hXEFWajkKkEmV6SZeWc2Ng9/vRAMKH7BbbwqACapvKgpgMqjXaaH5+F6
         Kzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qguPXMsobjGh0gMrjKWiwBtEMZfs8M/EiXrBJsK6sgw=;
        b=m5ulVua0dMEX23/MgpaGYIZ6LMTvv8vqUleAxrfld7mSysENMn9Xj16pjJaf4Tojie
         CyEj9y4vsLhalcG9rK2ERthgtMSrU+pYbSupyhOlyljrqBq66/KAJ3oiGjxcgZF9mV4E
         miBDV5b5di+5GW067lYW4+EU2bK8O5ALHelCEIeScr6Esi6P64o40FsM6T1hGkTQBY0b
         EMNYPTBDzgaSqsyduEWHqbPapU6dypxuPh0hw8rr1VIBsGSHwkwH6EX7onyO6kk6diiO
         KwsUZLdZRBMW2zdL+PlGioB6yoRt1AGR6RjLR3VUD/crPfsR5lSiq7q9STo7iFES7gG3
         drOg==
X-Gm-Message-State: AOAM5328hKgJ1CdO/phtrvGoe5s20dQi4SfjMEnLtAwfQMT6Qy8bQzrS
	KSBCbnrRtjdTdTEIAkInFJnrYEQszwc=
X-Google-Smtp-Source: 
 ABdhPJxD68RJ2uDLgbigeGRb7w25JhFDz5Xrz2Iw+xC1Tx/9SkJxhQjJqweV8pzJ0WBzSQjUyvFkhg==
X-Received: by 2002:aa7:c656:0:b0:428:3280:a432 with SMTP id
 z22-20020aa7c656000000b004283280a432mr2054222edr.396.1651727182031;
        Wed, 04 May 2022 22:06:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/61] vte: upgrade 0.66.2 -> 0.68.0
Date: Thu,  5 May 2022 07:05:27 +0200
Message-Id: <20220505050544.651895-44-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165273

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/vte/{vte_0.66.2.bb => vte_0.68.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.66.2.bb => vte_0.68.0.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.66.2.bb b/meta/recipes-support/vte/vte_0.68.0.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.66.2.bb
rename to meta/recipes-support/vte/vte_0.68.0.bb
index af1c47cf80..fc4324872d 100644
--- a/meta/recipes-support/vte/vte_0.66.2.bb
+++ b/meta/recipes-support/vte/vte_0.68.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
-SRC_URI[archive.sha256sum] = "e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976"
+SRC_URI[archive.sha256sum] = "13e7d4789ca216a33780030d246c9b13ddbfd04094c6316eea7ff92284dd1749"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.30.2


