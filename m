Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id C002B7943A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:40 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id q11-v6so3672813oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sdTvmd+sxgO9yC4PeBiV2dE+QmzFLx1Kqum6weRldAk=;
	b=qHDmx9BOtaso48fLn0bK+eZ9iGbfMxCu4CIEL9yxuo4n/sxvdQtu22rLN/lh84CcaZ
	+l+rWTU1NION0mPWnNr6wr9RiJw7n7ftCdWAUuV0kLq4HstM9oAKwgWrUUpcCns/l3EW
	PfxJw4JMiOnUx7xTBI8xPUYn6jwobh+1geX2AlwLjLFx7avSijIAhVe6f3kL1I0j/xiN
	Q3IKYutgSToOFKi4GJfL4+EsfFPVfDI5DFdUZ8HdGWZK7xaQN4bC2EZAvawGdtNOKpVg
	IzGvTOaqtInnGizdx+pY+O+o+9LX7dvgNRjTLu9W0uxEWXFUSBy4Q9IZugdPcVihcYsJ
	W8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sdTvmd+sxgO9yC4PeBiV2dE+QmzFLx1Kqum6weRldAk=;
	b=pPmlDDAa19L5f1sQ2bMxa9pK0Vwasn0fdZS/YPtEbCdEQ5ANfAzm41wBwzX1x5c5EE
	Ed+qinTWNVhmsDle/z2O05SqgKf2WwdFUMNG2jUN2F+bh4Vc0+GdMLqcu86AK59iLyap
	o5c3lvP1qg+2bO4KRVWGBfIdzxvcHc8g4nNb19HybkveAkI8P2gbR8TUfI6bUIeFoQ5o
	aduU3P5gC+i4oDlwtys9Pkoksq65KSSWRyI5yzDi6nGOM971ts/BR7DXWMNE+JWpL/2/
	QbHKH2NuMKykzzENRhG6VFe7rIcR4fLbUGHpw1oe8rP8yq8LvMa8I9e9yLj9/FbCY/CK
	wYQQ==
X-Gm-Message-State: APzg51A8N0rdeWdMAvYDsH9wAEazLdFpCfCXhKafjAo9PbblADE4v1/n
	LkUYiOc4Iv8wm9A/WG1/zn33EFJr/IU=
X-Google-Smtp-Source: ANB0VdZyWgEC3xZ0mMJqtKkfAd8tq5qPqXQr6SdbrSCoZY2PkfUr86Dv1UKthoUSc7p7nE6OgUJqFQ==
X-Received: by 2002:aca:d946:: with SMTP id
	q67-v6mr2003683oig.212.1534950581627; 
	Wed, 22 Aug 2018 08:09:41 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:41 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:36 +0530
Message-Id: <1534950532-23850-18-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 18/34] pcmanfm: CVE-2017-8934
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:41 -0000

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


