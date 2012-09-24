Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TG7Mm-00011E-UI
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:02:25 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TG7AO-0004On-CH
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 13:49:36 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 12:49:35 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348487376.31293.31.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] kexec-tools: admit mips as a COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 24 Sep 2012 12:02:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-kernel/kexec/kexec-tools.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 278ce34..ee1f1e8 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -12,6 +12,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
 
 inherit autotools
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|freebsd.*)'
 
 INSANE_SKIP_${PN} = "arch"
-- 
1.7.10.4





