Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 30468621CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 15:43:44 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id l18so638339wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 08:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=W1dGcj5U+XqzVq8WKd2wzcw5DZJfo1M6OZq7LV4pIes=;
	b=d74oVuGzqWfZMDCgtUkbQdhgVlZ7qf2EVIw26yBA0qg5Pa039+Pas3/NGPLH3Qx3QO
	zowE2CZSdGu6hxzwWVVuUQBVCe3WHKvxZ2yzKiUFWN9EF//I92pa+ruRVZi3RvhbOWhA
	/AkAnmtGAlWDI2UO1C50Gdyaqeu5wryrColcrRnAbIwlxoQPsObY0xjNVkNkKEbBOnk6
	O1/OVnyQ+ebdPTATiQGehSUGr2rDBuvtyyDpmceP8+K48Q6gjVS3/RG+WWdkuiTlqXHT
	XcBbaIk0uXCaA4+vXB56SGjqgkyENX+wkBs8wenjXKbGNUEwTXWdm+APTGD0zULOPlXJ
	LKNQ==
X-Received: by 10.195.12.18 with SMTP id em18mr1781066wjd.78.1371224624297;
	Fri, 14 Jun 2013 08:43:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id en3sm4049135wid.1.2013.06.14.08.43.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 08:43:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2013 16:40:18 +0100
Message-Id: <1371224418-11163-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQk1nuithlQH5mtoes1BMvhaw0bexBNtiLMKUkgVFg1kLxDBnNVvO+gay155B5UBCqVsxpVf
Subject: [PATCH] atk: inherit gnomebase
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
X-List-Received-Date: Fri, 14 Jun 2013 15:43:44 -0000

This recipe was missing a dependency on gnome-common, so lets just inherit
gnomebase and get both it and GNOME SRC_URI handling for free.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/atk_2.8.0.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/atk/atk_2.8.0.bb b/meta/recipes-support/atk/atk_2.8.0.bb
index a190c0a..cfe2f58 100644
--- a/meta/recipes-support/atk/atk_2.8.0.bb
+++ b/meta/recipes-support/atk/atk_2.8.0.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
-inherit autotools gtk-doc pkgconfig
+inherit gnome gtk-doc
 
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "c652bd25530825d604dae1c1ebd2da02"
 SRC_URI[sha256sum] = "b22519176226f3e07cf6d932b77852e6b6be4780977770704b32d0f4e0686df4"
 
-- 
1.7.10.4


