Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53CA77C989
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 00:32:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x360WBO2026459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2019 17:32:12 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 5 Apr 2019 17:32:11 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Apr 2019 20:32:10 -0400
Message-ID: <20190406003210.13747-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] autoconf: update runtime perl module dependencies
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
X-List-Received-Date: Sat, 06 Apr 2019 00:32:11 -0000
Content-Type: text/plain

Running:
   # autoreconf -if
on target for prelink-cross was failing due to missing perl modules:
   Can't locate File/Spec.pm in @INC ...

Add the required perl modules and duplicate them for the SDK.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index b82af5a5fa..2c87bf8296 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -22,10 +22,14 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-file-find \
 		  perl-module-file-glob \
 		  perl-module-file-path \
+		  perl-module-file-spec \
+		  perl-module-file-spec-unix \
 		  perl-module-file-stat \
 		  perl-module-getopt-long \
 		  perl-module-io-file \
+		  perl-module-overloading \
 		  perl-module-posix \
+		  perl-module-symbol \
 		  perl-module-thread-queue \
 		  perl-module-threads \
 		 "
@@ -46,14 +50,20 @@ RDEPENDS_${PN}_class-nativesdk = "\
 		  nativesdk-perl-module-file-find \
 		  nativesdk-perl-module-file-glob \
 		  nativesdk-perl-module-file-path \
+		  nativesdk-perl-module-file-spec \
+		  nativesdk-perl-module-file-spec-unix \
 		  nativesdk-perl-module-file-stat \
 		  nativesdk-perl-module-getopt-long \
 		  nativesdk-perl-module-io-file \
+		  nativesdk-perl-module-overloading \
 		  nativesdk-perl-module-posix \
+		  nativesdk-perl-module-symbol \
 		  nativesdk-perl-module-thread-queue \
 		  nativesdk-perl-module-threads \
                   "
 
+
+
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
 
-- 
2.17.0


