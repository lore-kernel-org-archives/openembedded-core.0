Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D091719E2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 03:17:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v183HC7V020816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Feb 2017 19:17:12 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 19:17:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 22:16:57 -0500
Message-ID: <4e3b9567bfc39e23b920144bfe459b014eb1b6c3.1486523726.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] pax-utils: 1.1.6 -> 1.2.2
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
X-List-Received-Date: Wed, 08 Feb 2017 03:17:13 -0000
Content-Type: text/plain

Export GNULIB_OVERRIDES_WINT_T to fix compile failure
---------
1099 make[4]: *** [printf-args.o] Error 1
1100 make[4]: *** Waiting for unfinished jobs....
1101 In file included from ../../../pax-utils-1.2.2/autotools/gnulib/printf-args.h:41:0,
1102                  from ../../../pax-utils-1.2.2/autotools/gnulib/printf-parse.h:29,
1103                  from ../../../pax-utils-1.2.2/autotools/gnulib/printf-parse.c:36:
1104 ./wchar.h:476:6: error: #if with no expression
1105  # if
1106       ^
1107 make[4]: *** [printf-parse.o] Error 1
---------

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../pax-utils/{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb}            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb} (86%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
similarity index 86%
rename from meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
index 5cc5463..a032a22 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
@@ -10,11 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "96f56a5a10ed50f2448c5ccebd27764f"
-SRC_URI[sha256sum] = "f5436c517bea40f7035ec29a6f34034c739b943f2e3a080d76df5dfd7fd41b12"
+SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
+SRC_URI[sha256sum] = "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
 
 RDEPENDS_${PN} += "bash"
 
+export GNULIB_OVERRIDES_WINT_T = "0"
+
 do_configure_prepend() {
     touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog ${S}/README
 }
-- 
2.8.1


