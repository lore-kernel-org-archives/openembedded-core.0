Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 676A86067C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 23:04:25 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id dx3so8423668pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 16:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6vvF/v0zSUFnPcAV1EaxfHV1PH1PUDhZ9gj7x4Lwers=;
	b=HUGo3Y+3MazCoH18rnX6fLO1RaoLC5fOSODAePfPY7fqK9exiuRAlycU2rvkeCquz4
	Ju856qmXQhR1yZ7WXp5kLao17agf1RBnE7XLxrTwqi2bhgsSVC6RmqHYT1kIrLGcXUIp
	kNUEg6aAAm5wLKim9ikEGj2YU+mTTqH9q35T8uryrMES/rpcOWPuSn5BByQOH37OR7jA
	of/TqohnQgAv/JHJt2vr6wTfTaI3+YGur+kVWqVeF43hwAz/aIi/tNkWyUhtGZrBfsmT
	NQlNLE39CpKmpctN87g2vkMwfY+S/hBdMprfiBvJj2xExtM54kIdBHx/ujdCQzu0FkoO
	4Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6vvF/v0zSUFnPcAV1EaxfHV1PH1PUDhZ9gj7x4Lwers=;
	b=k6YzxpNigSgCmWAgNWKd8N1VOArr5MjHQpG6ApnkmNKsex/IPDYd4yfp82FaSeHEZV
	nV+Cs7+py4sVno6CafLQZoXnbHYc84a9ggW7WztiPKBN1p4fdyP3hXG/JcVWQY5bh+gP
	vQBqbijQ4QxuCBHScJSYjeiuUdB59uZphV9dVwh/j6HYpqHHm01daCHACZqI3jXGbcGl
	3OugAv58tlUgXDkuCyUEx6zlui0I4M1ZtGlajtp8HmUilo4Ic7Y8G9gbxLN8RkJ/fBsh
	fo1nUAz+IkAY0ZEJ5oFn5/ALJThs9PhPVGsphCV7wnoeCCcHJzO4WkVDBc3zUpafd0Wj
	xNYw==
X-Gm-Message-State: ALyK8tIdCxxI8s1dERioKsaqu4Tgnvt/EImZ5s5krhEwtZJnb+2GVKYcvtIBAGE/6bLd5g==
X-Received: by 10.66.156.226 with SMTP id wh2mr41616392pab.116.1468710266374; 
	Sat, 16 Jul 2016 16:04:26 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 84sm2346368pfp.59.2016.07.16.16.04.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 16:04:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 16 Jul 2016 16:04:15 -0700
Message-Id: <1468710255-5030-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
References: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][PATCH] 5/5] python3: Security fix CVE-2016-5636
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
X-List-Received-Date: Sat, 16 Jul 2016 23:04:26 -0000

From: Armin Kuster <akuster@mvista.com>

Affects python3 < 3.5.1
Base Score (4.4) Medium

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../python/python3/CVE-2016-5636.patch             | 44 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2016-5636.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2016-5636.patch b/meta/recipes-devtools/python/python3/CVE-2016-5636.patch
new file mode 100644
index 0000000..0d494d2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2016-5636.patch
@@ -0,0 +1,44 @@
+
+# HG changeset patch
+# User Benjamin Peterson <benjamin@python.org>
+# Date 1453357506 28800
+# Node ID 10dad6da1b28ea4af78ad9529e469fdbf4ebbc8f
+# Parent  a3ac2cd93db9d5336dfd7b5b27efde2c568d8794# Parent  01ddd608b85c85952537d95a43bbabf4fb655057
+merge 3.4 (#26171)
+
+Upstream-Status: Backport
+CVE: CVE-2016-5636
+
+https://hg.python.org/cpython/raw-rev/10dad6da1b28
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: Python-3.5.1/Misc/NEWS
+===================================================================
+--- Python-3.5.1.orig/Misc/NEWS
++++ Python-3.5.1/Misc/NEWS
+@@ -91,6 +91,9 @@ Core and Builtins
+   Python.h header to fix a compilation error with OpenMP. PyThreadState_GET()
+   becomes an alias to PyThreadState_Get() to avoid ABI incompatibilies.
+ 
++- Issue #26171: Fix possible integer overflow and heap corruption in
++  zipimporter.get_data().
++
+ Library
+ -------
+ 
+Index: Python-3.5.1/Modules/zipimport.c
+===================================================================
+--- Python-3.5.1.orig/Modules/zipimport.c
++++ Python-3.5.1/Modules/zipimport.c
+@@ -1112,6 +1112,11 @@ get_data(PyObject *archive, PyObject *to
+     }
+     file_offset += l;           /* Start of file data */
+ 
++    if (data_size > LONG_MAX - 1) {
++        fclose(fp);
++        PyErr_NoMemory();
++        return NULL;
++    }
+     bytes_size = compress == 0 ? data_size : data_size + 1;
+     if (bytes_size == 0)
+         bytes_size++;
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 0d667d2..bf29d12 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://use_packed_importlib.patch \
             file://configure.ac-fix-LIBPL.patch \
+            file://CVE-2016-5636.patch \
            "
 SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
 SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
-- 
2.3.5


