Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.7178.1588683741941377155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aPdvZXVH;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id f13so2606544wrm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MSVtvCq8aEt2rRkFP9eFXQDlQS8OMbfFkhecsOtfNfA=;
        b=aPdvZXVHKqWw0EG2mU3EwjiINJaRCo2xZ0iIKzzZvSAZzAVCoYSAoEYd/ajuGxBSle
         0VRTk5NkjaLTlrCc9uBOoDZWAuKt7GBXS9uZUtdEO2ruyF7RHpciqGaPVqne91j6hnDj
         cjkCAco3gFFwxxv8m75j4/ARNb4kuphOGPQb0BRbf4TVcaIvAJ1Mu72AHQJksPqsYxpl
         DaP0eK6cqUyVQP9QW4qKFDP9XG5OCizf6w2/gzgvd32ojedOKGtrj3kT2fLdmO3aICH/
         vea/eOoHpuW4wk3ibQ/58P4n1l6TjwoBMfOk+8LyEohh46agULsEgDq7P9Fe+M4vXFFW
         Zzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MSVtvCq8aEt2rRkFP9eFXQDlQS8OMbfFkhecsOtfNfA=;
        b=Y8daCsU1nm5shQjOyWt1AmHtHNU/75PLs050vA8Fe91i+TlryZ/eBfideMP6dYOu1M
         I67w8mH8SbMZNyZEmXgXC7/adNP5C1eFeEAalkF0s4ekkFqbu9QNcxgq+4tu2osh8UOP
         Mkqmu9QKYTFlPinhKK1Cb3FYrARuOU/XPE9VxrG3F1GsGzDn682KEpdSWHf0bN51TcqG
         izvIFZf8T4GOMHkKr0h5c/iRR4PxqVDch8edPP8Ri/P34tC6sM6mfhSvqmnQFcYba5pB
         MkgLa5bbn6Lk50WqjLTE6EPBwHLmcRx95aKTEnKSEfRitezy+7C107Hu1wJcoaUICsGt
         hdfQ==
X-Gm-Message-State: AGi0PuaQUYyH88+N+6l/nuUzp6+KU3dHLZyGvBSbmJou3syCDL6cx/l/
	D9vYVO4TjcxudG+ZqWGW/uezKvh7
X-Google-Smtp-Source: APiQypIsMFrOB0QlMvKym/pbMrJM3akYw8/zNZsbvHlrW8vQrx+NK2gtsSG/t8jFKcsVbLY8bgKdhA==
X-Received: by 2002:a05:6000:1287:: with SMTP id f7mr3724531wrx.345.1588683740025;
        Tue, 05 May 2020 06:02:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/24] build-compare: update to latest revision
Date: Tue,  5 May 2020 15:01:29 +0200
Message-Id: <20200505130133.24930-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the patch as upstream has refactored the code,
and recent reproducible builds work has likely rendered it
unnecessary.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../build-compare/build-compare_git.bb        |  8 ++--
 .../files/Ignore-DWARF-sections.patch         | 37 -------------------
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index b0560cc277..d2a4b5444d 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -5,15 +5,13 @@ HOMEPAGE = "https://github.com/openSUSE/build-compare"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/openSUSE/build-compare.git \
-           file://Ignore-DWARF-sections.patch;striplevel=1 \
-           "
+SRC_URI = "git://github.com/openSUSE/build-compare.git"
 
 # Date matches entry in build-compare.changes and date of SRCREV.
 #
-SRCREV = "4dfa207660776cae120afa4353aec7f1f2a998d2"
+SRCREV = "28bf642fcfdab94adb9b847329338005be6f73c7"
 PE = "1"
-PV = "2019.08.14+git${SRCPV}"
+PV = "2020.03.31+git${SRCPV}"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch b/meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch
deleted file mode 100644
index 2fb62ae8ce..0000000000
--- a/meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 015715694eadd714b903f30ade876e0738d44974 Mon Sep 17 00:00:00 2001
-From: Randy Witt <randy.e.witt@linux.intel.com>
-Date: Mon, 5 Jan 2015 15:09:20 -0800
-Subject: [PATCH] Ignore DWARF sections.
-
-Assume for now that we don't care about the DWARF sections due to path
-differences. However, in the case the tool is ran on a "debug" package
-it will most likely falsely say the packages have no differences.
-
-Upstream-Status: Inappropriate [other]
-
-The package difference tool is correctly labelling the packages as different
-when the DWARF sections don't match due to paths. The paths in the debug info
-should actually be made to be the same using compile flags or some other
-mechanism.
-
-However, to make the tool more useful to Yocto until the work can be done
-to ensure identical paths in debug sections, this patch is being applied.
-
-Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
----
- pkg-diff.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pkg-diff.sh b/pkg-diff.sh
-index 9c2125e..b0d77c8 100755
---- a/pkg-diff.sh
-+++ b/pkg-diff.sh
-@@ -851,7 +851,7 @@ check_single_file()
-        echo "" >$file1
-        echo "" >$file2
-        # Don't compare .build-id, .gnu_debuglink and .gnu_debugdata sections
--       sections="$($OBJDUMP -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" -e "\.gnu_debugdata" | tr "\n" " ")"
-+       sections="$($OBJDUMP -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" -e "\.gnu_debugdata" -e "\.debug_abbrev" -e "\.debug_aranges" -e "\.debug_frame" -e "\.debug_info" -e "\.debug_line" -e "\.debug_loc" -e "\.debug_macinfo" -e "\.debug_pubnames" -e "\.debug_pubtypes" -e "\.debug_ranges"  -e "\.debug_str" | tr "\n" " ")"
-        for section in $sections; do
-           $OBJDUMP -s -j $section old/$file | sed "s,^old/,," > $file1
-           $OBJDUMP -s -j $section new/$file | sed "s,^new/,," > $file2
-- 
2.26.1

