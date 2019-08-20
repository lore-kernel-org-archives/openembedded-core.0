Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5917ECB9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j16so12853452wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XY6wa1GMJZ7ujs26QRulR5KAXbCPGzDnNvK4z/m2gXI=;
	b=fpcl06w1cFX5UiKf4bA6tfBmxhUTQ43nDnuV6XbQInkFtKPGsbooBwJ2G1SnfzFOMa
	+hzyv2v/oChSzWvVY0agSfY8iLs1qFXwkXnarBTf0moQ9/qv48W59FkA4Pq9u0qzc1vs
	p6BanYzc5xeUdRTM6sZm73ARTH+dwPT43tKQiqgkWbSFzH49ZwzYCCUI8ZRuIRCYyFfF
	fYQdOaxB+Oa6lswGMKQGNhaw9XFtzbmg/9hZi3tJT6byGfBG87EoAyVARhzUHqcLWoD3
	eUSEGYYAO5yx+YSPZ/fPB3iE5g5JYGSBPNU1vtZsC9LOqZLkUQEBiWcs6QEAyNb5qVMp
	CxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XY6wa1GMJZ7ujs26QRulR5KAXbCPGzDnNvK4z/m2gXI=;
	b=ptDhJDrcJ1B0Z9REtjBabgUXUkU1J0P0EQ18TvPECuiCfUe3Y66otdwlh20Dlphm7h
	K1gEkgt1RBd87+9/hSktTND/Y69xKxyKmTaRLgQONqw55GA7dM/b6iHjWrptgKsiwYcc
	2dRRpJm+j0ueN7rRxV07KYxGvatJyrxDoX5jzWO9qVmmQ+jQa81AfywK6rr5kA+MaAcC
	ATDB6uTKIzuappKZSu2XDya7S1y6yDUxdMHffU/7feOhh6az5DgOfUgwOR1+yw0YAnRH
	5ueHljIwOKMLQpfxjQqZ6D5ugtnY3O4vnByUsjiJDcLiJfWr8V6zUAcFzDYCJZuchSoB
	de1g==
X-Gm-Message-State: APjAAAVJnI74or5DZ3kWDXK8LtXU3UGmY6QZ1wijEG0BNIohGKP0b5UX
	hAyH9lvecvWCbhvgqhDJb/MOs7/FUEA=
X-Google-Smtp-Source: APXvYqxz/ZhKHGGOGgZAFVHZIrr7f+gtcVFBbLpdnDfPvmZ+ziuFwNb6Y/sjeXKf6iGbFhPgkCA1Tw==
X-Received: by 2002:adf:e887:: with SMTP id d7mr34803548wrm.282.1566315151846; 
	Tue, 20 Aug 2019 08:32:31 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:14 +0200
Message-Id: <20190820153219.62435-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/12] createrepo-c: upgrade 0.14.3 -> 0.15.0
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:32 -0000

Disable delta-rpm, which oe-core does not use.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.14.3.bb => createrepo-c_0.15.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.14.3.bb => createrepo-c_0.15.0.bb} (91%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
similarity index 91%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.14.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
index 22b9f3d3b14..ae0a35da847 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "de9d8337885d953baae501cce75decc11d5468dd"
+SRCREV = "2077ba104eae04bb819e9e0c906c8c835b62e7a6"
 
 S = "${WORKDIR}/git"
 
@@ -17,7 +17,7 @@ DEPENDS_append_class-native = " file-replacement-native"
 
 inherit cmake pkgconfig bash-completion distutils3-base
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF -DENABLE_DRPM=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


