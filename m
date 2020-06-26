Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.2899.1593155974639243462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YpmgCQK0;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id dr13so8376910ejc.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9nteOP7ACFlIS/0HIqqV2TVhJ7zFWwE4hBgRWLjwCM=;
        b=YpmgCQK04KKuU6L6sxEaLMet+6vVAtN6TBkx8Cu2eTMHqxo7RHemYBXUa1z6M0xrOV
         gUuD+gswRSFmuhIYN6/SplmH2hPlHnmfQ4TEyLG2nic+k+2HbmlhlyCzVmtik6pbAEtB
         fv7DM1iA0yntveTdzUuTIf4vAJTXh/6m77lmeuQtkMNP9eE15yE1jE5Md7cO7r4ZGl4F
         LE9t2RyaHHHCzutkNKFmfpzHCmBMLiJYHJzmMJRXnUS99fHFgay7ugiYGzUIWcGx0c01
         BcxPN8sC1XtfUXvFcNswRGmTyXAud76QE7quz0bCndr+MzvIks694GjEbCcp3rp8LjZ4
         kOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9nteOP7ACFlIS/0HIqqV2TVhJ7zFWwE4hBgRWLjwCM=;
        b=gRYkFdA1bmwCstPmMMmuwN+o9c0bf+L8rrZ1IvmWc0bG0YN/LGbkvEi1OvPFkj4fl5
         C2qB6cJNdd58AT+b4aU10poKlpJ45QDRJnAn6cTYQ9XbUIadNd+177jsyGpLJvGp2BaF
         uARtEs5X9zgkh9LOJ4KIZIPN4/gKMB7yeKbFLuRde9XhLQuoywa5kWgwPiBBtW75xQ8Y
         x0ipanibejo+s0V9MjZdVZkBy/FWrdSqjdNgbJCpp5IfZsApFbsUEGeQT6NwcDFMeWuD
         Eop79G9zRwH0WCC0GxK0qc4w7RueUNGwCGWODIvz90ZdW3MkRyNRIFhkW6TSCBBOIspK
         0UQw==
X-Gm-Message-State: AOAM530i79MEitJdn/w8QrM/vs1yBtkev21VUZG9zybJXbXTq3ij4Odu
	uxxDI7z6cAKC02mpmcHTdwdr3JamJWY=
X-Google-Smtp-Source: ABdhPJxJvspZ+935EWiBviwXy8r694J5lrD+66CRsUeM8GZ2OVYFf3zrKn32ruLsr6NWaVlP922ADQ==
X-Received: by 2002:a17:906:fc20:: with SMTP id ov32mr1259106ejb.531.1593155972929;
        Fri, 26 Jun 2020 00:19:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/30] Revert "python3-setuptools: patch entrypoints for faster initialization"
Date: Fri, 26 Jun 2020 09:18:43 +0200
Message-Id: <20200626071844.29134-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies, but the patch is not possible to rebase onto the new setuptools,
as the code has changed too much. Please get it accepted upstream first.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/python-setuptools.inc              |  4 +-
 ...nt-usr-bin-wrappers-signoff-included.patch | 62 -------------------
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 3222de7079..9322ca9a05 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,9 +10,7 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch \
-            file://0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch \
-            "
+SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
 SRC_URI[md5sum] = "6e9de90b242fdd60ef59f497424ce13a"
 SRC_URI[sha256sum] = "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
deleted file mode 100644
index 7e931c845c..0000000000
--- a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001
-From: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
-Date: Thu, 26 Mar 2020 14:24:25 +0000
-Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers
-
-Upstream setuptools writes scripts to /usr/bin that do insanely much
-stuff at runtime. https://github.com/pypa/setuptools/issues/510
-
-Since the script entry points are already known at build time, we can
-just write those directly into the /usr/bin wrapper, avoiding the
-expensive 'pkg_resources' import at runtime. The idea is from
-https://github.com/ninjaaron/fast-entry_points but patched directly into
-the native build of setuptools here, so that all Python modules under
-bitbake automatically use it without needing additional build time
-dependencies.
-
-Upstream-Status: Pending
-
-Signed-off-by: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
----
- setuptools/command/easy_install.py | 14 ++++++--------
- 1 file changed, 6 insertions(+), 8 deletions(-)
-
-diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 8fba7b41..03a72714 100755
---- a/setuptools/command/easy_install.py
-+++ b/setuptools/command/easy_install.py
-@@ -2023,17 +2023,12 @@ class ScriptWriter(object):
-     """
- 
-     template = textwrap.dedent(r"""
--        # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(group)r,%(name)r
--        __requires__ = %(spec)r
--        import re
-         import sys
--        from pkg_resources import load_entry_point
-+
-+        from %(module)s import %(ep0)s
- 
-         if __name__ == '__main__':
--            sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
--            sys.exit(
--                load_entry_point(%(spec)r, %(group)r, %(name)r)()
--            )
-+            sys.exit(%(entrypoint)s())
-     """).lstrip()
- 
-     command_spec_class = CommandSpec
-@@ -2068,6 +2063,9 @@ class ScriptWriter(object):
-         for type_ in 'console', 'gui':
-             group = type_ + '_scripts'
-             for name, ep in dist.get_entry_map(group).items():
-+                module = ep.module_name
-+                ep0 = ep.attrs[0]
-+                entrypoint = '.'.join(ep.attrs)
-                 cls._ensure_safe_name(name)
-                 script_text = cls.template % locals()
-                 args = cls._get_script_args(type_, name, header, script_text)
--- 
-2.24.1
-
-- 
2.27.0

