Received: from elite.brightsigndigital.co.uk ([81.142.160.137])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1S8aDr-00012S-8u
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:41:47 +0100
Received: from [172.30.1.25] (helo=chuckie.brightsign)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1S8a5M-0004ZG-OS; Fri, 16 Mar 2012 16:33:00 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1S8a5M-0007OE-NT; Fri, 16 Mar 2012 16:33:00 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 16:32:53 +0000
Message-Id: <1331915573-28368-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.9
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] libc-common: Apply Debian-naming to libc debug symbols too
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
X-List-Received-Date: Fri, 16 Mar 2012 16:41:47 -0000

The magic in rootfs_ipk.bbclass expects to generate debug package
names by just appending '-dbg'. This breaks for eglibc because whilst
the binary package has been renamed to libc6 the debug package is
still called libc-dbg. This patch ensures that the debug package is
renamed too.
---
 meta/classes/libc-common.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 962f205..d0c1ab4 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -27,4 +27,5 @@ python populate_packages_prepend () {
 		bpn = d.getVar('BPN', True)
 		d.setVar('PKG_'+bpn, 'libc6')
 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
+		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
 }
-- 
1.7.9



