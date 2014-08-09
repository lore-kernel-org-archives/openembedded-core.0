Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id DA14C70A74
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:39 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so6890270wes.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dryGKkIDwzvq6LHftvDUY/kCrGkWlR/GVroHD+OPwBc=;
	b=MwboOTXuSrdbmCE4S4KqvfalF45sNpjo7R2NsyT8CNSkanBFzhKDCE528CFASyIfSH
	1VhI2ogkHLR1ak/UMuKlQsEHed0OAIhyTXrf/X+OKJ1A+gilt88MLY7aq0gdifS3cOqA
	X55LEpjpm87pbb2gpdFoGQjx5LO7NkFhJiRguhTpocdFVC88LoaSg8c48dMTQ6Quujgk
	oDYi4FG+iL2I+72EgUFbUX6vGkdP8j3EjVasJTjJBVVowNNnzGAG2CrtUyzuCeISGWOT
	kHbAtffxPnBoOMHmpUbuLPoR2QdpqSfSFYV0oLkQbqnEFxRpB2P90mKrziFf+WXD8e3/
	MfAw==
X-Received: by 10.180.106.99 with SMTP id gt3mr7158289wib.1.1407600460049;
	Sat, 09 Aug 2014 09:07:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gl4sm20392547wib.19.2014.08.09.09.07.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:00 +0200
Message-Id: <1407600483-31215-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 5/8] piglit: add dependency on libxrender
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:40 -0000

* fixes floating dependency:
  piglit/piglit/latest lost dependency on  libxrender

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 64289ed..32e73af 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,7 +11,7 @@ PV = "1.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "virtual/libx11 waffle virtual/libgl libglu python-mako-native python-numpy-native"
+DEPENDS = "virtual/libx11 libxrender waffle virtual/libgl libglu python-mako-native python-numpy-native"
 
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.0.4


