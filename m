Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4ow-0002oA-Tv
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:10:07 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qh4l6-00011G-1u from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:06:08 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:06:07 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:06:06 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:06:02 -0700
Message-Id: <e351235961ce10c07818e885ec20aa047cb41ea9.1310583666.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ea6f9e7c8e2fd03d3c1ca9fc83f149dd696ac40b.1310583666.git.tom_rini@mentor.com>
References: <ea6f9e7c8e2fd03d3c1ca9fc83f149dd696ac40b.1310583666.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310583666.git.tom_rini@mentor.com>
References: <cover.1310583666.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 13 Jul 2011 19:06:06.0659 (UTC)
	FILETIME=[EB0DF130:01CC418F]
Subject: [PATCH 2/3] perl: Use SITEINFO variables not functions
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
X-List-Received-Date: Wed, 13 Jul 2011 19:10:07 -0000

Switch from SITEINFO_BITS / SITEINFO_ENDIANESS rather than
siteinfo_get...

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-devtools/perl/perl_5.12.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index beb1791..105bbcc 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -116,8 +116,8 @@ do_configure() {
         # Generate configuration
         rm -f config.sh-${TARGET_ARCH}-${TARGET_OS}
         for i in ${WORKDIR}/config.sh \
-                 ${WORKDIR}/config.sh-${@siteinfo_get_bits(d)} \
-                 ${WORKDIR}/config.sh-${@siteinfo_get_bits(d)}-${@siteinfo_get_endianess(d)}; do
+                 ${WORKDIR}/config.sh-${SITEINFO_BITS} \
+                 ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIANESS}; do
             cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
         done
 
-- 
1.7.0.4



