Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA296B938
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:33 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so182026eek.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=DW0yGP5qT+RZBRt7q3Dg04ahfJiINXsd1J7pni7/eoY=;
	b=Y0V+YtueHSiH8NBAyw284wkcow3m09fUq7ga+PoX+pP3N7E9bxsHuRvLidmT0ht1s9
	ar/HXmAek3gkBJMQZofQruc/vsQ9ob/MZpR4GeXJkPxMQ421aa8/nUrGRiqLSQ7S1D6t
	SF1wAmH+N9+5slxxIgX8bZERrjR7B+pZxGc/YArG1cVOnAjae+EnAqeato0Y/HT1qM7l
	fA2ED3J9g5CBfcKzdfD5PaBz8HkCkUxQeTWIjyQg2eOUl/1qkSTL9/ZPl8o+YxtI0zPP
	4h/0nG8K8YtjCY6nkvysAi28aqUsJkyUyOoZOh5ivB9nRQb5XLkU//WZ07ZSVkY12HXs
	rCHw==
X-Received: by 10.14.1.5 with SMTP id 5mr132713eec.96.1376551413750;
	Thu, 15 Aug 2013 00:23:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm81972444eeb.11.2013.08.15.00.23.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:43 +0200
Message-Id: <2cbd576b8a987f61d44a5e58fc5a2a1d827d56bc.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 32/33] mesa: inherit gettext
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:33 -0000

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
 meta/recipes-graphics/mesa/mesa-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index c37ad69..c3c76d7 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -18,7 +18,7 @@ DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig pythonnative gettext
 
 EXTRA_OECONF = "--disable-glu \
                 --disable-glw \
-- 
1.8.3.2


