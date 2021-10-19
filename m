Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC2FC43217
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.11410.1634657709003599072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cYlKK7um;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id o24so5064512wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uSTGCP297mUyw05kfLapkRAnz8eaAumWgNMNIjzREh4=;
        b=cYlKK7umGqg4OO3WesXZG8dly9tbkuXSC9HEuP1JHoUZh7iJHGUfFEWBRp582o30Mr
         DB3G/d8I1EaJLAIa2zTtu6ndxSJGdmMbbncuMgyXW4tm7UGbUvPJGL74mobEV+yisL6P
         MYRdKMBAmvVbKEOo+t5pugjzLCqWpGhDyXvvV9YTbQvwDn6JQsyWVhp95l5AWrkwCxTK
         TgMSI3sJf0o8vZRmbLGnuE3UMigjWTPnxQcvfOUD/4RPH2OR3D7iN6GtnrYwamJ/5P3M
         ci0vGyHdSdAMGP/mVG+/hcahIH22aSfV/VUQvy4Dtm3hY0QnzHcfyOpcF2p+cm+zwdGC
         0APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uSTGCP297mUyw05kfLapkRAnz8eaAumWgNMNIjzREh4=;
        b=jE2LBQhpNB8hS71/aKdbeazZQD8SXds93hIpLsRV7f8DMHHgkAfgdp1iVVZ2w+9fzz
         T0wAM6NGGxjvkbeL8kUrWERg1ZMvHlgZjme3SbkgUznWwQTo5mqJtVnYeZbwr+I+PXSm
         aqM2IiqZdMFEnUlPeGNktvQc3cCa4EkeMOSYTQukA+uechLUK7BNu7l2ilit7EfVT8cY
         ZOvvJPxKeyVd6zdIpPA8sVgdd9cEFFA2iuCUseFTK/kGKlsBYjO03/gVm5vXWV+1slSQ
         FyEG0weLgRsZYDN4CsCPzbEODhiPbYVrc+06MWbzGlHAAq7WMgU+sQsjQI29juAHYqid
         U+kw==
X-Gm-Message-State: AOAM531/swaWW1aLMsBUTR5eFNxB5xHAUv4yMP+uecQBNdgeEe/Qk7bc
	nvPIKbSt2gtLg/VyvKB9Bg8pfQGwdjY=
X-Google-Smtp-Source: 
 ABdhPJyPyZuYYRzOep34Eqra6Rhlsva+3/G4QIRvtdvkgWZe8mIyd1qmjaJTrtz33laaZe5zjT/ISQ==
X-Received: by 2002:a05:600c:3223:: with SMTP id
 r35mr6752411wmp.32.1634657707645;
        Tue, 19 Oct 2021 08:35:07 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 62/65] libsoup-2.4: upgrade 2.72.0 -> 2.74.0
Date: Tue, 19 Oct 2021 17:34:16 +0200
Message-Id: <20211019153419.3319802-62-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157181

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup-2.4_2.72.0.bb => libsoup-2.4_2.74.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.72.0.bb => libsoup-2.4_2.74.0.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.0.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.74.0.bb
index 351bc9de73..ea34373a67 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "170c3f8446b0f65f8e4b93603349172b1085fb8917c181d10962f02bb85f5387"
+SRC_URI[sha256sum] = "33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e"
 
 CVE_PRODUCT = "libsoup"
 
-- 
2.20.1


