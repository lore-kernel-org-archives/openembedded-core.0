Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8B1C54732
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9507.1724319335283994176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKw45SCF;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3718706cf8aso259540f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319333; x=1724924133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiMrJtcPbgvmw2N8ZhAu9Of29KmCkXTVXOZnh0GQct0=;
        b=PKw45SCFf+HmmtR7oEwTX8MOeP/OeOK8bSgnkfk7OfC3p3eUbP2vMcG3odEZB48vZW
         GZy93Wel/Sjj1oe5WAsX6eaFNynGJibNWDRD3TOGOr3zfJcEEA1E+JlXmjPT6jrCe8wb
         kqNKucnyM9FmLYG1U0RFoZp9vMGmkPwN7MXDnWbbC/n2Ip7mgQA2NzvYir7Zav+rBjiQ
         jzQ5SSyPMS2LrLekNY5IAOBoEptCxTgBnMvvz4RqoxuBkLTsvygkG9Na1XwPPcDN3tGE
         yDQBVsi9M5fsfiVmQoiz1u1+nr2iS4MRsh9Y7lLWSfXSw0oji+023Xos3rPXgh0ow+A3
         lGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319334; x=1724924134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiMrJtcPbgvmw2N8ZhAu9Of29KmCkXTVXOZnh0GQct0=;
        b=UD8UfgZ0ho6+RwIs5eHi3gylUgEcjKa9XCILisnxn7+QWtebJCxcXbeTbMCL1hZejJ
         34JoFmeFIxANpW2dEzKkXOGv6e949AbwTAtlDvDBy6SnYP2UwLvdeXutaqwgdpV9GyBl
         hNQGa88SkWNbTD7a2nOwB4KEMknE6U5tMWOv/KSQ0wEOHhwyhn4VEZ/yqDw9Dm4jBNon
         9iXzwTPW608LDpCuYOw1Q0u+gTEWtOuBSaPBdO8l0Kmz7NzT6QbGcE8sj8kkr/eVO3OW
         wvKy+RWQuJMk0Wo2B4hNlAE5WduS6jy7rO1YRvZHpJCZ8manQZTN2pcGqQOBz2BY/jH/
         dHhA==
X-Gm-Message-State: AOJu0YzH3JxkHR+vWLVVJYWTZZEczUYPPiuUDap2mWg1f5t7FBrSSJJ4
	BaSbtH7CsIqFq+0P6vzVec7EXzgSF2tsQbVlehme24oKbG+DXczBzZzRdg==
X-Google-Smtp-Source: AGHT+IE3HpSsmfbayVyRxXaVD7ObDX9XRl62PDxQnbHTn/b87UqaHu3VQmMx8DxVw1iUkjGGWuz5Ow==
X-Received: by 2002:adf:eb47:0:b0:371:899b:5c5 with SMTP id ffacd0b85a97d-37308c3782bmr717179f8f.27.1724319333284;
        Thu, 22 Aug 2024 02:35:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/32] libadwaita: upgrade 1.5.2 -> 1.5.3
Date: Thu, 22 Aug 2024 11:35:02 +0200
Message-Id: <20240822093521.36790-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203628

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libadwaita/{libadwaita_1.5.2.bb => libadwaita_1.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.2.bb => libadwaita_1.5.3.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
index 078f81c677c..2e22211135a 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "c9faee005cb4912bce34f69f1af26b01a364534e12ede5d9bac44d8226d72c16"
+SRC_URI[archive.sha256sum] = "3b358635f7ea455d9fe75101373e34d2fba130d1590bd1a1c87ab1ccfba05f32"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.39.2


