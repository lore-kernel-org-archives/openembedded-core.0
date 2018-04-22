Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E0BE865D35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2018 01:00:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m21so2876632pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 18:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=32jQwImneMMpfvCIHeF18QHbWAG6kgld3qvpKL/U2g4=;
	b=R8O+X9JtzHrhbMrvb+QH+KYwBP0+4NrLj56YY5CChuevy4eBbZw1U5NK/psSUG3hid
	oRB2PWCamX27quu+z0jTANjMMQVjh/Q9Rt7irA2m0oLP7qva4IoLE+c/tF96fyKQ4pho
	+cyrskBugLx6BsOd57o0f4PB9ebu1TlIjxGMtjjIUYl8XT//rYJ4V+Fh5yR/9dZA0xPb
	QsTjG/wEYhg+bgXxvutS3RsYlU3/DycSildRtCUakLZy21gaarkYUJ04FpmYFRw67cB4
	0+kWq8Ic303wpW7jQviWKKtyb/qsNy+qQisB7V4uOTzjNGcGIX5vGhYoOVllutxptcXc
	3AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=32jQwImneMMpfvCIHeF18QHbWAG6kgld3qvpKL/U2g4=;
	b=iXI+5WlcQJqtxHcyp+kZOlHWIo/TgszBS+umpjIN6VARpZoz77IJ7xn+i6ifSu4v8r
	Rt1XQQ/bY1O8FlWV0ueppXyNa39As5+w5fiQas1/vlcf+vHiUP7DM1qAJ5+CTHUKfPIi
	VOSJXgY2KlI4MlrfEZ6Elb9n9qYDpPx53Z8+vUKS6MBHFcj46q6brZQQ3qv10muuyxmX
	thFEBhV2KsjMyMsnuunImiq97Tzr3Fs3KENTRbWjJjR/5CrfPL7qVXBeML21H2uhBgAX
	w/QccOeLDhlxUV4JMfisAk3mNtesxkiHBJRXcBFzK0fF2Wp0QiTrAz/zD5XjVD6n39gz
	Qtgg==
X-Gm-Message-State: ALQs6tBN2PXcb4X7NANQvdP7hYEHM7Zd/qvnApFQvNxo2vmr7jkQVLLV
	tmqakgtEHNhb+W8g3wccycahuA==
X-Google-Smtp-Source: AIpwx48R4ACoDix5fCqHdPTsCMcVP4FQPk04kxtWTf1Gv0xnPQUppx4B6XDO4Toai2fbdxywKCbnrA==
X-Received: by 2002:a17:902:9881:: with SMTP id
	s1-v6mr15385355plp.350.1524358832014; 
	Sat, 21 Apr 2018 18:00:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ad3f:3096:6add:98d8])
	by smtp.gmail.com with ESMTPSA id
	x29sm19224522pfk.68.2018.04.21.18.00.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Apr 2018 18:00:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 21 Apr 2018 18:00:30 -0700
Message-Id: <1524358830-24383-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][sumo][PATCH] perl: Security fix CVE-2017-12883
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Apr 2018 01:00:31 -0000

Affects: Perl  < 5.24.3-rc1 and  5.26.x before 5.26.1-RC1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../perl/perl/CVE-2017-12883.patch                 | 44 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2017-12883.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2017-12883.patch b/meta/recipes-devtools/perl/perl/CVE-2017-12883.patch
new file mode 100644
index 0000000..5c1805f
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2017-12883.patch
@@ -0,0 +1,44 @@
+From 40b3cdad3649334585cee8f4630ec9a025e62be6 Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Fri, 25 Aug 2017 11:33:58 -0600
+Subject: [PATCH] PATCH: [perl #131598]
+
+The cause of this is that the vFAIL macro uses RExC_parse, and that
+variable has just been changed in preparation for code after the vFAIL.
+The solution is to not change RExC_parse until after the vFAIL.
+
+This is a case where the macro hides stuff that can bite you.
+
+(cherry picked from commit 2be4edede4ae226e2eebd4eff28cedd2041f300f)
+
+Upstream-Status: Backport
+CVE: CVE-2017-12833
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ regcomp.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+Index: perl-5.24.1/regcomp.c
+===================================================================
+--- perl-5.24.1.orig/regcomp.c
++++ perl-5.24.1/regcomp.c
+@@ -11918,14 +11918,16 @@ S_grok_bslash_N(pTHX_ RExC_state_t *pREx
+ 	}
+         sv_catpv(substitute_parse, ")");
+ 
+-        RExC_parse = RExC_start = RExC_adjusted_start = SvPV(substitute_parse,
+-                                                             len);
++        len = SvCUR(substitute_parse);
+ 
+ 	/* Don't allow empty number */
+ 	if (len < (STRLEN) 8) {
+             RExC_parse = endbrace;
+ 	    vFAIL("Invalid hexadecimal number in \\N{U+...}");
+ 	}
++
++        RExC_parse = RExC_start = RExC_adjusted_start
++                                              = SvPV_nolen(substitute_parse);
+ 	RExC_end = RExC_parse + len;
+ 
+         /* The values are Unicode, and therefore not subject to recoding, but
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 222dd88..53a4262 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -64,6 +64,7 @@ SRC_URI += " \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
+        file://CVE-2017-12883.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


