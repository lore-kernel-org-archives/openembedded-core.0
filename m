Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id F27AA7942C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:44 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id q11-v6so3109567oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sdTvmd+sxgO9yC4PeBiV2dE+QmzFLx1Kqum6weRldAk=;
	b=kEzCBtgDjf2fO28lGLUPjaY7rnyzcs6ageU05c8sBY6lqv8Y8+OsPifxriq5xD0Fwz
	awJA3TEjhPcxyrMMtw/3HIB5nLF32iB8DjnUhdidazhFVzrN05xJg+4Hc6lNffaQ6Ehy
	rGqxkHE6IaLxlMMUI5Km3MylIygwlINAqpAfuYVAIHDxScHFxvmRNcOS8AKELYK8MyxX
	trtEfC2m8gjFSzh+37pXqsrO9fDICkDCu8urW+75LcW70OiFLtCyMSe87tOU5Oon4jK9
	n2UKil2ZFmYlVaXCGXaZf1FZxE1ASItNTVU570APqIBx1BkyJjiN5z60DKecge+EfQ6j
	uWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sdTvmd+sxgO9yC4PeBiV2dE+QmzFLx1Kqum6weRldAk=;
	b=AZzsxxRW5VtrCmJqgdBNxnfPpz6sfhWA8/ZHou0rPLnTCD5rQ20iqE23wx+Iskqv+w
	xlJE8oUnPGP4BHvpXZW6cdUWQkh89mISlTuudVpbEe4RMvbdAOLKwkL5XBoPk8+jlefl
	1581+g9hqdAxmdaXIAwVrmjBdvboF+E/rlF89ZQTvZ7j1yOOhAgT1CqObZ8Eubrxy7WF
	PkGpfKlNW3nKoqmDNwkItnDzJIJI7WBzkVmritZCIXhXysV+dV47WOKK1xliJb2rK+4k
	45x7j4YuOOW5cbnXBDFnGR6k1P3jdZb2iI9wJC8sTnyXIt+crcd7DlUW7QqnxMrlrLUX
	H5MQ==
X-Gm-Message-State: APzg51BYeMEYbuG0PdL6HECjL2cTyRtMKI98END+npRdxBq4+T7F8KDy
	jYqJOcv/kHbRA2maK6aAj4jUInAmlzY=
X-Google-Smtp-Source: ANB0VdZA/PWNF3SqphGHq4EQ/pO3YalJOCjHmeRBjBwNXAPMeGnfwLrSQBGvLHNov05ea7p3DIZxgg==
X-Received: by 2002:aca:cf97:: with SMTP id
	f145-v6mr4164167oig.131.1534945005763; 
	Wed, 22 Aug 2018 06:36:45 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:45 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:24 +0530
Message-Id: <1534944940-21566-18-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 18/34] pcmanfm: CVE-2017-8934
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:45 -0000

Fix potential access violation, use runtime user dir instead of tmp dir.

pcmanfm = 1.2.5

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-sato/pcmanfm/files/CVE-2017-8934.patch | 60 ++++++++++++++++++++++
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb         |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/pcmanfm/files/CVE-2017-8934.patch

diff --git a/meta/recipes-sato/pcmanfm/files/CVE-2017-8934.patch b/meta/recipes-sato/pcmanfm/files/CVE-2017-8934.patch
new file mode 100644
index 0000000..ea34555
--- /dev/null
+++ b/meta/recipes-sato/pcmanfm/files/CVE-2017-8934.patch
@@ -0,0 +1,60 @@
+From bc8c3d871e9ecc67c47ff002b68cf049793faf08 Mon Sep 17 00:00:00 2001
+From: Andriy Grytsenko <andrej@rep.kiev.ua>
+Date: Sun, 14 May 2017 21:35:40 +0300
+Subject: [PATCH] Fix potential access violation, use runtime user dir instead
+ of tmp dir.
+
+CVE: CVE-2017-8934
+Upstream-Status: Backport [https://git.lxde.org/gitweb/?p=lxde/pcmanfm.git;a=commitdiff;h=bc8c3d871e9ecc67c47ff002b68cf049793faf08]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ NEWS              | 4 ++++
+ src/single-inst.c | 7 ++++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index 8c2049a..876f7f3 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,7 @@
++* Fixed potential access violation, use runtime user dir instead of tmp dir
++    for single instance socket.
++
++
+ Changes on 1.2.5 since 1.2.4:
+ 
+ * Removed options to Cut, Remove and Rename from context menu on mounted
+diff --git a/src/single-inst.c b/src/single-inst.c
+index 62c37b3..aaf84ab 100644
+--- a/src/single-inst.c
++++ b/src/single-inst.c
+@@ -2,7 +2,7 @@
+  *      single-inst.c: simple IPC mechanism for single instance app
+  *
+  *      Copyright 2010 Hong Jen Yee (PCMan) <pcman.tw@gmail.com>
+- *      Copyright 2012 Andriy Grytsenko (LStranger) <andrej@rep.kiev.ua>
++ *      Copyright 2012-2017 Andriy Grytsenko (LStranger) <andrej@rep.kiev.ua>
+  *
+  *      This program is free software; you can redistribute it and/or modify
+  *      it under the terms of the GNU General Public License as published by
+@@ -404,11 +404,16 @@ static void get_socket_name(SingleInstData* data, char* buf, int len)
+     }
+     else
+         dpynum = 0;
++#if GLIB_CHECK_VERSION(2, 28, 0)
++    g_snprintf(buf, len, "%s/%s-socket-%s-%d", g_get_user_runtime_dir(),
++               data->prog_name, host ? host : "", dpynum);
++#else
+     g_snprintf(buf, len, "%s/.%s-socket-%s-%d-%s",
+                 g_get_tmp_dir(),
+                 data->prog_name,
+                 host ? host : "",
+                 dpynum,
+                 g_get_user_name());
++#endif
+ }
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
index 75ff773..0ab8a2e 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
@@ -17,7 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://gnome-fs-regular.png \
 	   file://gnome-mime-text-plain.png \
 	   file://emblem-symbolic-link.png \
-	   file://no-desktop.patch"
+	   file://no-desktop.patch \
+	   file://CVE-2017-8934.patch"
 
 SRC_URI[md5sum] = "b4d1f8ce08d87e4f27805a246fc51ac2"
 SRC_URI[sha256sum] = "0c86cac028b705ff314c7464d814c2cf7ff604c17491c20aa204b1ef1a80ad67"
-- 
2.7.4


