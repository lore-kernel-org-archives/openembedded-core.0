Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id C48D47473A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 13:56:48 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id f17-v6so6222254otl.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aV92Z8IkPHFK2ZR96GN+ebeorzNjxIOOtcT3s2tm57U=;
	b=hzGPVmC7tfdGUaV0rmhpAOrdVecZnPugI+lOElhHnbPJ5K27UZ+vQobqeF20G9G9D7
	hXmIDygy5J+EnC8fscnrgSINtnkBM32Q8gMSWk4EQZ07//O2mks7rd5XwkJxDXFHm2Iw
	vVBYgpn9VDsypzg7+myO3dJWP3LvZ1COSVEw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aV92Z8IkPHFK2ZR96GN+ebeorzNjxIOOtcT3s2tm57U=;
	b=bs0l5u7m5hk3AVwmx/1+nwPSa7eokxZT4ZmvTNK68lGu7BKRx6eOi6ji5BKd6CUrbX
	RfGqy+b9MOzp3KKfZ98uqCoLcncV04kZiuQFSFf7cJ1EaCuFgVN2fdNhp1BO5rAgv+r7
	mnFGIhhBTew6AU+gY1D6EVBb7jsjY6SCb78Qa3VKY6Z2HmlYMQ4KgJtmWe2KA+/NCBVu
	amCPAg3mP/ViT/gWgNg3vRBXaBr+mo3iHMbUltwhTQgS9dL5VZsLSzOLKUt5hgBWzOoQ
	srdj1FV/xoZJQ7pWpiHGdPjzHpcofrGjO1ZH3HaHfJzfADs6Q5WmoytuJqIhmUZsknqk
	cKGQ==
X-Gm-Message-State: APt69E0rUiRPtVvZav6Lzcn4jcJtCN7Sq4jrxIYhzLf6JcZuHPHmqsyi
	hY7hYp6MD+fE3qJAfFYCJBZe1F84UzE=
X-Google-Smtp-Source: AAOMgpdHVYCh3SMjdZWxc2SmMCDPO3RTn5ZbzMbwFeVQDLIzmJjGlnvIiu0cCW1xnWwKrhxuVNrHBQ==
X-Received: by 2002:a9d:b54:: with SMTP id
	p20-v6mr5748935otd.143.1530194209006; 
	Thu, 28 Jun 2018 06:56:49 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-191-185.PCs.InterCable.net. [187.161.191.185])
	by smtp.googlemail.com with ESMTPSA id
	a30-v6sm3285112otc.65.2018.06.28.06.56.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jun 2018 06:56:47 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 08:56:28 -0500
Message-Id: <1530194188-6052-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] kmscube: Update to master from 2018-06-17
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
X-List-Received-Date: Thu, 28 Jun 2018 13:56:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes from 0d8de4ce:
  c2d4ba8 drm-legacy: fix poll for flip event, actually exit on user input
  56c3917 formats: use weston's egl config matching logic, centralize format
  aac3788 Rework default modifier handling
  4f7cec0 Use weak functions to handle lack of gbm modifiers
  98f31bf cube-tex: make use of modifiers
  063ce5c gbm: fix fallback for drivers that don't support modifiers
  9dcce71 add MSAA

Also refresh gbm_bo_map/_unmap patch.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 .../detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch      | 10 +++++-----
 meta/recipes-graphics/kmscube/kmscube_git.bb                   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
index 3605446..611e541 100644
--- a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
+++ b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
@@ -49,9 +49,9 @@ diff --git a/configure.ac b/configure.ac
 index 8397f7b..c7f1f4d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -65,5 +65,8 @@ if test "x$enable_gbm_modifiers" = xyes; then
- 	AC_DEFINE(HAVE_GBM_MODIFIERS, 1, [Define if you can use GBM properties.])
+@@ -49,5 +49,8 @@ if test "x$HAVE_GST" = "xyes"; then
  fi
+ AM_CONDITIONAL(ENABLE_GST, [test "x$HAVE_GST" = "xyes"])
  
 +AC_CHECK_LIB([gbm], [gbm_bo_map], [HAVE_GBM_BO_MAP=yes], [])
 +AM_CONDITIONAL(ENABLE_GBM_MAP, [test "x$HAVE_GBM_BO_MAP" = "xyes"])
@@ -99,12 +99,12 @@ diff --git a/kmscube.c b/kmscube.c
 index 3a2c4dd..276dc55 100644
 --- a/kmscube.c
 +++ b/kmscube.c
-@@ -142,7 +142,11 @@ int main(int argc, char *argv[])
+@@ -148,7 +148,11 @@ int main(int argc, char *argv[])
  	else if (mode == VIDEO)
- 		egl = init_cube_video(gbm, video);
+ 		egl = init_cube_video(gbm, video, samples);
  	else
 +#if HAVE_GBM_BO_MAP
- 		egl = init_cube_tex(gbm, mode);
+ 		egl = init_cube_tex(gbm, mode, samples);
 +#else
 +		printf("gbm_bo_map() support missing\n");
 +#endif
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 5b64ed6..46aeeb0 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "0d8de4ce3a03f36af1817f9b0586d132ad2c5d2e"
+SRCREV = "9dcce71e603616ee7a54707e932f962cdf8fb20a"
 SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git \
     file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.7.4


