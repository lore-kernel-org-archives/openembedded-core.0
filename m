Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id C0E0B70031
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 01:27:38 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id cf3so8909248pad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 18:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pKxVhq1nouLrFQZ12d02B8OhSOMnhksTL71MjLYcvH8=;
	b=gYj4diS2YF1kDlkcubENG7PwFB9gO/gkPbYiU7Eta9J0Us6zmG2zK/EvEhgQQLJHYJ
	pfqMw3iUjLWyvmSlM5EkYo4kuSkAbxGKsNU/ydIGwmDfzsz4Eor4VhUKJU+at6xhTsks
	sMoHJZOfXt0DZ+TseAT6sS/0biv52rky7fB6WLqmS1qAK6kSNbNselGD9nvCXfAsAyJ7
	pp9qlmrihAvEJeZng72nLvn9ZFjoLpa53rw/is8eN5M/VZc9bvB48TVUxbQgF0amQJJd
	MPVkj9XXm+wH1s7DXIqi6sPBakPSco5ZAb5Ji8/32dbaWAu5t4abSgIUcro+19qYEobu
	xveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pKxVhq1nouLrFQZ12d02B8OhSOMnhksTL71MjLYcvH8=;
	b=LMyQ/eTPwLit3HXShvdmyaZTlmtnxpWkFjX6e5pX+3OjwpZ5Nij+0TP9e+raDAWLmd
	sixT7Zd4yuK47LSYO8dhQfczP2P89ItgNd3nVLRcX2wpDyzwpDxL9obsegblzT1qSQXu
	oyQOh0G0BjjFyZfHcxkVlupVoOA03Zsq424mcN+s0c1KG5MxqbNITYMmE33MRYIICQOc
	7XFx276DGdnNj+hQF+z9CCyuP+FxnBNWAZ974yLNiSnR35L0NOiO413THL8xoKoFkES8
	5sO3AuGyt4WmT2o/IeLE9/iPNIANT0Ms0edO05zU444oS5eL2gbEcQYevxkWNfi4R+m+
	I5Kw==
X-Gm-Message-State: AEkoousfri3MBs2hxuPd6xhpTKhxZm8pZTdOdNsWumBmfJ7WaEBhqytPswqWSv2OWW6c7Q==
X-Received: by 10.66.221.229 with SMTP id qh5mr47438444pac.66.1471915659406;
	Mon, 22 Aug 2016 18:27:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id yv9sm598220pab.0.2016.08.22.18.27.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Aug 2016 18:27:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 18:27:31 -0700
Message-Id: <20160823012731.22993-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] gcc: Update to final 6.2.0 release
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
X-List-Received-Date: Tue, 23 Aug 2016 01:27:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.2.inc | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.2.inc
index f42f5ea..b118995 100644
--- a/meta/recipes-devtools/gcc/gcc-6.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.2.inc
@@ -4,11 +4,9 @@ require gcc-common.inc
 
 PV = "6.2.0"
 
-SNAP = "-RC-20160815"
-
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "6.1.1"
+BINV = "6.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.2:${FILE_DIRNAME}/gcc-6.2/backport:"
 
@@ -26,10 +24,10 @@ LIC_FILES_CHKSUM = "\
 "
 
 
-#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
 #SRCREV = "bd9a826d5448db11d29d2ec5884e7e679066f140"
 #BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
-BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
+#BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
 
 SRC_URI = "\
            ${BASEURI} \
@@ -84,10 +82,10 @@ SRC_URI = "\
 "
 BACKPORTS = ""
 
-SRC_URI[md5sum] = "9ef78bb894dfb38f567416eb67a68989"
-SRC_URI[sha256sum] = "0754995253eb0efc061264b1c4e99efcaee45489a8b940ac5d2fd52e6773f27e"
+SRC_URI[md5sum] = "9768625159663b300ae4de2f4745fcc4"
+SRC_URI[sha256sum] = "9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5"
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}${SNAP}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
-- 
2.9.3


