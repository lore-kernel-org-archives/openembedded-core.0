Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id E222572D98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 14:52:18 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id k48so21241431wev.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=h0uNO8USVS9lPnKmdmtho/ou6lnPW6L+3zrU6fu/rfc=;
	b=J2kQLlR8yHJhKpFGeY3znan5ShytwUdkGfC0E8A175AumoIoChX6VSgDZGZYwCbD4y
	vS6LH8OlWBmPriRhO2nH5Xl3bdq21ZwvHCIQV0iNE+VY4kKL8orsa6zjqYwkT0NRedXj
	OYyR05anGacv5iu19YGnBKMEUTTw5XHzq1DTskb2ZUpSNN5pocON54wGX2sKDwQnr3mD
	xsVUFhpr+axJhet5v93T3Ibhr+josb4e8h1xMnlM4qBR/HPeMs7F8ruRHkyCykfDdMMH
	g9QoSLSzSecngfNqerKuVZrO2LGJHduJAtpKenLcscx11LAVuwVLBx48IwA35IQzJ4os
	899Q==
X-Received: by 10.180.104.100 with SMTP id gd4mr8076302wib.22.1422456738271;
	Wed, 28 Jan 2015 06:52:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e18sm6422185wjz.27.2015.01.28.06.52.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 06:52:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 15:52:11 +0100
Message-Id: <7daa079d85bf89b2c16c23ec6e98c9709377f458.1422456689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 4/4] piglit: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 28 Jan 2015 14:52:20 -0000

* there is some pending work to resolve this unnecessary x11
  dependency, this can be reverted together with x11 dependency
  removal

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index f468120..68ac7e7 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,9 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "virtual/libx11 libxrender waffle virtual/libgl libglu python-mako-native python-numpy-native"
 
-inherit cmake pythonnative
+inherit cmake pythonnative distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # As piglit doesn't install, enforce in-tree builds so that we can easily copy
 # contents out of $S and $B.
-- 
2.2.1


