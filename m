Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2896A984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 12:21:39 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p60so5201450wes.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 05:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=iGHNaPiEzQu1xy0sxMuLNosxhArqL3rVbI0D6RoTmGM=;
	b=e2K5IAS4II8LbGGPvSsMZskZ7JLw3byZO+H9KGh/VaInXdBrwpvZLJzPrn7T0WQq+W
	ntuMgqZ9UZvbKQNrKVev4DADs9R27POqEi4r1ly3pl3C3U9aPdQcJp4uEAeVxT5OpI54
	rPw+7WpyMwVaV7tWCEjvftuRkmuZHjzgarMg05prACQdtpzzLL7ozI4mON5kYMDiuyt7
	TvrQC0/9vPjsKsf28KPvPIou1XEHVRWZxUDSZYDYh2DFxDx/VhrdzS3RXOD24wHrkwqI
	6HL5sXMpbFr8b6DfnXTKC9Yq4g3iSy2wlx2ovwESVTtvZDi6LS1l35PSsNGB61ZqBdf2
	tLqw==
X-Received: by 10.180.105.231 with SMTP id gp7mr4274844wib.23.1371039699794;
	Wed, 12 Jun 2013 05:21:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id en3sm24287327wid.1.2013.06.12.05.21.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 05:21:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 13:18:13 +0100
Message-Id: <1371039493-21547-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkbzQ2mh9sGqysxbgQVvHMNGe/KZZ9W+rfQD0m1J11voUKaTkrBrkqfb++/uVdqNHt4xJSI
Subject: [PATCH] at-spi2-core: add xtst dependency
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
X-List-Received-Date: Wed, 12 Jun 2013 12:21:39 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
index 29851bb..34cdcbb 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "93b57d5d56d15d1222ddf2386e2f869f"
 SRC_URI[sha256sum] = "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f7403c96a10a481c458"
 
-DEPENDS = "dbus glib-2.0 virtual/libx11 libxi"
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
 
 inherit autotools gtk-doc
 
-- 
1.7.10.4


