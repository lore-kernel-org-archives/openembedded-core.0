Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4908A601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 12:33:55 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e5so2505219qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 05:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=pzM1vYJJNVz0/z9K8Ln0Xxl//WCDhRwdxUpvnale+QA=;
	b=Odys+tFTs6hWjR1In1X8Ob6h+w4H4KB7orwgkM636VHcolZcqRB1xcUtJajuxC/iB9
	/PvybsnPamMmx7RNoHuxnedwAIPlFQQEenTZPvd+Wn0SxrG14qtN9liLg0lUwgu/bI4T
	gkqbq4jTyXAPFXySE+Z9dkjxC+McAM4HFOPA5XFExT+A6G+mIqJ6MGbwppipNbO7iUk4
	oBweOZgB2WwSTIA6VNfsUnIlo1tJ5IYuMHsk0fyldPJ2WlClSyetLq/TR+QPojF32uTV
	59TcnxYa7gmD5vn6db4nqQ6Pu77rL9PlaHdi1HGqoi4avaBJdZ7NLcLxvwCc1vi+Bxzp
	eO0g==
X-Gm-Message-State: AA6/9RnK6rEg0A80HNCjBk1meTM7DnQtmrzv/+TsASp6evQcn55nOyfqttvaXBdItxR4mQ==
X-Received: by 10.200.41.71 with SMTP id z7mr1713797qtz.107.1474547636703;
	Thu, 22 Sep 2016 05:33:56 -0700 (PDT)
Received: from localhost ([179.105.252.78])
	by smtp.gmail.com with ESMTPSA id f94sm798354qtb.13.2016.09.22.05.33.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Sep 2016 05:33:55 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 22 Sep 2016 09:33:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2016 09:33:49 -0300
Message-Id: <20160922123349.21115-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.10.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] gstreamer1.0-libav: Add 'valgrind' config option
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
X-List-Received-Date: Thu, 22 Sep 2016 12:33:56 -0000

This fixes following error:

,----
| src/libavutil/log.c:51:31: fatal error: valgrind/valgrind.h: No such file or directory
|  #include <valgrind/valgrind.h>
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index b24de62..ea01163 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl,"
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,yasm-native"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 
-- 
2.10.0


