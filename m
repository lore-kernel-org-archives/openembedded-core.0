Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id B70507FE49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z7so5927040wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zUQvYSUj7Awq9h7xppW5B8KHR7HcXco1zigVsNaQKXI=;
	b=jxE7fP6D+viHDNfCSs0QQ3jhRVFIthy02EHFkGOgFWhlutzfeF4x1wnB1wzVo3lW78
	FzPoaruUmoLc8y3CDsd9DY4Gz9tt5XuOfL9O7wA8vV1TYc2+47PGLdDKP95svILl67h5
	budXg8ebobao89Jdy0Zc6fx3M/UMbgAdI4ekkwMqof6Wv6SVEIGBuxGSRNeZWG4QUICs
	hSXkzZfPxP1tE8KmQEIkTdp2OQCCbs5wBbwagM1qs9gO9PuYpkQcFavp/oVLaw2oq7CT
	UlnUgIheJtY00DgyAc2yMTjZPzr+UMv3+FMrsUx2vqTGZI6SnCE+Du1Y3zO6OYRW6YY8
	x0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zUQvYSUj7Awq9h7xppW5B8KHR7HcXco1zigVsNaQKXI=;
	b=tZVw6IaRVjpnKxSeF9Rde6FJm0G2hAde1S5zGgI4oigw7ttSg8HJtXwmKkWDRbggEs
	bS+LOYuB6uIgV+YUbjNjtOYTaGwQwUjhOlFbSmjEgz29UR3kLUcPWxXoy52h7VoekpL3
	ZRQO0NA47dGkE6z+Fg0u4bMdEwiZlepvNvmeNObWOA05lTnV5KnGHgXHKUd7mfKihxJl
	6diaV/z5MRPshdHdorCXm5anSi84BKlsdo3Lx4K+ymRz5qw12LlG5Q/KDK3vdRLKaKpP
	W1PTi0T/iyqYfAnKcT8HzWgre5ON/orD6gNVJwe5LGx+6h/1cjdm60UxrcJ4yn7n8Sy+
	NJGw==
X-Gm-Message-State: APjAAAVDfntUqSHiMQfDTlFO11gRS3zp2xQuyyQERW45s0DDUJdQoqlL
	fqBOAIaARprUxgCttUQG9mS5Qv4V8BU=
X-Google-Smtp-Source: APXvYqzim4tgtlrYyaMNyc+augh7maHIGKHGZ+wBEeWUSkWE6vECssJPDE2e9vDtECCemEicfL/iEA==
X-Received: by 2002:a05:6000:11c9:: with SMTP id
	i9mr9211270wrx.164.1576761810974; 
	Thu, 19 Dec 2019 05:23:30 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:58 +0100
Message-Id: <20191219132301.80034-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/16] strace: update to 5.4
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:31 -0000

Drop patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...Check-for-mips-and-alpha-before-usin.patch | 32 -------------------
 ...st-test-for-m32-mx32-compile-support.patch | 12 +++----
 .../strace/{strace_5.3.bb => strace_5.4.bb}   |  5 ++-
 3 files changed, 8 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
 rename meta/recipes-devtools/strace/{strace_5.3.bb => strace_5.4.bb} (89%)

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
deleted file mode 100644
index 95d85bf34ae..00000000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 879ae71c472ce522f1b3514d2abf6ad49b4acc07 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 18 Sep 2017 22:51:32 -0700
-Subject: [PATCH] tests/sigaction: Check for mips and alpha before using
- sa_restorer
-
-local structure does not define restorer member for mips and alpha
-in definition, we need to match that assumption here where they are
-being set
-
-Fixes
-| ../../strace-4.18/tests/sigaction.c:177:36: error: 'struct_set_sa {aka struct set_sa}' has no member named 'restorer'
-|  # define SA_RESTORER_ARGS , new_act->restorer
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- tests/sigaction.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/tests/sigaction.c
-+++ b/tests/sigaction.c
-@@ -156,7 +156,7 @@ main(void)
- 	sigdelset(mask.libc, SIGHUP);
- 
- 	memcpy(new_act->mask, mask.old, sizeof(mask.old));
--# ifdef SA_RESTORER
-+#if defined(SA_RESTORER) && !defined(MIPS) && !defined(ALPHA)
- 	new_act->flags = SA_RESTORER;
- 	new_act->restorer = (unsigned long) 0xdeadfacecafef00dULL;
- #  define SA_RESTORER_FMT ", sa_flags=SA_RESTORER, sa_restorer=%#lx"
diff --git a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
index a9bd900da86..11fca4f4a91 100644
--- a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
+++ b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
@@ -1,4 +1,4 @@
-From cc97307e8e39a81999c6a365d057487a02e6128e Mon Sep 17 00:00:00 2001
+From 1e19f38307d20d751c64b1f0376b29d8b2119a93 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:00:00 -0800
 Subject: [PATCH] mpers.m4: more robust test for -m32/-mx32 compile support
@@ -24,18 +24,18 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/m4/mpers.m4 b/m4/mpers.m4
-index 13725d7..d8578ea 100644
+index 92eeb1f..1921a04 100644
 --- a/m4/mpers.m4
 +++ b/m4/mpers.m4
-@@ -88,6 +88,7 @@ case "$arch" in
- 	CFLAGS="$CFLAGS MPERS_CFLAGS $IFLAG"
- 	AC_CACHE_CHECK([for mpers_name personality compile support], [st_cv_cc],
+@@ -103,6 +103,7 @@ case "$arch" in
+ 	CFLAGS="$CFLAGS MPERS_CFLAGS${IFLAG:+ }$IFLAG"
+ 	AC_CACHE_CHECK([for mpers_name personality compile support (using $CC $CFLAGS)], [st_cv_cc],
  		[AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
 +						     #include <sys/syscall.h>
  						     int main(){return 0;}]])],
  				   [st_cv_cc=yes],
  				   [st_cv_cc=no])])
-@@ -95,6 +96,7 @@ case "$arch" in
+@@ -110,6 +111,7 @@ case "$arch" in
  		AC_CACHE_CHECK([for mpers_name personality runtime support],
  			[st_cv_runtime],
  			[AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
diff --git a/meta/recipes-devtools/strace/strace_5.3.bb b/meta/recipes-devtools/strace/strace_5.4.bb
similarity index 89%
rename from meta/recipes-devtools/strace/strace_5.3.bb
rename to meta/recipes-devtools/strace/strace_5.4.bb
index b000afb30be..ed1b1cd9078 100644
--- a/meta/recipes-devtools/strace/strace_5.3.bb
+++ b/meta/recipes-devtools/strace/strace_5.4.bb
@@ -12,13 +12,12 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://run-ptest \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
-           file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            file://ptest-spacesave.patch \
            file://uintptr_t.patch \
            file://sys_headers.patch \
            "
-SRC_URI[md5sum] = "84f5e72de813c9b1bb6057ee8ab428d8"
-SRC_URI[sha256sum] = "6c131198749656401fe3efd6b4b16a07ea867e8f530867ceae8930bbc937a047"
+SRC_URI[md5sum] = "b2b58f05eb3c5c0bf9d1e26003b4d698"
+SRC_URI[sha256sum] = "f7d00514d51290b6db78ad7a9de709baf93caa5981498924cbc9a744cfd2a741"
 
 inherit autotools ptest
 
-- 
2.17.1


