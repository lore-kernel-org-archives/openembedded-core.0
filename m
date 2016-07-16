Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2844E6067C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 23:04:23 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id dx3so8423633pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 16:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2M3CBXjF3rANr1NRjMLSSUpRalIJHf1J8dkG4nx4k9c=;
	b=ws/w2AAeSSQ4oYSOXigKTfliJD0su7xwrlDHW74XpP404qrtyJAAG0pgAn57jbIeQV
	3jRA2yhGuk9yJRQZWo+eSd8e2Y1p9yFfzDZU1x08Mps6nlPT/kGIhzp6nMhgKrkZ/DEc
	T6/wKVG5vraPNrP3fqwcHP+DQXimEUGDwtN3c6XXZoLM4GzOlFMaW+QVXujNTud739m3
	1dfuhisirXOYTy5DLeYun5dfwMxtI2pbOK6AXV5A9XLGlFSYEZ0/6vSkvnklPd1nyhOX
	LCoVO32HaU6emCVDGbngb6GELofYVy5YgW2vWTfVvfbLPss5kl+sBZYAXljDtvTkxMEi
	MQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2M3CBXjF3rANr1NRjMLSSUpRalIJHf1J8dkG4nx4k9c=;
	b=AtNBYD9nWvo6qEJDuKeHOY9ijnigt8hZ04Vooztz3aLp59lxLvRD73yh8t7kZRwDa5
	/YmXmABwMujZw9N9Vl09VnS8M7wCrtB+RBm+xrFdCpCjYavqAauqGFWhymU3LUt77zZG
	3Mk1Bh8BhL62L8+YWapznbFjTNLCFkN9nOOR99RbdQ4GgNj3oa97Z/nY9I8GxBtC6yEG
	8+Yp6D6ibQlsr21iYEfCItF3hU6Eup9+QHRvuePD5/ydC4mvw5fOU6IZpVtqerJLsCYT
	rpFaGrh7xyB8xKdpzo1g0QeJXOMgWnNVMBcMjCpri5oNRZVfNgaeVyLQfqLyBW4GNTd4
	xl0Q==
X-Gm-Message-State: ALyK8tLJ405+9dNGyr/bXq1mrhzK2ytBji7SzXCrVbp5kX6FsMETnEyCEDQyYlCOnWfTyQ==
X-Received: by 10.66.94.71 with SMTP id da7mr43734660pab.31.1468710264251;
	Sat, 16 Jul 2016 16:04:24 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 84sm2346368pfp.59.2016.07.16.16.04.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 16:04:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 16 Jul 2016 16:04:14 -0700
Message-Id: <1468710255-5030-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
References: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][PATCH] 4/5] python2: Security fix CVE-2016-5636
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
X-List-Received-Date: Sat, 16 Jul 2016 23:04:24 -0000

From: Armin Kuster <akuster@mvista.com>

Affects python2 < 2.7.11
Base score (4.4) Medium

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../python/python/CVE-2016-5636.patch              | 44 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.11.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2016-5636.patch

diff --git a/meta/recipes-devtools/python/python/CVE-2016-5636.patch b/meta/recipes-devtools/python/python/CVE-2016-5636.patch
new file mode 100644
index 0000000..9a37471
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2016-5636.patch
@@ -0,0 +1,44 @@
+
+# HG changeset patch
+# User Benjamin Peterson <benjamin@python.org>
+# Date 1453357424 28800
+# Node ID 985fc64c60d6adffd1138b6cc46df388ca91ca5d
+# Parent  7ec954b9fc54448a35b56d271340ba109eb381b9
+prevent buffer overflow in get_data (closes #26171)
+
+Upstream-Status: Backport
+https://hg.python.org/cpython/rev/985fc64c60d6
+
+CVE: CVE-2016-5636
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: Python-2.7.11/Misc/NEWS
+===================================================================
+--- Python-2.7.11.orig/Misc/NEWS
++++ Python-2.7.11/Misc/NEWS
+@@ -7,6 +7,9 @@ What's New in Python 2.7.11?
+ 
+ *Release date: 2015-12-05*
+ 
++- Issue #26171: Fix possible integer overflow and heap corruption in
++  zipimporter.get_data().
++
+ Library
+ -------
+ 
+Index: Python-2.7.11/Modules/zipimport.c
+===================================================================
+--- Python-2.7.11.orig/Modules/zipimport.c
++++ Python-2.7.11/Modules/zipimport.c
+@@ -895,6 +895,11 @@ get_data(char *archive, PyObject *toc_en
+         PyMarshal_ReadShortFromFile(fp);        /* local header size */
+     file_offset += l;           /* Start of file data */
+ 
++    if (data_size > LONG_MAX - 1) {
++        fclose(fp);
++        PyErr_NoMemory();
++        return NULL;
++    }
+     raw_data = PyString_FromStringAndSize((char *)NULL, compress == 0 ?
+                                           data_size : data_size + 1);
+     if (raw_data == NULL) {
diff --git a/meta/recipes-devtools/python/python_2.7.11.bb b/meta/recipes-devtools/python/python_2.7.11.bb
index 7eced2d..1e4a30d 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.11.bb
@@ -27,6 +27,7 @@ SRC_URI += "\
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://avoid_parallel_make_races_on_pgen.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
+  file://CVE-2016-5636.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.3.5


