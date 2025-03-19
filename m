Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE0EC36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.2927.1742372197747185771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVQ5+XZN;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225d66a4839so6128335ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372197; x=1742976997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=FVQ5+XZNzfFbt94rHzBBFyEWXeSZGrJhPOYcICtL6Exiq7cawfcfmrkAAmCxS+eHY0
         1ImdzlhrJF72Yxzuy8STgTLz7Z7tTrkM9LZspRIMhZ8rxb2Az3mWvYAxIKrOFt3D2rgU
         fVL2ODXVFL1avqZEKlQK141k7ww+RqaGyWXoHoeL0Mhxt78N+JCGOiKdSC30Jt2AL7G2
         Vpi2LkJgdU5eoN/lX0K78Z169DqKjBpcN3o0+4Gq8sDYEZK1u9ec74iB9yHnOiAJMglZ
         Y9TrGiYSSDgfMv8DKg16GdQ4i9DKcMk65g1eGsCcPKKBU0IZqqDdvWBdQPlFuCH5ceCC
         kqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372197; x=1742976997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=mSJVdlgk+PVGTZE24Din8h7FDC/M9XEzTR74muGuq2Qn9x9L/cpNdq/R+qBR6OvOoB
         HgtXcmntk4SmWiyh6MTELJjAdA07hfSgVfT6RQwpM0Aqb/du5I2bBt9Ar/9oXvDmxH4Z
         uzjhLRQeV83DV46MGyOMwEXBtUWiFsFpNGL1nfHnKWOWzgCwjdqQeb/1Tu0wAhnt1ZBv
         dcBJRanVVcsBS3e93SInd06LVlUqMebUGa4m2/tQLReBJ/EQcQjUkjKJWSpCehmhJdB2
         ufq92sBGcJN1AperXTea+tDTUSvozGuh/FrnGEkpdKCHBWE5JaP52P/dt23E2zbHwpJX
         vc7Q==
X-Gm-Message-State: AOJu0Yy0dRKh3vofN62FxpimYMdfbKnUs+p6r6bh2umatajgYuxgXNPw
	X5JOdxvu6G9qeMzCVvl1MJ0NKksICjH5DO2xa4qtlZgUxsP2FIsr5jqS8kyk
X-Gm-Gg: ASbGncvDGB0rZjdBhDw4klK3TfeIIEq+Ay7q5Bct4+J+HXG/WFz8Vj/7BceHhdNSS+u
	Qxb3zUWlsQNliNz5NHUIPGnGAavu2dSZnJvlyPf2+jNzW0UGsZSrhQFBqC6IXidQ7qJ9RFcJtwI
	eq0vAxZoMwdA0Uf349x3mxmp0VwDS9s2RTfY6JSP96NakoFFy3eehuOWPRjYg4LoSMvml7QC6vw
	Lk+IspUzIYzqp5z6cT+f1qtci7RPfChBVK9N+DBIVe6x2HU/suyFMb467RQGeidrNPZ+dSLvY6w
	1w9R6ydFkazVIIUjzBkZytmbD/u6+IXDGnEn
X-Google-Smtp-Source: AGHT+IFHs2Ry1a9Pa7rmDTLGXYVTlS5Dpa3KU0LlgiRn96Ob2QAyXOkUQToBYby7m6akkYf54JYXzA==
X-Received: by 2002:a05:6a00:2d8a:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-7375778c1femr11285583b3a.4.1742372196941;
        Wed, 19 Mar 2025 01:16:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 20/25] cronie: Resolve build failure with GCC15
Date: Wed, 19 Mar 2025 01:15:56 -0700
Message-ID: <20250319081610.3536475-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213294

Fix function prototypes for C23 to work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../make_error_func_prototype_complete.patch  | 41 +++++++++++++++++++
 meta/recipes-extended/cronie/cronie_1.7.2.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch

diff --git a/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch b/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch
new file mode 100644
index 00000000000..71f0153ec6f
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch
@@ -0,0 +1,41 @@
+From 09c630c654b2aeff06a90a412cce0a60ab4955a4 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tmraz@fedoraproject.org>
+Date: Mon, 18 Nov 2024 21:02:30 +0100
+Subject: [PATCH] load_entry(): Make error_func prototype complete
+
+Fixes #193
+
+Upstream-Status: Backport [https://github.com/cronie-crond/cronie/commit/09c630c654b2aeff06a90a412cce0a60ab4955a4]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/entry.c | 2 +-
+ src/funcs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/entry.c b/src/entry.c
+index 586eb9d..a2077e8 100644
+--- a/src/entry.c
++++ b/src/entry.c
+@@ -90,7 +90,7 @@ void free_entry(entry * e) {
+ /* return NULL if eof or syntax error occurs;
+  * otherwise return a pointer to a new entry.
+  */
+-entry *load_entry(FILE * file, void (*error_func) (), struct passwd *pw,
++entry *load_entry(FILE * file, void (*error_func) (const char *), struct passwd *pw,
+ 	char **envp) {
+ 	/* this function reads one crontab entry -- the next -- from a file.
+ 	 * it skips any leading blank lines, ignores comments, and returns
+diff --git a/src/funcs.h b/src/funcs.h
+index 427e027..f28d634 100644
+--- a/src/funcs.h
++++ b/src/funcs.h
+@@ -89,7 +89,7 @@ char		*env_get(const char *, char **),
+ user		*load_user(int, struct passwd *, const char *, const char *, const char *),
+ 		*find_user(cron_db *, const char *, const char *);
+ 
+-entry		*load_entry(FILE *, void (*)(), struct passwd *, char **);
++entry		*load_entry(FILE *, void (*)(const char *), struct passwd *, char **);
+ 
+ FILE		*cron_popen(char *, const char *, struct passwd *, char **);
+ 
diff --git a/meta/recipes-extended/cronie/cronie_1.7.2.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
index 496ca39fd71..b250717ab81 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -17,6 +17,7 @@ SECTION = "utils"
 GITHUB_BASE_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
+           file://make_error_func_prototype_complete.patch \
            file://crond.init \
            file://crontab \
            file://crond.service \

