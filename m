Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (unknown [209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 25B066FB7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 11:56:48 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hi2so3531012wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 04:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rFfpkhuYWKNTYas3uj1yFy5yPOAcjGQoYMxtVpb5UaU=;
	b=UvA+P/QHTnHHzm0yDfA5st3Ma/7/Y57ZjNzuxdiP/ETi9Y/X4KGTtx12J9Kb+uBQP2
	AYqE4uqPvY/hcZ3ynGQm60C1p94uFUiXHQJ6PmQ4StSPXUpZuTQxh1UP7qpPl3GaIequ
	2TBbnK9Ku+ypH+hBsFrOH9mY7bLfLiEBom9YoNjzC0rLEBZnref/noZYhp/bmfvUTlel
	S7hiNDLxKHt5++iiel7Sg+til9XEE35lMPhDRKLteLeErcvKXipyRnnaBW72A2c8KoZm
	OmtCN7tBERd5ru43qWlmTCM+MUSLYjuSZRaiPGazsCiK8loYNjgGa7VRbtd3VEiwaGsg
	BnLQ==
X-Gm-Message-State: ALoCoQmyBehYeyFo3Cvv2vbn5rsQLY+04lcrMAcK5OKQHG4R/X9Lv+iDMU2Ur+bCYGTbrti5a+Gl
X-Received: by 10.194.184.179 with SMTP id ev19mr50137207wjc.85.1401278206565; 
	Wed, 28 May 2014 04:56:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:23 +0100
Message-Id: <0124c6edfd85eba465f188d08a03a56e7e189e1a.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
Subject: [PATCH 1/4] readline: add missing STRUCT_DIRENT_D_* symbols to config.h.in
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
X-List-Received-Date: Wed, 28 May 2014 11:56:49 -0000

readline maintains config.h.in by hand but several symbols are incorrect.  Fix
these so that the test results are reflected in config.h.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../readline-6.3/config-dirent-symbols.patch       |   34 ++++++++++++++++++++
 meta/recipes-core/readline/readline.inc            |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch

diff --git a/meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch b/meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
new file mode 100644
index 0000000..cfff03c
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
@@ -0,0 +1,34 @@
+Fix the names of the STRUCT_DIRENT_D symbols to match the names used by both
+configure and the source code.
+
+Upstream-Status: Submitted (http://lists.gnu.org/archive/html/bug-readline/2014-05/msg00008.html)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From e48656811550774892fd4e0f4b3c7d418422da52 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 27 May 2014 22:32:31 +0100
+Subject: [PATCH] config.h.in: fix names of STRUCT_DIRENT_D symbols
+
+---
+ config.h.in |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/config.h.in b/config.h.in
+index a67e43e..a42acc5 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -244,9 +244,9 @@
+ 
+ #undef HAVE_GETPW_DECLS
+ 
+-#undef STRUCT_DIRENT_HAS_D_INO
++#undef HAVE_STRUCT_DIRENT_D_INO
+ 
+-#undef STRUCT_DIRENT_HAS_D_FILENO
++#undef HAVE_STRUCT_DIRENT_D_FILENO
+ 
+ #undef HAVE_BSD_SIGNALS
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 9d78aa9..c33e91a 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -13,6 +13,7 @@ DEPENDS += "ncurses"
 
 SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
            file://configure-fix.patch \
+           file://config-dirent-symbols.patch \
            file://norpath.patch \
            file://acinclude.m4"
 
-- 
1.7.10.4


