Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 389686E648
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:04:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA4ZcE006130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:04:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:04:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:04:32 -0700
Message-ID: <9a04e499714c98af0b08f89bac067f0e39398bb3.1436781811.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436781811.git.liezhi.yang@windriver.com>
References: <cover.1436781811.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] xserver-xorg: remove invalid ac_cv_file__usr_share_sgml_X11_defs_ent
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
X-List-Received-Date: Mon, 13 Jul 2015 10:04:35 -0000
Content-Type: text/plain

There is no ac_cv_file__usr_share_sgml_X11_defs_ent in configure, can't
find it in config.log after remove, either.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 02a170a..cc1c02b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -119,7 +119,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
                  --with-sha1=libcrypto \
-                 ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
 PACKAGECONFIG ??= "dri2 udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
-- 
1.7.9.5


