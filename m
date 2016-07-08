Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id E6B2760119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 23:03:49 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ts6so8955147pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 16:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SYc6a+Tk46CEgY67QD1gmlkWppo2VqZWlyz5RNnRddA=;
	b=FkkWTAf6S4udGepBOFhIIdPul8auP0IsU7op3/lMw9fXoWhLJVPAhYfe0vCnyWgd/t
	659JZc7hctL2ZTiKMeIdT14vyS9XEdzvt/JrYRZll0GZpDpGqXmTpc+1meZY977xWb14
	JPytedp1xqmYo9/qzqimU1ZbBP/bzx64cVGTYSwLkNfYdojoFE7q1tUCWS+fFqt8HWuS
	m7YoKOXm/vZicdTRSb8JW5qWg0JJmPsrH4N0PIHwkEoJv7NqSru1mC3JBcJ4qvDJWNda
	JV5vmzeqsONnha6aD4u4q1ZZOCuB+MF6IHWs9ZTdP4KKlM++B8z5RRJhdAYInk3wrDQ/
	jOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SYc6a+Tk46CEgY67QD1gmlkWppo2VqZWlyz5RNnRddA=;
	b=OCZtWs5np4o4sToVOVWAPVlU7JcTUDpsVKpftu3Dp2T64eBP/nlwugFJ6koPeZrdVR
	AmLy0vCuZRO45clu23p+Za3e01yhO99nXYE7LqSuXz9A9Wer68ujLmbZ2Wl4NESXA6/J
	zBTWCI9CuxDYqMs6s67O77fWZ6YweC3EYFShs2AnOJZff2EvhYh9syKrBgiN1jpiwqMe
	kA1qg5hocPbVqaQ0nRKK1pSuFkS6vptS/AJU+iAmkAhJnjn7QC+L2YsHJmYTX0JOStaE
	ZMT5SnwoTyKVe0JZBGszahnlu+nDDJSoPZY82/9fEJv62OsGDglDzT4d+h2RrF7f7N/z
	gN4w==
X-Gm-Message-State: ALyK8tI/di0mGWfkip+vxOB+Znxdqc9gEBIgVmfGBzuXYPhr8PGsSTBpkFJqjKQ61aTBAw==
X-Received: by 10.66.52.106 with SMTP id s10mr13734061pao.65.1468019030100;
	Fri, 08 Jul 2016 16:03:50 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id ff9sm2813373pac.5.2016.07.08.16.03.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jul 2016 16:03:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2016 16:03:43 -0700
Message-Id: <20160708230343.7747-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] python{3}-numpy: Predefine of sizeof off_t on mips/mipsel/ppc
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
X-List-Received-Date: Fri, 08 Jul 2016 23:03:52 -0000

Fixes below errors as seen on musl

| In file included from numpy/core/include/numpy/ndarraytypes.h:4:0,
|                  from numpy/core/include/numpy/ndarrayobject.h:18,
|                  from numpy/core/include/numpy/arrayobject.h:4,
|                  from numpy/core/src/multiarray/compiled_base.c:7:
| numpy/core/include/numpy/npy_common.h:167:10: error: #error Unsupported size for type off_t
|          #error Unsupported size for type off_t
|           ^~~~~
| In file included from numpy/core/include/numpy/ndarraytypes.h:4:0,
|                  from numpy/core/include/numpy/ndarrayobject.h:18,
|                  from numpy/core/include/numpy/arrayobject.h:4,
|                  from numpy/core/src/multiarray/compiled_base.c:7:
| numpy/core/include/numpy/npy_common.h:167:10: error: #error Unsupported size for type off_t
|          #error Unsupported size for type off_t
|           ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h    | 1 +
 meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h   | 1 +
 meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h
index 05d2b8b..4c465c2 100644
--- a/meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h
+++ b/meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h
@@ -12,6 +12,7 @@
 #define NPY_SIZEOF_PY_INTPTR_T 4
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_NO_SMP 0
 #define NPY_HAVE_DECL_ISNAN
 #define NPY_HAVE_DECL_ISINF
diff --git a/meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h
index c4bf654..0b7cd51 100644
--- a/meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h
+++ b/meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h
@@ -13,5 +13,6 @@
 
 #define NPY_SIZEOF_LONGLONG 8 
 #define NPY_SIZEOF_PY_LONG_LONG 8 
+#define NPY_SIZEOF_OFF_T 8
 /* #define CHAR_BIT 8 */
 
diff --git a/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
index 0f45d5b..6e7262a 100644
--- a/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
+++ b/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
@@ -12,6 +12,7 @@
 #define NPY_SIZEOF_PY_INTPTR_T 4
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_NO_SMP 0
 #define NPY_HAVE_DECL_ISNAN
 #define NPY_HAVE_DECL_ISINF
-- 
2.9.0


