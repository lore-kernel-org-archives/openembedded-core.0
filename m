Return-Path: <rahulchauhankitps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3776CC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 12:50:39 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.10015.1651495834600840933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 05:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rao5BeNq;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: rahulchauhankitps@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id g3so11623446pgg.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+iKQgXO0iP9fpnmBXkIUObL9+czgpEpMto8PLoIymWk=;
        b=Rao5BeNqjL1zKgOTYru0iCdMFYErG1hQ08mVrADZmTia5ZaKSNeuohK5dLEvRSxUAW
         xDVkPbYP4eFqLInUJ5PnWYk4S2fYtvT2S56wz0XmyCx9Lh3dVAtDHziECmfpCArMrF/b
         DYMPsdzfS9YG9QQ1MkAMNWZ4UzAbd4KS0rmlg4tVHlpRkbJ1XyQLCyl+3mRgwfqJYDFs
         OTl+lpT3ZNGMAQvsTCYS93GC7ZAoyJ/2zRJX4niVoe97HILEn8sATnnqzigM8zrq8phr
         iZezvZjEx907xaO1zKIy0fXQNLJpvgRUqozm7cX4iFnoA26IDnO7YydxTXSzJ5YKRLAD
         LY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+iKQgXO0iP9fpnmBXkIUObL9+czgpEpMto8PLoIymWk=;
        b=Fg3rg+n1a4A0ETZQwjVK/FleoF52QpQzw6ZD1HrJBVfbUscScme/anLd6rGzUqLY1j
         qOYopwYs2oI5pEvm6yrHdWqvCa4YK5GPTkIQAaPH/YkPl+h2ZZzn/3HD7l8KEpgF8TsG
         r/oDMyjodBTTDHpE4sJpRYnZCRpKlZCaD7GXB0SFgDnIXeM0RtGIHRLraeDDT5nG1UzE
         w3vJQ18FXKC97RdaPoBGTJ0hBMb8/Z5HyzjijxkgI3iBs+osxt0FlTlAXo6rXHY3Scmf
         xNHgBx63yDP3CeEURbNn7VhlFKqrwgZqx99G0oPjQW9FBysXl1XvVTyQJBBKiimKnalu
         8b9Q==
X-Gm-Message-State: AOAM530tBhqEzpTd5k6kZuW/Ov8FzJnUkClJRKwntxGEtjI5vsROBZSr
	+G3xzB3uv5bicI0+KfrKlPOfR9p2bEhkJw==
X-Google-Smtp-Source: 
 ABdhPJwzkrvJK7Y4XN1PeRBQNaTDTqutla75EJLVrJHo42teUSPxRI0NK6aCaWevwIxN1p9/O+sDng==
X-Received: by 2002:aa7:8104:0:b0:50d:374b:4568 with SMTP id
 b4-20020aa78104000000b0050d374b4568mr11116570pfi.45.1651495833835;
        Mon, 02 May 2022 05:50:33 -0700 (PDT)
Received: from rahul.Optilink ([103.211.17.117])
        by smtp.gmail.com with ESMTPSA id
 lw4-20020a17090b180400b001d7faf357b7sm21522226pjb.4.2022.05.02.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 05:50:33 -0700 (PDT)
From: Rahul Chauhan <rahulchauhankitps@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Chauhan <rahulchauhankitps@gmail.com>
Subject: [PATCH 2/2] vim: Security Fix For CVE-2022-1420
Date: Mon,  2 May 2022 18:20:12 +0530
Message-Id: <20220502125012.11630-2-rahulchauhankitps@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220502125012.11630-1-rahulchauhankitps@gmail.com>
References: <20220502125012.11630-1-rahulchauhankitps@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 12:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165166

CVE: CVE-2022-1420

Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
---
 .../vim/files/CVE-2022-1420.patch             | 93 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2022-1420.patch

