Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SObo1-0007Wc-0B
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 23:37:21 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1643831wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QvqFN/ItQ44omKe/hpMohP3Nz5mrWPzbYbtis5gC4sk=;
	b=ai8DE3HyF5l2WKkncDOMpv7jlVCLfCVP2I49cVprfjSd0b+5zYUlFFm3oKtl9vNAWr
	0uM6VTXYvzYioHtFNiyfxTWQf4scvJBNLXZG5IR0Y15Ft52gbuvljGrOUqdd02J8845/
	SVZGWEz9TgsUu1h022ul5oeaKivnjAPvSfmb7wBdFxxg17xsP47HH4wizV/MT09z+ors
	qO1FzyGO2jkJDT6Bib/ro0/fQLa6sJfZ1k4kFxQ7mlJ4IiQ5LfpLBooxXNG5QNHa5YAL
	SyQ7EGFPJbj1HrVUrlTykz/UgKwSmko8vdp1UmE2tPMN262Ktt4efVwoUGQZC9zu0zVk
	uD8w==
Received: by 10.180.107.104 with SMTP id hb8mr23177749wib.8.1335734861942;
	Sun, 29 Apr 2012 14:27:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm37421483wib.9.2012.04.29.14.27.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 14:27:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2012 23:27:18 +0200
Message-Id: <12d42a70cbaedfe0e3e63bcfa93e962fc54ed9bf.1335734193.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335734193.git.Martin.Jansa@gmail.com>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335734193.git.Martin.Jansa@gmail.com>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] libsoup-2.4: upgrade to 2.38.1
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
X-List-Received-Date: Sun, 29 Apr 2012 21:37:21 -0000

* newer webkit-efl needs 2.37.4 or newer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} (55%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
similarity index 55%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
index 8e6ef26..c04918e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
@@ -6,14 +6,14 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
-PR = "r1"
 
 DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/2.36/libsoup-${PV}.tar.bz2"
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9c03fc033da61deaf5b403e9e9c884b8"
-SRC_URI[sha256sum] = "c387eefd8214c458965b1d6e3490cea33b5bb6c81798cac90cde96136dc19401"
+SRC_URI[md5sum] = "d13fb4968acea24c26b83268a308f580"
+SRC_URI[sha256sum] = "71b8923fc7a5fef9abc5420f7f3d666fdb589f43a8c50892d584d58b3c513f9a"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.8.6



