Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF207DFB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:33:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 7so8143137wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G8+PS9L1tjKVrKOxIHu69zIixAqLx4PCjDBB6Z5icWM=;
	b=oFJsxTisA2eP1lUzxvvr1PmokIa3WqBFylD7zkbdpYn8tE5OUGq+OZCu2aIpMftDOD
	LDMvqCHveu6OUht2VpfVCehVoHyW+hKj1EjPLh1/W+qFsmFIzbhvuHg0EwRm5e17A1yu
	Xk9W8Du8LasQQZI4rGBuPTJ07M3kmW80Vi761IiSWF/J4dkeAZvs3BtCamywTrBbqWge
	1HR+1qxxiJ0PHVegbt1kXYm9gco6TFGOLhJdiOVtCG9XBEO/QaREpbrK2KlkRP7qqMEK
	/WO6yjlgTIIpjR2Y3wRtjA2mx36ZnzNvFTe3bmEyLEVciVTYe8d/AntbcI72C2xDqG4U
	wzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G8+PS9L1tjKVrKOxIHu69zIixAqLx4PCjDBB6Z5icWM=;
	b=b+MvnXWBus3IpFDeZd2/8iNlZyZEjsHSp8JunaikL/2fldNm5k/RTl0gzGpznOKDOt
	PLj1C20lRUCTN0VwrHzOY8WctS6AZR1Fjzuoed/UeLqYRQ8dDkCbe7dPRzlf/RsjanZJ
	VxTc9MIcUlWq18HuWlRzHeIBgJLjvQoTGJZCS7n4mtaWliwIlXcrmianin1ZsR6WViZ8
	Vydo4E44pDK0/cnw1oguhXiZZMwLWWb5tPpJk5ay7PDPlacIGytTPsrK5p7Fy0m07fO9
	aQTvfpjmf+P9n+jmrvBgGkHEE/8/n9Yh3buRr3qhuK6tZTFWpPC1Dkok9LbnIZMmpozG
	yJuw==
X-Gm-Message-State: APjAAAVuI+rXOvRkcUrTqoNLVyUNHyrcKjzKHSO43dmDtGwXfIchoH8A
	t4J7ZaUVecNILOY7UQaDC+2xN81/
X-Google-Smtp-Source: APXvYqz8XuZn5HYdXRGH4X3xbTBQKnKX6Hg1ADbVsejoXSXWGHojZDS4l2BpE/JfbhypZW0OdXAX1Q==
X-Received: by 2002:a7b:c347:: with SMTP id l7mr15601745wmj.70.1557761591941; 
	Mon, 13 May 2019 08:33:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	m8sm25046407wrg.18.2019.05.13.08.33.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 08:33:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 17:33:03 +0200
Message-Id: <20190513153303.50095-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513153303.50095-1-alex.kanavin@gmail.com>
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] packagegroup-self-hosted: drop epiphany
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2019 15:33:11 -0000

Originally a web browser was added to build-appliance-image to
enable Hob's use cases that involve opening a URI; with Hob long gone,
a web browser is no longer necessary to have in build-appliance-image.

This will also address the out-of-resources problem when
build-appliance-image builds itself in a VM, as a test case.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index b296db5457e..f206cee3731 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -189,7 +189,6 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     libx11-dev \
     adwaita-icon-theme \
     xdg-utils \
-    epiphany \
     l3afpad \
     pcmanfm \
     vte \
-- 
2.17.1


