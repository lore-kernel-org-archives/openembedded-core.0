Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C8A9278917
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:02:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651851"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:02:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:40 +0200
Message-Id: <20180309185614.31113-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/36] pcmciautils: drop duplicate chunk from pcmciautils-018/makefile_race.patch
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
X-List-Received-Date: Fri, 09 Mar 2018 19:02:54 -0000

The new rule was patched into the makefile twice.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../pcmciautils/pcmciautils-018/makefile_race.patch        | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
index f5a518ff73c..4c5eba7951e 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
@@ -12,20 +12,6 @@ RP
 
 Upstream-Status: Pending
 
-Index: pcmciautils-018/Makefile
-===================================================================
---- pcmciautils-018.orig/Makefile
-+++ pcmciautils-018/Makefile
-@@ -249,6 +249,9 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
- yacc_config.o lex_config.o: %.o: %.c src/yacc_config.h
- 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
- 
-+src/lex_config.o : src/lex_config.c src/yacc_config.h
-+	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
-+
- debugtools: ccdv $(CBDUMP) $(CISDUMP)
- 
- $(CBDUMP): $(LIBC) debug/cbdump.o
 Index: pcmciautils-018/Makefile
 ===================================================================
 --- pcmciautils-018.orig/Makefile
-- 
2.16.1


