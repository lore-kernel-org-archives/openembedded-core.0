Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CB6BC60F07
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 18:06:39 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id l18so4142889wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=o1bxHdSAOz2ZaMDYmw6DnQkndgwmh45HVFSZXjU38F8=;
	b=MFS68cxJY2mpOcWx9bbXD2V2/uoHTSKigDEz74qKuR/zO5TEKTnyTTallc4rTh6l72
	jZYRL5x+xvyaSiwMMiNRqwXZPTVhNumASSxH2ee/mm4OMjADqJlTJY9l4SN4g7RXA1VL
	jR4s/mZBIskfN7JqDGoEp2dEK0YWHUrqsMvkfGC0+4aKONHZpAQMJFfyki1QAS2Tiieu
	EfsXUZDTbrRfjSEiOx7dyxJqh9ul8IUpKMy9dmHQKn+mNfI5AYApxrHUQxfUsOjoe25Q
	qXJ8j7KFA6Yxf3zsPP32+JF3e2+RsUyUsPXBcKAsQJBkvC7xxnCqj1XW5hxJYgPIxAJG
	jy7Q==
X-Gm-Message-State: ALoCoQkI5WdLFzSL/61BmR+biGpYJ9woj76xfov9eJdenKzO7LHRoTmemT31asXulJPHwnk2gVxi
X-Received: by 10.180.183.108 with SMTP id el12mr14176997wic.55.1379354800529; 
	Mon, 16 Sep 2013 11:06:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx7sm25399911wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 11:06:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 19:06:33 +0100
Message-Id: <1379354796-8157-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2 1/4] mesa: add virtual/mesa provider
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
X-List-Received-Date: Mon, 16 Sep 2013 18:06:40 -0000

As there are two alternative mesa recipes (mesa and mesa-gl), there needs to be
a virtual provider that recipes that explicitly need Mesa (such as xserver-xorg)
can depend on.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 meta/recipes-graphics/mesa/mesa.inc            |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index a804089..d4b9db0 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
+PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 79605fa..afc795c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,7 +17,7 @@ PE = "2"
 
 DEPENDS = "expat makedepend-native flex-native bison-native"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
 inherit autotools pkgconfig pythonnative gettext distro_features_check
 
-- 
1.7.10.4


