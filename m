Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0679F776DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 23:35:56 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id o126so607428pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nzLQ+ES9O7fqSDnml1AfW958fMC6tIseKaGbUh4Apdw=;
	b=RCCbV5qq+Ny0KtMLnxTQdWTcfufgvkbVWEVLpycuPFQyT/5UqtjMIOjlOuVKWz/cWU
	u4XKQ1u0dyEugPwLpg/5boNGHWWfPl3LSvUhLbp2p8Nndgfm0Wh4kwvpl5f57ILxDWWR
	7VUn6lmyrt8jYP7jal5a2tI4T6srI9vnjPE0qpUhqrcFzVaeafzE9aNBliqLatvqvRow
	OEzpGA0+JLny2WthLUst+7Hhf/pC/rtWaBrkkj1+EKYAaL8GUynpKGa6vr655gVB4SQ5
	IGYclYcGmnJPdHaoOGj6YSFPC3egFcEhdeCsRC6V2cVUbWL9W6nkMbMFGH8KCZrxXiAP
	HiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nzLQ+ES9O7fqSDnml1AfW958fMC6tIseKaGbUh4Apdw=;
	b=LsB14fdioPJaKFTb9ZE0wi566Pyh50S2/zDl4MbuBm60ct761dMilH7iBlAUMaUJvq
	3gkTZNrxSKKajuPMexme4ibAYo1zwo+90Ajd/DR08Q3zHM9Fi3xMWAbLckj1fLmwUjN5
	wvMreC0j8zsaV4dzcy4KsmOK6WBNf73JCbrCyTCqxN1sCjt4WJ8MJg3hja8fhH8jB9Dr
	gmiy3GZHz1ZLM8tE25fIykTR66r52VD/aFMkN6oVLa2fhyRSiEP6PjVyzLVjCyR8d91U
	nfAoEz43+QZUIGooJItyLgcuQ+8BOzkNBS33hEyoLubqpIEwmPmr4tF6aOsRIHcL+Wrq
	HN/Q==
X-Gm-Message-State: AFeK/H2QrtGObo2A61/74/pQ23RBPyaNONqYsiedPZHAlpW1IonISaKQ9+M7srJvhCVM4A==
X-Received: by 10.84.229.151 with SMTP id c23mr378951plk.27.1489534558315;
	Tue, 14 Mar 2017 16:35:58 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 73sm124094pfh.56.2017.03.14.16.35.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 16:35:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:35:33 -0700
Message-Id: <296e8037e29cb259f5284aada35afb87dd6e7b69.1489534345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] xserver-xf86-config: Remove X server module preload
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
X-List-Received-Date: Tue, 14 Mar 2017 23:35:57 -0000

This was a solution needed for musl but now musl has
got lazy loading.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf   | 10 ----------
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb  |  8 --------
 2 files changed, 18 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
deleted file mode 100644
index 23fcdc7ef2..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
+++ /dev/null
@@ -1,10 +0,0 @@
-Section "Module"
-    Load "fbdevhw"
-    Load "fb"
-    Load "shadow"
-    Load "shadowfb"
-    Load "int10"
-    Load "vbe"
-    Load "vgahw"
-    Load "glamoregl"
-EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index e07c204c74..4c442bc712 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -7,10 +7,6 @@ PR = "r33"
 
 SRC_URI = "file://xorg.conf"
 
-SRC_URI_append_libc-musl = "\
-          file://10-preload-modules.conf \
-"
-
 S = "${WORKDIR}"
 
 CONFFILES_${PN} = "${sysconfdir}/X11/xorg.conf"
@@ -25,7 +21,3 @@ do_install () {
 		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
 }
-
-do_install_append_libc-musl () {
-	install -Dm 0644 ${WORKDIR}/10-preload-modules.conf ${D}/${sysconfdir}/X11/xorg.conf.d/10-preload-modules.conf
-}
-- 
2.12.0


