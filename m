Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A1E6D7F8CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:37:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n1so5417125wra.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eeSVwD4mUbFJANOXUnuJSySWyq9jGlW1nL55HcNPwLU=;
	b=GABUIm5OGY5MYTJYskzQx4/aJV5kqiNlNSDXk9tOKijVyB7YeZxgm6xJmlrdvPYKJs
	hiKsq7CqAQlM5cOFb0JIzdQDlciDdHK+iJ7RYmXcJ55wqZnFd+ov+7t0Wz5QtHAmIzgv
	vM5ThVRk6iEwF2axcJe5IU90lgMEZF9RuUa746rw8OjWutB+Dtpd7iiLAtBUENYIbzDb
	ylWw21DS4Ooc2sPrZFD6KD7mUlCn3iXJBX+gPRii9+PsjrLHjC1vT+ATyXLbmRwHjGit
	Uz7nRV2DB6wfboXhoRytO60HHyooKRBERVAcioKjFDzYDPuNRsjBV7TK/mGjqNIwCchy
	sSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eeSVwD4mUbFJANOXUnuJSySWyq9jGlW1nL55HcNPwLU=;
	b=aRCkz31gmGL0UXEJkXl4Q+/z2X/Ke74nB0SjQhv8PnBrTL4W3RyDr68JHTfqZCFGGT
	fiQj9BMioeS7u7xvt9JoXR/afREYV7yDF5Uz93J5/A/GLrwKCsd6YM9zTTsh6cjchOlO
	1PKpELp84CvX3CHUQ8lvQ1R0DNBYpMJ707kiVgLFuD6nROCLmTv26NwxtsvQ55vxj3G0
	djcjz7jy3AUEeoG0I1vBaoyjhxP11tGrGBorD1g5YW3KR7K+nvHggP2pXRspvSHn0q85
	qwRjXtWqGXYeO8jlYtjp2ckLnC3pVMNH4cRm+Ohfz7SX2rr/WDNnRRH67q5+drULULKg
	GRGw==
X-Gm-Message-State: APjAAAXoRLLhqyx1B1ugH51nRjSaKHML2WSB1Avav01UTz3FBuQvi9ax
	rOc018Jl93n9ZLJF0k4fk4Wd/AKUpP0=
X-Google-Smtp-Source: APXvYqyfVrdG2gooYZXNJFArlyf0WXLjmuOl5BZ9QhMv49EGImxVLd1PU5B2Ko8lyhMWBgg1Eb8iCw==
X-Received: by 2002:adf:f989:: with SMTP id f9mr4514055wrr.163.1572514628135; 
	Thu, 31 Oct 2019 02:37:08 -0700 (PDT)
Received: from localhost.localdomain ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	b186sm2950263wmb.21.2019.10.31.02.37.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 02:37:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:36:53 +0100
Message-Id: <20191031093655.14852-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031093655.14852-1-alex.kanavin@gmail.com>
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/6] gcr: update to 3.34.0
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
X-List-Received-Date: Thu, 31 Oct 2019 09:37:08 -0000

inherit gettext, as gcr is now gettextized.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gcr/{gcr_3.28.1.bb => gcr_3.34.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr_3.28.1.bb => gcr_3.34.0.bb} (83%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
similarity index 83%
rename from meta/recipes-gnome/gcr/gcr_3.28.1.bb
rename to meta/recipes-gnome/gcr/gcr_3.34.0.bb
index 0a9867451ee..f13bfecbe19 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
-inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
+inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection gettext
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "afd88cacfd54c1ac5b3e0eb35e3aa674"
-SRC_URI[archive.sha256sum] = "95204aa2111c301778ebfbe60975ce3ed698c958430ffcc2a785ac5e593d168b"
+SRC_URI[archive.md5sum] = "4af28919fb1dd36d93603e8230283b6f"
+SRC_URI[archive.sha256sum] = "29df50974a90987af694c0fb8926a6b366e68cacd8abd813817cfe1eb5d54524"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.17.1


