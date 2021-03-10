Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.89.1615415039328980066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 14:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OFxmbT0h;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d15so25095015wrv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 14:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xmGSgOsQVYx+tkPDYMJD6KOb2aMdGMQDIYChSaiEFcU=;
        b=OFxmbT0hnylCYqJlFnjx+egkPIKs4qALedrlQoxaCqadJGCHAMtNGICO/XDbA1s0Nv
         MnRxKAvhSLiWn0lDtOVg+XE8iu1MXITte3Do1ZMKanJrzaQjBxqNJsj+6VhKuMQPzURl
         Akc4m1f0Cge2v9zp9Q6je6mf56Jlbq/ytWu7FXLqSMbdJpVkFFLh+NE6A9Q+nAOh+Kqm
         02066KNmlgnucsCv5Trnct2wmjUGjDbV5z2jVmpld8LvwZK03Mb3FGjID/Uc3GCypcBl
         5uYElQJNHOzPOYquREWixnUdg93wgIh5deRNpGmvnhxI/B6qzGWgT8jdgPbbU8dbgNp3
         Trlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xmGSgOsQVYx+tkPDYMJD6KOb2aMdGMQDIYChSaiEFcU=;
        b=GK1mhMki85GhTaK/zp6MdwMG6ToSvQMu+CkXDMwhpoU/U56E1Hq7OOuY3QM2WAevw9
         aftzFCO/fH7kZd0wvYnfo1BWRHKbnb+z4DPgdxPtw/+j9QYt+l6NjPkUZetoFRTA0efy
         b1PTOuv5ap68s1i5XF9SeyTK1tN6CfIZc7hj942kMp9pJAmwlOvcf3Mm35wvPcD3Lj3D
         PP5QNlJn/0ummULt+pMp+BYe6MnU3pL9hGcG1BPwqG1ZzmDjsc6pOCx9rpoJp8OiMnUn
         n0LWIaqMNGwPqCeHMNiBYtq0OQ0yc9S225l9LR7/hf5ak9LBSgM4CukNKqKca7to0ueT
         Noow==
X-Gm-Message-State: AOAM533A1ZRdS1D/ggkvkqmDmOKgiy7ZsMZxJV8MI8+5XnT3jKeD3vdm
	0vA5RbIXAwip1UsCP+vtlBPS0vA1uwrw6A==
X-Google-Smtp-Source: ABdhPJyRo0p7/4OQTKTDKrFvHEJhmk61FR48fci4fSZyCfoIcwkxeZAk+92hkDqacrDEs12EWS/Rig==
X-Received: by 2002:adf:b1de:: with SMTP id r30mr5651511wra.125.1615415037201;
        Wed, 10 Mar 2021 14:23:57 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.99.183])
        by smtp.gmail.com with ESMTPSA id d204sm789209wmc.17.2021.03.10.14.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 14:23:56 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dorinda Bassey <dorindabassey@gmail.com>
Subject: [PATCH v2] meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
Date: Wed, 10 Mar 2021 23:23:43 +0100
Message-Id: <20210310222343.15805-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Dorinda Bassey <dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v2:
removed DESCRIPTION that was not necessary

 meta/recipes-devtools/python/python-cython.inc               | 2 ++
 meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb      | 1 +
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb      | 1 +
 meta/recipes-devtools/python/python3-jinja2_2.11.3.bb        | 1 +
 meta/recipes-devtools/python/python3-pygobject_3.38.0.bb     | 2 ++
 meta/recipes-devtools/python/python3-pytest_6.2.2.bb         | 2 ++
 meta/recipes-devtools/python/python3-scons_3.1.2.bb          | 1 +
 meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb | 2 ++
 8 files changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index da6eba254f..0e6bac06a7 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -1,3 +1,5 @@
+SUMMARY = "The Cython language"
+HOMEPAGE = "https://pypi.org/project/Cython/"
 DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
 It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
 and the messy, low-level world of C."
diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
index b1feee8416..0b87ab0380 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
+HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index af4291bbf4..6b3359712f 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A small and simple INI-file parser module"
+HOMEPAGE = "https://pypi.org/project/iniconfig/"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 86604aeedc..dbdf563f87 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+HOMEPAGE = "https://pypi.org/project/Jinja/"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
index b4427050f5..8df3150e37 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Python GObject bindings"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/pygobject"
+DESCRIPTION = "PyGObject is a Python package which provides bindings for GObject based libraries such as GTK, GStreamer, WebKitGTK, GLib, GIO and many more."
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.2.bb b/meta/recipes-devtools/python/python3-pytest_6.2.2.bb
index 392c20d039..d221cbcd7f 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.2.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Simple powerful testing with python"
+HOMEPAGE = "https://pypi.org/project/pytest/"
+DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scales to support complex functional testing for applications and libraries."
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
diff --git a/meta/recipes-devtools/python/python3-scons_3.1.2.bb b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
index ce117a92d4..12122131a5 100644
--- a/meta/recipes-devtools/python/python3-scons_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
+HOMEPAGE = "https://github.com/SCons/scons"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-python3-scons-${PV};md5=e14e1b33428df24a40a782ae142785d0"
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
index 406404ec69..ead80da7b4 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
@@ -1,4 +1,6 @@
 SUMMARY = "the blessed package to manage your versions by scm tags"
+HOMEPAGE = "https://pypi.org/project/setuptools-scm/"
+DESCRIPTION = "setuptools_scm handles managing your Python package versions in SCM metadata instead of declaring them as the version argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-- 
2.17.1

