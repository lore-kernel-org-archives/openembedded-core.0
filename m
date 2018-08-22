Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA7A7934B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:02 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id 8-v6so2537575oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sdTvmd+sxgO9yC4PeBiV2dE+QmzFLx1Kqum6weRldAk=;
	b=Y7+FsNftcnuRf3Sa2/mIAmoIX07luRco2kLJLTEfT+ubDmTby5l9iRuKFawJgsP1nU
	pHl1EEy+TgIRSBi53MRdMMHHQbgojmW9itT+vTxQjKlvBB298nuza+4WyRp1JXnGYNJI
	bFloK/2hLdxE3tL3UtC6iWSsWJrWApAqXkWhnbq3QlVvalhNyh1Y8JmrE63GjELN3qn6
	fow9eNKOK60hHz6R6/Cy3MevYUQ26ZHkQUl6TG/P3jf37CHcsBBjD1oE5v3WwvwaGgQV
	g/QAw+xGldzUVTVYrakXqd5qyV7+K0zQ8Zjie14SoAL6gdIBH6wuTVa3b/QQJEIVRf+i
	Y0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sdTvmd+sxgO9yC4PeBiV2dE+QmzFLx1Kqum6weRldAk=;
	b=UnsMZ0JSXG3LmG53SkQeeHv9TF4Q94V7hVnELAm7FOu0DZvjTpbIr4tqCwL59idS7O
	f4qS9jgGJDnyGenuw0LCO0o2ZT5IGUDVxxb0vsxWWZfYw2CGX/GR3n4yDwfBTq8SFhJB
	/lYRT1KwChMGZ1dVOzZsQvgvxWDHIrTFfgYXVCwUIqITlm9sODUgyEWA/cZBly1O9HN7
	197ZuVAbAJIDpvuLBOZAyx5reVhP9n6Sp3GeRsaKoHAbPRu7+RzzocIXGogKRQNNQZr4
	tbaJeBB2rOBYifXWxLoJFECw82bKf1aQWdYwZ00F3gk7sllmcLFl+4LV9obRYZIleO2w
	WN/g==
X-Gm-Message-State: APzg51Asmik3Jrs7iSgA0Y1q4qWpl184Ul2WvZNgkFn+fhZnp0BDxnt1
	GSu/EDKsqkWyAffaxjNwG+nsXB0IRyc=
X-Google-Smtp-Source: ANB0VdYLAzdTozd28HdRYCf4DNoTaxwXcupGt5ifKFX+pKJkWUpLqTahAGVVNqmyKHY6F5ks9LJe3Q==
X-Received: by 2002:aca:ba57:: with SMTP id
	k84-v6mr3643995oif.10.1534936743433; 
	Wed, 22 Aug 2018 04:19:03 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:03 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:56 +0530
Message-Id: <1534936692-11736-18-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 18/34] pcmanfm: CVE-2017-8934
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:03 -0000

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


