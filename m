Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.6508.1629603591545215088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 20:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KncT70lw;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id j2so3785322pll.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 20:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUPmkNWbxteQ6pZhuc8zyVNTy31fc4jc1dpc9lQetPQ=;
        b=KncT70lwigIEWhIfNYQgQK1VRxp31g+sIiB+CwKki8bePfCYd2bDTqV0cKiUiCbFOa
         ZgV/2si4sewiOTr9LJQeqyssxfJPRhnOfLFjz41CMjdnQNlBCxqOACd5xp+aMjOBWQar
         yoI+PK0GqFqi7Up/3iiExzQ9URqR4SZ3sxhtW1uekNuW9ITPhNh18+rMB3UHWRT9ns4y
         n5KPumoePzl7PR2OlxpUXh/4TuELx1+MNG1AmGRiMAPYFQISv1OUve62dp9cvneDB67B
         HIY1e0UVCsTc0KBsb0saG+YbweCMzlJK5FakzYXYGGY2Bk9Xol5dYaZ4YpaUyr5cpAvm
         C3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUPmkNWbxteQ6pZhuc8zyVNTy31fc4jc1dpc9lQetPQ=;
        b=qsz+MRBv8DDhw5s/sw26X7w0VHRwhEPMlzgiI9cXRTh6fJsQqEOljn2lwy3I4FekAb
         fsBElSMGbG5KOFoJinV08oIx4r3LRy1e7cZ23BG55qqzB4VHZlAV58eQhoSd7Y7VgtEh
         qwj/OLWrjWaxkK7+cQIiOLPIWaBIfmGks1FWFj+0yrqEv8cfY4VQ8DWkeDm9zwmxPasZ
         b1Gp/ca8+FNniUg/glBRNq+jOUE2cylQRD2cYDUNHckgbb7Ly+qYZU+LJRzdz7Tk3qV5
         4zQIcp4H7yVaZrkYOgC1HRtTsUi8jyTcH815gyHZCOQPDvzAo7UgU9nhyy4go2NP4GJo
         WnYg==
X-Gm-Message-State: AOAM533XFKboXfL0vZyjQb6ajf0MS2RlcFfvd8aS53Qof3SR4Xg2WkEW
	+URxiTTypzxld5VpA+X4s0Ny2wj+kK0=
X-Google-Smtp-Source: ABdhPJx8x5GptV4usPieZh4ACt8snoZFeuwbY26c1EK9liSpwdKB73Y3cR8St1rjQw2Y/9DdUkXyng==
X-Received: by 2002:a17:902:8c83:b029:129:17e5:a1cc with SMTP id t3-20020a1709028c83b029012917e5a1ccmr22746616plo.49.1629603590728;
        Sat, 21 Aug 2021 20:39:50 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:7b3d:18d5:b887:4ff9])
        by smtp.gmail.com with ESMTPSA id b8sm10139377pjo.51.2021.08.21.20.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 20:39:50 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/2] python3-hypothesis: upgrade 6.14.8 -> 6.15.0
Date: Sat, 21 Aug 2021 20:39:40 -0700
Message-Id: <20210822033941.1277996-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

6.15.0 - 2021-08-22

This release emits a more useful error message when @given() is applied to
a coroutine function, i.e. one defined using async def (issue #3054).

This was previously only handled by the generic return_value health check,
which doesn’t direct you to use either a custom executor or a library such
as pytest-trio or pytest-asyncio to handle it for you.

6.14.9 - 2021-08-20

This patch fixes a regression in Hypothesis 6.14.8, where from_type() failed
to resolve types which inherit from multiple parametrised generic types,
affecting the returns package (issue #3060).

References:
https://github.com/HypothesisWorks/hypothesis/issues/3054
https://github.com/HypothesisWorks/hypothesis/issues/3060

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ython3-hypothesis_6.14.8.bb => python3-hypothesis_6.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.14.8.bb => python3-hypothesis_6.15.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.14.8.bb b/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hypothesis_6.14.8.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
index bc29b94a54..9f0b7eaf3d 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.14.8.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cb80e06ca44992b08d2889734b740e67c8b41337315bbd6dba2ef43ca816cfe3"
+SRC_URI[sha256sum] = "10699f595eebb9410fd902908aa13aece19be5c437b405092be34f60f69f7999"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2

