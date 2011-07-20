Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje2t-00046m-W7
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:11:08 +0200
Received: by wyg30 with SMTP id 30so505823wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=epxwqwuKX6NrqapcA+yRPk4hQDQEAHUJwxu+Qi3VIIA=;
	b=S7tsjeWQTuahgWezcovtlhc5O8JcRhImeqIcCzvRYWRcId6NB/rHTfGUSuNPMOFmH1
	vQNT/04Sf96ngHBVcLrJYbFifIyIy/4qa3gHe9Y9MDyE+CQ8siaCcKbyJiBl5DZjKHMc
	olpn8cZ+LSyehTH7waz+hwZRp2CrXF7fgn3YY=
Received: by 10.204.146.5 with SMTP id f5mr1373369bkv.155.1311196020214;
	Wed, 20 Jul 2011 14:07:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q1sm4073201faa.3.2011.07.20.14.06.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:06:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:21 +0200
Message-Id: <15a85a3841fcd2b785871d4cb2f0a73b31f74cca.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/10] polkit: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:11:08 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/polkit/polkit_0.101.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
index 6769914..fed3baf 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpam expat dbus-glib eggdbus intltool"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 FILES_${PN} += "${libdir}/${PN}-1/extensions/*.so \
                 ${datadir}/${PN}-1/actions/* \
-- 
1.7.6



