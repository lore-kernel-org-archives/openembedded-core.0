Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.7322.1615289776116493776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNi0j+n0;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so5782995wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 03:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HF/iMTGIo5HcofsiyhM+lNsJb+YUeTW0mnqYOoPrnQg=;
        b=bNi0j+n09am7ZrKC5MxWGnszy2tdiu8sAYwPTzbO1k8GOnoTGYTgHUVYitU0GVyQYQ
         frEMfPWYBm+DLBpvLIiNFzd3ruchQLRVhlByVRxJcqi2gEeQOO7hI05By0ZADnANJzeE
         ig+qDHRPQ8jCdZzZTKzdcpoC42R0xyk+iTx9JER5tVRiliRXJKISErWVE5eXWjjAD0XP
         x2Pvps7cpXQejQ5ps+t5lcjimVQ9UMFM5NQtsOSzPLkbLbE/i5/f+QH2Px3o0MbnleiR
         rKP08cLLAUszfQ23wMAr7au8t09JRiFAXYBaRsP6KWvx+Mnm4M5XnFZafck4OZ3aY4Eb
         Sjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HF/iMTGIo5HcofsiyhM+lNsJb+YUeTW0mnqYOoPrnQg=;
        b=VoYQVaVlDS3Tx32olXTaggA8oM401PUZlyhPxmGlpdSSl/cUOeIPkDVJPafH+7MYjN
         hy1Yr0V36yyF7s5WZQ5hnB+YRvVlFj5/WrtqQMx57E9oBdoElExGiNzaE6ZyPbJzvoMR
         S+snsKBTyEa+ch7PbB8jkwD/mIQeeHy1vslK4nVT2uaUUhsAnsiXTnL3/Zi9qubO+UVg
         eEUyEUQLub4HYnStJD0LsIzE/erwr48vUDj8uqivfZa+IqwxwUDmUhLsePIewEvZwI5c
         QxmxnjsVxuY9ge8hlApNXVgD3cCZp0EViJQftv39R7PDJQ6CJBshB8o+OGvI58GrcMKp
         +W4Q==
X-Gm-Message-State: AOAM530z/4GokOgV3HvFou6ehoXkiPtLhwdy4wl6kIW9Z64lJvi85OZL
	BWNl3xjwk4XpehLtqivG8XbeLUsXV4hj1Q==
X-Google-Smtp-Source: ABdhPJxjJnPCb95cR5sfkUP3nCx7M0GvNTBpA3sYYqKzdjFOZiTi3vMKSMcpl6n49gaKuO1EuqQuVA==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr3574367wmf.165.1615289774031;
        Tue, 09 Mar 2021 03:36:14 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.166])
        by smtp.gmail.com with ESMTPSA id x11sm3804289wme.9.2021.03.09.03.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 03:36:13 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 1/5] meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
Date: Tue,  9 Mar 2021 12:35:47 +0100
Message-Id: <20210309113551.13691-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/python/python-cython.inc               | 2 ++
 meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb      | 2 ++
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb      | 2 ++
 meta/recipes-devtools/python/python3-jinja2_2.11.3.bb        | 1 +
 meta/recipes-devtools/python/python3-pygobject_3.38.0.bb     | 2 ++
 meta/recipes-devtools/python/python3-pytest_6.2.2.bb         | 2 ++
 meta/recipes-devtools/python/python3-scons_3.1.2.bb          | 1 +
 meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb | 2 ++
 8 files changed, 14 insertions(+)

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
index b1feee8416..6dc376efe6 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
+HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
+DESCRIPTION = "${SUMMARY}"
 
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index af4291bbf4..7f78d46285 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -1,4 +1,6 @@
 SUMMARY = "A small and simple INI-file parser module"
+HOMEPAGE = "https://pypi.org/project/iniconfig/"
+DESCRIPTION = "${SUMMARY}"
 
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

