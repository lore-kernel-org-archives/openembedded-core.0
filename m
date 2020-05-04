Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.34727.1588555009431788387
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 18:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jYxDEyyW;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id b18so9788582ilf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 18:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=974ELqJcQIXm3ABimoT4rXba4WiqiXNVsHDkEQCtcaU=;
        b=jYxDEyyWNSHm9jCxUSrSHY6bbt5pwJBK0w6YZVTSylJ4crGYcHp+KVDl0qGOQnjRAG
         AIwXXDAoSSYClKutzmhsMtRvPt6OiY+nFvySsLix5WaRzEsCbCqrhlwh86cTNsCAKSxh
         1IjY0C8HPBGvO8kHkEXZ+JbLCBzW62yFO+djdkj4rlyt0j4H3TCYPrEJLDDKHgOAORma
         WJ75QHMhBs9Q1SUeVB1OF3GrHKNr9aG+jSqBHZfnPAUeb7nEhm+WhtvKR4OJ88qV1VLI
         NSdHSEJkW1Dgafv5t7dPk8f3igPoDZCsG2PE7VIr1EFtKwyDHQwNI4c5XjatMmpwsi9J
         qUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=974ELqJcQIXm3ABimoT4rXba4WiqiXNVsHDkEQCtcaU=;
        b=bAnDHa3gmmsb3HZIO1CdLowj2zX8cQHYTDPAVtxv9b9r5PghucNxeqLxYSy4gagvng
         21el5HN+aARz6ul7sNY8q3ZuCcG9Jg1W7i3EYcv+TBgGotjZkx2UvimDdllEcDeMJP4A
         xRLn+fRY7l+q3PmhUyd+myjkPEcLu3I8HlpRPavRfp2wlBIXwfXsnwMamGMdsoqi+VW8
         fF8aoYjJFU7W36krWCWXYUA8IrWS8GALaMebdyl/5N7LJTfH/Ch/k0dwW8mKixpyc+tr
         wO8tIaupGOHCGREoEwFZkhwzo4UoCn+zEXJy0nh9rnkA37zQE9oFmTV3lh3gt1sb/vwE
         e55Q==
X-Gm-Message-State: AGi0Pua1a7xVOkJEetKUsIGNEP01bonzB4XYYWamFlPeKqEXp1xfq58A
	A8Cf7YjNEs9r9zGMvFQ+0hbQBu3S
X-Google-Smtp-Source: APiQypL3Q+2RWFC6PhUiqIya/LcnHOqxq2yYb5nZ/3GRxveNY9pqqx9ZvXMbwybHoGkfJC6Zr5cHSg==
X-Received: by 2002:a92:9f93:: with SMTP id z19mr14063249ilk.85.1588555008637;
        Sun, 03 May 2020 18:16:48 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:ddf5:728:85e7:be75])
        by smtp.gmail.com with ESMTPSA id w14sm4096540ilg.49.2020.05.03.18.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 18:16:48 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: matthew.zeng@windriver.com,
	randy.macleod@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] jquery: Upgrade 3.4.1 -> 3.5.0
Date: Sun,  3 May 2020 20:16:45 -0500
Message-Id: <20200504011645.25319-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../jquery/{jquery_3.4.1.bb => jquery_3.5.0.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.4.1.bb => jquery_3.5.0.bb} (73%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.4.1.bb b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
similarity index 73%
rename from meta/recipes-devtools/jquery/jquery_3.4.1.bb
rename to meta/recipes-devtools/jquery/jquery_3.5.0.bb
index 1bf6ef5c98..5c6f9cddbe 100644
--- a/meta/recipes-devtools/jquery/jquery_3.4.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "jQuery is a fast, small, and feature-rich JavaScript library"
 HOMEPAGE = "https://jquery.com/"
 LICENSE = "MIT"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;startline=8;endline=10;md5=cdb86f5bda90caec023592d2e768357c"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;startline=8;endline=10;md5=b1e67ece919e852643f1541a54492d65"
 
 SRC_URI = "\
     https://code.jquery.com/${BP}.js;name=js \
@@ -10,9 +10,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map \
     "
 
-SRC_URI[js.sha256sum] = "5a93a88493aa32aab228bf4571c01207d3b42b0002409a454d404b4d8395bd55"
-SRC_URI[min.sha256sum] = "0925e8ad7bd971391a8b1e98be8e87a6971919eb5b60c196485941c3c1df089a"
-SRC_URI[map.sha256sum] = "8da74aec0fcdd7678a2663b3cc9bafbaf009e6d6929b28bb3dd95bced18206f6"
+SRC_URI[js.sha256sum] = "aff01a147aeccc9b70a5efad1f2362fd709f3316296ec460d94aa7d31decdb37"
+SRC_URI[min.sha256sum] = "c4dccdd9ae25b64078e0c73f273de94f8894d5c99e4741645ece29aeefc9c5a4"
+SRC_URI[map.sha256sum] = "3149351c8cbc3fb230bbf6188617c7ffda77d9e14333f4f5f0aa1aae379df892"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.17.1

