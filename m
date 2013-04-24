Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7es-0007V8-Ri
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916440"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:03 -0700
Message-Id: <23af8728f8ade4bab316bed456476ac6a5cbf364.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 10/18] nspr: Update to 4.9.6
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/nspr/{nspr_4.9.5.bb => nspr_4.9.6.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.9.5.bb => nspr_4.9.6.bb} (95%)

diff --git a/meta/recipes-support/nspr/nspr_4.9.5.bb b/meta/recipes-support/nspr/nspr_4.9.6.bb
similarity index 95%
rename from meta/recipes-support/nspr/nspr_4.9.5.bb
rename to meta/recipes-support/nspr/nspr_4.9.6.bb
index d18b12e..0dc688d 100644
--- a/meta/recipes-support/nspr/nspr_4.9.5.bb
+++ b/meta/recipes-support/nspr/nspr_4.9.6.bb
@@ -11,15 +11,14 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-$
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
            file://trickly-fix-build-on-x86_64.patch \
-           file://fix-build-on-aarch64.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
 
-RDEPENDS_${PN}-dev += "perl"
+SRC_URI[md5sum] = "62b1e9d376d503d972f90c3c0031d879"
+SRC_URI[sha256sum] = "7693fddd3c5cc15d53a50df53ab5dcdaa2eb58f5003302690559471744d6c6f9"
 
-SRC_URI[md5sum] = "b6ccfa8fcbbeb17ebeb19a3edff612bd"
-SRC_URI[sha256sum] = "616ab65c849155c9ed0e5f502530a241cc9108e278275aa448b417ae632c7604"
+RDEPENDS_${PN}-dev += "perl"
 
 S = "${WORKDIR}/nspr-${PV}/mozilla/nsprpub"
 
-- 
1.8.0.2



