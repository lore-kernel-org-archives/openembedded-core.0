Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 930B1613C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m16so1941884wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4IUMTA3wGUHok2SFsNPciKOV2Z5p6xc0HtmLQJLAt1U=;
	b=RSvesELTQ2Hslp8m5g6T7LcWSioTPJnkP0eHY4YPCP2vFlrfeBLwsY5hVNhlEti5DV
	aQZNAaqJFIaGPr3TLTlxYxwfOZhHhsCpC5/ue1wTVFCM2idrKsG1ojBfhIi1bxgNyZYN
	alNncWK/ARGHGkcwepkkYjvc52ZwSBeSdr7EMssoO+8id60/QgPrap3odk4vzmO2WDcr
	sE0nylDikSjdY5BCLGRDUNcsByV++OifKs/r/9cI51zHfr4LYHaU/UxGN9KIv1KWGM0K
	kK1h/caRdgaDIkwYqGTMBseP/HCzy6CbgiEwtnF266IYGcCMrv/kouTvMOf0LC1caQCG
	740g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4IUMTA3wGUHok2SFsNPciKOV2Z5p6xc0HtmLQJLAt1U=;
	b=CkXW691Ra/jCpavmcJH7/GTSN44dXtP3noEimwfJjSlUZBum9Cqz0KgDG8K9hX5IJc
	pMCAIkLXWFWEIh4gr2YAP8t2wpwA2laVv8qUS8Zj+mYV9ZS3shSKWKChEqHciHFw0iJ7
	qhj6nI54BH4TptxfSZeazKtIIZsIsurnadtCjuHk0HDioJ93RhfciK2seuKgvF+7K3cY
	yQUnb2ciI3aHyyIicSVPdW4IChri4465T8PolAFrDH9Y6goOSQTdj09SlsHhWm2DPBgx
	h4e+78XwhIxVP8jKI+iiDUiZ/7NW+iIDdUz2Vi1KqACmDLbR5yIGN4Gzhf9R9dUCRRq4
	+TwQ==
X-Gm-Message-State: APjAAAXN9JvSlxSzCtTwp5fTRnGlIyOs8xRfrvQAdGX8q9MatWnStk+U
	WbjERIfAsNZgz5D7VcTwFN6sVI37
X-Google-Smtp-Source: APXvYqzo/DLt6URrXtXJ2b3VQo2WxHB3E2f6fOIDOAyNe8hPO/gGRseYEvL7Fv/Kjh5cBzdRVAB42g==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr39637842wru.55.1582141703064; 
	Wed, 19 Feb 2020 11:48:23 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:47 +0100
Message-Id: <20200219194752.7967-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] epiphany: upgrade 3.34.3.1 -> 3.34.4
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.34.3.1.bb => epiphany_3.34.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.34.3.1.bb => epiphany_3.34.4.bb} (85%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.3.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
similarity index 85%
rename from meta/recipes-gnome/epiphany/epiphany_3.34.3.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
index 7e1573348e..ddb4c2794f 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.3.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
@@ -14,8 +14,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "c8010e7ef1b0fd2da1e613e17445062a"
-SRC_URI[archive.sha256sum] = "00e479fba108f44b1830370780b98116d87fc277eb1a4eed8e229dcdf04aea6d"
+SRC_URI[archive.md5sum] = "a559f164bb7d6cbeceb348648076830b"
+SRC_URI[archive.sha256sum] = "60e190fc07ec7e33472e60c7e633e04004f7e277a0ffc5e9cd413706881e598d"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.25.0


