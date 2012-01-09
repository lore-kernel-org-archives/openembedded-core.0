Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rk78r-0002sW-6k
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 05:47:29 +0100
Received: by yhjj51 with SMTP id j51so74539yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jan 2012 20:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=crsbrz1BJd6uyl3flY/OkWoTCGZGOTESTXu/Ipk7AYU=;
	b=fSdO6VrjJr14X+zzHkyxMwoLH4eEXys1apkOHzrHuqpQCeoBje3U4zwUsBeIZX91Kq
	x3qaiU7IqkdMw9/Fa2lVageoJLQyqUPbfvmwTXYIG9tWmaaqpCuqS2QVMZ0cfCCb1Lpw
	eL5kF7ELH7uNSK0b4Bjwo5EVaou95gMuiXO9U=
Received: by 10.236.123.37 with SMTP id u25mr3403664yhh.52.1326084001578;
	Sun, 08 Jan 2012 20:40:01 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id a7sm179421777ana.5.2012.01.08.20.39.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jan 2012 20:40:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jan 2012 20:39:29 -0800
Message-Id: <1326083969-28287-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] site/common-uclibc: Cache gl_cv_func_wcwidth_works
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
X-List-Received-Date: Mon, 09 Jan 2012 04:47:29 -0000

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
1.7.5.4



