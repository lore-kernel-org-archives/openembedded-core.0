Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7221F7780D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:12 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id a12so7599098pll.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=7oOLP7iJpX7+SB7tE2VAJTWN7HE3L8u9aRlUatQO3I8=;
	b=bcIQp5I/g4aHgrqgu7qGac9coWkWE61y2eCQ/xaCfDWNBOt33SFjHlOljxupfkLeCg
	Y4vbDpbTNJ6C5a8u9K8jVYCQE9y0fuHCCj9gwdaG6yOV/qh1T0a5BHy5qbWeeg7ZuEhp
	7N6S5USJRHivaWE4PKzxDuPDkWw99KsBvM1dHJa6WLaTPcAY/TpZHe3nlUPa5ncEdDzp
	1VagmzyuYRH9RmwiCPDw/1LEp9NSCgpxxy2SrzPU7APnM1h29CLLd1LhlKoygHyMqdIb
	f/zay6SsFh1Xo/3zUrzyOzh6PcejvJyb79GMol5fYpDjFdWFWEYgUb2IEZLYWwKKqy5x
	jgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7oOLP7iJpX7+SB7tE2VAJTWN7HE3L8u9aRlUatQO3I8=;
	b=gCv+HnX9JIpeWB8HXqxAgmYz/9x9vLiyU7H6samcSru/rjNibbjRIYfTU6SpFK1VWO
	3F0y2G0wALt+LcbPwquJogBlOK8hYDGkFnp5cH4/tgByaHtZ6OC41wmB9pZcGkGx4Knq
	tdYeMpoYHLIdnWq8Tm4+CoZbjKO6OOhVZXXxJme88rZW1LoFoXKIwWCFEN/AfimFOniu
	Yx9QThpTOry4aq6Y+wUNEieAu5rlHhpQUwXV9Eee0TesAn5MJfSj5goGqSHj2RZCJHrd
	5mWc2jMs9UYE1PiiDa4bZpcvET4F1SEj+1oU9C6c/PFDkh7l52Nr6kJOjAuWjbPYB+Ya
	ee4w==
X-Gm-Message-State: AJaThX7cPl7gz+L6U3eDaEliOasRK1OJ8dpvJpkwXzcWHGLxy2hPKu9K
	eChjEG6CXHA8WDHr2azdRoaC2Q==
X-Google-Smtp-Source: AGs4zMbcsCgiYm8tqWESd710rz7ktnWPD+5TNncF3DeuogoozVJje5KFvX6ZFbrhND4prgvIrslv/w==
X-Received: by 10.84.149.139 with SMTP id m11mr13427499pla.36.1511750114413;
	Sun, 26 Nov 2017 18:35:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:47 -0800
Message-Id: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [pyro][PATCH 01/26] binutils: Security fix CVE-2017-7223
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:13 -0000

Affects <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-7223.patch          | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7223.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 40b518b..f09bcdc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -43,6 +43,7 @@ SRC_URI = "\
      file://CVE-2017-6969_2.patch \
      file://CVE-2017-7209.patch \
      file://CVE-2017-7210.patch \
+     file://CVE-2017-7223.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7223.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7223.patch
new file mode 100644
index 0000000..c78c8bf
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-7223.patch
@@ -0,0 +1,52 @@
+From 69ace2200106348a1b00d509a6a234337c104c17 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 1 Dec 2016 15:20:19 +0000
+Subject: [PATCH] Fix seg fault attempting to unget an EOF character.
+
+	PR gas/20898
+	* app.c (do_scrub_chars): Do not attempt to unget EOF.
+
+Affects: <= 2.28
+Upstream-Status: Backport
+CVE: CVE-2017-7223
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gas/ChangeLog | 3 +++
+ gas/app.c     | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+Index: git/gas/ChangeLog
+===================================================================
+--- git.orig/gas/ChangeLog
++++ git/gas/ChangeLog
+@@ -1,3 +1,8 @@
++2016-12-01  Nick Clifton  <nickc@redhat.com>
++ 
++       PR gas/20898
++       * app.c (do_scrub_chars): Do not attempt to unget EOF.
++
+ 2017-03-02  Tristan Gingold  <gingold@adacore.com>
+ 
+ 	* configure: Regenerate.
+@@ -198,7 +203,6 @@
+ 	* config/tc-pru.c (md_number_to_chars): Fix parameter to be
+ 	valueT, as declared in tc.h.
+ 	(md_apply_fix): Fix to work on 32-bit hosts.
+->>>>>>> 0115611... RISC-V/GAS: Correct branch relaxation for weak symbols.
+ 
+ 2017-01-02  Alan Modra  <amodra@gmail.com>
+ 
+Index: git/gas/app.c
+===================================================================
+--- git.orig/gas/app.c
++++ git/gas/app.c
+@@ -1350,7 +1350,7 @@ do_scrub_chars (size_t (*get) (char *, s
+ 		  PUT (ch);
+ 		  break;
+ 		}
+-	      else
++	      else if (ch2 != EOF)
+ 		{
+ 		  state = 9;
+ 		  if (ch == EOF || !IS_SYMBOL_COMPONENT (ch))
-- 
2.7.4


