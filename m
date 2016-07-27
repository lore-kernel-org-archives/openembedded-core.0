Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A99B731CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:28:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R9S332002941
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:28:03 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 02:28:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 02:27:54 -0700
Message-ID: <7f39399686f509b743177d8d692b64e9d7174dac.1469609666.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469609666.git.liezhi.yang@windriver.com>
References: <cover.1469609666.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 6/9] xf86-input-vmmouse: remove duplicated udev setting from FILES_${PN}
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
X-List-Received-Date: Wed, 27 Jul 2016 09:28:03 -0000
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


