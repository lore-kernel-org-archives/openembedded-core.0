Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 288DC77249
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 12:22:02 +0000 (UTC)
Received: from localhost ([127.0.0.1]
	helo=[IPv6:2001:67c:1810:f051:fa2f:a8ff:feb0:ae33])
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1aPUXS-0007G0-CA
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jan 2016 13:22:02 +0100
Message-ID: <1454156519.7421.10.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jan 2016 12:21:59 +0000
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: [PATCH] native.bbclass: Set CXXFLAGS from BUILD_CXXFLAGS not BUILD_CFLAGS
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
X-List-Received-Date: Sat, 30 Jan 2016 12:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Although BUILD_CXXFLAGS, by default, expands to the same thing as 
BUILD_CFLAGS there is no guarantee that this will be true in all 
cases.  When setting CXXFLAGS we should use the former.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index aac2c1e..a3a5c8c 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -42,7 +42,7 @@ HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
-CXXFLAGS = "${BUILD_CFLAGS}"
+CXXFLAGS = "${BUILD_CXXFLAGS}"
 LDFLAGS = "${BUILD_LDFLAGS}"
 LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE} "
 
-- 
2.1.4




