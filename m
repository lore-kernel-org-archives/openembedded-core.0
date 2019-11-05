Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id B9D317F96B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:49 +0000 (UTC)
IronPort-SDR: /9zCnA7va6xkFDueGeEWvzJVPd1iC5F2mno5v8rCkFkIpV1vNJuMJd1hwp7MFs5Sh4Ku9sOJOJ
	Y1VpvUAowZR5KiD2ILSYPaqkLnRP96VWrGVYG+yI7OhU1eiV1ddP/aiIHak0qij7YS1n2N3mAI
	2j3sh7wWAQYm49p0AlOhddKHa7iSVfFl9yAid0C+Z/aDZ1g/pBqNG0tn1TMjOT+i9soEmm/6FT
	l1IVrRfTrecxZe230+vkSez53fIGLDXVePY84n5Y+Lwgj9x5PiwxbZn1BedRF//bctXwuNuTc3
	8cU=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2200442"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:33 +0100
Message-Id: <48ba833a6d4bfa342c82935aacfd847666bae04e.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 3/9] nativesdk-meson: Remove some unused variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2019 22:08:50 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
index 1549357a55..1756f342ce 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
@@ -16,11 +16,6 @@ def meson_endian(prefix, d):
     else:
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
-MESON_TOOLCHAIN_ARGS = "${BUILDSDK_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
-MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CXXFLAGS}"
-MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_LDFLAGS}"
-
 # The cross file logic is similar but not identical to that in meson.bbclass,
 # since it's generating for an SDK rather than a cross-compile. Important
 # differences are:
-- 
2.21.0


