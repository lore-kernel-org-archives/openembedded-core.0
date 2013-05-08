Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZzmo-0002VU-Rp
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:31:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2013 01:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,632,1363158000"; d="scan'208";a="334292787"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2013 01:13:38 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 11:17:16 +0300
Message-Id: <1368001036-27338-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <y>
References: <y>
Subject: [PATCH] kexec-tools: upgraded to 2.0.4
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
X-List-Received-Date: Wed, 08 May 2013 08:32:11 -0000
X-List-Received-Date: Wed, 08 May 2013 08:32:11 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../kexec/{kexec-tools_2.0.3.bb => kexec-tools_2.0.4.bb}         |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.3.bb => kexec-tools_2.0.4.bb} (55%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.4.bb
similarity index 55%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.4.bb
index 3cc8265..de44cf0 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.4.bb
@@ -2,10 +2,8 @@ require kexec-tools.inc
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
-PR = "r0"
-
-SRC_URI[md5sum] = "1b362abd2e8669171a5ba50a9cc26183"
-SRC_URI[sha256sum] = "36a50fad961e24c9cdaa7c01b74d3cdd2b1bebf9bf0f0f3740dd1f21bd1b8ba6"
+SRC_URI[md5sum] = "b9f2a3ba0ba9c78625ee7a50532500d8"
+SRC_URI[sha256sum] = "6ba1872c58434b8e92506ff515c7ef64555671af54097bae51b833bda3f5126c"
 
 PACKAGES =+ "kexec kdump"
 
-- 
1.7.10.4



