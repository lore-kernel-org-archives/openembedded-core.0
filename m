Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D564CD342A
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 18:58:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.22358.1725217122396904477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 11:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=am03PIbZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374bd059b12so877678f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725217120; x=1725821920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebwbLDX/GioQZ2Q1US1d+xP/SuVMj/8vjWj5RsYb030=;
        b=am03PIbZW240Nb4GmLj2QfRs68c3394FALWFAxj3ApG1m6wa7e68Qrft97+8WlfdqV
         Kz/HjN//NFqyKAx4QbPD6lt1IWI4WBtd1s7wZqbGv/bb9P1wMA2evI/w6bZg/MwHG+MN
         N3FJ1A75DwdzQRRUKOpOAQVROt9bHD19ZybTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725217120; x=1725821920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebwbLDX/GioQZ2Q1US1d+xP/SuVMj/8vjWj5RsYb030=;
        b=AvSzMIRZNegVbHXUS6w3MC6v3v0vwhwZcLILgYzwqNjcTx/2D7LE4VFCXbUJQ2Ptaf
         wK33V6y2p2Jsuho3FD+Em8Jwd5y/3G3m3pQsPny/lAyztAKgWUVdmHwBjpjK8RLzd/AU
         R59eTiWzUCZDPt61PePjg3XaqSCcHP3krY2E/dFFd3bOW8kTJV3sqomSxp+YidmiIcf+
         2jHsaQdXwmW4oC178ZgQHsMgqmNfjy+ile7PO4KWe/4GNWw9XVH1AU06cpLJtunUjkON
         yvWgNSopqtwkWBdKCfC3a9Lh8vuj7YB86sLVAot24yS14bozLlRBqFqXkFROKTHUDhl7
         VckQ==
X-Gm-Message-State: AOJu0YxjbUqzeOThSW5ArdY0e3ROSywBsXE3MoXV44WvBIJ6kmlP9umS
	03luK+5kpjRJy3nPNd1IRfiN+IlsavSVwXKgmkLmT93AlR5uNTqOZOZb5QceEzf96Wmu27mQQhy
	+
X-Google-Smtp-Source: AGHT+IEO8unpTomQtePZw7NBZxqtyrjeUO1bkzOno9cpZRKvd7IW5VceUMJfsfbVL+tsLSrUNd0hzA==
X-Received: by 2002:a5d:46d2:0:b0:374:ba83:8d73 with SMTP id ffacd0b85a97d-374ba838e6bmr3502114f8f.8.1725217120233;
        Sun, 01 Sep 2024 11:58:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d8a8:ecc:6edb:f5dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27c70sm113285695e9.35.2024.09.01.11.58.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 11:58:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libtool: 2.5.1 -> 2.5.2
