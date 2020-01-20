Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3F17FCCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so156370wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dO/nkFAvGO26B+ncQWnsFeY0tFYGlRP7pAj/nuxOHtw=;
	b=lIFA+bVadk9wLsGbkOhQJtNjEFfqpZt+zuUN61mGQBGW0eNODf7fhlb8N7hSOHs0vT
	iy23/cQencvHyNz7KKeDl2IaBeIXkcWavWwqK4oZdW/3eEjqO8n0ptDBZA0z1DSTvase
	TECgkBZUtqdIVOVRPvRAMkZolCrXVvh0qBEL+IVI+Bn9XdJFF8nYgiLrgVtf7QTTMQM/
	v3sKgTV2/lHaqotwAKKECWYWGTaLVipcmbBO4sKzGbG/xxtXbP6FxoLDgMcY+FfvnY8i
	70AEsqfirESknzOMwCEmFC681GBwiJgRRxiM0UicZqcjtw+Co4IqhPJ+r080pmFtZaWU
	T18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dO/nkFAvGO26B+ncQWnsFeY0tFYGlRP7pAj/nuxOHtw=;
	b=b/yklckXNAIcbHwUdm3ofhUW2ma1tZ0k43tteiJixsYfKF2C7XmCZVqq5Dol16B6DR
	moVfMysds+V+736gcOK/5B81nO7AF3jpxNWU3B0Xr+VfSSFQikRi2mQE1gCgy/TxW9CS
	uH9qi5jaknGpVyoVe4gyz53wyvWhfvoCyVSIag0IMYJDKfi4+1khp8mS0DEeuHC7LOol
	ZadhS4rljrY1s9IQOY0PzOvUc3iYLhCRV5lcpqt/psmYNKZ6LQx59Bo4wJqOSocCfeGk
	uF7TipNkn41+FjA/KleduBtzqwdFTj+8w2jy77qf3tDRGJAAHYHj+YOjvFMO+v6I4RkH
	IKRg==
X-Gm-Message-State: APjAAAW7/oUklbBFyJG5hhgtb/74tUG+l2/GLOgWtgZb/1KByuDZkGNS
	fXQdkKl/6DQDZ4Vn6+Xa5aqBM51i
X-Google-Smtp-Source: APXvYqwliGectgAfs/Yf+eEKmY3gbejo5hrWvRGhF9oU7QKtAzbQTmnsV0l/D/5fAMDpG61r2q5zMQ==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr348555wmc.57.1579541141785;
	Mon, 20 Jan 2020 09:25:41 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:06 +0100
Message-Id: <20200120172510.22648-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/24] epiphany: upgrade 3.34.2 -> 3.34.3.1
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:41 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.34.2.bb => epiphany_3.34.3.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.34.2.bb => epiphany_3.34.3.1.bb} (85%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.3.1.bb
similarity index 85%
rename from meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.34.3.1.bb
index c6105b97066..7e1573348e2 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.3.1.bb
@@ -14,8 +14,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "ae404e3a70ff904f5a23466727f8a90a"
-SRC_URI[archive.sha256sum] = "0eaa36fc7b73a23121a23b8a7ad3c18edaf5a8a6b7cdd6d630ba5b71d946a4a1"
+SRC_URI[archive.md5sum] = "c8010e7ef1b0fd2da1e613e17445062a"
+SRC_URI[archive.sha256sum] = "00e479fba108f44b1830370780b98116d87fc277eb1a4eed8e229dcdf04aea6d"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.17.1


