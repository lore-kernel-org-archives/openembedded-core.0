Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 138C5731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:28:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P7Sdto009113
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 00:28:40 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 00:28:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 00:28:33 -0700
Message-ID: <073b6d5bf606d9f652adf714eebf82972d70a3c5.1469431638.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431638.git.liezhi.yang@windriver.com>
References: <cover.1469431638.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] xf86-input-vmmouse: remove duplicated udev setting from FILES_${PN}
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
X-List-Received-Date: Mon, 25 Jul 2016 07:28:39 -0000
Content-Type: text/plain

bitbake.conf already sets it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
index 8615b48..92a1b25 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
@@ -23,4 +23,4 @@ do_install_append () {
 
 EXTRA_OECONF = "--with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
 
-FILES_${PN} += "${nonarch_base_libdir}/udev/rules.d/ ${datadir}/X11/xorg.conf.d"
+FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.9.0


