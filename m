Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.28758.1623018021130502651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Soj9s9RR;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id k22-20020a17090aef16b0290163512accedso7357753pjz.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ZfpVYTWBjEfW1wJA4Csj7O4+uHMlygOOztnstSq6aM=;
        b=Soj9s9RRjXe/o09mmxb5HnoPiMUFJij8mfdaMF8W/jS7wZRoul8xPSz/L75I3Wb7UJ
         Vb2CyK0rnpq8bK77SbRchvZDOLQg/wLgffB+BWXDQlcP1eS6LgZEkj9UWDrUazb5DMu1
         0OR/zilKag5b0qId+UNTNsLkicBfMvOj/GXXNk/Qqsoit4A38mPBvVCs2CWmHER5Mii7
         y9QU7IlBD0nN6trM6GLOXBN/EGrjwOnyfOkTxtRgaVZ261zj13aBcQL8aOd3yJJPn+ta
         eA9qCo3yHyxiCxYD1CB5LA4scQqf5UzMP4jGVDfozNhfU7vaoPBfRopC4mk3pB/vlbaO
         V5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ZfpVYTWBjEfW1wJA4Csj7O4+uHMlygOOztnstSq6aM=;
        b=a3IeYw5XzqD1IVNOs5hyi/KPZrXXjSE4n7lH3USo0dt6ySuOr70OjOmLTv/7SOreOr
         tLGuCNxbk/FNazh4ETHvxi3V4TdvhAMsWqqAtnf6Nx/BDBSNbegR0Q85nmQDXgfpWFmX
         V57FafeEY3lcNsTs8yPrs8AdRpVtWBOwOeqjiy/dYDN9DFQKRCX7E2T6dbR4HhwpK0LR
         qqJWT6143CfWxifMDjD3zdMtB/Jj19jK3kWmw9w7fM3Vm1F8UGBTss6QhcETmfErRt9E
         6YugXe+Orrv/9i9SKnF+LpiU4DtReVdTWTrYd/7VNCVFYzY2s6WGH5D5x4ZcrU8AlPjV
         IW+g==
X-Gm-Message-State: AOAM530ODBLyVnBOYZMv5VENDQT8fqha2RmL/Or3MbwxMTtZWizqEy+X
	RAv8S5d/L+duZx+rmrh/vUHiEoAO+Rk4dQ==
X-Google-Smtp-Source: ABdhPJx0pE2rMdhqpUoEudKfSJH0cuw3aBpyulx1GJrsVyBgSOjOUR5MOUulxD9F25DSwcNyFXdL7A==
X-Received: by 2002:a17:902:d4c8:b029:102:715b:e3a5 with SMTP id o8-20020a170902d4c8b0290102715be3a5mr15140590plg.83.1623018020228;
        Sun, 06 Jun 2021 15:20:20 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d783:82a8:8b1b:d4e0])
        by smtp.gmail.com with ESMTPSA id z6sm6818369pfr.99.2021.06.06.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:20:19 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/5] maintainers.inc: update email address
Date: Sun,  6 Jun 2021 15:20:12 -0700
Message-Id: <01f3150245afae9467b384fb0ba4318ada61015a.1623016777.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1623016777.git.timothy.t.orling@intel.com>
References: <cover.1623016777.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 68 ++++++++++++------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ee118209dbf..f9ca9036cf8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -48,9 +48,9 @@ RECIPE_MAINTAINER_pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-assimp = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-at = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-at-spi2-atk = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-at-spi2-core = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-atk = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-at-spi2-atk = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-at-spi2-core = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-atk = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-attr = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
@@ -310,7 +310,7 @@ RECIPE_MAINTAINER_pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcgroup = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libcroco = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -320,7 +320,7 @@ RECIPE_MAINTAINER_pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br
 RECIPE_MAINTAINER_pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libepoxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-liberror-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-liberror-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libevdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libevent = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libexif = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -351,7 +351,7 @@ RECIPE_MAINTAINER_pn-libmd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmicrohttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -385,9 +385,9 @@ RECIPE_MAINTAINER_pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-libtimedate-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libtimedate-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libtirpc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
@@ -396,7 +396,7 @@ RECIPE_MAINTAINER_pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
 RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com>"
@@ -424,12 +424,12 @@ RECIPE_MAINTAINER_pn-libxi = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxinerama = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxkbcommon = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxkbfile = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libxml-namespacesupport-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libxml-parser-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libxml-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libxml-sax-base-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libxml-sax-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libxml-simple-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libxml-namespacesupport-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-parser-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-sax-base-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-sax-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-simple-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libxml2 = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libxmu = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxpm = "Armin Kuster <akuster808@gmail.com>"
@@ -582,8 +582,8 @@ RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yocto
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-atomicwrites = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-attrs = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-atomicwrites = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-attrs = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -593,9 +593,9 @@ RECIPE_MAINTAINER_pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-hypothesis = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-iniconfig = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-hypothesis = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-iniconfig = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
@@ -603,36 +603,36 @@ RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-python3-more-itertools = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-more-itertools = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-packaging = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-pathlib2 = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-packaging = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-pathlib2 = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-pbr = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pip = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
-RECIPE_MAINTAINER_pn-python3-pluggy = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-py = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-pyyaml = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-pluggy = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-py = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-pyyaml = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-pytest = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-pytest = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-python3-wcwidth = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-zipp = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-wcwidth = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-python3-zipp = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.29.2

