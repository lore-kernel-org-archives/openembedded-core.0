Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA0077E92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:35 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f6so7589000pln.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j5Ve2SnYk/bKOLTRHr9aFcq4Fqlnqbluu6GqhwO5vx8=;
	b=ZsqQb+wBg+2jAvf38WsNFYLeBMKkrUOZL1+iZYCHRxgg5Z43Wv496e2iZji+Kf7Zci
	nkfaC3c5RtwRO45Jo1AOkG01gAwwsmhjkFrh5rrXfiv2XOvkUs3Qg5NlWClkiNN7f6Ij
	Brgmr601KK3/bZcBhpGgvfKgNxfgrBTRpWl9xuQAHRU2S6e/8UZ/LzMly4UHnX0bPZrA
	/WIlwDDRqFLlthmVZMYoAu2teTlTBcwP9arVDci6JXgmInwh7ngtC0bMsm7d317sFp82
	IWL0Eo+eoGm43vwZyCTDrxKQslvPtVa+H2/evl9Fi8kyVB+WcuCFLClt3UQ2cYUMpcZo
	qzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j5Ve2SnYk/bKOLTRHr9aFcq4Fqlnqbluu6GqhwO5vx8=;
	b=jMAsuzrctnu4kLMHQq44BnaMQIL8T4wI0FnREB+pK066jlV3TocrviTXseOvfXl1ni
	h35VFE86K3j+4b9YpxelXHUHpOD3sHwtjgyH5poURWYDu7azKvrYcjcs3ZxUSU4Korh/
	FQ4C11o2tYUOrdW1jjEFByjXFG+pJBJP+K/GeAQkMzBhY+BXnSMbFIEaJqV0kccVoLri
	bPjU5v5KabxDf+aD2G3iD5IpKWk0kUMpqJuX3DGt/5kXQatyM6NADiMRbMypfcyTXlID
	cP+/nq9GG9NtB/hu/bV8n/CB1l3SabiRdBWspSunAC6oVyeXbudocJOc34WZybKYcbYM
	468A==
X-Gm-Message-State: AJaThX5gkAp8jglrqg+MTCK/oCG1OdEjDf75E5s77OeK/85UZ7IBcH39
	QK8zOthfE0LDD7wKKJWA8CsZMw==
X-Google-Smtp-Source: AGs4zMZHiWpdxa6qV9MiMiJ/Ev6mxiFXNcyJeQBt4bH9eKrgsmnppnHUEjMxL1xXAXD1sRVts3s+Xw==
X-Received: by 10.84.130.33 with SMTP id 30mr37493670plc.161.1511750137051;
	Sun, 26 Nov 2017 18:35:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:11 -0800
Message-Id: <1511750112-2263-25-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 25/26] binutils: Security fix for CVE-2017-9954
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:36 -0000

Affects: <= 2.28
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9954.patch          | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9954.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index a2b2901..fe9059a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -67,6 +67,7 @@ SRC_URI = "\
      file://CVE-2017-9753.patch \
      file://CVE-2017-9755.patch \
      file://CVE-2017-9756.patch \
+     file://CVE-2017-9954.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9954.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9954.patch
new file mode 100644
index 0000000..8a9d7eb
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9954.patch
@@ -0,0 +1,58 @@
+From 04e15b4a9462cb1ae819e878a6009829aab8020b Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 26 Jun 2017 15:46:34 +0100
+Subject: [PATCH] Fix address violation parsing a corrupt texhex format file.
+
+	PR binutils/21670
+	* tekhex.c (getvalue): Check for the source pointer exceeding the
+	end pointer before the first byte is read.
+
+Upstream-Status: Backport
+CVE: CVE_2017-9954
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/tekhex.c  | 6 +++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+Index: git/bfd/tekhex.c
+===================================================================
+--- git.orig/bfd/tekhex.c
++++ git/bfd/tekhex.c
+@@ -273,6 +273,9 @@ getvalue (char **srcp, bfd_vma *valuep,
+   bfd_vma value = 0;
+   unsigned int len;
+ 
++  if (src >= endp)
++    return FALSE;
++
+   if (!ISHEX (*src))
+     return FALSE;
+ 
+@@ -514,9 +517,10 @@ pass_over (bfd *abfd, bfd_boolean (*func
+   /* To the front of the file.  */
+   if (bfd_seek (abfd, (file_ptr) 0, SEEK_SET) != 0)
+     return FALSE;
++
+   while (! is_eof)
+     {
+-      char src[MAXCHUNK];
++      static char src[MAXCHUNK];
+       char type;
+ 
+       /* Find first '%'.  */
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-06-26  Nick Clifton  <nickc@redhat.com>
++ 
++       PR binutils/21670
++       * tekhex.c (getvalue): Check for the source pointer exceeding the
++       end pointer before the first byte is read.
++
+ 2017-06-15  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21582
-- 
2.7.4


