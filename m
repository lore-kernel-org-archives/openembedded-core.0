Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C9EF078451
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:20:50 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id x70so33770270wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gk8u80Backc+CtYqiGx5o8/zsIDDNnCSXOZKA+QuAKM=;
	b=yhAtZAIOdTUe+M+Bpa98USrLnF2Jt6puS1ewvgVUSyEIWM5L/1pBUoz2LrYK/5bq93
	oZgexQqV4qULSQFAwndw2WMkx2EbrJslnfiuSadekpIMVbv38A9sCEk9N3Z7zqPnUVnX
	9KvES62QOQg7E3x0mZz00CfDAUVLXJokt2BCGyB00M3gxCNpm1wt1hZWc0seKVUYJ9Fm
	+H9jnF19JwYUCLPQ7amxlbw6IHRsNg6/KdKuX5hQZOQeNmfH5b5ztWh20OnF5TcP+rxA
	OLBCIAhlvcP3mLRVSYwMptTwdn88Tlj4/58BMoR6CPb6ufa6z7XbUCv54EjTVoNKNJuU
	mDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gk8u80Backc+CtYqiGx5o8/zsIDDNnCSXOZKA+QuAKM=;
	b=uVT8jpKvqaJHNf8kT9MPPGf3JdyNCb1YGe7mi0VJ0cK0TQSa+eKkhTRnZiAbgOjXLU
	FaqEfCAM+x0Thaawe2Yq68zMtQM6jKPXQKzwmWCUMW8t9xlNL1fBe3Dczn6kFhH0irHT
	oENmFO1J39wAZmg1FXZ+5XgTqqN5eKkh1+J3If7kxOXvE7+HPpP+elhopJXYzXr/zRiE
	QZyL1sw+A+JJPtOvXEb4n5gtn0d5RXZWp3nD3suP7h/9XBQFgEbCF8b/gmGAixerkIVz
	cx14reTaOYBC1iUhTQsMitIzcYRNWqlL3+5baiG7X8aC7JL23k+0gRSjIWr7Trci2wC6
	S1Kg==
X-Gm-Message-State: AKS2vOwxV0TqWtUGa3DAYoEeu65qwehIbAVP5Kz7S32R/PYVnn+gWaGl
	10xbcRq+e7V3sCC+UYM=
X-Received: by 10.28.91.209 with SMTP id p200mr8201013wmb.67.1497640851167;
	Fri, 16 Jun 2017 12:20:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	v96sm3055147wrc.53.2017.06.16.12.20.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:20:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 20:20:47 +0100
Message-Id: <1497640847-9108-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] epiphany: remove unused intltool build-dependency
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
X-List-Received-Date: Fri, 16 Jun 2017 19:20:51 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
index b51f54f..77c1933 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   gsettings-desktop-schemas gnome-desktop3 libxml2-native \
-	   intltool-native glib-2.0 glib-2.0-native json-glib"
+	   glib-2.0 glib-2.0-native json-glib"
 
 inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.8.1


