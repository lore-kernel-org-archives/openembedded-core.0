Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18QLYwDnsldWwqC184oachv7pZ5iQIykBY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkBuo-0003kH-07
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:21:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9GsP4032021
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:16:54 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:16:51 -0500
Message-Id: <1311326212-10672-3-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311326212-10672-2-git-send-email-galak@kernel.crashing.org>
References: <1311326212-10672-1-git-send-email-galak@kernel.crashing.org>
	<1311326212-10672-2-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 3/4] site/powerpc32-linux: Update with ac_cv_sizeof_* from eglibc
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
X-List-Received-Date: Fri, 22 Jul 2011 09:21:02 -0000

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/site/powerpc32-linux |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 433ccef..bd45ea6 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -9,21 +9,30 @@ ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
+ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
-ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
 ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
+ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
 ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
 ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_long_long_int=${ac_cv_sizeof_long_long_int=8}
 ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
 ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
 ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
+ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
+ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
+ac_cv_sizeof_unsigned_long_int=${ac_cv_sizeof_unsigned_long_int=4}
+ac_cv_sizeof_unsigned_long_long_int=${ac_cv_sizeof_unsigned_long_long_int=8}
+ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
+ac_cv_sizeof_unsigned_short_int=${ac_cv_sizeof_unsigned_short_int=2}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
-ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
 ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=4}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
 ac_cv_sys_restartable_syscalls=yes
 ac_cv_type___int64=${ac_cv_type___int64=no}
 ac_cv_type_size_t=${ac_cv_type_size_t=yes}
-- 
1.7.3.4



