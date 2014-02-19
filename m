Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 381006E9D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 02:35:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1J2ZMNq005932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 18:35:22 -0800 (PST)
Received: from wind-OptiPlex-780.corp.ad.wrs.com (128.224.162.219) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 18:35:21 -0800
From: Zhu Yanjun <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Feb 2014 10:35:27 +0800
Message-ID: <1392777327-12786-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nmap: use native python and add python dependence
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
X-List-Received-Date: Wed, 19 Feb 2014 02:35:22 -0000
Content-Type: text/plain

---
 recipes-security/nmap/nmap_6.25.bb |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-security/nmap/nmap_6.25.bb b/recipes-security/nmap/nmap_6.25.bb
index aff5c63..8d7e853 100644
--- a/recipes-security/nmap/nmap_6.25.bb
+++ b/recipes-security/nmap/nmap_6.25.bb
@@ -11,12 +11,17 @@ SRC_URI = "http://nmap.org/dist/${PN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "fcc80f94ff3adcb11eedf91092ea6f5e"
 SRC_URI[sha256sum] = "3349cc6d36b86b95ca2b8075d16615a3a598cef494920d6652f9a8bf9f7660b5"
 
-inherit autotools
+inherit autotools pythonnative
 
-DEPENDS = "libpcap"
+DEPENDS = "libpcap python"
 
 EXTRA_OECONF = "--without-liblua --without-zenmap --without-subversion --with-pcap=linux"
 
+export BUILD_SYS
+export HOST_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+
 do_configure() {
     autoconf
     oe_runconf
-- 
1.7.9.5


