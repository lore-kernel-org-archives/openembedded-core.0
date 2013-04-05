Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1UO1Kr-00079B-J7
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 09:45:49 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DF1622232544
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 09:23:00 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8EE0F2232546
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 09:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052225030.adsl.alicedsl.de
	[78.52.225.30]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 09:22:59 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 7E16A3C510; Fri,  5 Apr 2013 09:22:58 +0200 (CEST)
From: "Henning Heinold" <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 09:22:57 +0200
Message-Id: <1365146578-14129-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.10.4
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] site/common-uclibc: add predefined configure vars for coreutils
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
X-List-Received-Date: Fri, 05 Apr 2013 07:45:54 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>

* this sets some configure vars which will be guessed
  false in cross-compile case for uclibc

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/site/common-uclibc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index 331c2a2..0e3fde0 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -31,6 +31,11 @@ bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
 
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
+gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
+gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
+ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=yes}
+ac_cv_func_posix_spawn_works=${ac_cv_func_posix_spawn_works=yes}
 
 # va_copy and _va_copy
 ac_cv_va_copy=${ac_cv_va_copy=yes}
-- 
1.7.10.4


