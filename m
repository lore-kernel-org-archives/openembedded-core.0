Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id B8D4E60F7F
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:18 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id y5so9577155pfb.11
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hBWhWhmQTPUifZT77diqpZX1Yu8Pq2cg+BlIC0EouAs=;
	b=Ab9nOG55j4lxn6Bjh6ru/r0m83YMiNC0TbKYPjLr4Yej/MuRkpEViq59sWNfEfBNIh
	w4yhEYVgzt5bfyvRLESN+lR9rJsgNlwSLhAB/Qm/RMUY74fP2InHJxgtZqKiCnPk2F41
	mmWi/Q1xFBoUIPgx5jCAqj5Cr+PPZzFgKsaRz4iatwTXKrYWo/7/i+eAqqiWFkDrpj8w
	DucHVUpjH3xJouSs6DO+C0mCuBG3yKKNFxGuWFg1mx8BORpNAOelSmKVPn+jg9rGuf0I
	TLjAtVPDcT59aM9nqKankfzxZjwU4NJNrfrfP9AkmBm+zyWZ0Vn9vmuWurPq+TpqPuLE
	2sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hBWhWhmQTPUifZT77diqpZX1Yu8Pq2cg+BlIC0EouAs=;
	b=mpzN3dRFyzvZB0bhcUrSHdcxywQ9jhcWM6b/TJV49zJ4NBAVBbZvqrnxB1QjnQQprY
	BFZj/R7XO7ho1hKzNxBuZHxZfvr7PEIjw0XjYjWl2sJLIXVl6D+q44zsLqBIbrg4/zLR
	b39OLxx16SLVetRtcMVmI3nzXZwCxqYny6rBMkRIW77jMuvsc9zAs+nUo5KZqg3ifNzX
	N3toZ9stKjz+OpvvQxh9D1UEYjiljtx5GaZYkzITEsiRBoGbheBpMIAhoNYHpit1rAfE
	c3jcDLDmSry53Y4SCD468gpTUr6DTlWKwSU4hQQeLO9Bo1geJUwSHbAXelrYv8GVcfk2
	kJ7A==
X-Gm-Message-State: APjAAAUoj9UZmamTmjSGsDEbxAqTuUpwQ0TLzcQC+m6DkbuHUkuitWyL
	fVlW9sX1a8H2jza4VkpnLr2xgGrv
X-Google-Smtp-Source: APXvYqwMPhlX01FoEpi8fwj1fVmxRMFymdqdHND9cqSgrHeT8WwxE0oqZMxHhRc0I5pxeJJ6OFHCsA==
X-Received: by 2002:a62:8308:: with SMTP id h8mr21537723pfe.180.1580828779178; 
	Tue, 04 Feb 2020 07:06:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.18
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:06 -0800
Message-Id: <1e0f2151ab9c30e104bcbd30e2c1d842a1ff4150.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580828664.git.akuster808@gmail.com>
References: <cover.1580828664.git.akuster808@gmail.com>
Subject: [zeus 6/8] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Tue, 04 Feb 2020 15:06:18 -0000

From: Sumit Garg <sumit.garg@linaro.org>

Some native tools dependency issues were seen while building with
external GCC tool-set rather than source GCC tool-set. While building
with source tool-set these dependencies were implicitly met which is not
the case with external tool-set. So explicitly state these native tools
dependencies.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/man-db/man-db_2.8.7.bb       | 2 +-
 meta/recipes-extended/psmisc/psmisc.inc            | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb b/meta/recipes-extended/man-db/man-db_2.8.7.bb
index 083b2374aa..0d73b03482 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
 SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
 SRC_URI[sha256sum] = "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd flex-native"
 RDEPENDS_${PN} += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 594a10cf22..6de5acb71b 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl gettext-native"
+DEPENDS = "ncurses virtual/libintl gettext-native xz-native"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 3529cb26ef..211e399cf0 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -12,6 +12,6 @@ INC_PR = "r8"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check gettext
 
 FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
-- 
2.17.1


