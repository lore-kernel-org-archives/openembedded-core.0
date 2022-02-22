Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52303C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:38 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.1869.1645557457457262007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Loo7jSmP;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id w2so853906pfu.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gH28zEYuX4dIu22F5ySRqNxKqG8OHTnBjYzGU5MdKwE=;
        b=Loo7jSmPhqzOG+9cKnBultOJs4oZbPVb+OY2uv+LLEXKgDYhF75+wpBAGfblBE1U3X
         XlSvC1NUzAUz9HNTYXse9JKhylKysDlnY5RR+hg0ZKyLjO8gxUWOB3m3Ornb6O88kICZ
         kYzVR1SSzUMKlXjOeraEgWOUgGjU2+3mbP6HoijaVW8nQ0nfnv+AMMiXDPDMcV0csEkI
         sOqzhY21l5zDlBM4L21SGQ0eXSl/3YdFkpIXrR/H30DAZ07Qc+7h85b1KWLH0vYBvc04
         G5/UJiOD5KQ/SZO3C7ccF/6DgsZaC+dbWh7+Pe9TmYdpN6Z5Cw4TEBf7VA4xFMehlQjw
         XHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gH28zEYuX4dIu22F5ySRqNxKqG8OHTnBjYzGU5MdKwE=;
        b=EgpDMmVaffZte3OI13OJWGGTreYtCHnxjWeZJwgTNLjcAQe1j4ElJJg6yIyPqCbeMu
         PLZtwrKH2rt+LHdWm5nLBYD8RSO5fO+n2wxt6KoRvlxVxiJmzTJSL1QncjaGLHBSPShI
         LRu0JV87DBb8Yb3L7DRbAxvSi98BFvVYVPN5qZPuL2tVxpcC9J8L5omFARJ7pIBOjaw5
         jhxyfyiXNiqsdm2cuV1Qwiiap+7Z/q5q3U4cAQ2nkxOKSAiyfGg8uKdiAYBsZ543jXPj
         tXM54HWuYOqz7NoyYBtsaq3vesvbY81xNVA3mgxvV4N4//TuS+jqhov0N63YxK6A/ioF
         NJ0g==
X-Gm-Message-State: AOAM530UsxAjqtJOAjLSgosyDOl2QrpIwXIFKVxVHNS6FUFjr7TpEMWe
	nxXvb9S+KJ3MZZokZWZ4YG0TMo9weAqIjA==
X-Google-Smtp-Source: 
 ABdhPJytLWuO2DDHL3mSFQqp3zgQ9UUoo3Tuplig0orayrcY8Cy1vWLoBMlDOi+PgRl0qkvtMLTOig==
X-Received: by 2002:a63:d44d:0:b0:372:d975:3390 with SMTP id
 i13-20020a63d44d000000b00372d9753390mr20333334pgj.525.1645557456403;
        Tue, 22 Feb 2022 11:17:36 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 20/32] python3-libarchive-d: set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:46 -0800
Message-Id: 
 <dd4a550a700ace162d057f508d3b0a89c330a817.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162211

Set PIP_INSTALL_PACKAGE to libarchive_c to match the name of the wheel
built by bdist_wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-libarchive-c_4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
index 3c6bc1e1cab..99837848a67 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
@@ -9,6 +9,8 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
+PIP_INSTALL_PACKAGE = "libarchive_c"
+
 SRC_URI[sha256sum] = "a5b41ade94ba58b198d778e68000f6b7de41da768de7140c984f71d7fa8416e5"
 
 RDEPENDS:${PN} += "\
-- 
2.30.2


