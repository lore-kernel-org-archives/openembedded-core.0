Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.1669.1616180325430748083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Eg8I3NOe;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id h7so7562723qtx.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JbnyxuVHwqguGIcQPk8qHp+wLpy5P6o71hOfhOiMrX0=;
        b=Eg8I3NOe3EcDPMLd2mh2kixH69cgmUZPoWDXKFeFGI6lNhFsySV0HgApu3E23f01rS
         P6YFP1mun01BsYGXVAN7erx61kXubsuo5cNmW+sa5VARzCl35rnPRmSz6ODp25kfOnr4
         tbbIuhOdJd1wz5mY82euf+8UjmttQUF0R82gIYSBHZLFrzfequACY9fV69ZvZ1BY9D1D
         6CdWt22xgFMeuovCqV4IrVP/LLjo8XW9fDRIJN648XR3xYDKmXQ9muP/gun10VxOjfKo
         yVy0OhHuGJPJ4bavO7rk71X/+aFlaDsS3ODHi13ekDmNssHdlIBG/CAcey2RPwEdlIIo
         usnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JbnyxuVHwqguGIcQPk8qHp+wLpy5P6o71hOfhOiMrX0=;
        b=XNAbQAv9WG1wwb3GFr1Q1qUpvASahZxsrgPw9IFeDuMXrAhhicLu/5mS7gGEBJrJ4X
         tJebcjUKlToYTgSY+QjCB3CdwQ9lD29xoIxmCzcGlap5q6qxqu2QrX4YOgr/pYof42Ex
         +atvC7wBYXhRpkqrykbeLIq5bsAAMd5KatjhMEqbYTvUeikzMEzHq9QfOtgFQPQpAxBj
         712pt0o3jUSuLgx9Cq9bZRK3rBZzXWNwWvRoEjTDyS32q6Rym9jp6Sgsk7w1hSyd4gY5
         SlyV9J8K8e0R7dHRxG0os7pFg1f9e4grbLSmzUoCPDSFcjxNR1Pwxjs5fQ7WY40maIUD
         McLg==
X-Gm-Message-State: AOAM530NNs2ofyZylqSpF4GT7XJZAmZ8DnKoJ8EHymDWK7sD/RQ3Dtct
	0oanrFM6QwWFgpR3yOUKHqA=
X-Google-Smtp-Source: ABdhPJyqS9/RTnNKEpPMHUGNXiuOo603PHDwG5ooQrbsh6u8KbL8qL3YaNX/NqLSZe8upVWLS1VsDw==
X-Received: by 2002:aed:34c7:: with SMTP id x65mr27813qtd.147.1616180324496;
        Fri, 19 Mar 2021 11:58:44 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:44 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] lttng-modules: update devupstream to 2.12.5+
Date: Fri, 19 Mar 2021 14:58:35 -0400
Message-Id: <530250c5d88913c1faabd1742132ee24d73747dd.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building against kernel v5.12-rc+, we need extra changes
on top of the 2.12.5 release. We can bump devupstream separately
from the main release to grab those changes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
index 48e91e158d..ea36a3464b 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
@@ -35,7 +35,8 @@ DEFAULT_PREFERENCE_class-devupstream = "-1"
 SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.12 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            "
-SRCREV_class-devupstream = "be71b60a327d7ad2588abc5cad2861177119972b"
-PV_class-devupstream = "2.12.3+git${SRCPV}"
+
+SRCREV_class-devupstream = "92cc3e7f76a545a2cd4828576971f1eea83f4e68"
+PV_class-devupstream = "2.12.5+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.19.1

