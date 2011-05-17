Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMJTg-0002Ro-A7 for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 14:34:20 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMJQv-0004Yw-5t
	for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 14:31:29 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.linuxtogo.org
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 13:31:27 +0100
Message-ID: <1305635487.2429.196.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] image.bbclass: use soft assignment for LDCONFIGDEPEND
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
X-List-Received-Date: Tue, 17 May 2011 12:34:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This allows distros that don't want ldconfig to turn it off.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b2325b3..346dd5e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -23,7 +23,7 @@ PID = "${@os.getpid()}"

 PACKAGE_ARCH = "${MACHINE_ARCH}"

-LDCONFIGDEPEND = "ldconfig-native:do_populate_sysroot"
+LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
 LDCONFIGDEPEND_linux-uclibc = ""
 LDCONFIGDEPEND_linux-uclibceabi = ""

--
1.7.1





