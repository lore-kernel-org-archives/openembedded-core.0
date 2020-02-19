Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7A36077F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:24 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n10so2025131wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NwiAb9zIkKGqo7emVwIfQu8NMTmFr29iKvs39rgCyC4=;
	b=mAkBAAt4i3ou4B1fmNDQmu/CnllBOJQIENHiysWPvuh+xu11lWv8DjCQWM34bBAFCs
	1VsPdSSztjhNdL3icX9+B7sn0c2hB5QlsyQSfFMo3WLTTtegSxMy49cdSwlLbe25lOAt
	mq1W95HFsQrW051hLV/qNuLQbHRjWVix/kEgXWl/oUosu+98JWRffcvqYFnKx6kp6sWU
	c5zo8N9nl3TUOsF0fBOWvcNjv10M3Wk0OuoE4oCe55SG5o4/zckw7nqWb1g+k2tMZWXt
	zX8fgtLQnX8ULYDQVcYHu1FfQMPTmSe0CQkZxSLNEC8QxKBSUP+s0bfgC74ODRng2qzc
	FwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NwiAb9zIkKGqo7emVwIfQu8NMTmFr29iKvs39rgCyC4=;
	b=GZGm1R+sj+9qK0ouC863c3vGuLl+4veebY9KSouMw4xlfx5E/UFBDIc1O+gOrpgvRp
	65QJu5Eu070d8f2NcwCqHYAwDvspjaBLjJHAdaFCDAHr2sSc9oMI6UTdfMRQBuXlWjTo
	GWGIET/imza6kPL67ZL8vAZ/Evr8owWGfqUzuUbf254wi4q2CoZ0DW+bbOABEBe5hgVf
	wQYgxxNOjJrO/lxlCsoZ1hYwb1bt1Tpl2cQ/xneeKZ0iZljvJs8ukfEH2xjr2+p6HNIn
	YzqvnYaYkk+tv94XdogCadE3axALxMdQsixbMyUh35YR13VwlsDcCKbUzf7LYQ09xfEj
	m/fA==
X-Gm-Message-State: APjAAAWeQMFoPkVKiQGBWWR0Rg6ltG+4+Exr/G6Nuvdc+CXmfJBKOcaK
	YWoIf10hkk86FmstJ80kqf1zOqm9
X-Google-Smtp-Source: APXvYqyCo8ADI++fHxSM1QRclGaw5X/4WEiyV21VNdAycPLpaMtH9mOtXiBDgvPRZWnA3uYslFrFLQ==
X-Received: by 2002:a05:6000:1208:: with SMTP id
	e8mr39264314wrx.351.1582141704780; 
	Wed, 19 Feb 2020 11:48:24 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:49 +0100
Message-Id: <20200219194752.7967-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/13] meson: upgrade 0.53.0 -> 0.53.1
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc                |  4 ++--
 .../meson/0001-Make-CPU-family-warnings-fatal.patch  |  2 +-
 ...0002-Support-building-allarch-recipes-again.patch |  2 +-
 .../meson/meson/0003-native_bindir.patch             | 12 ++++++------
 .../meson/{meson_0.53.0.bb => meson_0.53.1.bb}       |  0
 ...sdk-meson_0.53.0.bb => nativesdk-meson_0.53.1.bb} |  0
 6 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.53.0.bb => meson_0.53.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.53.0.bb => nativesdk-meson_0.53.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index c0ce7d338b..d391c9cf29 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            "
-SRC_URI[sha256sum] = "035e75993ab6fa6c9ebf902b835c64cf397a763eb8e65c9bb6e1cc9730a9d3f6"
-SRC_URI[md5sum] = "3a0313d040ded973d84cbec368c2e1d3"
+SRC_URI[sha256sum] = "ec1ba33eea701baca2c1607dac458152dc8323364a51fdef6babda2623413b04"
+SRC_URI[md5sum] = "9bf73f7b5a2426a7c8674a809bb8cae2"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 74d5b4ca66..9ce31e5489 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 8ce7a1ddbc9b7775568a98fcd50e39a01513c902 Mon Sep 17 00:00:00 2001
+From ee638fd4a299bfc53a2238e9f71ae310c8d97460 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 1529ebe9fe..ce18660756 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From cc6e47da801ce3c274485775c62784416fd22977 Mon Sep 17 00:00:00 2001
+From 9c221c74bd306dfa6fec22c8f156eb9d4e4f7fcb Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index 76c1aa9ac1..dc822fb1fc 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From af2554b9b08af973181b4e4181bd1cb936fdbb8f Mon Sep 17 00:00:00 2001
+From e76726321067748362b39937bd1e663a1a948ad5 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -22,7 +22,7 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index f17b9f2..b5c9c92 100644
+index 40e304c..4b687df 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
 @@ -184,7 +184,7 @@ class Dependency:
@@ -73,7 +73,7 @@ index f17b9f2..b5c9c92 100644
 +            cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env, use_native)
          return cache[(self.pkgbin, targs, fenv)]
  
-     def _convert_mingw_paths(self, args: List[str]) -> List[str]:
+     def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
 @@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
                                        (self.name, out_raw))
          self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
@@ -93,7 +93,7 @@ index f17b9f2..b5c9c92 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index bdcc4a7..e2de847 100644
+index da411ef..856506a 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
 @@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
@@ -105,7 +105,7 @@ index bdcc4a7..e2de847 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
-@@ -507,7 +507,7 @@ class Qt4Dependency(QtBaseDependency):
+@@ -508,7 +508,7 @@ class Qt4Dependency(QtBaseDependency):
          applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
          for application in applications:
              try:
@@ -114,7 +114,7 @@ index bdcc4a7..e2de847 100644
              except MesonException:
                  pass
  
-@@ -517,7 +517,7 @@ class Qt5Dependency(QtBaseDependency):
+@@ -518,7 +518,7 @@ class Qt5Dependency(QtBaseDependency):
          QtBaseDependency.__init__(self, 'qt5', env, kwargs)
  
      def get_pkgconfig_host_bins(self, core):
diff --git a/meta/recipes-devtools/meson/meson_0.53.0.bb b/meta/recipes-devtools/meson/meson_0.53.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.53.0.bb
rename to meta/recipes-devtools/meson/meson_0.53.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.53.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.53.1.bb
-- 
2.25.0


