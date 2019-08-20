Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2621F7ECA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:35 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id k2so12866166wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5frn8ZoY026V3xwRZq7flUQgF0nsm5wzJ5Rm1UzmAHI=;
	b=T+z/71Muh54PK2c1H1ASFEiTZIGqbPKKIN/o2WNc5pqJytKUhWDG9OR+QVl4Uokr5w
	Gdu9GhbNYKdxIjzgx+yCfP/obgeZDGgjJELeerf+kogwOZC2w0T62ZlNWoKL73lbVTEh
	2gCbia4YwUiCgJ75SeS5vuZ0DllJUxiOoyWroU/sSu9NoClyKTT5EEJE+YTbHchy8Yat
	AWuVThGm2AfdZDLrHlFUARKr8brHmxV9iKOfPjtUnClprjGmvYMKUN3rrbCBxWGsUGgJ
	VnYvOKu23jHLzkoCwJhuHynAJYgIBvZgEjXwAMz8VoIc12LyMISyobZRvWSGK2qaMm6J
	Im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5frn8ZoY026V3xwRZq7flUQgF0nsm5wzJ5Rm1UzmAHI=;
	b=GppMtzHeWPU5eGy0Z9KwxHBkpxUY8wXem+cZUiPDRWQ8W6LP5H534julgHzrDpvdrj
	ILeG6m9u4jEOLA7+Eo2zvJwUUaGnpkVn1qVhBKKe2/N5B0p1MzZSOb2vJNwtVRp4jiPc
	N3HCSfrCxwo2TjPjjgH6LQACjD2RGCzGWygmRgaR0uLLzM9fyNn+fy5ni0WFmMW1zpSQ
	gesltOpw7GHMu+x2RtTW34pjl4beTP/2WrWwj+Gmh3KKfCnGkbQtfK2j+ljV1+LVzeMx
	nbClsLxTR9QO4pIaI9IROntAtwQkdcUsoB90aDACJ4b8NT1ohWtEuOBsnZ4PeZ1ddV6D
	u/dQ==
X-Gm-Message-State: APjAAAU7Tsi/ux4nGVGwjqBTWohy8juCvCPIdUu3q0G4PtEqJ/YjX9Q8
	MAiNSueXqcFaiJFAepPSwogLxx2QKik=
X-Google-Smtp-Source: APXvYqwwl1lJSCwYBGeFEx/gb/nUrPQmlnvCI61iW0SRohBldyJrKR5xA06jYN0qiN6Hjg5LPtCDBQ==
X-Received: by 2002:a5d:4644:: with SMTP id j4mr34249006wrs.146.1566315155669; 
	Tue, 20 Aug 2019 08:32:35 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:19 +0200
Message-Id: <20190820153219.62435-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/12] epiphany: upgrade 3.32.3 -> 3.32.4
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:35 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.32.3.bb => epiphany_3.32.4.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.32.3.bb => epiphany_3.32.4.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.4.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.32.4.bb
index de1b6e2f84f..44af469942b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.4.bb
@@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"
-SRC_URI[archive.sha256sum] = "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"
+SRC_URI[archive.md5sum] = "6a5eada8a3870ab4d0fcd5168559776f"
+SRC_URI[archive.sha256sum] = "c9a828578301af77ac9f3d3ce253b02f9f3a1561840cc8d74dd5645f92d0a995"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.17.1


