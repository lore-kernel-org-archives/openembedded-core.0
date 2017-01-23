Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6A60B60269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCw7Ik015889; Mon, 23 Jan 2017 12:58:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5qGLSKCkeTCT; Mon, 23 Jan 2017 12:58:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCw2YG015884
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 12:58:03 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cVeCA-0000Mq-6N; Mon, 23 Jan 2017 12:58:02 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:57:59 +0000
Message-Id: <1485176279-1373-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] tremor: Use mirror tarball instead of svn url
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
X-List-Received-Date: Mon, 23 Jan 2017 12:58:12 -0000

This is the only remaining svn url in OE-Core and building subversion-native
for things like the url checker is wearing and slows down builds. Since
this rarely changes, use the mirror tarball instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/tremor/tremor_20150107.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/tremor/tremor_20150107.bb b/meta/recipes-multimedia/tremor/tremor_20150107.bb
index 937894a..96834bd9 100644
--- a/meta/recipes-multimedia/tremor/tremor_20150107.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20150107.bb
@@ -13,10 +13,15 @@ RECIPE_UPSTREAM_VERSION = "20150107"
 RECIPE_UPSTREAM_DATE = "Jan 07, 2015"
 CHECK_DATE = "Aug 12, 2015"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http \
+# Only subversion url left in OE-Core, use a mirror tarball instead since
+# this rarely changes.
+# svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/Tremor_svn.xiph.org_.trunk_19427_.tar.gz \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
+SRC_URI[md5sum] = "b308f9598176c0b5059c0124ab122afe"
+SRC_URI[sha256sum] = "2196802e1635f9ac4474eeee0fe4da12e6c1ad3942862427a67268de2b65b1d4"
 
 S = "${WORKDIR}/Tremor"
 
-- 
2.7.4


