Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1112470DD7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 02:08:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7G28BLx005063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 19:08:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 19:08:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 19:08:09 -0700
Message-ID: <70cbf8891e31f422cbb2d75fd3ade807122efde8.1408154848.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408154848.git.liezhi.yang@windriver.com>
References: <cover.1408154848.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] avahi-ui: drop rmdir localstatedir in bb recipe
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
X-List-Received-Date: Sat, 16 Aug 2014 02:08:15 -0000
Content-Type: text/plain

There is a "rmdir --ignore-fail-on-non-empty ${D}${localstatedir}" in
avahi.inc, so drop the one in avahi-ui_0.6.31.bb, otherwise do_install
error:
rmdir: failed to remove `/path/to/image/var': No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index 557c1c1..070530e 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -64,6 +64,5 @@ do_install_append () {
 	rm ${D}${mandir}/man1/a*
 	rm ${D}${mandir}/man5 -rf
 	rm ${D}${mandir}/man8 -rf
-	rmdir ${D}${localstatedir}
 }
 
-- 
1.7.9.5