Date: Sun,  1 Sep 2024 19:58:38 +0100
Message-ID: <20240901185838.194043-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901185838.194043-1-richard.purdie@linuxfoundation.org>
References: <20240901185838.194043-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 18:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204054

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libtool-2.5.1.inc => libtool-2.5.2.inc}  |  2 +-
 ...-cross_2.5.1.bb => libtool-cross_2.5.2.bb} |  0
 ...ative_2.5.1.bb => libtool-native_2.5.2.bb} |  0
 .../libtool/libtool/fixinstall.patch          | 35 ++++++++++++-------
 .../{libtool_2.5.1.bb => libtool_2.5.2.bb}    |  0
 ...ol_2.5.1.bb => nativesdk-libtool_2.5.2.bb} |  0
 6 files changed, 23 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.5.1.inc => libtool-2.5.2.inc} (94%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.5.1.bb => libtool-cross_2.5.2.bb} (100%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.5.1.bb => libtool-native_2.5.2.bb} (100%)
 rename meta/recipes-devtools/libtool/{libtool_2.5.1.bb => libtool_2.5.2.bb} (100%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.1.bb => nativesdk-libtool_2.5.2.bb} (100%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.5.1.inc b/meta/recipes-devtools/libtool/libtool-2.5.2.inc
similarity index 94%
rename from meta/recipes-devtools/libtool/libtool-2.5.1.inc
rename to meta/recipes-devtools/libtool/libtool-2.5.2.inc
index 94344d4d416..bde80e12ce7 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.1.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.2.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://alpha.gnu.org/gnu/libtool/libtool-${PV}.tar.gz \
            file://nohardcodepaths.patch \
           "
 
-SRC_URI[sha256sum] = "6a83edafd42d4e2ebdc09579f99ce828d5f932f1738de02495cc8c2884e430ce"
+SRC_URI[sha256sum] = "29275fb45b236d6ff720a433f9cd5f61ea2f52cc3aa2e5f89ba57726bda54793"
 
 inherit autotools texinfo
 EXTRA_AUTORECONF = "--exclude=libtoolize"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb b/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.1.bb b/meta/recipes-devtools/libtool/libtool-native_2.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-native_2.5.1.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.5.2.bb
diff --git a/meta/recipes-devtools/libtool/libtool/fixinstall.patch b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
index 48330d82fbf..94601b1beb8 100644
--- a/meta/recipes-devtools/libtool/libtool/fixinstall.patch
+++ b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
@@ -18,10 +18,11 @@ RP 2011/11/16
 
 Updated by: Robert Yang <liezhi.yang@windriver.com>
 
-diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
---- a/build-aux/ltmain.in
-+++ b/build-aux/ltmain.in
-@@ -2355,7 +2355,7 @@ func_mode_install ()
+Index: libtool-2.5.2/build-aux/ltmain.in
+===================================================================
+--- libtool-2.5.2.orig/build-aux/ltmain.in
++++ libtool-2.5.2/build-aux/ltmain.in
+@@ -2381,7 +2381,7 @@ func_mode_install ()
  	dir=$func_dirname_result
  	func_append dir "$objdir"
  
@@ -29,8 +30,8 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 +	if test "$fast_install" = no && test -n "$relink_command"; then
  	  # Strip any trailing slash from the destination.
  	  func_stripname '' '/' "$libdir"
-	  destlibdir=$func_stripname_result
-@@ -2394,7 +2394,7 @@ func_mode_install ()
+ 	  destlibdir=$func_stripname_result
+@@ -2419,7 +2419,7 @@ func_mode_install ()
  	  shift
  
  	  srcname=$realname
@@ -39,7 +40,7 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
  
  	  # Install the shared library and build the symlinks.
  	  func_show_eval "$install_shared_prog $dir/$srcname $destdir/$realname" \
-@@ -6162,15 +6162,15 @@ func_mode_link ()
+@@ -6276,17 +6276,17 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
@@ -48,7 +49,9 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 -	    *)
 -	      case "$compile_rpath " in
 -	      *" $absdir "*) ;;
--	      *) func_append compile_rpath " $absdir" ;;
+-	      *) case $absdir in
+-                 "$progdir/"*) func_append compile_rpath " $absdir" ;;
+-		 esac
 -	      esac
 -	      ;;
 -	    esac
@@ -57,14 +60,16 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 +	    #*)
 +	    #  case "$compile_rpath " in
 +	    #  *" $absdir "*) ;;
-+	    #  *) func_append compile_rpath " $absdir" ;;
++	    #  *) case $absdir in
++            #     "$progdir/"*) func_append compile_rpath " $absdir" ;;
++	#	 esac
 +	    #  esac
 +	    #  ;;
 +	    #esac
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -6236,15 +6236,15 @@ func_mode_link ()
+@@ -6352,17 +6352,17 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
@@ -73,7 +78,9 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 -	    *)
 -	      case "$compile_rpath " in
 -	      *" $absdir "*) ;;
--	      *) func_append compile_rpath " $absdir" ;;
+-	      *) case $absdir in
+-                 "$progdir/"*) func_append compile_rpath " $absdir" ;;
+-		 esac
 -	      esac
 -	      ;;
 -	    esac
@@ -82,14 +89,16 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 +	    #*)
 +	    #  case "$compile_rpath " in
 +	    #  *" $absdir "*) ;;
-+	    #  *) func_append compile_rpath " $absdir" ;;
++	    #  *) case $absdir in
++            #     "$progdir/"*) func_append compile_rpath " $absdir" ;;
++	#	 esac
 +	    #  esac
 +	    #  ;;
 +	    #esac
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -6590,8 +6590,8 @@ func_mode_link ()
+@@ -6705,8 +6705,8 @@ func_mode_link ()
  		  eval libdir=`$SED -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
  		  test -z "$libdir" && \
  		    func_fatal_error "'$deplib' is not a valid libtool archive"
diff --git a/meta/recipes-devtools/libtool/libtool_2.5.1.bb b/meta/recipes-devtools/libtool/libtool_2.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool_2.5.1.bb
rename to meta/recipes-devtools/libtool/libtool_2.5.2.bb
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.1.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.5.1.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.5.2.bb

