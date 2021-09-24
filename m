Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.8801.1632492987698204424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sRC8hXSF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so7765088pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cpvsAvemT7YbwpzreTTerBKA0GP39cuX86Xm9mHWEhc=;
        b=sRC8hXSFuYq1SHvOgvgeHSR8gIP+h0NSYH3XtJkZxck1BaJzsPzZ9jZvw/EX7bdD76
         h2iESDH6v6q/4mBb3NkUA1fm8poyzccEqR6cWzR91PhR2J2dvmEd6FUzppG5M+/bjkzd
         fz8SjSuH3dR4+ZAKPNoxGc8E3LIVGBIje+ae+KLMsVXS3nQM35+MuMr0wi3gULlovKZS
         bGAFy6NU2m3bES/JvZoGOI8MtP7LWLh+TOzJ5Q/Eo7URMzQ1yP66gT3KPZv2fhLPMo8Q
         J85HgMBd3wqn2XzfY/QSPRNQPH8LkLFbuLSIefiEfwfcpzyDIaQW86Bon8Ix894A/YPe
         9YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cpvsAvemT7YbwpzreTTerBKA0GP39cuX86Xm9mHWEhc=;
        b=dDwv61wbrBw9XIBT/xOd/cZMUgr6h2ADQ232IeRNdM8dKzqJF+l9vTQHJDNwdE9Hbg
         LeONnNxoOTtUblQ572VIIB4eyOzbpiZ2AgAlqYf57SzmtMEJ1ABgN3UmlrWfqa3Nq45M
         3CWopgN5iAEwCEMpP2uWuivjbXoiCgahtIZEiS8iV4cttiTNGj321RyiQuDvQ4yRRmfk
         3YpbZsg2033FfZpsuC2aWGttZTZ+bcNGP8ggSv5VOgB4ve4Ioq1dZw4ekEUUrKiUuWxk
         NBitfdy3wIVujS0z+Q/vMqDSJ6IPHlVpM5cN1Vz/LbtvABQf9NAE792H62AIBV4xe/4E
         N5Nw==
X-Gm-Message-State: AOAM531yydGQko5VKMm5i+BkEahMEXNh0B8PLC7+KGzuAAFG0DHeNmbm
	+JIjjfV2p1PGCABLOAmZrLFdYASAZOTtS2f34oA=
X-Google-Smtp-Source: ABdhPJz0h1I0pqpWmy4nyBx3P87o+l6PxSDftuN5JcwpKXJ7CtIRbmwKfaR5JW7NwzvazwzbwbxaJQ==
X-Received: by 2002:a17:902:ec8e:b0:13c:8897:8c33 with SMTP id x14-20020a170902ec8e00b0013c88978c33mr9463920plg.87.1632492985144;
        Fri, 24 Sep 2021 07:16:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/25] vim: Backport fix for CVE-2021-3770
Date: Fri, 24 Sep 2021 04:15:17 -1000
Message-Id: <fa7b4315f42ad9dad631caed910ebaef23ad94d0.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54d3d023ce55ba4a7160ed25a283f0918e7d8e2e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

