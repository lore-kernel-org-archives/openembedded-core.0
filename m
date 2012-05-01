Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFcL-0000in-F1
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:07:57 +0200
Received: by mail-qa0-f48.google.com with SMTP id y23so2546606qad.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CgcPMoFzZI3QX28JWFK1yE9keg8r9y2gSCDJXO/cv2A=;
	b=rRQk1MZ4MX2iPsZMcmo3rUOF+O0licBNfi9dml7Tm3I1etvil5FALvMuuyuYzQfhfo
	7spuOUrUNi20QGydG2Hq33lC49YswLFrgCTQIypDA15khMNPokqzp8tCFOC9h0qYoHTU
	BvBUB42/all3Wy1gRn7f2sGUHXCxLvDH5WdwI9QKlPCpNCFyoi+0vNGDEs3h8WR9ceCl
	HOVMt3SBYIEbKwBXws01L/aLVKbbQnqy8KAzCX/rGJitffzlTHHmCHRt3WukEArIrJV/
	1P7+0pQb4oOgFngmLev9gyo6jJewe5+hIp6Rzqywfxvlj6zWJNFdTJiBwCAcXcdP/NDW
	WAsA==
Received: by 10.60.31.67 with SMTP id y3mr33519009oeh.41.1335887893353;
	Tue, 01 May 2012 08:58:13 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h7sm16733267oeh.9.2012.05.01.08.58.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 08:58:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 10:58:26 -0500
Message-Id: <118912916f6c04b157345bbcb1c722a575769859.1335887732.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
Subject: [PATCH 8/8] tcmode-external-csl: use the existing precompiled locale files
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
X-List-Received-Date: Tue, 01 May 2012 16:07:57 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 1fc366c..3b54e35 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -35,6 +35,10 @@ PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
 PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
 
+# No need to re-compile the locale files
+GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
+ENABLE_BINARY_LOCALE_GENERATION = ""
+
 TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
 TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
 
-- 
1.7.7