diff --git a/meta/recipes-support/vim/files/CVE-2022-1420.patch b/meta/recipes-support/vim/files/CVE-2022-1420.patch
new file mode 100644
index 0000000000..2c2e09a9d2
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2022-1420.patch
@@ -0,0 +1,93 @@
+From 6258e29cbdc55c9496baa23462ef77d79a4e08cf Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Sun, 17 Apr 2022 15:06:35 +0100
+Subject: [PATCH] patch 8.2.4774: crash when using a number for lambda name
+
+Problem:    Crash when using a number for lambda name.
+Solution:   Check the type of the lambda reference.
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/8b91e71441069b1dde9ac9ff9d9a829b1b4aecca]
+CVE-2022-1420
+
+Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
+---
+ src/errors.h                |  4 ++++
+ src/eval.c                  | 16 ++++++++++------
+ src/testdir/test_lambda.vim |  4 ++++
+ src/version.c               |  2 ++
+ 4 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/src/errors.h b/src/errors.h
+index 951acabb2..96bba755b 100644
+--- a/src/errors.h
++++ b/src/errors.h
+@@ -3256,3 +3256,7 @@ EXTERN char e_compiling_closure_without_context_str[]
+ EXTERN char e_using_type_not_in_script_context_str[]
+ 	INIT(= N_("E1272: Using type not in a script context: %s"));
+ #endif
++#ifdef FEAT_EVAL
++EXTERN char e_string_or_function_required_for_arrow_parens_expr[]
++       INIT(= N_("E1275: String or function required for ->(expr)"));
++#endif
+diff --git a/src/eval.c b/src/eval.c
+index 2cde64216..5d208a378 100644
+--- a/src/eval.c
++++ b/src/eval.c
+@@ -4094,19 +4094,23 @@ eval_lambda(
+ 	++*arg;
+ 	ret = eval1(arg, rettv, evalarg);
+ 	*arg = skipwhite_and_linebreak(*arg, evalarg);
+-	if (**arg == ')')
++	if (**arg != ')')
+ 	{
+-	    ++*arg;
++	    emsg(_(e_missing_closing_paren));
++	    return FAIL;
+ 	}
+-	else
++	if (rettv->v_type != VAR_STRING && rettv->v_type != VAR_FUNC
++					       && rettv->v_type != VAR_PARTIAL)
+ 	{
+-	    emsg(_(e_missing_closing_paren));
+-	    ret = FAIL;
++	    emsg(_(e_string_or_function_required_for_arrow_parens_expr));
++	    return FAIL;
+ 	}
++	++*arg;
+     }
+     if (ret != OK)
+ 	return FAIL;
+-    else if (**arg != '(')
++
++    if (**arg != '(')
+     {
+ 	if (verbose)
+ 	{
+diff --git a/src/testdir/test_lambda.vim b/src/testdir/test_lambda.vim
+index e6dcb6774..8d06e5973 100644
+--- a/src/testdir/test_lambda.vim
++++ b/src/testdir/test_lambda.vim
+@@ -66,6 +66,10 @@ function Test_lambda_fails()
+   echo assert_fails('echo 10->{a -> a + 2}', 'E107:')
+ 
+   call assert_fails('eval 0->(', "E110: Missing ')'")
++  call assert_fails('eval 0->(3)()', "E1275:")
++  call assert_fails('eval 0->([3])()', "E1275:")
++  call assert_fails('eval 0->({"a": 3})()', "E1275:")
++  call assert_fails('eval 0->(xxx)()', "E121:")
+ endfunc
+ 
+ func Test_not_lamda()
+diff --git a/src/version.c b/src/version.c
+index 38c3e69b6..c7516e3a5 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -750,6 +750,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    4774,
+ /**/
+     4763,
+ /**/
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c78e53007e..05891b07df 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            file://racefix.patch \
            file://CVE-2022-1381.patch \
+           file://CVE-2022-1420.patch \
            "
 
 PV .= ".4681"
-- 
2.17.1


