Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF027705A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQUhk011074; Wed, 16 Jul 2014 17:26:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eeH_gYx9umCJ; Wed, 16 Jul 2014 17:26:30 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQQDG011033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:28 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S29-0004N2-Qg; Wed, 16 Jul 2014 17:26:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:01 +0100
Message-Id: <4810877f28523012c4cd93d1d8265f341bf3f293.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/19] python-docutil: Upgrade 0.11 -> 0.12
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:16 -0000

License change is just a date change in the license file, looks
like English to German locale change to the date display.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python-docutils_0.11.bb => python-docutils_0.12.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-docutils_0.11.bb => python-docutils_0.12.bb} (60%)

diff --git a/meta/recipes-devtools/python/python-docutils_0.11.bb b/meta/recipes-devtools/python/python-docutils_0.12.bb
similarity index 60%
rename from meta/recipes-devtools/python/python-docutils_0.11.bb
rename to meta/recipes-devtools/python/python-docutils_0.12.bb
index f5da973..8cda88d 100644
--- a/meta/recipes-devtools/python/python-docutils_0.11.bb
+++ b/meta/recipes-devtools/python/python-docutils_0.12.bb
@@ -2,13 +2,13 @@ SUMMARY = "Text processing system for documentation"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=da0d261d1db78ab21ce86c79364a4098"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=a722fbdc20347db7b69223594dd54574"
 
 DEPENDS = "python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "20ac380a18b369824276864d98ec0ad6"
-SRC_URI[sha256sum] = "9af4166adf364447289c5c697bb83c52f1d6f57e77849abcccd6a4a18a5e7ec9"
+SRC_URI[md5sum] = "4622263b62c5c771c03502afa3157768"
+SRC_URI[sha256sum] = "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa"
 
 S = "${WORKDIR}/docutils-${PV}"
 
-- 
1.9.2


