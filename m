Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1++/y2wwBXcQffLKeDXfD1iYTzJSdIDm9E=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkBuo-0003kI-I0
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:21:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9GtTc032033
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:16:55 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:16:52 -0500
Message-Id: <1311326212-10672-4-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311326212-10672-3-git-send-email-galak@kernel.crashing.org>
References: <1311326212-10672-1-git-send-email-galak@kernel.crashing.org>
	<1311326212-10672-2-git-send-email-galak@kernel.crashing.org>
	<1311326212-10672-3-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 4/4] site/powerpc64-linux: Start initial site config
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
X-List-Received-Date: Fri, 22 Jul 2011 09:21:03 -0000

Use ac_cv_sizeof_* from eglibc as starting point for powerpc64-linux
site info.  We will refactor common bits that are needed out of
powerpc32-linux based on build issues.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/site/powerpc64-linux |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta/site/powerpc64-linux

diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
new file mode 100644
index 0000000..9430ea1
--- /dev/null
+++ b/meta/site/powerpc64-linux
@@ -0,0 +1,21 @@
+ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=8}
+ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
+ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+ac_cv_sizeof_long=${ac_cv_sizeof_long=8}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
+ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=8}
+ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_long_long_int=${ac_cv_sizeof_long_long_int=8}
+ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
+ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
+ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
+ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
+ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=8}
+ac_cv_sizeof_unsigned_long_int=${ac_cv_sizeof_unsigned_long_int=8}
+ac_cv_sizeof_unsigned_long_long_int=${ac_cv_sizeof_unsigned_long_long_int=8}
+ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
+ac_cv_sizeof_unsigned_short_int=${ac_cv_sizeof_unsigned_short_int=2}
+ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
-- 
1.7.3.4



