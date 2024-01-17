Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8F5C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 13:08:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1544.1705496906515324000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 05:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aociWd7i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e86a76c11so14171895e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705496905; x=1706101705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDUiRVaXB98m6lHixE/3qW41L5ZMJQOj5+X/Bbq8jnc=;
        b=aociWd7ibjKT7T0EhbiekfsMtl9GpoG+azyp+Avzd3ePq1ZC/hsEv/IrpfYcH+IEIH
         V0j9fHertKN57sx1O6dIp5CPoa1sl18mOipNa6aoMWez4Pja5wbX4Zlyt2RQeIUkgQ5K
         fd+3Q52zRZau6l1UExp1U2n00Po9mWVHx2HIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496905; x=1706101705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDUiRVaXB98m6lHixE/3qW41L5ZMJQOj5+X/Bbq8jnc=;
        b=L7MZaVY9NQc7fbMIw1XXRjLer4a12Qa12xlaK7JfRaaj1hq3iWVrEU9WBkGqSicYDb
         MEqoEKNS++OmkbzDc0fGoNvPkHSglEhCkcwPQF7z0eXUxfthEywgZyevwfXajMxdn1aq
         YaRBSoZRvT28us65gmW1f7Na0aVCfCcm4BX597UlVKtyZhC1rvgPPIkhkwXv7j1xddY4
         WUmUfZLLAkaolGesq0at8dD2m3NcaD9ag6GM9gxTMX/HYgneRj+DzjC6YpNYNisAcKm/
         buCmGj/QJkyfZn+eIwHF2vKIJDTusR1ppuvXZDRmDWe13To2fB3NffWI6bcH/4/3Ra76
         GA0Q==
X-Gm-Message-State: AOJu0YyUesiRHFhHju6hK44MgTUfI0k46HZtz9JtA2UGDcFnVgNvW+RK
	dXezHJKzy2Q76M663jg3P3XVej0rgmzy9vdP2QqeVvp2X+4=
X-Google-Smtp-Source: AGHT+IE4FeBiaGjyfXjaGmKYdl5363bwxrb71RyCi5Gy3qs83MjjeBzvnbbddV6T0pJFNTdZZxHDLg==
X-Received: by 2002:a1c:4c08:0:b0:40e:61d9:492f with SMTP id z8-20020a1c4c08000000b0040e61d9492fmr3292476wmf.6.1705496904586;
        Wed, 17 Jan 2024 05:08:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3c1d:bf3d:325f:7bb3])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm26263349wms.31.2024.01.17.05.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 05:08:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] libtool: Update nios2 patch to match upstream merged version
Date: Wed, 17 Jan 2024 13:08:19 +0000
Message-Id: <20240117130822.3928928-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
References: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 13:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193909

Update the patch to match the version merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...tool-Fix-support-for-NIOS2-processor.patch | 81 +++++++++----------
 1 file changed, 38 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
index 277afe0af62..676ce7fd1ba 100644
--- a/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
+++ b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
@@ -1,65 +1,60 @@
-From: Marek Vasut <marex@denx.de>
-Subject: [PATCH 07/12] libtool: Fix support for NIOS2 processor
+libtool: Fix support for NIOS2 processor
 
 The name of the system contains the string "nios2". This string
 is caught by the some of the greedy checks for OS/2 in libtool,
 in particular the *os2* branches of switch statements match for
 the nios2 string, which results in incorrect behavior of libtool.
 
-This patch adds an explicit check for *nios2* before the *os2*
-checks to prevent the OS/2 check incorrectly trapping the nios2
-as well.
+Switch to use $host_os instead of $host and tweak the patterns to
+match to avoid this problem for nios2.
+
+* build-aux/ltmain.in: Fix NIOS2 support
+---
+ build-aux/ltmain.in | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
-Signed-off-by: Marek Vasut <marex@denx.de>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00021.html]
+Submitted: https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00021.html
+Reworked and submitted: https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00068.html
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=49e6cb0d4dfdca2a59b909dc4532fe22dbc57ad5]
 
-diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 6fb58ed2..606f17be 100644
---- a/build-aux/ltmain.in
-+++ b/build-aux/ltmain.in
-@@ -519,6 +519,12 @@ libtool_validate_options ()
+Index: libtool-2.4.7/build-aux/ltmain.in
+===================================================================
+--- libtool-2.4.7.orig/build-aux/ltmain.in
++++ libtool-2.4.7/build-aux/ltmain.in
+@@ -518,10 +518,10 @@ libtool_validate_options ()
+     # preserve --debug
      test : = "$debug_cmd" || func_append preserve_args " --debug"
  
-     case $host in
-+      # For NIOS2, we want to make sure that it's not caught by the
-+      # more general OS/2 check below. Otherwise, NIOS2 is the same
-+      # as the default option.
-+      *nios2*)
-+        opt_duplicate_compiler_generated_deps=$opt_preserve_dup_deps
-+        ;;
+-    case $host in
++    case $host_os in
        # Solaris2 added to fix http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16452
        # see also: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=59788
-       *cygwin* | *mingw* | *pw32* | *cegcc* | *solaris2* | *os2*)
-@@ -6246,6 +6252,15 @@ func_mode_link ()
+-      *cygwin* | *mingw* | *pw32* | *cegcc* | *solaris2* | *os2*)
++      cygwin* | mingw* | pw32* | cegcc* | solaris2* | os2*)
+         # don't eliminate duplications in $postdeps and $predeps
+         opt_duplicate_compiler_generated_deps=:
+         ;;
+@@ -6273,8 +6273,8 @@ func_mode_link ()
+ 	fi
  	if test -n "$library_names" &&
  	   { test no = "$use_static_libs" || test -z "$old_library"; }; then
- 	  case $host in
-+	  *nios2*)
-+	    # For NIOS2, we want to make sure that it's not caught by the
-+	    # more general OS/2 check below. Otherwise, NIOS2 is the same
-+	    # as the default option.
-+	    if test no = "$installed"; then
-+	      func_append notinst_deplibs " $lib"
-+	      need_relink=yes
-+	    fi
-+	    ;;
- 	  *cygwin* | *mingw* | *cegcc* | *os2*)
+-	  case $host in
+-	  *cygwin* | *mingw* | *cegcc* | *os2*)
++	  case $host_os in
++	  cygwin* | mingw* | cegcc* | os2*)
  	      # No point in relinking DLLs because paths are not encoded
  	      func_append notinst_deplibs " $lib"
-@@ -6316,6 +6331,11 @@ func_mode_link ()
+ 	      need_relink=no
+@@ -6343,8 +6343,8 @@ func_mode_link ()
+ 	      soname=$dlname
  	    elif test -n "$soname_spec"; then
  	      # bleh windows
- 	      case $host in
-+	      *nios2*)
-+		# For NIOS2, we want to make sure that it's not caught by the
-+		# more general OS/2 check below. Otherwise, NIOS2 is the same
-+		# as the default option.
-+		;;
- 	      *cygwin* | mingw* | *cegcc* | *os2*)
+-	      case $host in
+-	      *cygwin* | mingw* | *cegcc* | *os2*)
++	      case $host_os in
++	      cygwin* | mingw* | cegcc* | os2*)
  	        func_arith $current - $age
  		major=$func_arith_result
--- 
-2.25.1
-
+ 		versuffix=-$major
-- 
2.39.2


