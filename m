Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 147657D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:53 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id g3so4426479pfi.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dLPMAKCkDRLaurSOt2DqCB3zHSxRZWgNkuq9EklsQcs=;
	b=vLaad6I5zYQvnH8693EhQQOppkdh5D5BiFkrJ9FYLKAXfWD2pDirokq/aGA6N+8AyT
	5zfhU+e1U+5YUJyWlCLtyxzfJmG15dGntVj9Jn0cBWDFopzng4/lw4cCDXnU+0AfpR8z
	hAL4OYCVl4LKFQUsIM/it6FpuLReDnqQArJp/bDFybHGILOs3qmo6LKZvlJzSMOrrQ9Z
	ChLwYxdENqsDE0exS7Y3lSP2bpLCEYOGEUdBhniyu890gF9oT9Hdzz3Q5YpI10yq1DYT
	kokYJL5L8eoLc7e3gGXVtrsRdXE/ITB57pTJhSVPiNhOVs5kxxl7Bfx/e4IVRXw8DiCN
	3aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dLPMAKCkDRLaurSOt2DqCB3zHSxRZWgNkuq9EklsQcs=;
	b=UlnwZzLMvqH17kv/MznupXOZR5K5yndqcVxvtczhlflW68rKc2GXiqB3UFYXxSdyQg
	uSiJxTsJziPB77DFFBBCzbNXLrGtafW8JE6eRddzQiajDLdzKTMoAnWsZFBMbQcVsIjU
	a0eANfSIwB1OgofganiV/Lx3GibNi21PaBshBbPiooXRkizXr/aM/DbWn37KpKUAOFk7
	Kw5I/YnCruiYOaQA5n0ncPaSlBvYNUSTT1Cq97rthZ1VuW23f3N5jaPRqjpaEGoIkbGR
	fF4t4LzQcW2hKlPeljFFPiCNDBl/AB15e9a+JITzwwVO5cgoHuuJmC2/070BBo4TErAZ
	jv7w==
X-Gm-Message-State: APjAAAUCQVyEeNwtFOYZDgLf/hpe+mLo80dSOf4KwgnM3l4KLlb6VkBi
	yB5MZp8yQrLPDtlVQJ/62aQW2xr8
X-Google-Smtp-Source: APXvYqxT7+rWv7FL1dg72G6mIilEWUN+0HQT5zd2Af9gXPyjk3nd3oy4LigLLzx7UduaooFDX6ojHQ==
X-Received: by 2002:a62:ac0a:: with SMTP id v10mr11104447pfe.57.1556983674035; 
	Sat, 04 May 2019 08:27:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:04 -0700
Message-Id: <5ae52eb8508c0ba5713489dc4661649c19dceeed.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 28/43] Adding back wrapper and using OEPYTHON3HOME variable for python3
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
X-List-Received-Date: Sat, 04 May 2019 15:27:53 -0000

From: Jaewon Lee <jaewon.lee@xilinx.com>

Adding back the python wrapper and adding a patch to use OEPYTHON3HOME
instead of PYTHONHOME if set, for python3.

If we add back the wrapper as is, we would see the following error that
we also see in Thud:

ImportError: No module named site
OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python
v3.
Please upgrade your python v2

This is because python3 would've set PYTHONHOME to use nativesdk
python3 libraries but when the oe-buildenv-internal script tries to call
python2 for the py_v27_check, there will be no python2 libraries in the
PYTHONHOME directory.
In other words, bitbake needs host python2 and the env variable set from
the wrapper contaminates the env and host python2 won't be able to find
its libraries

Creating another variable OEPYTHON3HOME and using this in the python3
wrapper to allow for a way to set a different paths for python3 and
python2

[YOCTO #13208]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...EPYTHON3HOME-is-set-use-instead-of-PYTHON.patch | 47 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.2.bb      |  7 ++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch

diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
new file mode 100644
index 0000000..06eb2bd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
@@ -0,0 +1,47 @@
+From ffe7797637f08cd6ee4c82e2d67462c5e194d30a Mon Sep 17 00:00:00 2001
+From: Jaewon Lee <jaewon.lee@xilinx.com>
+Date: Thu, 25 Apr 2019 15:34:26 -0700
+Subject: [PATCH] main.c: if OEPYTHON3HOME is set use instead of PYTHONHOME
+
+There is one variable PYTHONHOME to determine where libraries are coming
+from for both python2 and python3. This becomes an issue if only one has
+libraries in the specified PYTHONHOME path, but they are using the same
+PYTHONHOME. Creating another variable OEPYTHON3HOME to allow for a way
+to set a different path for python3
+
+Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
+---
+ Modules/main.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/Modules/main.c b/Modules/main.c
+index a745381..b553e30 100644
+--- a/Modules/main.c
++++ b/Modules/main.c
+@@ -1855,10 +1855,19 @@ config_init_home(_PyCoreConfig *config)
+         }
+         return _Py_INIT_OK();
+     }
+-
+-    int res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
+-    if (res < 0) {
+-        return DECODE_LOCALE_ERR("PYTHONHOME", res);
++    int res;
++    const char *oepython3home = config_get_env_var("OEPYTHON3HOME");
++    if (oepython3home) {
++        res = config_get_env_var_dup(&home, L"OEPYTHON3HOME", "OEPYTHON3HOME");
++        if (res < 0) {
++            return DECODE_LOCALE_ERR("OEPYTHON3HOME", res);
++        }
++    }
++    else {
++        res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
++        if (res < 0) {
++            return DECODE_LOCALE_ERR("PYTHONHOME", res);
++        }
+     }
+     config->home = home;
+     return _Py_INIT_OK();
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index a1d7ace..579febc 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -29,6 +29,9 @@ SRC_URI_append_class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            "
+SRC_URI_append_class-nativesdk = " \
+           file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
+           "
 
 SRC_URI[md5sum] = "df6ec36011808205beda239c72f947cb"
 SRC_URI[sha256sum] = "d83fe8ce51b1bb48bbcf0550fd265b9a75cdfdfa93f916f9e700aef8444bf1bb"
@@ -132,6 +135,10 @@ do_install_append() {
                 ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
 }
 
+do_install_append_class-nativesdk () {
+    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} OEPYTHON3HOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+}
+
 SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
-- 
2.7.4


