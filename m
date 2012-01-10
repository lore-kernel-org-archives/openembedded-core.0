Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmP-00042N-Ru
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:01:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535247"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:53:57 -0800
Message-Id: <a471d342424502de48f28c4f8297d490f2cd1443.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/22] site/common-uclibc: Cache gl_cv_func_wcwidth_works
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
X-List-Received-Date: Tue, 10 Jan 2012 06:01:54 -0000

From: Khem Raj <raj.khem@gmail.com>

Its not computed properly during configure and
we configure uclibc with widechar support anyway
so its fine to cache it. It fixes the errors like

| In file included from ./stdio.h:31:0,
|                  from fpurge.h:20,
|                  from fpurge.c:20:
| /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemux86/usr/include/stdio.h:662:40: error: expected declaration specifiers or '...' before '(' token
| make[4]: *** [fpurge.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-uclibc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index 331c2a2..c2ad42d 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -21,6 +21,7 @@ ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
 glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
 glib_cv_long_long_format=${glib_cv_long_long_format=ll}
 glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
+gl_cv_func_wcwidth_works=${gl_cv_func_wcwidth_works=yes}
 
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
-- 
1.7.6.5



