Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SfXnC-0008TY-1h
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 16:46:30 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id C85FF6005D;
	Fri, 15 Jun 2012 14:44:18 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 15:36:47 +0100
Message-Id: <1339771007-2678-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.10.4
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] Add perlnative to inherit as to use openembedded perl rather than hosts perl Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
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
X-List-Received-Date: Fri, 15 Jun 2012 14:46:30 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

---
 meta/recipes-connectivity/openssl/openssl.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 089b9a4..44d6c4c 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -33,7 +33,7 @@ export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
-inherit pkgconfig siteinfo
+inherit pkgconfig siteinfo perlnative
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc"
 FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
-- 
1.7.10.4



