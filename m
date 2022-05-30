Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A05C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 09:02:49 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.34718.1653901361142069465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RJCkH6/z;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id q123so4569837pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=jpjmSQWdR1qLeD8wrz9ktkYVIHDALjihl/6dNxeZ1bo=;
        b=RJCkH6/zmv7zv7IwVxpjP9s4d0/UpMyUEF9p09oHB1uQY2rxQCZppbvlNbHfRDfh8a
         pVUWXCuZz2h1+C1OVlo+QJyyxaRDJ1jDXWgmeZAdluooAfVKwWgrpIVdG064MNQ/61Jk
         QDLLJFHnTni4d38ipWmihhuWZdpGalEILsRPaZFy9QAuFq0dASSzHPaH/Ce8wzUPzE8m
         bK0dlTrz9ayXzuEYi53WAqv6n2DvmkLH4dt7iSx/seiGX6P84uosNAIRhqH3HN9ekyZP
         jPjWPjkhgq6hNs+nZT/Pk25V2yaI3h4aF+NxYVTaJ6U7kdsgDPBb9mGnplm8G3IW1rck
         6K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jpjmSQWdR1qLeD8wrz9ktkYVIHDALjihl/6dNxeZ1bo=;
        b=gF2LUmVTt8NlSKYop8kBfAHKv4IKqK21NLbNC1bj6R2GQWGsBGbzhvYEn3YVnZcsXB
         Xlvap3lSpmTbHfos9+AV5xw2o/e9UGrv4gW1luTdMpzkkbyI9uByI+EEnv+gJjQiLHGI
         fFx8lStYTFFZXjcmG7Ch9MHTsKIBVdCkZludfjKs/NAbmLDPF6Htp8fTD4tXwA/OA6Ko
         1cw4HoMGJRitDqBQCLg+iyvdP+j+H7yDrx72h4CvQJPAdc5nkzJYztK7zAKpq0f7TKKT
         0vwzMBAhvq0xhZ/HAdYHiIg8spgP22VbBXmKSh1F29NoAGkHPmN+ToHVkkjcZ4g9XBUz
         f8Cg==
X-Gm-Message-State: AOAM532kB2aedFZLFU2lRbSOveOAMHFh2dEiwyNJ8zzx9SJYxPr12cc/
	/bxqP88vTIFObXfqfH9NoaL5IK2hQzE=
X-Google-Smtp-Source: 
 ABdhPJzvCg08yyKFxdLwVfh2fYzDHDduPl4S+FAOXHz/pJ15F6gNcGgrb6Q/4absuyZ886S3/fIUOw==
X-Received: by 2002:a65:5cc2:0:b0:3fc:20d2:30ed with SMTP id
 b2-20020a655cc2000000b003fc20d230edmr2937674pgt.158.1653901360227;
        Mon, 30 May 2022 02:02:40 -0700 (PDT)
Received: from localhost.localdomain ([103.238.105.13])
        by smtp.gmail.com with ESMTPSA id
 10-20020aa7924a000000b00518950bfc82sm4983899pfp.10.2022.05.30.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 02:02:39 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-Core][kirkstone][PATCH] libxslt: Mark CVE-2022-29824 as not
 applying
Date: Mon, 30 May 2022 14:32:06 +0530
Message-Id: <20220530090206.27402-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 09:02:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166273

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have libxml2 2.9.14 and we don't link statically against libxml2 anyway
so the CVE doesn't apply to libxslt.

(From OE-Core rev: c6315d8a2a1429a0fb7563b1d6352ceee7bc222c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad63694e6df4f284879f7220962a821f97928eb0)
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.35.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 51cfb2e281..2fd777766c 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# We have libxml2 2.9.14 and we don't link statically with it anyway
+# so this isn't an issue.
+CVE_CHECK_IGNORE += "CVE-2022-29824"
+
 S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
-- 
2.17.1


