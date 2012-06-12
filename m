Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY0Q-0002dA-Ek
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:48:02 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 161432FE86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:23 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:47 -0700
Message-Id: <7c767d3723e0b55d3bcd3864a9cdbce6d11d5b35.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 161432FE86.784B3
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 16/16] freetype: upgrade to 2.4.9
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
X-List-Received-Date: Tue, 12 Jun 2012 20:48:02 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.8.bb => freetype_2.4.9.bb}       |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.8 => freetype-2.4.9}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.8.bb => freetype_2.4.9.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.8.bb b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.4.8.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.9.bb
index bce01cf..31bee80 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.8.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
@@ -18,8 +18,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "dbf2caca1d3afd410a29217a9809d397"
-SRC_URI[sha256sum] = "a9eb7da3875fcb2f022a9c280c01b94ae45ac83d8102838c05dce1277948fb71"
+SRC_URI[md5sum] = "77a893dae81fd5b896632715ca041179"
+SRC_URI[sha256sum] = "c4204ac1d48e99d4375a2f32bf4f3f92780a9d9f015e64e57e852f6c004859b9"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.9.5



