Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B01357FA30
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 20:32:35 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z193so8666070iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 12:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cUl5yOSlOt7vhF0YNejVXZfr9LI0+xzELCJpqQL3oKk=;
	b=KhK7SnDL9jpdVL5TSugmKMv1HvTqTQJPh4CIlt0hn5k4YCzpnTN2qDNjRJpZ1mvQ/P
	4bHAcyCYJGhLkaHOLdvtDMY3fApXlZPtNdFue4Ho4WYjW5Y2h1H3yQb354Pj0uYjJBuK
	Blw//riynVNqKexlCcVdV8Wv4bjfCqJYwu/cgkDtZ1eJNNybvAoptrPpYWVH2B3O7L3V
	JhRo7DGWSVwA2pzvvJslNosc6UFzR5XuFPDEFcOCxTRE9JNCWHjdw0bcC8+6Clzw1t0I
	YueWjp29hTGpBcX84hlvCiiR+nE4CtZmWej0Pcot9NHWeQ7H4sbEx9QNHoZLNpLJxZGG
	skKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cUl5yOSlOt7vhF0YNejVXZfr9LI0+xzELCJpqQL3oKk=;
	b=M/7fZvHwWpH13mCZGl7PPc8p+PlfhqmNuft3NjC5Y3ZXuqq/OF/yppg4jsyWTTeJrw
	HuvxzHLL23XHN/Qj2ufxxPH7eupurIo+W99RJZBdHmMv4MEtgVA8QNF8ZZB7KsDbLj7L
	aSJDbQBZiAWffg2Y1DD6pLQaNeGbYSoJDf7losEc8vXk3wzVEjBifoC5sh5aw1zlP4fc
	oMZvfC1rp6pAU+TPXlFzwfxIGBFQp9bVUYejahCCfhSGF2AOJ+9MyWc4B+WKaUYdEP91
	mLRXBsLG6dvhX/q3MdBV/n8WtcHqdEjMS6pPn0h4u+RIpoxF/rCdIBz5AIJfdcOIUsa0
	IRrA==
X-Gm-Message-State: APjAAAWutWPLmAaLxyednQU5Mn+Gw0MypyA0LAwe9NQRk0GgTIjfxSz4
	X+K0gDecRR9Kb3+Z3CQLQYKnsPqINcM=
X-Google-Smtp-Source: APXvYqzKNFevPzn7F8QVAPKME27CZxa3rvqm8KRqo7FXoDjWJFO1Q3At+dMaN/5YrD1AzObJPd5vyw==
X-Received: by 2002:a02:820f:: with SMTP id o15mr4350590jag.19.1575664356068; 
	Fri, 06 Dec 2019 12:32:36 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	y11sm4216261ilp.46.2019.12.06.12.32.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 12:32:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 14:32:29 -0600
Message-Id: <20191206203229.1510889-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] wayland: Add PACKAGECONFIG for dtd-validation
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
X-List-Received-Date: Fri, 06 Dec 2019 20:32:35 -0000
Content-Transfer-Encoding: 8bit

Adds the option to disable DTD validation when building wayland-scanner,
which makes libxml2 optional.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/wayland/wayland_1.17.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.17.0.bb b/meta/recipes-graphics/wayland/wayland_1.17.0.bb
index 2b5a8f94540..12916a0c40f 100644
--- a/meta/recipes-graphics/wayland/wayland_1.17.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.17.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
-DEPENDS = "expat libxml2 libffi wayland-native"
+DEPENDS = "expat libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 	   file://fixpathinpcfiles.patch \
@@ -24,6 +24,9 @@ UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
 inherit autotools pkgconfig
 
+PACKAGECONFIG ??= "dtd-validation"
+PACKAGECONFIG[dtd-validation] = "--enable-dtd-validation,--disable-dtd-validation,libxml2,,"
+
 EXTRA_OECONF = "--disable-documentation --with-host-scanner"
 EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
-- 
2.23.0


