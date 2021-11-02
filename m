Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7F9C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.6596.1635842605479648097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JBX/bpQQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d24so1452483wra.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5xnGnzd/TuW6mOSYuCndwoksnTjBNDJvwGN/gZ4ths=;
        b=JBX/bpQQ4CWIfk7cq1qgkM5EnIZVZqn5fWUSvlJpj2MrkI1r92hVDPtsTZbBYefZw6
         h9qYHii9sfLyhrIJvNt/OxMu8o9vxfzyg879FCtmnQjY7TMXbsPwE4Y9rdB2W6GEC895
         NYXuethT0daiuWjvYo+sm0RugdUlVKN35z87lbi2X1CcOSMD+hDT1iOdLQDnU/gvubVf
         s/lTkrBc7+FxXy2gucgldABpvR4s5EC22sE3rbky9m9e1vsVaIgOuW77gk0qt3oZ5QSt
         ybEc90NtP+Y2nAR78HiDbl8WfZNFU/BDuuXEs8HBigTIxgR27WrPtSijYcoghYfXVz2+
         aBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5xnGnzd/TuW6mOSYuCndwoksnTjBNDJvwGN/gZ4ths=;
        b=FvdVktlmtGer42wHHye17LVE1s9UXvTKvWq6xnZMrWK5pLITdBnz/pHa6A9R72TK4g
         OwGyVKpHnMzWddn9IqnxFZ7/9p77s5MNui3hupRSfv25BB4gjE0BkZCoRRiybrxf+pcK
         L2ZhO3OwvwedG81FLLlaARAMJHq9FjzWnX/SAKh2a1qZNeAQwdBoYOB4KDBka3ljVIYu
         mpR+suiOdq8kD8EYXgEYPSYXzuOSRnQG1q1YcosZ+e/soELtcGneJdIUBR5jDiXnBCMh
         R6drEfi5mjVl15dg5AjpaLdclht/LUCKxC3UzEZnlwaFSQLcVPOZZ4dkDHY9Dan34Hce
         lGwg==
X-Gm-Message-State: AOAM532WIK3rNdILc3+Ksaq2zNnVFlgbRuyaKIc8akW0BHpT42DLwIJE
	mit/H97JPz/6VB9Bk7E/P+EDHUmMvYE=
X-Google-Smtp-Source: 
 ABdhPJwcbUhSKO+bVhpRsfK+bcglw8sgNxYAnsm8MoagWqQGD7TZX0/8h7B0dZKECMDuerrNfZtC1g==
X-Received: by 2002:a5d:5651:: with SMTP id
 j17mr22090537wrw.166.1635842604075;
        Tue, 02 Nov 2021 01:43:24 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Dengke Du <dengke.du@windriver.com>
Subject: [PATCH 29/33] cracklib: update 2.9.5 -> 2.9.7
Date: Tue,  2 Nov 2021 09:42:59 +0100
Message-Id: <20211102084303.2974802-29-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157767

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Apply-patch-to-fix-CVE-2016-6318.patch | 105 ------------------
 ...port-dictionary-byte-order-dependent.patch |  12 +-
 ...aklib-fix-testnum-and-teststr-failed.patch |  10 +-
 .../{cracklib_2.9.5.bb => cracklib_2.9.7.bb}  |  17 +--
 4 files changed, 21 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
 rename meta/recipes-extended/cracklib/{cracklib_2.9.5.bb => cracklib_2.9.7.bb} (61%)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch b/meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
