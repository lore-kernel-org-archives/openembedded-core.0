Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 549F060EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 13:51:00 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8KDooX5008688; 
	Fri, 20 Sep 2013 08:51:01 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 18:52:13 +0500
Message-Id: <1379685133-3155-2-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379685133-3155-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1379685133-3155-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 2/2] [v2] connman: Remove obsolete configurations from EXTRA_OECONF
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
X-List-Received-Date: Fri, 20 Sep 2013 13:51:00 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

--enable-threads and --enable-fake are obsolete, unrecognized options
for connman now.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-connectivity/connman/connman.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 37ce3ec..12f3edd 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -21,14 +21,12 @@ EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
     ac_cv_path_PPPD=${sbindir}/pppd \
     --enable-debug \
-    --enable-threads \
     --enable-loopback \
     --enable-ethernet \
     --enable-tools \
     --enable-test \
     --disable-polkit \
     --enable-client \
-    --enable-fake \
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
-- 
1.7.9.5


