Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0556B773A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:15:43 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id hl1so2174062obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lFsie8aVDZiRtNVJU828uR2TxgEnJrpLdcJivnB/M7s=;
	b=vhSBHVw9hE17FQvi6i9NNwQUA381s9GCEC+BxdaUBLhKXyXYCG9xKAcsApQuyb+57D
	NyQ7Ch75769t5ds56sneJQhsHH127YppGFY6x4y85PG7y1z7Nh2EeaLYULw6TsLJHn1o
	JTiMAuHprwfM5wEfqSi7tNKo+PjS5ORb7z0gdDtldXTO+DA07oeAhc+JlMIYjRUqtE3L
	fftplJWnMfZeXiS+mtwqU0A/5jRDrI0+ul3BWROzmTu/3VDQW/E2Feswe8b9BcHfbjuR
	8+aJR+waUPrj8YMQL+Hfp6q4FFli18l0YKTmIOyypRiroIKiFxUPCj9TO57d6Ej9T21N
	hccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lFsie8aVDZiRtNVJU828uR2TxgEnJrpLdcJivnB/M7s=;
	b=Oauwfc0V0X3orc6UNFZWlB408NdPEZWILW1b7cyrFpn2T2YGO6TeyhcZVVqHUb2sQF
	Q/PYolAlT8tDC4m9ZkgLStBTeb7/RrzlHRNn+jwWLeQoHdRdjUcTfEuKqJjRoBMXBIGs
	VktaAWFJ0fSevXZBXp1wM4rZuwjpvvMBrXeU8yYYa7xYTfx7r+ud/KPC2cUCqHUVOv0x
	oIfGR2L4ZfVHqqCWy38UT9P3J9YkqG8JaTfkCAbvrFrEXMP2Jg/krFVWXsOvUD2htXzw
	2YCyx0wMVBijvbd/1QckaOyGuAPVdFXmVBFL2dTAqrNUho/NswAlPJAkgG4xoXlAI74q
	bReA==
X-Gm-Message-State: AG10YORi/Nq3S/RqRVQ4qePUyCcj/NjQ366VB5bAX7ZnJH+GZeijntIEOOWw1FDr7l5hUg==
X-Received: by 10.60.96.164 with SMTP id dt4mr34337385oeb.74.1456366543914;
	Wed, 24 Feb 2016 18:15:43 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id to9sm112844oec.9.2016.02.24.18.15.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 18:15:42 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:15:25 -0800
Message-Id: <1456366525-7522-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
References: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] gstreamer1.0-plugins-XXX: move inherit gettext into common .inc file
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
X-List-Received-Date: Thu, 25 Feb 2016 02:15:43 -0000

gstreamer1.0-plugins-base/good/bad/ugly.inc all independently inherit
gettext. Move into the common gstreamer1.0-plugins.inc include file.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 --
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 --
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc | 2 --
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 2 +-
 5 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index cb6cbad..6117e69 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 
 DEPENDS += "gstreamer1.0-plugins-base libpng jpeg"
 
-inherit gettext bluetooth
+inherit bluetooth
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index e04096c..cde0019 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -4,8 +4,6 @@ LICENSE = "GPLv2+ & LGPLv2+"
 
 DEPENDS += "iso-codes util-linux zlib"
 
-inherit gettext
-
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
 PACKAGECONFIG ??= " \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 8f996d6..3f56d1d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -4,8 +4,6 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 
 DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
 
-inherit gettext
-
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 869022a..839ff8a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -5,8 +5,6 @@ LICENSE_FLAGS = "commercial"
 
 DEPENDS += "gstreamer1.0-plugins-base libid3tag"
 
-inherit gettext
-
 PACKAGECONFIG ??= " \
     a52dec lame mad mpeg2dec orc \
 "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 6ea911e..d2b3820 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 
 DEPENDS = "gstreamer1.0 glib-2.0-native"
 
-inherit autotools pkgconfig upstream-version-is-even
+inherit autotools pkgconfig gettext upstream-version-is-even
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-- 
1.9.1


