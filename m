Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF770103A9B7
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19963.1774438301314615485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nfD3D9N3;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so8178445e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438299; x=1775043099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvd/wt7blnJra/XuJrknXHsBzlQTglyBnedt1vmOEIE=;
        b=nfD3D9N3XiuM+0nhgQU90C71TG+WOux5WWHgjE9+35hudADnr9J5EghpwA0O5O8qIf
         MNeu3RTOMSfVbpN8w5gWGYTkgweISK+lDahSDwP7Q0NZ2WSGJ0fmjkDIaTssyvMUk9OW
         t0oUMfKv/ll9aW6cwURzIPUz48zK2LlLyLVWC8nfFbeLmGln/WIje0l9tOtFt3hSwvAP
         O4678IPs6N5hdHZdrfQC5zJmFG1DjRR/JQk1uu59IgAwlmZu4V3cqp8VFeLxuO46gydV
         IWtzrJlY6D4xhZSAs2JjiCUpy+//Wx0kCG1WtvwTBhRrBMg+IT0E/YQuPOgB4SoJ5h9N
         xu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438299; x=1775043099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cvd/wt7blnJra/XuJrknXHsBzlQTglyBnedt1vmOEIE=;
        b=nYJTxKQMOSDDWGo5tRAEoj3tYOGQdmBq/ITMexDvCPxwh+VZ5J/GkoeX9znPW1hGzM
         OtWMpVPJozuTFuzS6LjWLnHdobHe8HKATNiOOOw2SswNv1nIvVujZ8DzQX7a5oWZZa6t
         oYNjM9B4B+QAUeNSWzcqDoVGMJAjcP/6fAun2qsUCaLrA5pIbgC1rvvqR9PwogWUaB+o
         CsgtoqwiSFAmcAe+B0hhwxA+F0ffMofDrpgDenFlyVFAOBkKCSabH6MoItlk/wU/JM1y
         mgWukBlTQ5J49CXeiwYPrY/Rtsysq8XzizGlpuUxwxh8WuhcKxg9HawPmJcBdjeXcrhY
         9nFg==
X-Gm-Message-State: AOJu0Yyp2eswmsikvYOkQ9xz6fI3G/Vgud4BiGQD38KSpE3uzYDb6+hM
	OWhGiFr9N+FhYUFxaI57odE9n3P9YTbb/VTm+TPO8CvOJh5j0esyF8n6ngSVPg==
X-Gm-Gg: ATEYQzwu615Pe3n46l5bZqg6CqnnP5Zcd33K4aoYyTOqZrnBhZD/ZlGcudyZe0XFHp+
	U2XXfc3sR2TFn0OsCqaQ4oXgS6t9jkOJ0Za7EHevp7YltYtKAtCiakdcWn4wUkllej/9FYjMc+F
	8mEWV1FgFcH5zFhuZCFaUJ9KOX/IaQNnbuYFyw9pQIkz7UR5J7A6nO2ppQbalH3hb9hvZwBB8HX
	xBsH5fGe/DUcAlCjMWw8qYwRwlKrraetVPZ5/8XdlepxYT8+xE75EgW9cY7/oEz0ezS70NYibaP
	c8ukub014zC1Olt9xgyzXOhcib85+So2JaOZ7cYc8/AfOYhhmWeLPQcW83WKnOQJDosApWk0Lev
	w8CNXz7Y6x1TDfqkSBaD0+dj1MLK9fpN6s66PmhaNgYtI4wC3empjj+uOSzgQNViLjEFX6uJnWS
	qywCMw9Kntj7JaTQ==
X-Received: by 2002:a05:600c:8489:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48715fc75dcmr42266295e9.2.1774438299357;
        Wed, 25 Mar 2026 04:31:39 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:38 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 07/14] boost: Fix settings for python freethreading
Date: Wed, 25 Mar 2026 12:24:17 +0100
Message-ID: <20260325113112.1163632-8-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233881

PYTHON_DIR now contains PYTHON_ABI, fix the settings accordingly
to still find both python builds.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 64a57ddfb2..c76fd7a0c6 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -174,7 +174,7 @@ do_configure() {
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR} : ${STAGING_DIR_HOST}${libdir}/python${PYTHON_BASEVERSION} ;" >> ${WORKDIR}/user-config.jam
 	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then
-- 
2.53.0


