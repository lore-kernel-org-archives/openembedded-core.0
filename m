Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fe2-00014u-5N
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:18 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0chlN004630 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:43 GMT
X-Quarantine-ID: <iry+kTWJIh6G>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iry+kTWJIh6G
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:42 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0caam004553
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVU-0002es-MM
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:28 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:23 +0000
Message-Id: <6bf473f3721c03adbfd283a65187dd5656e6debf.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 16/17] python-pycairo: Fix incorrect versions in license field
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:19 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python-pycairo_1.10.0.bb                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
index 7d1b6c1..dc009b3 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Python Bindings for the Cairo canvas library"
 HOMEPAGE = "http://cairographics.org/pycairo"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "python-devel"
-LICENSE = "LGPLv1.1 & MPL-1"
+LICENSE = "LGPLv2.1 & MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
                     file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
                     file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
 
 # cairo >= 1.8.8
 DEPENDS = "cairo"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.bz2"
 
-- 
1.7.5.4



