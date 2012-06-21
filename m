Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShqSk-00016g-NT
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 01:06:54 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so2657441pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kLYfUdyVgPJHsVCe6aPwV3RC2h/xgPrbQvVsb1B74Ug=;
	b=PanyXVn2/7ImzBgq0Lj+EYJ7L1pjHDBXiEK5bSSgmD50p/GmI/kCO+FgET6nLD7uTa
	VltU4mHUc40oe/8uZahb4H5UdNpJ3U7zgLR+w3XYhB8EuvxdTI6tRnmTINJn/1pXkr7T
	fUIkGvlAwxARhIOrI/BdU+YYJzWZQE6AqLYifSsStW8ZS8zexeQyyfIr4lyFcVI3WfRp
	QcDdPmQQAR+Q+vd3IaFtvoqQjB4Gl4EiycMLhySculIGEYUgG4O5VKSpP1+oT86JW6/h
	4MCaZWLaWMMSp78M/6U3AODBYrBPeTVedY5wXhhxBIMrsZA/3Kd/AQV6mV9CktUDuXSU
	y0QA==
Received: by 10.68.225.9 with SMTP id rg9mr2954970pbc.137.1340319370306;
	Thu, 21 Jun 2012 15:56:10 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tk1sm36951511pbc.8.2012.06.21.15.56.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 15:56:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2012 15:54:48 -0700
Message-Id: <162c4a03eccd6b326a26f18988cd011cc654fb04.1340319020.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
References: <34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340319020.git.raj.khem@gmail.com>
References: <cover.1340319020.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] qemu.inc: Fix packageconfig options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 23:06:55 -0000

--{en|dis}able-gl-accel is spcefic to gl
patches in 0.15.1 which may not be available
for other qemu's so if someone chooses to remove
gl from PACKAGECONFIG then we dont explicitly
use the --disable-gl-accel option since this
wont be recognised by configure.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e618c1d..707493e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ do_install () {
 }
 
 PACKAGECONFIG ??= "gl"
-PACKAGECONFIG[gl] = "--enable-gl-accel,--disable-gl-accel,,"
+PACKAGECONFIG[gl] = "--enable-gl-accel,,,"
 
 DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk glib-2.0-nativesdk \
-- 
1.7.5.4