diff --git a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
new file mode 100644
index 0000000000..1cee759502
--- /dev/null
+++ b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
@@ -0,0 +1,207 @@
+From b7081e135a16091c93f6f5f7525a5c58fb7ca9f9 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Sat, 4 Sep 2021 18:47:28 +0200
+Subject: [PATCH] patch 8.2.3402: invalid memory access when using :retab with
+ large value
+
+Problem:    Invalid memory access when using :retab with large value.
+Solution:   Check the number is positive.
+
+CVE: CVE-2021-3770
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Backport [https://github.com/vim/vim/commit/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9]
+---
+ src/indent.c               | 34 +++++++++++++++++++++-------------
+ src/option.c               | 12 ++++++------
+ src/optionstr.c            |  4 ++--
+ src/testdir/test_retab.vim |  3 +++
+ src/version.c              |  2 ++
+ 5 files changed, 34 insertions(+), 21 deletions(-)
+
+Index: git/src/indent.c
+===================================================================
+--- git.orig/src/indent.c
++++ git/src/indent.c
+@@ -18,18 +18,19 @@
+ /*
+  * Set the integer values corresponding to the string setting of 'vartabstop'.
+  * "array" will be set, caller must free it if needed.
++ * Return FAIL for an error.
+  */
+     int
+ tabstop_set(char_u *var, int **array)
+ {
+-    int valcount = 1;
+-    int t;
+-    char_u *cp;
++    int	    valcount = 1;
++    int	    t;
++    char_u  *cp;
+ 
+     if (var[0] == NUL || (var[0] == '0' && var[1] == NUL))
+     {
+ 	*array = NULL;
+-	return TRUE;
++	return OK;
+     }
+ 
+     for (cp = var; *cp != NUL; ++cp)
+@@ -43,8 +44,8 @@ tabstop_set(char_u *var, int **array)
+ 		if (cp != end)
+ 		    emsg(_(e_positive));
+ 		else
+-		    emsg(_(e_invarg));
+-		return FALSE;
++		    semsg(_(e_invarg2), cp);
++		return FAIL;
+ 	    }
+ 	}
+ 
+@@ -55,26 +56,33 @@ tabstop_set(char_u *var, int **array)
+ 	    ++valcount;
+ 	    continue;
+ 	}
+-	emsg(_(e_invarg));
+-	return FALSE;
++	semsg(_(e_invarg2), var);
++	return FAIL;
+     }
+ 
+     *array = ALLOC_MULT(int, valcount + 1);
+     if (*array == NULL)
+-	return FALSE;
++	return FAIL;
+     (*array)[0] = valcount;
+ 
+     t = 1;
+     for (cp = var; *cp != NUL;)
+     {
+-	(*array)[t++] = atoi((char *)cp);
+-	while (*cp  != NUL && *cp != ',')
++	int n = atoi((char *)cp);
++
++	if (n < 0 || n > 9999)
++	{
++	    semsg(_(e_invarg2), cp);
++	    return FAIL;
++	}
++	(*array)[t++] = n;
++	while (*cp != NUL && *cp != ',')
+ 	    ++cp;
+ 	if (*cp != NUL)
+ 	    ++cp;
+     }
+ 
+-    return TRUE;
++    return OK;
+ }
+ 
+ /*
+@@ -1556,7 +1564,7 @@ ex_retab(exarg_T *eap)
+ 
+ #ifdef FEAT_VARTABS
+     new_ts_str = eap->arg;
+-    if (!tabstop_set(eap->arg, &new_vts_array))
++    if (tabstop_set(eap->arg, &new_vts_array) == FAIL)
+ 	return;
+     while (vim_isdigit(*(eap->arg)) || *(eap->arg) == ',')
+ 	++(eap->arg);
+Index: git/src/option.c
+===================================================================
+--- git.orig/src/option.c
++++ git/src/option.c
+@@ -2292,9 +2292,9 @@ didset_options2(void)
+ #endif
+ #ifdef FEAT_VARTABS
+     vim_free(curbuf->b_p_vsts_array);
+-    tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
++    (void)tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
+     vim_free(curbuf->b_p_vts_array);
+-    tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
++    (void)tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
+ #endif
+ }
+ 
+@@ -5756,7 +5756,7 @@ buf_copy_options(buf_T *buf, int flags)
+ 	    buf->b_p_vsts = vim_strsave(p_vsts);
+ 	    COPY_OPT_SCTX(buf, BV_VSTS);
+ 	    if (p_vsts && p_vsts != empty_option)
+-		tabstop_set(p_vsts, &buf->b_p_vsts_array);
++		(void)tabstop_set(p_vsts, &buf->b_p_vsts_array);
+ 	    else
+ 		buf->b_p_vsts_array = 0;
+ 	    buf->b_p_vsts_nopaste = p_vsts_nopaste
+@@ -5914,7 +5914,7 @@ buf_copy_options(buf_T *buf, int flags)
+ 		buf->b_p_isk = save_p_isk;
+ #ifdef FEAT_VARTABS
+ 		if (p_vts && p_vts != empty_option && !buf->b_p_vts_array)
+-		    tabstop_set(p_vts, &buf->b_p_vts_array);
++		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
+ 		else
+ 		    buf->b_p_vts_array = NULL;
+ #endif
+@@ -5929,7 +5929,7 @@ buf_copy_options(buf_T *buf, int flags)
+ 		buf->b_p_vts = vim_strsave(p_vts);
+ 		COPY_OPT_SCTX(buf, BV_VTS);
+ 		if (p_vts && p_vts != empty_option && !buf->b_p_vts_array)
+-		    tabstop_set(p_vts, &buf->b_p_vts_array);
++		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
+ 		else
+ 		    buf->b_p_vts_array = NULL;
+ #endif
+@@ -6634,7 +6634,7 @@ paste_option_changed(void)
+ 	    if (buf->b_p_vsts_array)
+ 		vim_free(buf->b_p_vsts_array);
+ 	    if (buf->b_p_vsts && buf->b_p_vsts != empty_option)
+-		tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
++		(void)tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
+ 	    else
+ 		buf->b_p_vsts_array = 0;
+ #endif
+Index: git/src/optionstr.c
+===================================================================
+--- git.orig/src/optionstr.c
++++ git/src/optionstr.c
+@@ -2166,7 +2166,7 @@ did_set_string_option(
+ 	    if (errmsg == NULL)
+ 	    {
+ 		int *oldarray = curbuf->b_p_vsts_array;
+-		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)))
++		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)) == OK)
+ 		{
+ 		    if (oldarray)
+ 			vim_free(oldarray);
+@@ -2205,7 +2205,7 @@ did_set_string_option(
+ 	    {
+ 		int *oldarray = curbuf->b_p_vts_array;
+ 
+-		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)))
++		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)) == OK)
+ 		{
+ 		    vim_free(oldarray);
+ #ifdef FEAT_FOLDING
+Index: git/src/testdir/test_retab.vim
+===================================================================
+--- git.orig/src/testdir/test_retab.vim
++++ git/src/testdir/test_retab.vim
+@@ -74,4 +74,7 @@ endfunc
+ func Test_retab_error()
+   call assert_fails('retab -1',  'E487:')
+   call assert_fails('retab! -1', 'E487:')
++  call assert_fails('ret -1000', 'E487:')
++  call assert_fails('ret 10000', 'E475:')
++  call assert_fails('ret 80000000000000000000', 'E475:')
+ endfunc
+Index: git/src/version.c
+===================================================================
+--- git.orig/src/version.c
++++ git/src/version.c
+@@ -743,6 +743,8 @@ static char *(features[]) =
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
++    3402,
++/**/
+     0
+ };
+ 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6fe8fb90db..ecaba7107e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -17,7 +17,9 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+           file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
 "
+
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
-- 
2.25.1

