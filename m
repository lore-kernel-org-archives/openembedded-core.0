Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57CDC5473A
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.70884.1724736255498009541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ldOGNR3H;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a868831216cso566009666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736254; x=1725341054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpQJQxBbSVpDZD0cnWGp8A7xQaOrVOTadOQ1cEDXnhA=;
        b=ldOGNR3HzJz0ShnPA4U2ccDWhHLYhgEW9Qsz5VKcFNZhCNuSR+wPTwHSmnvXRgsLW6
         e3EUX0/WH/oDJkPLJI+AMRQvVoikku9fP4WpFRl3sEvAAg8cGJqdPnC9n8g5LINgDffD
         uYhycXVfW0BTxNW68T944/UD3uoEMD5yvv979YpaCSl5jQb6v0BBGs6yXNJ6DaDn1Hxx
         Ape9I4y7/ItuGRKSP9C27+H1MJtEWQ4Cu6F8TvoPzm+Dg6o0a3WdREzKhK8e7fcoV9NQ
         0IXktWtdFRVPvM8HYKbr7O6Z11BxkOaNzzwK0wnF5M1XhyHAOP/l+BeSyVKfDG90rI7M
         GivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736254; x=1725341054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpQJQxBbSVpDZD0cnWGp8A7xQaOrVOTadOQ1cEDXnhA=;
        b=SDAWoUKvjvfmPzJFIPAhHWwAjK+8O9BzifDyXpsPJUhAwN+WC4Yw/HaeKhGS/+5kNa
         w5NqUBaPTc+y35wTAG38e5/F/oCN5JOgyZIxw3F2lJ/S7XJ/21Vnw0V5NunRq5l60FN9
         wYWBuPG3zsPffzaaev6bi3nNQX5gjysxJcGVK56rSNwZvWpRLhw0Kyr5V2Z7Mka9xkhI
         r9XrR9yGQ/3xXB8CHBx/ORvFXF6lyLy6roaVZaX6HpzwBD68XhbrStXs6J+pLpzB/c5w
         nYHZNXV28+5cyZsDfNIb5sHQ1/uwPw+CUpWL6jbGj18HQvtVc3z2U3Iwy+dimUX7754J
         pDAQ==
X-Gm-Message-State: AOJu0YyQc0PI9A06JGfQzfEFHVbWjxrOrCx75qJU5RglYKq3jiJF4pOy
	7GdQNaLq0zhwgUfya6GeC74t6VAZ7HKa2cwGrAlOO+2MlCCzsJ5Jpu8/UQ==
X-Google-Smtp-Source: AGHT+IFK5+xTDbL1v8rms7mkg0Gm3EDHZSDS1ndcfOeUB2HlYtWcptz7NtrnKgreoje34kdU0wwJXw==
X-Received: by 2002:a17:907:6095:b0:a79:82c1:a5b2 with SMTP id a640c23a62f3a-a86a516800cmr935206966b.9.1724736253533;
        Mon, 26 Aug 2024 22:24:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/34] adwaita-icon-theme: upgrade 46.0 -> 46.2
Date: Tue, 27 Aug 2024 07:23:47 +0200
Message-Id: <20240827052354.1319810-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203803

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{adwaita-icon-theme_46.0.bb => adwaita-icon-theme_46.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_46.0.bb => adwaita-icon-theme_46.2.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
index 2f3e4e7b85f..14d26ebd19a 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "4bcb539bd75d64da385d6fa08cbaa9ddeaceb6ac8e82b85ba6c41117bf5ba64e"
+SRC_URI[archive.sha256sum] = "beb126b9429339ba762e0818d5e73b2c46f444975bf80076366eae2d0f96b5cb"
 
 DEPENDS += "librsvg-native"
 
-- 
2.39.2


