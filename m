Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fdy-00011W-8f
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cdRn004592 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:39 GMT
X-Quarantine-ID: <eZgBmvYVRVE2>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eZgBmvYVRVE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:39 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cZ53004536
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:36 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVT-0002eU-FC
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:27 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:15 +0000
Message-Id: <48b11b323622f1e4294bd3b95e3b54bb4929d941.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/17] gnome-doc-utils: Clarify license as GPLv2 and LGPLv2.1
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:14 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 0047a1d..08333db 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPL & LGPL"
+LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
 DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index 1681db7..e93f584 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r7"
+PR = "r8"
 
 SRC_URI += "file://xsltproc_nonet.patch \
 	    file://use-usr-bin-env-for-python-in-xml2po.patch \
-- 
1.7.5.4



