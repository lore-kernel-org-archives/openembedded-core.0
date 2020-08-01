Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.4586.1596317032506221009
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t5A2Jhir;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id c15so15021674edj.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lqRAGm+pz2f2aoVL/iBWVISY1D5chpdwZx7kFWtncKQ=;
        b=t5A2Jhirrv202Fo9LnfEd/dS/Tp43wQ2Cb+Y20d9ivGuuq50Ec+Lpv8ec/z/YZQRt/
         lNipWtuUuUz/JtzRjFVkjasMFvC17CzYvU8VRY9ggZ/i/SeLOMIZG3eiSKUFOoCoaVZn
         26wiZ5wxpEOAjE0PrQeu+HSkHu5t1YE349ErgGbGR/O4zOTgz2wOejSSRtjqt0mv9FUL
         2VjCPrrB5/SDq84Iqw4F0A6ohHWlJHRhCDFLFu3nQMTwGUr3RmZA9x5vzPWl8IHAtXRO
         nq1X1J3OP8FIRn2EBQHoJOnUyizap9ry3kIk2tD0V0Cz/lKmcjNdf7SaTNLIdhWaWWVA
         yrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lqRAGm+pz2f2aoVL/iBWVISY1D5chpdwZx7kFWtncKQ=;
        b=gBP6PSClFdJzga7cdEP+Z0gjK710WyeJ/SBRQPJClkIfjjf66jceh860zIXULYG8Fh
         Ev67IWJvhRDZAqRAVu/huy1gDyy+UOgfTG6ABfvBDKHLg3lwi58J8o8AontANplEM6nZ
         HNzan64t01kWwTL4D/WE4+DY16fMrmlJv3ciYLc4JWaISylmlsQ8wWbgskrX9+h0SGSF
         uqx7LgF1rdnXBxSIclMR1x92pEo2M1Ayl9P8P/04GfTfyCZHDUYjCCfFMLs2oYJXexR1
         +JYy1DO0DjzbYr49VhTaX3b+Gd9HGJSDLGIzXYPS2IFymkivyJFAIBSkamiHyjlp7aEV
         VKqQ==
X-Gm-Message-State: AOAM531kut5DMfXrpeiyBeijwvllePaLtyJRNssF2HNMwl8H0STletYd
	eIyr/rkjxVx2Zo+NWMhVIVN+7tLfFm4=
X-Google-Smtp-Source: ABdhPJxQQZtljBkehHe+mYpMITXd6O2qk1rvho5TKBtDHMdcmpQ43nFcc1IiE3+5FLTrwrTD1wBACw==
X-Received: by 2002:aa7:de09:: with SMTP id h9mr9293305edv.277.1596317030784;
        Sat, 01 Aug 2020 14:23:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/13] vala: update 0.48.6 -> 0.48.7
Date: Sat,  1 Aug 2020 23:23:31 +0200
Message-Id: <20200801212335.14922-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove patch, as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...don-t-append-dirty-if-we-re-not-in-g.patch | 55 -------------------
 meta/recipes-devtools/vala/vala_0.48.6.bb     |  7 ---
 meta/recipes-devtools/vala/vala_0.48.7.bb     |  5 ++
 3 files changed, 5 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
 delete mode 100644 meta/recipes-devtools/vala/vala_0.48.6.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.48.7.bb

diff --git a/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
deleted file mode 100644
index ac9dc8c83a..0000000000
--- a/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 2460d7b79f7e90dcfeebde5e9c53d9b6798a1f3c Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 21 Feb 2012 17:12:50 +0100
-Subject: [PATCH] git-version-gen: don't append -dirty if we're not in git
- repo
-
-* for example if we have some dirty directory and we unpack clean vala tarball in it, then it will append -dirty
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Inappropriate [OE-Specific]
----
- build-aux/git-version-gen |   25 ++++++++++++++-----------
- 1 files changed, 14 insertions(+), 11 deletions(-)
-
-diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
-index 0fa6faa..1d1f9d2 100755
---- a/build-aux/git-version-gen
-+++ b/build-aux/git-version-gen
-@@ -126,18 +126,21 @@ fi
- 
- v=`echo "$v" |sed 's/^v//'`
- 
--# Don't declare a version "dirty" merely because a time stamp has changed.
--git status > /dev/null 2>&1
-+if test -d .git
-+then
-+	# Don't declare a version "dirty" merely because a time stamp has changed.
-+	git status > /dev/null 2>&1
- 
--dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
--case "$dirty" in
--    '') ;;
--    *) # Append the suffix only if there isn't one already.
--	case $v in
--	  *-dirty) ;;
--	  *) v="$v-dirty" ;;
--	esac ;;
--esac
-+	dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
-+	case "$dirty" in
-+	    '') ;;
-+	    *) # Append the suffix only if there isn't one already.
-+		case $v in
-+		  *-dirty) ;;
-+		  *) v="$v-dirty" ;;
-+		esac ;;
-+	esac
-+fi
- 
- # Omit the trailing newline, so that m4_esyscmd can use the result directly.
- echo "$v" | tr -d '\012'
--- 
-1.7.8.4
-
diff --git a/meta/recipes-devtools/vala/vala_0.48.6.bb b/meta/recipes-devtools/vala/vala_0.48.6.bb
deleted file mode 100644
index 9dace1348c..0000000000
--- a/meta/recipes-devtools/vala/vala_0.48.6.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
-           file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
-           "
-
-SRC_URI[sha256sum] = "d18d08ed030ce0e0f044f4c15c9df3c25b15beaf8700e45e43b736a6debf9707"
diff --git a/meta/recipes-devtools/vala/vala_0.48.7.bb b/meta/recipes-devtools/vala/vala_0.48.7.bb
new file mode 100644
index 0000000000..2e61db1052
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.48.7.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+
+SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
+
+SRC_URI[sha256sum] = "28de33e28da24500cc1675c3a6ced1301c9a6a5e6dd06193569001f9ce9a5c53"
-- 
2.27.0

