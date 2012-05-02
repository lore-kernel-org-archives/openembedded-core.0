Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SPacO-00080N-0i
	for Openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:33:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q42ENcdO004478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 2 May 2012 07:23:38 -0700 (PDT)
Received: from localhost.localdomain (128.224.60.100) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 2 May 2012 07:23:38 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 2 May 2012 09:23:36 -0500
Message-ID: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.6.6.2
MIME-Version: 1.0
Subject: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Wed, 02 May 2012 14:33:24 -0000
Content-Type: text/plain

The user mode NFS server does not get built by default when you are
using a purely command line driven development environment without SDK
tools.  In order to accommodate simple test configurations and have
all the tools built for the minimal validation with qemu-native,
simply add the dependency to unfs-server-native.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 421a149..742b629 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -14,4 +14,4 @@ RDEPENDS_kernel-base = ""
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 
-EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native unfs-server-native"
-- 
1.6.6.2



