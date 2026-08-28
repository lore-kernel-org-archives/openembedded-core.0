Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00C2C61DDC
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2981.1787945895912232111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nrS9zvhn;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fd4531020so796845f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945894; x=1788550694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hKjt2cw6x75L/07A03s7Y7CtOmHS8WeJO39GG7GPhq0=;
        b=nrS9zvhnt38lLhyBKu6u6usaXUSrahCw95GaSqWkeLLZuiYt8jOuvFaHVuBE5Dp/cQ
         yVvtNW8jIAHyQYuR8rgGC0eHgEyu8TKCtpjHJY45bx8WpZMz40o8AcHLTAL5o5SjFhCg
         tNSkP//TBFIFlSNb7zhiyTEui3XBkVDrRdz2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945894; x=1788550694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hKjt2cw6x75L/07A03s7Y7CtOmHS8WeJO39GG7GPhq0=;
        b=HlSAxZQv326z4udG6eAZ8YNtF8uljzvhvjtWXHSt/d6hoBzS+IBAo7P6bzeOYYblAY
         0o09DGAZu94eqH2fLLdOkKQgQQz/OfKSt/dlsY9m44pNvNXANKO13h1Ov4bfJfP/BAIL
         maSJ3s1FrZMIIu5ciAguCQRHSXUOnEmH9Mk1Ih6cVlnyRu5QgYm0cc2AVWEfqn2svRNq
         /a4H8MKe4sxblNu2djsGUEAibk6p5OySZl94eBtmlhHnqaHGGr7JMbGqIFN15d1nv3aT
         rmwK7qZTH3bhiqWiQJuhevSXL0rKuo17miqtDqZmd+TZdixq1MgPM536jrJoVoeZM9fw
         XafA==
X-Gm-Message-State: AFuF++nkzY6ZjVECf89ESAKfuRtwJUerAAiYxZlUA9AU7lKHC0m5OkiV
	sGsNkttEoBCq+71ocfBohF5G8ea3/4est3zxi4rB0XvjeZUNTvBTJlGunnckSyASVgigVUskLF2
	NfF4F3BE=
X-Gm-Gg: AR+sD11vU9x6daTjrUibCz93Iq+QUbKpZj0kR1AvkKz55DqGNWPPBM5rn/XBV5bbf4w
	0wHY/Q91cjKsE3pwKKpVwGVisMgzdvmdl4USPbPeuq6vRjiHxrX2rompfVjUX3HHGoIVRdfjsZD
	LrrUPw/VwX/b1EkB5ebjzHVxogbDcIRhh3S59K3R0Zci1kHw6bWF60N5bxQIroQaBg0JQXXUV1A
	qeXFag5cegNjcioBBcbeYepZcaZq0Wxr3GKZs7Z1d6QSr+VXK6pQmM968RD7gYCiq98FL8YHSCs
	ROyMCIy1iCnkM80WV8PmLJnUuQf4Kmu6iWcJUqaa0ayYLOWJAQLhkdkOvQ07KioxD6/AzBurLyC
	VjbcJbu/QvaokWbiFKdDVnz8+q1kLR769j9xuIXHCgshdr9C6fR4GPglXZrEX6BUR0PQPwbxsau
	r/z6yluESrA2ZBUMBQpLIHYGqJ8mRNFbtIRE52kHiSW6y0YtPXJHTy0J4SzquGz9rLHLsIM1ps6
	Q/w2xzTLkfFSnJlSdQYq/8itB/0EEWMkEB9smk8QKUZle6MvtwUs3O6zdq5tUGD
X-Received: by 2002:a05:600c:a03:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49b91c5096dmr122687605e9.15.1787945894104;
        Fri, 28 Aug 2026 12:38:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/56] vim: Fix for CVE-2026-57455
Date: Fri, 28 Aug 2026 21:35:28 +0200
Message-ID: <239ab2395f66f622adb8e1e6378325334e19eb66.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244579

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57455

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57455.patch            | 87 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/recipes-support/vim/files/CVE-2026-57455.patch
new file mode 100644
index 00000000000..8b5bd0e0e8b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57455.patch
@@ -0,0 +1,87 @@
+From f2744f3810cee1c63850e58f85cda299a2c20ce3 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:20:03 +0000
+Subject: [PATCH] patch 9.2.0698: [security]: Out-of-bounds write with
+ soundfold()
+
+Problem:  [security]: Out-of-bounds write with soundfold()
+          (cipher-creator)
+Solution: Add an abort condition to the for loop to validate the buffer
+          size.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-q8mh-6qm3-25g4
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b]
+CVE: CVE-2026-57455
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/spell.c                    |  2 +-
+ src/testdir/test_spellfile.vim | 21 +++++++++++++++++++++
+ src/version.c                  |  2 ++
+ 3 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 72d1f0b52..e0fc17bfb 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3270,7 +3270,7 @@ spell_soundfold_sofo(slang_T *slang, char_u *inword, char_u *res)
+     else
+     {
+ 	// The sl_sal_first[] table contains the translation.
+-	for (s = inword; (c = *s) != NUL; ++s)
++	for (s = inword; (c = *s) != NUL && ri < MAXWLEN - 1; ++s)
+ 	{
+ 	    if (VIM_ISWHITE(c))
+ 		c = ' ';
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 5b2ed4efd..50afe3dfa 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1224,4 +1224,25 @@ func Test_spell_sug_tree_count_words_overflow()
+   bwipe!
+ endfunc
+ 
++" A word longer than MAXWLEN must not overflow the soundfold result buffer in
++" the single-byte SOFO branch of spell_soundfold_sofo().
++func Test_soundfold_overflow()
++  let _enc=&enc
++  set enc=latin1
++  call writefile(['SOFOFROM ab', 'SOFOTO xy'], 'Xtest.aff', 'D')
++  call writefile(['1', 'foo'], 'Xtest.dic', 'D')
++  mkspell! Xtest Xtest
++  defer delete('Xtest.latin1.spl')
++  defer delete('Xtest.latin1.sug')
++  setl spelllang=Xtest.latin1.spl spell
++
++  " Before the fix the copy loop wrote one byte per input byte into a
++  " MAXWLEN (254) stack buffer with no upper bound, smashing the stack.
++  let sound = soundfold(repeat('ab', 300))
++  call assert_true(strlen(sound) < 254, 'soundfold result exceeds MAXWLEN')
++
++  set spell& spelllang&
++  let &enc = _enc
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 80d3cc7f5..d3b72595f 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    698,
+ /**/
+     679,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 93b8ba39700..8c5a5e88a9c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57451.patch \
            file://CVE-2026-57453.patch \
            file://CVE-2026-57454.patch \
+           file://CVE-2026-57455.patch \
            "
 
 PV .= ".0340"

