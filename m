Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1U-0004v2-10
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:48 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FwurZ7UxKRfKTyJfBUDYPSwizJfQ/1RODAjSuAyCDlM=;
	b=p8sEdOAKUKETz7IT2qqILCpUAPHJuKZEVaOepa5f59jxsJyMqKwH+PAjLBOsjosG67
	sXtDAHjIxDdE0BEkoDJJIP0akMDR2csXjEZcdixQY6s2ScDYutxG/9EcFBtOHvHBpV2M
	SF+aK05swh4qNHA0Rmtch5Mitr+EhV8kIjrug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ixl72c7cU58+b1dHQ8QhdQxEPzSwSet4t13QfJ17Ak7QZ/DHv0bxZZmunxwpSuqdH/
	8WuRmo4E87qrlKnbueT1UJ/2iPQ/LoIarnhvnPEzqvqY6vPwxKrPEFXbb+gEdzOiBTOP
	Svm5EKjMWgsGiYhE/OyamifVQ1XAbGppYw/JQ=
Received: by 10.42.148.202 with SMTP id s10mr4576327icv.45.1301632189321;
	Thu, 31 Mar 2011 21:29:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o3sm1179467ibd.44.2011.03.31.21.29.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:40 -0700
Message-Id: <89bd2dfb441de55bbac4e7588ba4ef4ffde35913.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 28/46] xorg-lib: inherit gettext class instead of adding gettext to DEPENDS directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:34:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb     |    2 +-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb   |    2 --
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb     |    1 -
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
index 79078ef..c96b6e9 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
@@ -9,7 +9,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7908e342491198401321cec1956807ec"
 
-DEPENDS += " xproto gettext"
+DEPENDS += " xproto"
 PROVIDES = "xau"
 
 PR = "r0"
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
index d897dab..8ac8e38 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
@@ -17,8 +17,6 @@ PROVIDES = "xdmcp"
 PR = "r0"
 PE = "1"
 
-DEPENDS += "gettext"
-
 XORG_PN = "libXdmcp"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 4ed8c86..9b4ce1e 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -11,6 +11,6 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 EXTRA_OECONF = "--enable-malloc0returnsnull"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
index 335f020..28617ce 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
@@ -16,7 +16,6 @@ PE = "1"
 PR = "r0"
 
 RDEPENDS_${PN}-dev = ""
-DEPENDS += "gettext"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.4.1



