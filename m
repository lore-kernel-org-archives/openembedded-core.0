Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.10283.1598441257954314220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 04:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07QBRY5a018314
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:27:35 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v2 2/6] kernel.bbclass: Remove do_install[prefunc] no longer needed
Date: Wed, 26 Aug 2020 06:27:29 -0500
Message-Id: <20200826112733.52492-3-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>

Prior work has refactored the do_install task multiple times, and any
references to PKGV and PKGR (even indirect ones) have been removed.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/kernel.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index cba77daa7a..7869184b94 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -416,7 +416,6 @@ kernel_do_install() {
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
 }
-do_install[prefuncs] += "package_get_auto_pr"
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
-- 
2.17.1

