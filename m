Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80545CCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:38:55 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.32817.1654526334092913265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Q+h+52eH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id d129so13047473pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EiGX45rjDHYq1GjyPkr7JkUoxncyKY8b696LrL3SloI=;
        b=Q+h+52eHdXpn0+Qebvc2WUfRo+dIml6DMB/rFpmSMTJIxJuXnVyo6Rsctv4wpEGckl
         zmK4PxaQFfwWvJlVidRa/xpD8sL8lNLO1dUOaR71IXyp6O6zZFvC3qVF79r0L8RQg0rb
         hnVGyMz/bSPiNsgAhEPf6G3R1enW8lk7uRrhk1FwQ0D8KPi53Hc5bsY13YGNEBop19S2
         COiskoxEGaC2H6/TiP1EISdRxINdj97Vj4grzj+KENNoLBpQ+jy+6ArR+D4blUEBtYYt
         Kj28luqQWXlTa23UN9vcYByOmMavQR6UPdOagUmmq965hv8Cdh3pl/NmckY0qLgQgzC3
         J2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EiGX45rjDHYq1GjyPkr7JkUoxncyKY8b696LrL3SloI=;
        b=CLlZf17AYBBPLeC0JyL5a0N5X25ulKARFS33vmjDsS3QfoV4ghhC3gIN9kd8FyU6g8
         /hvyiZESKAtjs1p8Pm6ar/e2VoR/o4GJPDZuq21WgYPhj0LLqP0rWigSgcFksqRH4WrO
         94zj6BTylvDbNN5z/PZvVEwNN6PFm4j2nwMhouVuEhNhe/v4J4OUOCzGIYabYgd5n6c6
         lWwNNlutT72n6iaYhBJrVHzzqjN4tFZ1CzedUBuT4AjvNSUy1o0v51V+ylPRrP8Enhg+
         q6efn0ZZrWNRtEeWMvn2Y/kI33k2tWNfYiUmlqKSz7GkRJjjtETOND9PD5n+qbBOjSc0
         0NFA==
X-Gm-Message-State: AOAM533iKjM8xM/bQr4+7orEpPTs446bRUDEYkjIBk6TaqyK76KZ5cmG
	CiHhC9jh8YWPx5XXwOHiwADV+aMs20RhwCzB
X-Google-Smtp-Source: 
 ABdhPJwiZ4PKPjdFUIMZPfDK7rQ1KCbedQ9noJpniP4Lr7vNLxfTqY7VBuWur4K7H6RvYD2tJtMNXQ==
X-Received: by 2002:a63:797:0:b0:3fc:da19:45a7 with SMTP id
 145-20020a630797000000b003fcda1945a7mr20391236pgh.326.1654526332943;
        Mon, 06 Jun 2022 07:38:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.38.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:38:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/13] systemd: Document future actions needed
 for set of musl patches
Date: Mon,  6 Jun 2022 04:38:20 -1000
Message-Id: 
 <d95e9e144b3cb594f7352fb6892c839478692157.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166635

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 433d51c3840d03623509ce8e3a1b3679f8771164)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch | 3 +++
 .../systemd/0008-add-missing-FTW_-macros-for-musl.patch       | 3 +++
 ...fix-missing-of-__register_atfork-for-non-glibc-build.patch | 3 +++
 .../systemd/systemd/0021-test-json.c-define-M_PIl.patch       | 4 ++++
 4 files changed, 13 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index 18fcc6e48c..dfe4164900 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -6,6 +6,9 @@ Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
 Make it work with musl where comparison_fn_t and __compare_fn_t
 is not provided.
 
+Revisit this when upgrading to 251+ systemd since systemd does not need
+__compare_fn_t anymore
+
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 59bd81c76f..4cce9a3fe6 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -7,6 +7,9 @@ This is to avoid build failures like below for musl.
 
   locale-util.c:296:24: error: 'FTW_STOP' undeclared
 
+Revisit this when upgrading to 251+ since most of these defines are not
+needed anymore except FTW_CONTINUE
+
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 1fb84c7090..e7b7269f95 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -5,6 +5,9 @@ Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
 
 Upstream-Status: Inappropriate [musl specific]
 
+Drop this when upgrading to 251+, systemd does not use
+__register_atfork anymore
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index cc20c3710a..82a01f732e 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -8,6 +8,10 @@ src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this functi
 
 Upstream-Status: Inappropriate [musl specific]
 
+This is fixed upstream where systemd no longer needs M_PIl so it could
+be dropped when upgrading to 251+ see
+https://github.com/systemd/systemd/commit/f9a1fd2a3b2d8212ba84ef1c3b55657ced34475e
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
-- 
2.25.1


