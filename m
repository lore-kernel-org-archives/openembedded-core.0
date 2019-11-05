Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F32317F8A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739L0Cj8zHg
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990294;
	bh=19CUEhodyvaIG/uko1z/qoE2J3OnQXaqAYOLkf3IvnA=;
	h=From:To:Subject:Date:From;
	b=Ty8Bm5BBZI64c6+oWKl/B3cY0tJ1N++A0CVu2eLr9nfYtlHqqXG4rqg3kvhAAvvM7
	9qTgztQeVtPcGjBIGJdag0syFVBYgEE2CDhjFA6V9hk4eBnUJLXIArowmxUHLMnWSX
	OW9hYiDk9ThpG5wX6sFhZoR1yR+dC6YDLHippKcN+uKFzlKmQ3ylLAewS8n/lBKtb7
	/hfTrxXPemV7Se1MW2bALHrbEmt5Igp7ZrPzXIV37z7L3CJHEnnGOEcnFF0zyk1voW
	CIjbemCOlpAoheq4EPAenBVZROlJoQAiQyLaFH+Gx4iKNqbseyem7icOapsvj3TmU7
	dJfQa7GX5xpePpCyOs9xSGNL+nH/ygL4RRvldTNwtmr9pGM68X9TTI+n0NrYYsIlbl
	PZcUuF2z027EL0pIJ5FlPG6SYS7bfDwdIlkpHu5BhwaYFLqT8+ACxF0nQQcB5POq9H
	OcexSUutA4jbFB+1suCJVv9Yznb7RwyK3E+ME6Udm/YbNUVEjB9TIF7CgPujLDT9Ew
	0o4dwW7It8xMbUqpKpTcAUf5YomG92qRcNY8Ind4Fxz323zKzsjFdZXuybjSce/bCs
	ZiTe9ib6Q7flHWcldRuPtRZadMhxbg80jsUs31hYCj3Sj0cWNYk5abAVXpiajaKG02
	tFmrmF9Z4XQENakndQubb78Q=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:47 +0200
Message-Id: <20191105214448.2511-11-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] webkitgtk: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:53 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.22.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
index 301bf10cea..26e673cbcb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
@@ -30,6 +30,8 @@ inherit cmake pkgconfig gobject-introspection perlnative distro_features_check u
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
+CVE_PRODUCT = "webkitgtk webkitgtk\+"
+
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
-- 
2.17.1


