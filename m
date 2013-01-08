Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TsW8J-0005fo-EN
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:10:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2013 01:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="243362755"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2013 01:54:58 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 11:58:12 +0200
Message-Id: <1357639092-14169-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] nasm: updated to 2.10.07
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
X-List-Received-Date: Tue, 08 Jan 2013 10:10:19 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/nasm/{nasm_2.10.06.bb => nasm_2.10.07.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.10.06.bb => nasm_2.10.07.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.10.06.bb b/meta/recipes-devtools/nasm/nasm_2.10.07.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.10.06.bb
rename to meta/recipes-devtools/nasm/nasm_2.10.07.bb
index cb12a22..1c95ed8 100644
--- a/meta/recipes-devtools/nasm/nasm_2.10.06.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.10.07.bb
@@ -7,8 +7,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 PR = "r0"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "875c4217b2e581dbae0bf96d45a6067a"
-SRC_URI[sha256sum] = "ac84dd0d7e4ad6282061ce36b68a72db591db55cf0902b53d4297c743b0944a6"
+SRC_URI[md5sum] = "af1cd6669f5e98148cd5ec42dee90f19"
+SRC_URI[sha256sum] = "c056e2abc83816892e448f9e9e95a3d21e9e096f44341b9d4853f62a443bba82"
 
 inherit autotools
 
-- 
1.7.10.4



