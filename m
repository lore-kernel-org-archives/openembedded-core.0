Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B677BC433FE
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.53221.1638136721469265810
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hflX2yRf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 200so13895112pga.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SOQQX1+d58vUwBsX6LhKWQaIqe1wNWgBXWD+JtIbt3M=;
        b=hflX2yRfYRZgZ9Z7LOp7jFkZmUnAhHqkAJe6ipSB9vqbjgNGlqieHXeBjcdBUKUe4h
         RKEh6VmyFlf6P9R+YJvQzUniGCbbWTz9VyiL5wC6MMMOPlCxFKcPKIBnj8mDdsctLzTV
         7w25PhWzzW/OPENv44SxVk/uqcYk7gliHELwzyBkRcEI3xvNECi5m9M3cPmxhxsULJdB
         uqusOve7Mciyiwjr8jIIG8FIxNS2QF5B9U8rehiEzRVsqP/PekvLEsL62yYNY6gv/PDq
         0o6eXrmzJxTwOD82iVazoITNlWdB5SL/qBqiNarfCoeXJP8nA11bse3jXgpYeUxlMAgt
         KV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SOQQX1+d58vUwBsX6LhKWQaIqe1wNWgBXWD+JtIbt3M=;
        b=mFL1Jdjd5o7G0ii01baVD/Ki/PZEZUfczSCSbPw6+OODqXWCrrYG9nHsi7Eh0qOv61
         aFggTH2l0ZPkfXYSOF52G0wfRXoJKsnWvE3JwwEFqgyq5zoL3d95s7HbyZgVwF59vV60
         BYjrQWeNljjczOjY0e1iGyw9m9f+ZnCeYsohwuSDARqx4LTWQSX9WU1UmA/g1GznkiBe
         DxGoIlsteotE9Yvm4X/9cU7/QLGkNTGCR/onv0703aJY5n7ch32lJvzaV80DKlTr7IPs
         mlxSVzQNc8skK9z975UgqS9SJBTgnlj0LkDWsQ87xU1q3BzFbXQxKy2s+bbDh90YVOtZ
         8IZQ==
X-Gm-Message-State: AOAM531fwKhA8kIA0AvChGqBBjPPi4RFkcfhvMd8qAsFtD9bKdYlZ6Fd
	uINZml/tWw/krE6OE1QaE1T8Pr5MzxMBV/vyVko=
X-Google-Smtp-Source: 
 ABdhPJweRFWx+OJsL0735xGNHNdmKQMYmwchpGQurl94EbFQXIp2LFBSL4Rq2XPFR9DcobFfKj49cg==
X-Received: by 2002:a05:6a00:21c4:b0:4a7:ec46:34b7 with SMTP id
 t4-20020a056a0021c400b004a7ec4634b7mr27637163pfj.15.1638136720363;
        Sun, 28 Nov 2021 13:58:40 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/42] vim: add patch number to CVE-2021-3778 patch
Date: Sun, 28 Nov 2021 11:57:21 -1000
Message-Id: 
 <dc7789ac5277752060c7f5aeede5c4d861951e39.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158891

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 222be29051a3543ac63a0eb07019e90d44429b16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/CVE-2021-3778.patch             | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/recipes-support/vim/files/CVE-2021-3778.patch
index 9e1c4d29be..5fa60f5340 100644
--- a/meta/recipes-support/vim/files/CVE-2021-3778.patch
+++ b/meta/recipes-support/vim/files/CVE-2021-3778.patch
@@ -1,4 +1,4 @@
-From eb41373c8c88b0789e5cf04669d6116f9a199264 Mon Sep 17 00:00:00 2001
+From 6d351cec5b97cb72b226d03bd727e453a235ed8d Mon Sep 17 00:00:00 2001
 From: Minjae Kim <flowergom@gmail.com>
 Date: Sun, 26 Sep 2021 23:48:00 +0000
 Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid utf-8
@@ -10,13 +10,15 @@ Solution: Check for NUL when advancing.
 Upstream-Status: Accepted [https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f]
 CVE: CVE-2021-3778
 Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
 ---
  src/regexp_nfa.c                 | 3 ++-
  src/testdir/test_regexp_utf8.vim | 7 +++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
+ src/version.c                    | 2 ++
+ 3 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
-index fb512f961..4d337f1f1 100644
+index fb512f961..ace83a1a3 100644
 --- a/src/regexp_nfa.c
 +++ b/src/regexp_nfa.c
 @@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, char_u *match_text)
@@ -44,6 +46,16 @@ index 19ff882be..e0665818b 100644
 +  bwipe!
 +  call delete('Xinvalid')
 +endfunc
--- 
-2.17.1
-
+diff --git a/src/version.c b/src/version.c
+index 8912f6215..85bdfc601 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    3409,
+ /**/
+     3402,
+ /**/
-- 
2.25.1


