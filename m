Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 379FC71D82
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 02:32:01 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id x184so31066585oia.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Nv/8tMeWTHzeiPMLIU/KDuLrcdupwdtA9dEB80h3Ej4=;
	b=acS3nloAIw2s6AinHuMDgweyZnKClYy6O7R2iSkIgqiT16JTePWFfY60Ts70LnXq5R
	gDR4tqVzOhMDpSLiwaglqyWwndYMjg//yvw5QXPMsjMapnDIQlENvxQl88+uABnn7m9x
	hPeE5pwkAdlZI+LePCE7imuE4u6L3fH/nPGMLLLsgzb0wy0NbGOFoRO6z1IQVoH4jF4H
	xEmIMl07Xc2feVJz+gDNbWfvvYN4bFMPrsPn5V9i+7U0kBlLLlXoB1OVJWx6bxFVV+jY
	5iM0iXChS0S6WmgUpZ6NGPAnDPz1BadId+sGRmPSzTTWepnjVdLScOSdBZmd53xMzNfD
	OcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Nv/8tMeWTHzeiPMLIU/KDuLrcdupwdtA9dEB80h3Ej4=;
	b=c5acpsVdU9vZAH7T58KcKkc0GdAwwDcEeRxa0PSpuGTBYJgMGW1ugOg2yDLT6Cr8WZ
	0y7Gjyyy+pwcAQnounyrvR9L9xPM59qnYv7motmL2Yqhg3gKwacNbuLbXuWnwn2TX8mS
	a7GSunHNKL6Eb/yY/ecnJTVfLnC3/x0zLbTZp9By3VhsuVSwwlKGrpR0jjFCySXck5T/
	XUKfFm+SrR7wCIZ3UNovEC32TVKk4si+JZrPrE12FdmD5g9QtIXQSPvQ613O0gS0C1v3
	pSXj7YQ4imgSayw7lutNewrRF35f67S9j9Wi1IjRGJ/P8DIdAXavnacTSIAol2VF/XlY
	HU7Q==
X-Gm-Message-State: AN3rC/4LGhugC3ai5yTm5GTMZJd+K24HPjHCs6KkHbfzM+4vWG4adY1l
	cOf8SLjYqt+SD2Rr
X-Received: by 10.84.254.4 with SMTP id b4mr5332957plm.64.1492655522919;
	Wed, 19 Apr 2017 19:32:02 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r73sm6790312pfa.65.2017.04.19.19.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 19:32:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 19:31:45 -0700
Message-Id: <20170420023147.1868-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420023147.1868-1-raj.khem@gmail.com>
References: <20170420023147.1868-1-raj.khem@gmail.com>
Subject: [PATCH 3/5] pax: Fix build with gcc7
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
X-List-Received-Date: Thu, 20 Apr 2017 02:32:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pax/0001-Add-a-comment-for-fallthrough.patch   | 38 ++++++++++++++++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |  9 ++---
 2 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/pax/pax/0001-Add-a-comment-for-fallthrough.patch

diff --git a/meta/recipes-extended/pax/pax/0001-Add-a-comment-for-fallthrough.patch b/meta/recipes-extended/pax/pax/0001-Add-a-comment-for-fallthrough.patch
new file mode 100644
index 00000000000..b76f85aa458
--- /dev/null
+++ b/meta/recipes-extended/pax/pax/0001-Add-a-comment-for-fallthrough.patch
@@ -0,0 +1,38 @@
+From e67bb3debe582f0e77770b714bd012bb1082fc41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Apr 2017 11:32:00 -0700
+Subject: [PATCH] Add a comment for fallthrough
+
+Fixes warnings with gcc7 e.g.
+
+../../../../../../../workspace/sources/pax/src/options.c: In function 'tar_options':
+../../../../../../../workspace/sources/pax/src/options.c:725:7: error: this statement may fall through [-Werror=implicit-fallthrough=]
+    if (opt_add ("write_opt=nodir") < 0)
+       ^
+../../../../../../../workspace/sources/pax/src/options.c:730:2: note: here
+  case 'O':
+  ^~~~
+cc1: all warnings being treated as errors
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/options.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/options.c b/src/options.c
+index c663b4e..b80819a 100644
+--- a/src/options.c
++++ b/src/options.c
+@@ -724,6 +724,7 @@ tar_options (int argc, char **argv)
+ 	case 'o':
+ 	  if (opt_add ("write_opt=nodir") < 0)
+ 	    tar_usage ();
++	  /* fallthru */
+ 	case 'O':
+ 	  Oflag = 1;
+ 	  break;
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index 9b4e17b3df7..6df9a8186b6 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -15,10 +15,11 @@ PR = "r2"
 DEPENDS_append_libc-musl = " fts "
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.bz2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
-	file://fix_for_compile_with_gcc-4.6.0.patch \
-	file://pax-3.4_fix_for_x32.patch \
-        file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
-"
+           file://fix_for_compile_with_gcc-4.6.0.patch \
+           file://pax-3.4_fix_for_x32.patch \
+           file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
+           file://0001-Add-a-comment-for-fallthrough.patch \
+           "
 
 SRC_URI_append_libc-musl = " file://0001-Fix-build-with-musl.patch \
                              file://0001-use-strtoll-instead-of-strtoq.patch \
-- 
2.12.2


