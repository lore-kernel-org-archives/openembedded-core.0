Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3EF60842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9xt001260; Thu, 22 Aug 2013 12:42:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RefWVtls2J3R; Thu, 22 Aug 2013 12:42:10 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg6bU001216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:08 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5a-0001hn-CA; Thu, 22 Aug 2013 12:30:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:38 +0100
Message-Id: <1377171000-6469-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/28] gcc-cross-canadian-4.8: Enable PARALLEL_MAKE
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:54 -0000

This disabling of PARALLEL_MAKE has been forward ported for gcc-cross-canadian
since at least 2009-09 and gcc 4.3.3, probably older.

I've tested this with high values of parallel make and it all seems to work and
we usually build gcc with parallel make so it seems unlikely there are issues.
Lets therefore enable it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb
index 53c4632..278a529 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb
@@ -20,7 +20,5 @@ EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
 # to find libmpfr
 # export LD_LIBRARY_PATH = "{STAGING_DIR_HOST}${layout_exec_prefix}"
 
-PARALLEL_MAKE = ""
-
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
-- 
1.8.1.2


