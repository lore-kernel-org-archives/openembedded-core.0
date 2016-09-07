Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9555477699
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 11:19:53 +0000 (UTC)
From: Jack Mitchell <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 12:20:05 +0100
Message-Id: <20160907112005.10247-1-ml@embed.me.uk>
X-Mailer: git-send-email 2.9.3
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [PATCHv2] file: build with c std as c99
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
X-List-Received-Date: Wed, 07 Sep 2016 11:19:55 -0000

From: Jack Mitchell <jack@embed.me.uk>

when using a toolchain not shipped by OE core such as linaro we
can't be sure what the std will be set to. Set to compile as c99
which is the lowest version supported.

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 meta/recipes-devtools/file/file_5.28.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.28.bb b/meta/recipes-devtools/file/file_5.28.bb
index 516c8c5..e64a89c 100644
--- a/meta/recipes-devtools/file/file_5.28.bb
+++ b/meta/recipes-devtools/file/file_5.28.bb
@@ -27,6 +27,8 @@ inherit autotools
 EXTRA_OEMAKE_append_class-target = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
 EXTRA_OEMAKE_append_class-nativesdk = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
 
+CFLAGS_append = " -std=c99"
+
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
 do_install_append_class-native() {
-- 
2.9.3


