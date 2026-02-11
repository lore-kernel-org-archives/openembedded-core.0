Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00B0EB5961
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 04:02:24 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11114.1770782534627174072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 20:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nN3aLlv2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770782535; x=1802318535;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZvXaEfla7xPjEDcPfLDeDHhO1M0xk1XjiRtiBKYpl2s=;
  b=nN3aLlv2qhd0eDKtAkFdtKCkcTEXy9Xva4Bh5Z+ELfRNx4LGvugL3kot
   ORvYeL6cfGxI0U4riedPHPCa1Cr7vRXaosyHddP2DHTa1s9y1QURIh7kD
   NxzbqdmBGaxspEVf/nCnDAIVeSpiUhdRjJ97gdbG4XtOyq4uSrtTuNyti
   pkyVeVWt3BNjoZoc9nVXqE+Cpn3kbj5fNhr8Wky1Ng8fS5RJxT21j6O8X
   TZ4LxZkyn0SIQqrp2EBj8Fw7Xcu0XPOkbj0Ao1EZXnwPCf2jZ96icvAz7
   0rGio4rSjGpkas9vNlqnM0aMvSYnh2i1bReJJOpJpDgfyRQj0AiuOU+/X
   w==;
X-CSE-ConnectionGUID: +fKPWcdERsexbXW/Fh6Nqw==
X-CSE-MsgGUID: /8vn+/+OQ02d4ufX4kmeNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="229211801"
X-IronPort-AV: E=Sophos;i="6.21,283,1763391600"; 
   d="scan'208";a="229211801"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id CA21C1C00094
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 04:02:12 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6911D8D29FE
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 04:02:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BCB66180053C;
	Wed, 11 Feb 2026 04:02:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] piglit: use 'shape' in place of 'newshape' on numpy>=2.1
Date: Wed, 11 Feb 2026 12:02:05 +0800
Message-ID: <20260211040205.1710-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 04:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230961

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...use-shape-in-place-of-newshape-on-nu.patch | 105 ++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch
new file mode 100644
index 0000000000..acf2671262
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch
@@ -0,0 +1,105 @@
+From ad6ee4d7c4d3b882ef6196832ed2bbc78b7cb10a Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 11 Feb 2026 03:42:24 +0000
+Subject: [PATCH] generated_tests: use 'shape' in place of 'newshape' on
+ numpy>=2.1
+
+The 'newshape' parameter was deprecated upstream but kept for backwards
+compatibility reasons. It was finally removed as of numpy 2.4.0, so
+transition to using 'shape' in its place when available.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/c1dd58ff61fe6b713af795e2680c16371c1cb98c]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ generated_tests/builtin_function.py      | 17 +++++++++++++++--
+ generated_tests/builtin_function_fp64.py | 17 +++++++++++++++--
+ 2 files changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/generated_tests/builtin_function.py b/generated_tests/builtin_function.py
+index eb7e078..f87236f 100644
+--- a/generated_tests/builtin_function.py
++++ b/generated_tests/builtin_function.py
+@@ -58,6 +58,11 @@ import numpy as np
+ if np.lib.NumpyVersion(np.__version__) >= '2.0.0b1':
+     np.set_printoptions(legacy = "1.25")
+ 
++if np.lib.NumpyVersion(np.__version__) >= '2.1.0':
++    np_reshape_shape = 'shape'
++else:
++    np_reshape_shape = 'newshape'
++
+ # Floating point types used by Python and numpy
+ FLOATING_TYPES = (float, np.float64, np.float32)
+ 
+@@ -293,7 +298,11 @@ def column_major_values(value):
+     """Given a native numpy value, return a list of the scalar values
+     comprising it, in column-major order."""
+     if isinstance(value, np.ndarray):
+-        return list(np.reshape(value, newshape=-1, order='F'))
++        reshape_args = {
++            np_reshape_shape: -1,
++            'order': 'F',
++        }
++        return list(np.reshape(value, **reshape_args))
+     else:
+         return [value]
+ 
+@@ -301,7 +310,11 @@ def column_major_values(value):
+ def glsl_constant(value):
+     """Given a native numpy value, return GLSL code that constructs
+     it."""
+-    column_major = np.reshape(np.array(value), newshape=-1, order='F')
++    reshape_args = {
++        np_reshape_shape: -1,
++        'order': 'F',
++    }
++    column_major = np.reshape(np.array(value), **reshape_args)
+     if column_major.dtype == bool:
+         values = ['true' if x else 'false' for x in column_major]
+     elif column_major.dtype == np.int64:
+diff --git a/generated_tests/builtin_function_fp64.py b/generated_tests/builtin_function_fp64.py
+index 84d939c..06fe987 100644
+--- a/generated_tests/builtin_function_fp64.py
++++ b/generated_tests/builtin_function_fp64.py
+@@ -57,6 +57,11 @@ import numpy as np
+ if np.lib.NumpyVersion(np.__version__) >= '2.0.0b1':
+     np.set_printoptions(legacy = "1.25")
+ 
++if np.lib.NumpyVersion(np.__version__) >= '2.1.0':
++    np_reshape_shape = 'shape'
++else:
++    np_reshape_shape = 'newshape'
++
+ # Floating point types used by Python and numpy
+ DOUBLE_TYPES = (float, np.float64, np.float32)
+ 
+@@ -254,7 +259,11 @@ def column_major_values(value):
+     """Given a native numpy value, return a list of the scalar values
+     comprising it, in column-major order."""
+     if isinstance(value, np.ndarray):
+-        return list(np.reshape(value, newshape=-1, order='F'))
++        reshape_args = {
++            np_reshape_shape: -1,
++            'order': 'F',
++        }
++        return list(np.reshape(value, **reshape_args))
+     else:
+         return [value]
+ 
+@@ -262,7 +271,11 @@ def column_major_values(value):
+ def glsl_constant(value):
+     """Given a native numpy value, return GLSL code that constructs
+     it."""
+-    column_major = np.reshape(np.array(value), newshape=-1, order='F')
++    reshape_args = {
++        np_reshape_shape: -1,
++        'order': 'F',
++    }
++    column_major = np.reshape(np.array(value), **reshape_args)
+     if column_major.dtype == bool:
+         values = ['true' if x else 'false' for x in column_major]
+     else:
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 060e287f26..7659635062 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
+           file://0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.43.0


