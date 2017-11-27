Return-Path: <dan@shadrach.duckdns.org>
X-Greylist: delayed 761 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Nov 2017 18:41:47 UTC
Received: from mail142c7.megamailservers.com (mail542c7.megamailservers.com
	[209.235.141.42])
	by mail.openembedded.org (Postfix) with ESMTP id 532677832A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:41:47 +0000 (UTC)
X-Authenticated-User: mcgreg123.sasktel.net
X-VIP: 69.49.109.87
Received: from shadrach.duckdns.org (204-83-204-148.prna.hsdb.sasknet.sk.ca
	[204.83.204.148]) (authenticated bits=0)
	by mail142c7.megamailservers.com (8.14.9/8.13.1) with ESMTP id
	vARIT5Mr022398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 27 Nov 2017 13:29:07 -0500
Received: by shadrach.duckdns.org (Postfix, from userid 1001)
	id 030EC8A92; Mon, 27 Nov 2017 12:29:03 -0600 (CST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 12:29:02 -0600
Message-Id: <20171127182902.33171-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.15.0.106.g7bc77766e
X-CTCH-RefID: str=0001.0A020203.5A1C5973.00F3, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.2 cv=BuPt+cf5 c=1 sm=1 tr=0 a=6cqb4ilmvwuDSF4sbTau3A==:117
	a=6cqb4ilmvwuDSF4sbTau3A==:17 a=x7bEGLp0ZPQA:10 a=gPhswxWUPe8A:10
	a=6l96557QvZYA:10 a=sC3jslCIGhcA:10 a=gWDa-L1wAAAA:8 a=SCo1hh1FAAAA:8
	a=GAosC7mqKKP17BWLvbIA:9 a=jjiDOD437DYA:10 a=vg_HiZM2M4GgzivzK9OA:22
	a=nwb-CePKZZm3gL-ai9HY:22
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] bind: fix python3 dependencies
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
X-List-Received-Date: Mon, 27 Nov 2017 18:41:48 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Add missing python3 dependency, and use python3 from the build
system.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-connectivity/bind/bind_9.10.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
index 8b8835ba80..0cf572af26 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
 
-DEPENDS = "openssl libcap"
+DEPENDS = "openssl libcap python3"
 
 SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
@@ -38,7 +38,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
 
-inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
+inherit autotools update-rc.d systemd useradd pkgconfig python3-dir python3native
 
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.15.0.106.g7bc77766e