deleted file mode 100644
index b251ac9056..0000000000
--- a/meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 47e5dec521ab6243c9b249dd65b93d232d90d6b1 Mon Sep 17 00:00:00 2001
-From: Jan Dittberner <jan@dittberner.info>
-Date: Thu, 25 Aug 2016 17:13:49 +0200
-Subject: [PATCH] Apply patch to fix CVE-2016-6318
-
-This patch fixes an issue with a stack-based buffer overflow when
-parsing large GECOS field. See
-https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-6318 and
-https://security-tracker.debian.org/tracker/CVE-2016-6318 for more
-information.
-
-Upstream-Status: Backport [https://github.com/cracklib/cracklib/commit/47e5dec521ab6243c9b249dd65b93d232d90d6b1]
-CVE: CVE-2016-6318
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- lib/fascist.c | 57 ++++++++++++++++++++++++++++++++-----------------------
- 1 file changed, 33 insertions(+), 24 deletions(-)
-
-diff --git a/lib/fascist.c b/lib/fascist.c
-index a996509..d4deb15 100644
---- a/lib/fascist.c
-+++ b/lib/fascist.c
-@@ -502,7 +502,7 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
-     char gbuffer[STRINGSIZE];
-     char tbuffer[STRINGSIZE];
-     char *uwords[STRINGSIZE];
--    char longbuffer[STRINGSIZE * 2];
-+    char longbuffer[STRINGSIZE];
- 
-     if (gecos == NULL)
- 	gecos = "";
-@@ -583,38 +583,47 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
-     {
- 	for (i = 0; i < j; i++)
- 	{
--	    strcpy(longbuffer, uwords[i]);
--	    strcat(longbuffer, uwords[j]);
--
--	    if (GTry(longbuffer, password))
-+	    if (strlen(uwords[i]) + strlen(uwords[j]) < STRINGSIZE)
- 	    {
--		return _("it is derived from your password entry");
--	    }
-+		strcpy(longbuffer, uwords[i]);
-+		strcat(longbuffer, uwords[j]);
- 
--	    strcpy(longbuffer, uwords[j]);
--	    strcat(longbuffer, uwords[i]);
-+		if (GTry(longbuffer, password))
-+		{
-+		    return _("it is derived from your password entry");
-+		}
- 
--	    if (GTry(longbuffer, password))
--	    {
--		return _("it's derived from your password entry");
--	    }
-+		strcpy(longbuffer, uwords[j]);
-+		strcat(longbuffer, uwords[i]);
- 
--	    longbuffer[0] = uwords[i][0];
--	    longbuffer[1] = '\0';
--	    strcat(longbuffer, uwords[j]);
-+		if (GTry(longbuffer, password))
-+		{
-+		   return _("it's derived from your password entry");
-+		}
-+	    }
- 
--	    if (GTry(longbuffer, password))
-+	    if (strlen(uwords[j]) < STRINGSIZE - 1)
- 	    {
--		return _("it is derivable from your password entry");
-+		longbuffer[0] = uwords[i][0];
-+		longbuffer[1] = '\0';
-+		strcat(longbuffer, uwords[j]);
-+
-+		if (GTry(longbuffer, password))
-+		{
-+		    return _("it is derivable from your password entry");
-+		}
- 	    }
- 
--	    longbuffer[0] = uwords[j][0];
--	    longbuffer[1] = '\0';
--	    strcat(longbuffer, uwords[i]);
--
--	    if (GTry(longbuffer, password))
-+	    if (strlen(uwords[i]) < STRINGSIZE - 1)
- 	    {
--		return _("it's derivable from your password entry");
-+		longbuffer[0] = uwords[j][0];
-+		longbuffer[1] = '\0';
-+		strcat(longbuffer, uwords[i]);
-+
-+		if (GTry(longbuffer, password))
-+		{
-+		    return _("it's derivable from your password entry");
-+		}
- 	    }
- 	}
-     }
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index adbe7dfff4..082933e471 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -1,7 +1,7 @@
-From 8a6e43726ad0ae41bd1cc2c248d91deb31459357 Mon Sep 17 00:00:00 2001
+From aae03b7e626d5f62ab929d51d11352a5a2ff6b2d Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Tue, 9 Jun 2015 11:11:48 +0900
-Subject: [PATCH] packlib.c: support dictionary byte order dependent
+Subject: [PATCH 1/2] packlib.c: support dictionary byte order dependent
 
 The previous dict files are NOT byte-order independent, in fact they are
 probably ARCHITECTURE SPECIFIC.
@@ -22,11 +22,11 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
- lib/packlib.c | 214 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
+ lib/packlib.c | 214 +++++++++++++++++++++++++++++++++++++++++++++-
  1 file changed, 210 insertions(+), 4 deletions(-)
 
 diff --git a/lib/packlib.c b/lib/packlib.c
-index f851424..3aac805 100644
+index 8acb7be..a9d8750 100644
 --- a/lib/packlib.c
 +++ b/lib/packlib.c
 @@ -16,6 +16,12 @@
@@ -317,7 +317,7 @@ index f851424..3aac805 100644
 +	fwrite((char *) &tmpdatum, sizeof(tmpdatum), 1, pwp->ifp);
  
  	fputs(pwp->data_put[0], pwp->dfp);
- 	putc(0, pwp->dfp);
+ 	putc(0, (FILE*) pwp->dfp);
 @@ -464,6 +668,7 @@ GetPW(pwp, number)
             perror("(index fread failed)");
             return NULL;
@@ -335,5 +335,5 @@ index f851424..3aac805 100644
  
  	int r = 1;
 -- 
-1.8.4.2
+2.20.1
 
diff --git a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
index 6210e82121..27a4fcbec2 100644
--- a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
@@ -1,7 +1,7 @@
-From 06f9a88b5dd5597f9198ea0cb34f5e96f180e6e3 Mon Sep 17 00:00:00 2001
+From 7250328d7f77069726603ef7132826c9260d3c92 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 27 Apr 2013 16:02:30 +0800
-Subject: [PATCH] craklib:fix testnum and teststr failed
+Subject: [PATCH 2/2] craklib:fix testnum and teststr failed
 
 Error log:
 ...
@@ -18,8 +18,8 @@ Set DEFAULT_CRACKLIB_DICT as the path of  PWOpen
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Pending
 ---
- util/testnum.c |    2 +-
- util/teststr.c |    2 +-
+ util/testnum.c | 2 +-
+ util/teststr.c | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/util/testnum.c b/util/testnum.c
@@ -49,5 +49,5 @@ index 2a31fa4..9fb9cda 100644
  	perror ("PWOpen");
  	return (-1);
 -- 
-1.7.10.4
+2.20.1
 
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
similarity index 61%
rename from meta/recipes-extended/cracklib/cracklib_2.9.5.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.7.bb
index c2677184b4..2537962336 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
@@ -9,19 +9,22 @@ DEPENDS = "cracklib-native zlib"
 
 EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
+SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=master \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
-           file://0001-Apply-patch-to-fix-CVE-2016-6318.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
-SRC_URI[md5sum] = "376790a95c1fb645e59e6e9803c78582"
-SRC_URI[sha256sum] = "59ab0138bc8cf90cccb8509b6969a024d5e58d2d02bcbdccbb9ba9b88be3fa33"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cracklib/files/cracklib/"
-UPSTREAM_CHECK_REGEX = "/cracklib/(?P<pver>(\d+[\.\-_]*)+)/"
+SRCREV = "f83934cf3cced0c9600c7d81332f4169f122a2cf"
+S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
 
+# This is custom stuff from upstream's autogen.sh
+do_configure:prepend() {
+    mkdir -p ${S}/m4
+    echo EXTRA_DIST = *.m4 > ${S}/m4/Makefile.am
+    touch ${S}/ABOUT-NLS
+}
+
 do_install:append:class-target() {
 	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
 }
-- 
2.20.1


