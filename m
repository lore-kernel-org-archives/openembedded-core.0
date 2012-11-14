Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYeE7-0005i5-B6 for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 15:46:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEW6jU020604
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:32:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19887-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:32:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEVvIv020598
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:31:58 GMT
Message-ID: <1352903518.13332.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2012 14:31:58 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Drop now unneeded python whitelist entries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 14:46:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 12c9c60..fce4956 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -21,8 +21,6 @@ SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
 # Also need to make cross recipes append to ${PN} and install once for any given PACAGE_ARCH so
 # can avoid multiple installs (e.g. routerstationpro+qemumips both using mips32)
 SSTATE_DUPWHITELIST += "${STAGING_LIBDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}/usr/libexec/${MULTIMACH_TARGET_SYS} ${STAGING_BINDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}${includedir_native}/gcc-build-internal-${MULTIMACH_TARGET_SYS}"
-# Also avoid python issues until we fix the python recipe
-SSTATE_DUPWHITELIST += "${STAGING_LIBDIR}/python2.7/config/Makefile ${STAGING_LIBDIR}/libpython2.7 ${STAGING_INCDIR}/python2.7/pyconfig.h"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 




