Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4oX-0002l4-G7
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:09:41 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qh4ki-0000rI-Ez from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:05:44 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:05:44 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:05:40 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:05:35 -0700
Message-Id: <047bd16724160cc0f89205eca9258ebad6ab81f8.1310583292.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
References: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310583292.git.tom_rini@mentor.com>
References: <cover.1310583292.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 13 Jul 2011 19:05:40.0676 (UTC)
	FILETIME=[DB914040:01CC418F]
Subject: [PATCH 4/4] libpcre: Add bzip2, zlib and readline to DEPENDS
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
X-List-Received-Date: Wed, 13 Jul 2011 19:09:41 -0000

libpcre will build, if found, optional support for bzip2/zlib in
pcregrep and a readline frontend to pcretest.  It will not however
listen to --disable-pcregrep-{libz,libbz2} and will still build
these if found.  So we add bzip2, zlib and readline to DEPENDS to make
sure that we get consistent builds.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-support/libpcre/libpcre_8.12.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.12.bb b/meta/recipes-support/libpcre/libpcre_8.12.bb
index 33003c5..9216777 100644
--- a/meta/recipes-support/libpcre/libpcre_8.12.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.12.bb
@@ -17,6 +17,7 @@ SRC_URI[sha256sum] = "c63070d461edc451ec9457f2324e152a531e907d5c5d2d8f8121e725ac
 S = "${WORKDIR}/pcre-${PV}"
 
 PROVIDES = "pcre"
+DEPENDS = "bzip2 zlib readline"
 
 inherit autotools binconfig
 
-- 
1.7.0.4



