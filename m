Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fe0-00011w-8e
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cfcS004605 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:41 GMT
X-Quarantine-ID: <EZmR25JZMxH6>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EZmR25JZMxH6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:40 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0caMg004552
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVU-0002ep-Hg
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:28 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:22 +0000
Message-Id: <a964e22804705b64202d2852a13ff2be34dc7923.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/17] rpm: Add rpmdeps-oecore to appropriate package
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:16 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index eeca823..2441380 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r33"
+PR = "r34"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -261,6 +261,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/bin/rpmcache \
 		${libdir}/rpm/bin/rpmcmp \
 		${libdir}/rpm/bin/rpmdeps \
+		${libdir}/rpm/bin/rpmdeps-oecore \
 		${libdir}/rpm/bin/rpmdigest \
 		${libdir}/rpm/bin/abi-compliance-checker.pl \
 		${libdir}/rpm/bin/api-sanity-autotest.pl \
-- 
1.7.5.4



