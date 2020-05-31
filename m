Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.17625.1590940456096139564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NvHyd1Mn;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id k8so5424912edq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEPX3kMjm12GQ+0vLPvZ1pB640Qd1Pr1w2pmYCttR58=;
        b=NvHyd1MnUp+Zo+MZ9ZVopDKGO4asvWFZJmazYuyZYQ+BCDBhaXYW5csL9GJ6xM6ktQ
         xWp9/EN0vy7qO0KPZ27eIJG42kAH97Bg/Fg9hO5sAB0HUSNYpNl/GbUg0rMn3Nki1XXj
         kGXMS2BZ8SQHPAZGjDSEFBndbYwwxjoJDDqZ2RDEcEguLer4a+eVIPHBW/V9wLYnknbu
         7wjKg8pDo4Kk54yrgVUUrhdYQU1MRTxTgsXqrmAxsShJEldD8xs1v60+L98nq28h+vhU
         8z3p47MTMOeAO4rcNZKJlwQPgf40WfswgZmpGP+UhNi8VJBn0NW+abEbn//4NI5IF3Bi
         HKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEPX3kMjm12GQ+0vLPvZ1pB640Qd1Pr1w2pmYCttR58=;
        b=nfe2nxXqNPFiZUxhRCMSI1je0KjelMhobCqke4qsijj6mwS/hcNFAmf19ZP1iBv2BJ
         FdmWiccH78Bvw35e6lNQscci8+FlFgx42KoJ36aonDgMIvHgAoHn7vQl4UZwNNVkjcS/
         wvKdjIIw0ZdjJO8Z6izSd6TqjNMpFHCLuAEhQkyWxYZguFxo4yHXepqYA14e/UX7e1Mj
         0nUzeE2O9YKQR31RrV3FOyFGmyYa5Xxe1PdViP7fFoFUg0SCLKmFTjLfUP+qNsfBJeYu
         VCXNbWE6EhGxDfn/HgI+J38pE37mAhkxkn58IVndPbFOtMLTJzmW2Hw8w5e1Wl8rMAaT
         iMhw==
X-Gm-Message-State: AOAM530g1euOnr2Eae2eLR55s+xII64/TvJa0HnPZE3iurVBx3oGXZuJ
	FBIl+exFrcRWdBBL1E6mtbowt/TC
X-Google-Smtp-Source: ABdhPJwsYyqRlnQEvXllb/uw9CcpvzsC2Pe0KZnK6J0x+a4TO1WH8Wa9uR6yfzbKzTYEBBIz/HVjHg==
X-Received: by 2002:a50:9547:: with SMTP id v7mr18575735eda.78.1590940454439;
        Sun, 31 May 2020 08:54:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 53/70] bison: 3.5.4 -> 3.6.2
Date: Sun, 31 May 2020 17:52:37 +0200
Message-Id: <20200531155254.10283-53-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop dont-depend-on-help2man.patch.patch, as pre-build manpages
are already packaged into source tarballs.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../bison/dont-depend-on-help2man.patch.patch | 44 -------------------
 .../bison/{bison_3.5.4.bb => bison_3.6.2.bb}  |  5 +--
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
 rename meta/recipes-devtools/bison/{bison_3.5.4.bb => bison_3.6.2.bb} (91%)

diff --git a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
deleted file mode 100644
index 8a41a3a762..0000000000
--- a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 31bb81ef15c42b10844eb8af8738f672076edf0e Mon Sep 17 00:00:00 2001
-From: Marko Lindqvist <cazfi74@gmail.com>
-Date: Tue, 21 Apr 2015 00:48:45 -0700
-Subject: [PATCH] doc/local.mk: dont-depend-on-help2man.patch
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-
-Updated for bison 3.0.4
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- doc/local.mk | 9 +--------
- 1 file changed, 1 insertion(+), 8 deletions(-)
-
-diff --git a/doc/local.mk b/doc/local.mk
-index d12836e..f9bf332 100644
---- a/doc/local.mk
-+++ b/doc/local.mk
-@@ -101,10 +101,7 @@ endif ! CROSS_COMPILING
- ## Man Pages.  ##
- ## ----------- ##
- 
--dist_man_MANS = $(top_srcdir)/doc/bison.1
--
--EXTRA_DIST += $(dist_man_MANS:.1=.x)
--MAINTAINERCLEANFILES += $(dist_man_MANS)
-+EXTRA_DIST += bison.x
- 
- # Differences to ignore when comparing the man page (the date).
- remove_time_stamp = \
-@@ -127,10 +124,6 @@ $(top_srcdir)/doc/bison.1: $(MAN_DEPS)
- 	fi
- 	$(AM_V_at)rm -f $@*.tmp
- 
--if ENABLE_YACC
--nodist_man_MANS = doc/yacc.1
--endif
--
- ## ----------------------------- ##
- ## Graphviz examples generation. ##
- ## ----------------------------- ##
diff --git a/meta/recipes-devtools/bison/bison_3.5.4.bb b/meta/recipes-devtools/bison/bison_3.6.2.bb
similarity index 91%
rename from meta/recipes-devtools/bison/bison_3.5.4.bb
rename to meta/recipes-devtools/bison/bison_3.6.2.bb
index 124bc41d3e..2ec9381231 100644
--- a/meta/recipes-devtools/bison/bison_3.5.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.6.2.bb
@@ -10,11 +10,10 @@ SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
-           file://dont-depend-on-help2man.patch.patch \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
-"
-SRC_URI[sha256sum] = "4c17e99881978fa32c05933c5262457fa5b2b611668454f8dc2a695cd6b3720c"
+           "
+SRC_URI[sha256sum] = "4a164b5cc971b896ce976bf4b624fab7279e0729cf983a5135df7e4df0970f6e"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.26.2

