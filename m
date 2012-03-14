Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kG5-000631-43
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93pTK011840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:51 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:51 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:37 +0800
Message-ID: <4adc26ac6f7cd22036be74d01216e5c2dca5b249.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 2/8] newt: update to 0.52.14
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:37 -0000
Content-Type: text/plain

Update newt to latest verion 0.52.14.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../{libnewt_0.52.13.bb => libnewt_0.52.14.bb}     |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/newt/{libnewt_0.52.13.bb => libnewt_0.52.14.bb} (84%)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.13.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
similarity index 84%
rename from meta/recipes-extended/newt/libnewt_0.52.13.bb
rename to meta/recipes-extended/newt/libnewt_0.52.14.bb
index 38e09a9..5a3cc56 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.13.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
@@ -19,14 +19,12 @@ DEPENDS = "slang popt"
 
 PR = "r0"
 
-SRCREV = "c3c7be75f6ef1adfc2be5f99c1e8ef3f0ab58c38"
-
 SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://remove_slang_include.patch \
            file://fix_SHAREDDIR.patch"
 
-SRC_URI[md5sum] = "77de05b3f58540152a4ae32a1a64e5d0"
-SRC_URI[sha256sum] = "01c254b00a3d27e22f13240b6db74df04e721ccec4d1d4fc7b45fee009efc05f"
+SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
+SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
1.7.5.4



