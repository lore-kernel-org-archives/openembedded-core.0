Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.14923.1602253153939065898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FSe36wJU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id y14so7258952pgf.12
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dqOeMr77I+irk8hW8e6RQICyYnGl1PuvHouars3TerQ=;
        b=FSe36wJU4aDFil9bxNke60XJP6Cn9GqwqpPDfesaTRLUjIphHG3cpCd14KneRjFcBZ
         m+gaHeAay0vbvZ8cH75te2TjWPLZcvjkaVOtr4NHAKALUmlCzclN7c2dlQcGAmEWfU0I
         XNsu3ZU1+N5n6cDFSNco9S6h6YCTpxp6bMPxcaIRXF9P4lFsxVtBT6hESQST+6hI2VFZ
         sOUC+EmTW2lfPscs/+829Jsjejk8d92lb1FhRcZGLvZcuWtnsEcKBYXxuTZAdAD+L5cI
         YDgfYPW/+6TK3rat65HfN+Ht5jmevMGbHcRnSYma9WRSZfoQ7M6SIxncYKBc+aKm1fpU
         bGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dqOeMr77I+irk8hW8e6RQICyYnGl1PuvHouars3TerQ=;
        b=oHh/qcQIWmgDhPFyl7GE4o0OB26YHaOeb1QFbuv/9px3OTQQG7KCu1/jMfCZdVAcB+
         X49FUQm968Hf7ZD5XVIWM7Vi5CBKhCsRk+vgkgx71325qi420Tgjqz9e5hlLchG+C5Q2
         Su3N7PEl5T1tmZu4JgK4Z+zDIjIIkBQN7A23bpk5R/TLC7aCYiawrrv9gsh0O2UsLnMc
         M6uWxEttwmjCGGKnYWb6exyrtBnW4+NdMdmTcK+xvzKbJKU3BG9UMaDPyS1B5FXx3Ufh
         gdGHc8CT8TybkBJzJUaQswiwKUi/bwgzsILgL/WwIJrxg7v/2LGC1JeD39O1RTRgRTU3
         snCw==
X-Gm-Message-State: AOAM532YDxeyQUbMd6BPdUicrtpFFOf69D9U/U4VGLwr8bCvHM3GqRhr
	H00f2sYPuyUBd7cZf7H1lmjVBsGkAxFLWjxj
X-Google-Smtp-Source: ABdhPJxV2lVM1VsnC3x826IpTJbo+6l8oNTMrnbHEPE6epe4Lq4QCPw7F/yJUBmBZ/+8uGLTRhdp2Q==
X-Received: by 2002:a17:90a:ba0e:: with SMTP id s14mr4121411pjr.190.1602253153055;
        Fri, 09 Oct 2020 07:19:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] lttng-tools: update to 2.11.5
Date: Fri,  9 Oct 2020 04:18:38 -1000
Message-Id: <a2c43b5e52708c013559a0ee9529efe5635e50d3.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Marek Vasut <marex@denx.de>

Update to latest available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.11.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.11.5.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
index 36a19ec18d..a969fffd62 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
@@ -36,8 +36,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-regression-disable-the-tools-live-tests.patch \
            "
 
-SRC_URI[md5sum] = "68ed78f7fa4235477ea577e48b3cd245"
-SRC_URI[sha256sum] = "936477305b25f65c5dd22db9161287d30a309ce868b6180857b1fd1fb5e6a56b"
+SRC_URI[md5sum] = "4bd983891f642d4139f80251f209ef81"
+SRC_URI[sha256sum] = "38167b49e4d1bf78fdd5c3156d411123713fd8f04b0067d4b1cd03742d0edfaa"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.17.1

