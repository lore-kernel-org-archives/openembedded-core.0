Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QruEb-0007fB-UI
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:05:21 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QruAF-0000g3-CZ
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:00:51 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 17:00:50 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313164851.6733.166.camel@phil-desktop>
Mime-Version: 1.0
Subject: default-distrovars: add x11 to default DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Aug 2011 16:05:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/conf/distro/include/default-distrovars.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 2ef25e4..ce51c2c 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -16,7 +16,7 @@ DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-
 					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
 					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
 					libc-posix-wchar-io"
-DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
-- 
1.7.4.1





