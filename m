Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 784DA6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b9so11614542wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rQJiCFmtE3vynizDlgpJ3F+C4ARf+jClkAlqFA0yX0I=;
	b=Y/UiuOnzU/N0uanfEaj++Zst+zhb5jRtFWkKkmthas0sxHdiNOw84ivR2Gagvuo7Y7
	v7M7gN/iufVcT79USfKvzZJzDeQzwf8u5XubfOsPzSvjJJEE2UTjTWwIqJ95pJarKWQU
	/7qzVUTdjVhWwWDJPjsNvjTwNM5ammmOvqcG68JnJ9QRv3rtvE0PCflp3FeIpe7pZWRT
	+hLScbMoFVnTNTUEMwZHNodZsW6cXWd1EPXxDjmvOgNyeuxSmJz22bOsf8H3Mo5RwD6Y
	vvcNWo2tzY0pvd3GnnuNHZURpAsJr+XtUamroGKGsMNHmSVF4T/5nwf6IUAHvE/7/H4U
	Fu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rQJiCFmtE3vynizDlgpJ3F+C4ARf+jClkAlqFA0yX0I=;
	b=Jw9fN+nojlXenfTXjIjjRdi0/R2WkNuS+2bJ9BVsxo0H9QD8OFhUqVCe6aC/2xUZWC
	j5TZZxcOLNRWVh1wGRVHdpFn7hW0X8EVscsrurSDhqbWauZnXN8le3BWR+k6Njn/SeGK
	WFZ3lWPmTTenrTzVBiZmMOdGRNP0NgLmkut4w4gD5Pk9yTqjWjpePd02GfvrazraPLEH
	JIRqQM8C46F5fdFIFwqOkeoOaBDCF2W7wXs16aJl6aKY9w2KmxOBbxTGdrRmfBo53QrX
	+VLjQxed59bqCTT9lg8JqRZ9Cq/lKKVU0rQ2NkwlokXjDSHq+pnCd4AEjxyorOmoVLMq
	b+gg==
X-Gm-Message-State: APjAAAUoerAXyWmCge0Wg8Dd/QiZx+TyL8GufKLVbOoW3vf1Ze57HVow
	KIuKYymEJbqcRDKgCs6Bpa7KUlxc
X-Google-Smtp-Source: APXvYqzRU77F7pWN44zGi3jYLgiq+yNzpkDELasYyytyImLiet+OpOicL6tpwV8UPZx1n3YuBJHtVw==
X-Received: by 2002:a5d:66c7:: with SMTP id k7mr12531595wrw.210.1570794487963; 
	Fri, 11 Oct 2019 04:48:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:43 +0200
Message-Id: <20191011114754.91740-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/19] epiphany: upgrade 3.32.4 -> 3.34.1
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.32.4.bb => epiphany_3.34.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.32.4.bb => epiphany_3.34.1.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.32.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
index 44af469942b..f5f086391e5 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
@@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "6a5eada8a3870ab4d0fcd5168559776f"
-SRC_URI[archive.sha256sum] = "c9a828578301af77ac9f3d3ce253b02f9f3a1561840cc8d74dd5645f92d0a995"
+SRC_URI[archive.md5sum] = "50b50e18d99b19f44cc9cd419c6a4ba8"
+SRC_URI[archive.sha256sum] = "a07bc997ad2cbf14d58557bb0b63e92d8c33683680c5e50ea6f9b53b36bec1d9"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.17.1


