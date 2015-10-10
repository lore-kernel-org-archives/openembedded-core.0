Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB34176E70
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 07:01:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A71MJf024033
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 00:01:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 10 Oct 2015 00:01:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 10 Oct 2015 00:01:20 -0700
Message-ID: <190b6280c8759fd73281304211298d0ea2fa12ee.1444460443.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444460443.git.liezhi.yang@windriver.com>
References: <cover.1444460443.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] gtk+3: fix ALTERNATIVE_PRIORITY conflict with gtk+
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
X-List-Received-Date: Sat, 10 Oct 2015 07:01:24 -0000
Content-Type: text/plain

Conflicts:
gtk+3 and gtk+ have the same priority 10 for gtk-update-icon-cache

Turn up gtk+3's priority to fix the conflict.

[YOCTO #8477]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 558cdd7..5bbac07 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -92,6 +92,7 @@ PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
 
 ALTERNATIVE_${PN} = "gtk-update-icon-cache"
 ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-3.0"
+ALTERNATIVE_PRIORITY = "30"
 
 python populate_packages_prepend () {
     import os.path
-- 
1.7.9.5


