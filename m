Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0C361883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:30:58 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so1136294eek.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vnm6XNGOyFh7Q4Alg6ZfrNEjC7rY+0tcvyKKJ2FWjwc=;
	b=KXeFo8tTClwnafPekbhpvHCAM1tfj8EBagX1LEVyc1W+fXnaUR7XG+GefzWDbtKONf
	icagUroreevzqC+aTy4xHNIUjBydu8CJ6U68nvTJKJ7kobwh/gZTsB3hN00CHH/RScUQ
	cu+a4SsiNhUG7VQaQuj7Ok3R+N6Ts5WAuEzN7076x9AShqSAprikBGHanwXyMI+8+EHv
	ANbv6/iP1UbS59s57TgDDr/wKuE8481YdvMDlOI7nneikMr0kh+Q8rFegIWSQHg0/i32
	/+fnfIeDKtE8ja0FLforW+7x1zXYtkLdZSyT4wKHElKIw4vON8YGC0x3hr2395JJrbk3
	HbWA==
X-Received: by 10.15.21.76 with SMTP id c52mr2085813eeu.135.1375374658496;
	Thu, 01 Aug 2013 09:30:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n5sm5460003eed.9.2013.08.01.09.30.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 09:30:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:26:17 +0200
Message-Id: <1375374377-2415-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] mesa: inherit gettext
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
X-List-Received-Date: Thu, 01 Aug 2013 16:30:58 -0000

* build in clean tmpdir fails with:
  | make[6]: Entering directory `/OE/mesa/2_9.1.3-r9.0/git/src/mesa/drivers/dri/common/xmlpool'
  | Updating (de) de/LC_MESSAGES/options.mo from de.po.
  | Updating (es) es/LC_MESSAGES/options.mo from es.po.
  | Updating (nl) nl/LC_MESSAGES/options.mo from nl.po.
  | Updating (fr) fr/LC_MESSAGES/options.mo from fr.po.
  | /bin/bash: line 4: msgfmt: command not found
  | make[6]: *** [de/LC_MESSAGES/options.mo] Error 127
  | Updating (sv) sv/LC_MESSAGES/options.mo from sv.po.
  | make[6]: *** Waiting for unfinished jobs....
  | /bin/bash: line 4: msgfmt: command not found
  | make[6]: *** [es/LC_MESSAGES/options.mo] Error 127
  | /bin/bash: line 4: msgfmt: command not found
  | make[6]: *** [nl/LC_MESSAGES/options.mo] Error 127
  | /bin/bash: line 4: msgfmt: command not found
  | /bin/bash: line 4: msgfmt: command not found
  | make[6]: *** [fr/LC_MESSAGES/options.mo] Error 127
  | make[6]: *** [sv/LC_MESSAGES/options.mo] Error 127
  | make[6]: Leaving directory `/OE/mesa/2_9.1.3-r9.0/git/src/mesa/drivers/dri/common/xmlpool'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e888201..447e186 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig pythonnative gettext
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
-- 
1.8.3.2


