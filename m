Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.13820.1629891509107608028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fzV+aL7C;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so4401552wma.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z44a3+tKcB46pzDdVI5+NiApRvx4cejgwkcEsTisaM8=;
        b=fzV+aL7C/auNtlalFmoluGnS/zKc15VgW4hoZ00UylN016co7d4VnwswOpHcC0zuNC
         XcDTam1VxvqFaQBoWIw6WK5thpp3pFdiOoHxlUXBZkMJsDsAR4E3nwB999ZRB+RLu4Gh
         k2Too2bTKIC+THc1Q9IZffZpRjAx5Tah0SU+1121ylB1UKTX9MeAbTM2Q2Nqk8f07ShH
         Txe8oC7t4ax942qUms8PJ8FEMmbKnmpeNTM606WdVLthGFLD/A71lUSL0JWmqT2uRSNU
         6iLzQwKA4ZRsNMOUcLlJsNbbOgW7PgOGaOI+P6sJ2tSH4KzaB4psYwDeloDU+tx/pxmj
         H4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z44a3+tKcB46pzDdVI5+NiApRvx4cejgwkcEsTisaM8=;
        b=POWMKuxJQGQ7uc2xke0tNrTH5uxpe8AzAcejTtyw98LwkPc7AkWQo6xaSzqIlUtqlu
         LVTdfreuRj8sDmhk5s6LbB/lC1bvuqyxzZtcWw2HHbsgxGTrccfxZqrSs3Ew+0geb1Mo
         fGd5wTFNmmRy7SvVwb3Cc0x/6a2ZpcNMj7zTAcR2+1yd+QZCl+2FePbcTSqADVJw/hMw
         sBWZfxGubotn00gibZauURKJxpnIK4QZVPMH07UDXNIpfBw4B4nNMj98H+ZSYg0sgZHc
         /wuCggtMRS1JBeo/nkunEkrxqA6dtPessF6lzkmU7OeAAU3OxuTOI6641IPiD/1ZRYDi
         I95A==
X-Gm-Message-State: AOAM531jVqxLPNH/zowPV7Pxsp+u6nLGDAdzK7RykNda/g/gCdTEm3bb
	z3MCKHZPC6xhMkzVANZFEOUq7qa+lE4r/Q==
X-Google-Smtp-Source: ABdhPJxLY/kAce8oj85yC2w1BuFmMe1h9PpCG8Ro3XE7sVSb45AiAtYfSZFSdmJnG20+n8KbdostMg==
X-Received: by 2002:a1c:27c5:: with SMTP id n188mr8877648wmn.126.1629891507709;
        Wed, 25 Aug 2021 04:38:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/16] git: upgrade 2.32.0 -> 2.33.0
Date: Wed, 25 Aug 2021 13:37:54 +0200
Message-Id: <20210825113804.779395-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/git/{git_2.32.0.bb => git_2.33.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.32.0.bb => git_2.33.0.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.32.0.bb b/meta/recipes-devtools/git/git_2.33.0.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.32.0.bb
rename to meta/recipes-devtools/git/git_2.33.0.bb
index f45737b096..f8d4dacdbf 100644
--- a/meta/recipes-devtools/git/git_2.32.0.bb
+++ b/meta/recipes-devtools/git/git_2.33.0.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "6038f06d396ba9dab2eee541c7db6e7f9f847f181ec62f3d8441893f8c469398"
-SRC_URI[manpages.sha256sum] = "b5533c40ea1688231c0e2df51cc0d1c0272e17fe78a45ba6e60cb8f61fa4a53c"
+SRC_URI[tarball.sha256sum] = "02d909d0bba560d3a1008bd00dd577621ffb57401b09175fab2bf6da0e9704ae"
+SRC_URI[manpages.sha256sum] = "ba9cd0f29a3632a3b78f8ed2389f0780aa6e8fcbe258259d7c584920d19ed1f7"
-- 
2.31.1

