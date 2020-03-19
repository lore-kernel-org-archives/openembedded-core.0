Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 533F360AF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 01:12:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r7so3595222wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aWzXpaggsosls/GZmdgU6k962Vlt+YFyHfNgOAXmQEM=;
	b=JpWJS3fqQbWMiPBUNbSmSHjcOXGByf81VGBPraGXcvL7snnG79CGnw+zKZsEIo/f1+
	jjYCZECJqHmTQkFxh99lGpkEDK3XwCF+roNXoEDvQhd+469cWFtH08dEhYAIT4WQls6B
	N40n6dyaSNmR6CdBM9SjHDW+DG3FOQV4qXhumSkQHGtyTPq05wsHGchhCG9pHVJCNyb7
	ozoC2VTzrrTH4koS1KSFGyl6Gm7ERmXCOhW5Q31E/dFLKMpQ6K7tGNzHa5F7Dyfl0A/y
	Xuz6xgCuYuwBMLfH1m0/TiKjguvqBinTAbsezpOCZU2VloCXjieYQqdTdRarI7wwD0nT
	4U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aWzXpaggsosls/GZmdgU6k962Vlt+YFyHfNgOAXmQEM=;
	b=nbsqO9SNRN+cvcc1Xia0W6htjDmXAw+7KSTSDt/QLXO3oxI5L1o/Eb8LsVcVlH1/NF
	BAp+/Er3MVhZmzJjjIUedAy1NKq43f7lMLiYqNPLCchK2D/JTD6Md6EWlu/xUC+3ovB6
	We0blJwKZup6ANKC9Kj+tlrgs1nCJPN1JyB0V/lNKNLKyUgoLk9/czts9Ox8d+WPcmOM
	+WbeIsqs/pUeOV8YpB5KTXvx6rxV8zDYPmTq4czc1Nlfw9OJWNoFpsZiVSgvMTxjP2CM
	sizhr8awFoIHBv1xtrRP8x6E49/EZbfrlsx2kaARVFuMmdWduntiFeTDcE2gIVBKKnfH
	3gkQ==
X-Gm-Message-State: ANhLgQ1xC/TzYtpSYzJWd4cQrt1QZdnVSwxYoZ3J6NSEjDlwgK9Qu4Jj
	hBIxgimtllCyuAMdjw+78i7D1nIU+xI=
X-Google-Smtp-Source: ADFU+vscy0nJiVD6Bdwj0O+QAwm/zoNRtlHHPzJbsvOnYunK/qFk9v6QhShYxGjSaP1fJvcBJUabgg==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr552002wmc.32.1584580336459;
	Wed, 18 Mar 2020 18:12:16 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id f15sm926249wrt.9.2020.03.18.18.12.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 18:12:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 02:12:05 +0100
Message-Id: <20200319011206.14726-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libnotify: upgrade 0.7.8 -> 0.7.9 / port to meson
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
X-List-Received-Date: Thu, 19 Mar 2020 01:12:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:
New in 0.7.9
============
* Fixed linking in darwin [Iain, Marco; !5]
* Added man page for notify-send [Jan; !6]
* Dropped autotools [Jan; !11]

[1] http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.9.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libnotify_0.7.8.bb => libnotify_0.7.9.bb}     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.8.bb => libnotify_0.7.9.bb} (59%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
similarity index 59%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index 0306b04f4e..38da41639b 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -7,12 +7,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+3 glib-2.0"
 
-inherit gnomebase gtk-doc features_check gobject-introspection
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gtk-doc features_check gobject-introspection manpages
 # depends on gtk+3
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
-SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
+SRC_URI[archive.md5sum] = "ccd9c53364174cc8d13e18a1988faa76"
+SRC_URI[archive.sha256sum] = "66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761"
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
 
 # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
 # meta-gnome libnotify3: 0.7.x)
-- 
2.21.1


