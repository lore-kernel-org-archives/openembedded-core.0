Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBl-0001oq-2E
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:32:01 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:22 -0700
Received: by mail-wi0-f177.google.com with SMTP id hn17so923629wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=x1YbtVo9zwDydt6P8sTsh2IuaoXKV783OYHJ2wGUlfI=;
	b=OY/CpkUeNSJO5KnA3ydz/m6lMUpiInD8nSJambQQTzEA1GHJTijHANLhQH1rf6GXA9
	w0IP0RSaVELeMiJX5o5U3ZP4z+NjTyeYm5zYxHSCICLVxs4BR44/JM6M+8Zek47inHgw
	zAQ3lwUiut+oMocK/K1lhB1+XTdCtzzw9kOx2wDD1FuRd9ajh8GFXgyOjUFHuPNE04ri
	lzHjOFSQv10Rju5CfiGpZWntabeY7Yo3GBj7mk2XW9TXxDxw9e75i94U8wZuvBPLWrrv
	mJU9zPC3UGs+lwzidecNuL+oorRaKFNGbjq/4sAMwlCWVD1SsW41tUJ3s93csMNtykeW
	Y//w==
Received: by 10.180.106.97 with SMTP id gt1mr27192897wib.5.1347391162315;
	Tue, 11 Sep 2012 12:19:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:07 +0100
Message-Id: <1347391088-30390-17-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmsoqXtFZqL5Fg6GvsFnBlJK6RtEafF3q9T7iA6nOHVeGj7dBQWtHSXXoQqqWYdGmPCu12z
Subject: [RFC 17/18] libx11-diet: remove un-needed chunk from stubs patch
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
X-List-Received-Date: Tue, 11 Sep 2012 19:32:01 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libx11/X18NCMSstubs.diff              |   20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
index 8cd1870..9e91a8b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
@@ -519,23 +519,3 @@ Index: libX11-1.3/src/locking.c
      _XLockMutex_fn = _XLockMutex;
      _XUnlockMutex_fn = _XUnlockMutex;
      _XCreateMutex_fn = _XCreateMutex;
-Index: libX11-1.3/configure.ac
-===================================================================
---- libX11-1.3.orig/configure.ac
-+++ libX11-1.3/configure.ac
-@@ -289,7 +289,14 @@ else
- fi
- AC_SUBST(KEYSYMDEF)
- 
--AM_CONDITIONAL(UDC, test xfalse = xtrue)
-+AC_ARG_ENABLE(udc,
-+              AC_HELP_STRING([--disable-udc],
-+                [Disable Xlib support for UDC *EXPERIMENTAL*]),
-+              [UDC=$enableval],[UDC=yes])
-+AM_CONDITIONAL(UDC, [test x$UDC = xyes ])
-+if test x"$UDC" = "xyes"; then
-+	AC_DEFINE(UDC,1,[Include support for UDC])
-+fi
- 
- AC_ARG_ENABLE(xcms,
-               AC_HELP_STRING([--disable-xcms],
-- 
1.7.10



