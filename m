Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 206C57F97E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:11:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s1so16836012wro.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pjtGxMEIJgH8wk7zB7rbmMHYkA7nIq4Z7Wx40WUB1x4=;
	b=GFoY2ER4WrtDkhy3QYh5jUUZPGECu9re29NfyhqTrsq06786Fuerw5C7wXT1SnLRc9
	dYasQeoLNLsSBwzZMjYhsiwNE1lzsKyCZ90K1hK/Lbt1UM5Aqg7FgHQQs3jGW06V4UUS
	EvfO5xvGuR5B7zjcFzM7KT/20ciSDfrQ8R/3WDq/bTtY9PqzQB2jPbWlWixOTtlHGpPp
	Bqy8oe1eGZwdR/HiGH9XG7l+i8ntFOxMf/FOP1lX89ep/W+ZaCWhnBjpUBguOtoN3mjV
	8hKlASJSVcRMPzgfS4qIR38FOz0INc1ySr8MDPcuDN6yi1tdVdsOTmPyvCJZ45HGQGEV
	3xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pjtGxMEIJgH8wk7zB7rbmMHYkA7nIq4Z7Wx40WUB1x4=;
	b=SoPVtVMTyBosCqLdRvJGS6xHvjORCRGzVagLtb4mgHq0eeeE4/ehNtDy8ykLFn2h5u
	iGH4wXpBwJ/QtjvmO8gbEQ+qaQzxrkiGu17OoVqjA+w5IU2qLw5Z0iNif02WDW+GCK4U
	+h9kT+gZOzZO/9Dd/mb0wQ/AvbrBx/VjPX1m/qYiBVyKE3zblAedk7nfHU74eL2s5pRa
	avnFYhnS2+gaed+Y8JAD7RyTgrpQiTOwLktzqrX2diaZnSxwwg3ZNil8agtDOQz/3Oko
	NmyNbKJ5HKyCd5CMdO86jZLfAsVriEKkss/oTwbKn5OJR9xvhEjWDUEyAqOrgZTHWVki
	JDkA==
X-Gm-Message-State: APjAAAV1mxyRwMTyU/sw48/C0Jt6UrbYjf1Cvjsy3UKWL1EwPicPJUKS
	f8+YclOPFu29iX2r8Azd0x/rhxuESGA=
X-Google-Smtp-Source: APXvYqypCg16LQ5za4t5GpF/Gur1ly9/AqRNk7y56tsSnvgpVq/m2zj4MJxFJEIbTuwp0vvoPgXEhA==
X-Received: by 2002:adf:ea83:: with SMTP id s3mr3320846wrm.43.1571915495475;
	Thu, 24 Oct 2019 04:11:35 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v81sm1073024wmg.4.2019.10.24.04.11.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 04:11:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 13:11:24 +0200
Message-Id: <20191024111126.41198-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024111126.41198-1-alex.kanavin@gmail.com>
References: <20191024111126.41198-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] gcr: update to 3.34.0
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
X-List-Received-Date: Thu, 24 Oct 2019 11:11:35 -0000

inherit gettext, as gcr is now gettextized.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gcr/{gcr_3.28.1.bb => gcr_3.34.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr_3.28.1.bb => gcr_3.34.0.bb} (81%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
similarity index 81%
rename from meta/recipes-gnome/gcr/gcr_3.28.1.bb
rename to meta/recipes-gnome/gcr/gcr_3.34.0.bb
index 2299199c31f..c5593904947 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
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


