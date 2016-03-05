Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id BC0B46FF93
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:03:28 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id t4so56744916qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u49ADjhR3li1uDC0g/xadnGBt1ogNE7siSReqzG22EU=;
	b=odqzU76wSBnD3FzXueOyryJAbxpBSRr/Ra0iEPCMMVK0vXg+VrjeXqlcgTrcYZ9kzJ
	8WS7DW6j7RDMmMP29D0diB0nEudbVWiwr1q4gn0eSxJ1biSoCV/v7AjjZzqvDJnj0wdf
	UOQAXF85FL0oBO1wRXDw13O1Eai/ElT7FYW0Wv9FqFpUkC6g33Ad/7wUkHIT/qSRXMjq
	KE5F8NvC+16zARKUnNjQrCA0Pmss6WYVp5f7htCd+EvmHRCqYMQyChwfjI2G39Ro/2Xr
	5NwKFtgwwgrfdOMY6iLKPz3mLZ2ZiG+9ee6HJjp1Jc2tOkJgEN/YjXBxOjdjRf4hf/7q
	WYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u49ADjhR3li1uDC0g/xadnGBt1ogNE7siSReqzG22EU=;
	b=JvWGbgnfSdO5YJPUD2wWpXeHRuONvwWL9xHlNdmho/+czbirMJpkFhi2cdvKJzjuXK
	by8PS4ATFENFsMpoR/nfsLylbxj913J4/3g+fqRpV1DYFsu1wJ1axDDfw36dBwfvrpb9
	r/7DgomCG9nMl9emOPfSyK5Aw17E4yt8//G+pDRj9ulK7iulyFrpdoCXIbkA0iXRcyvd
	JqsFRBoNkhKjYI4DtnrOMEAw0ALWDxuFLp7b5obf++ZboBrGyZyHpSjeQ+9noTTVGlSp
	fVZrknr3TPYkQwwnSaqDSv6d3Tr/koRyu0i05F+XzkrXJnKeq40ZHtnzdBV67mQ0+qUS
	PhMA==
X-Gm-Message-State: AD7BkJIAUq2BmHYbOBpZQ3x3q5uw0AiQvzP6hTvDoxWchVmK09UTy3mUFKDMlRZbyQ8MHw==
X-Received: by 10.140.107.74 with SMTP id g68mr13604595qgf.82.1457136209233;
	Fri, 04 Mar 2016 16:03:29 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	w70sm2745344qge.13.2016.03.04.16.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 16:03:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 00:03:22 +0000
Message-Id: <1457136202-20890-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] nspr: Fix build regression on musl from last upgrade
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
X-List-Received-Date: Sat, 05 Mar 2016 00:03:30 -0000

This patch is no longer required as upstreamed has fixed
the problem in more comprehensive way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Remove-the-check-for-LINUX-glibc-case.patch | 35 ----------------------
 meta/recipes-support/nspr/nspr_4.12.bb             | 11 ++-----
 2 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch

diff --git a/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch b/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch
deleted file mode 100644
index 5b17355..0000000
--- a/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9b9c95e0390395c7e9ad24a882deb87a50846059 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Aug 2015 17:10:34 -0700
-Subject: [PATCH] Remove the check for LINUX == glibc case
-
-Here it does not consider the case where musl can be an options it does
-consider the bionic case with !defined(ANDROID) but musl does not define
-and musl'ism defines like that
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- pr/src/misc/prnetdb.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/pr/src/misc/prnetdb.c b/pr/src/misc/prnetdb.c
-index b86248f..dc83a56 100644
---- a/pr/src/misc/prnetdb.c
-+++ b/pr/src/misc/prnetdb.c
-@@ -61,10 +61,7 @@ PRLock *_pr_dnsLock = NULL;
- #define _PR_HAVE_GETPROTO_R_POINTER
- #endif
- 
--#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT)) \
--	|| (defined(LINUX) && defined(_REENTRANT) \
--        && !(defined(__GLIBC__) && __GLIBC__ >= 2) \
--        && !defined(ANDROID))
-+#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT))
- #define _PR_HAVE_GETPROTO_R
- #define _PR_HAVE_GETPROTO_R_POINTER
- #endif
--- 
-2.1.4
-
diff --git a/meta/recipes-support/nspr/nspr_4.12.bb b/meta/recipes-support/nspr/nspr_4.12.bb
index 2fd801f..168341b 100644
--- a/meta/recipes-support/nspr/nspr_4.12.bb
+++ b/meta/recipes-support/nspr/nspr_4.12.bb
@@ -9,20 +9,15 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
            file://remove-srcdir-from-configure-in.patch \
-	   file://0002-Add-nios2-support.patch \
-          "
-
-SRC_URI += "file://nspr.pc.in"
+           file://0002-Add-nios2-support.patch \
+           file://nspr.pc.in \
+"
 
 CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
                                           -D_PR_HAVE_OFF64_T -D_PR_INET6 -D_PR_HAVE_INET_NTOP \
                                           -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO \
                                           -D_PR_INET6_PROBE'"
 
-SRC_URI_append_libc-musl = "\
-        file://0001-Remove-the-check-for-LINUX-glibc-case.patch \
-        "
-
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-- 
1.8.3.1


