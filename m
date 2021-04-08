Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.156.1617899514789686961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jBlOm/O9;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id m13so2742780oiw.13
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SnN/zqwSEbLg4XjBZsHShF3cRto22q6oUExaU4oCjEc=;
        b=jBlOm/O9SNYTmOPw7R3xURBqIrAAMK82p34EGzWkQk2yyFuaibwrsWLYF+EVuMskY2
         9QcV4Ra62d2gbGvCygAeV00nakjtUd+B0G9GILM7jWlEFrM2CUp5eJA7O3leJzg/7kt4
         Dl7ZestNN+BSWycM7WMXQnZCZch2l1khGWIARcDG28o4IYbaStZ1DkVeWZvXSM7gQHTW
         94wpUiqOtW6UWpyxs34JL1J4BCZ7GzInUz5btHUt+hW7lgwFEFvsFVB47YNzjySxRdYg
         lhTVAVIszGhDmf7Xgi0H3PUOgyk04mrdGs23ga+IXG3lMvFKpq+MVfSDhSskT65euNsQ
         f5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnN/zqwSEbLg4XjBZsHShF3cRto22q6oUExaU4oCjEc=;
        b=gsw+c7N2YzuKH7NhPqdH5UvgW5yMYOwQbx7U4Z2W1g+RzEGt66Lp1ghft0xsf1zma9
         phRPN6MdBJLIN5jG+F46uydz1RMMRRZeaqgYGV1NPCbFtAOZ2zscKF1EcVbIrHDWf6xa
         ZK/5hM/ehOvT1ktyJPUNYijmA5A9pVLMcsxvyfdydgWlaV9g99flQGeo4NvPe/zuCixH
         vpYsCLbScqB0qKx00qXC8ZiZFLQngR0iItiBiw2WM2WoNGaT4VDKeMs8Riu/W5E+MJFe
         sL7hn5TZViTUjgaglMICgDJv2bo0WXF0ejhGy0xhGdZ1Xu93Buz5qDwMbNcI2iJx6tr0
         K45w==
X-Gm-Message-State: AOAM533ezOq7R2csC2aG8uo3GKdUfqrDYpxcSVwbVWtk271/Fu+/hL2l
	VVMpY/qqp0ROjuv/rVa+NejSZBizeHT8DB/9wDY=
X-Google-Smtp-Source: ABdhPJyWkTzZOzu1gzOViqEt+rYT7x4cDx5EV9S5xgUmRpmlhNM4ciRpoeNvGdYWrpWjP+D4sCCraw==
X-Received: by 2002:aca:1e11:: with SMTP id m17mr6602506oic.61.1617899513756;
        Thu, 08 Apr 2021 09:31:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.31.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:31:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] selftest/reproducible: adjust exclusion list for dunfell
Date: Thu,  8 Apr 2021 06:31:03 -1000
Message-Id: <988869f45c9e67a3bf0665d2870a4626bb28e6f6.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-be: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 32 ++++++--------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index cf0375c8a1..c023c92d5d 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -27,11 +27,8 @@ import datetime
 exclude_packages = [
 	'acpica-src',
 	'babeltrace2-ptest',
+	'bind',
 	'bootchart2-doc',
-	'cups',
-	'cwautomacros',
-	'dtc',
-	'efivar',
 	'epiphany',
 	'gcr',
 	'git',
@@ -40,40 +37,31 @@ exclude_packages = [
 	'go-helloworld',
 	'go-runtime',
 	'go_',
-	'groff',
-	'gst-devtools',
 	'gstreamer1.0-python',
-	'gtk-doc',
-	'igt-gpu-tools',
+	'hwlatdetect',
         'kernel-devsrc',
 	'libaprutil',
 	'libcap-ng',
-	'libhandy-1-src',
-	'libid3tag',
+	'libjson',
 	'libproxy',
-	'libsecret-dev',
-	'libsecret-src',
+	'lsb-release',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
-	'meson',
 	'ovmf-shell-efi',
 	'parted-ptest',
 	'perf',
-	'python3-cython',
+	'piglit',
+	'pybootchartgui',
 	'qemu',
-	'quilt-ptest',
+	"rpm",
 	'rsync',
 	'ruby',
-	'spirv-tools-dev',
-	'swig',
-	'syslinux-misc',
+	'stress-ng',
 	'systemd-bootchart',
-	'valgrind-ptest',
+	'systemtap',
 	'vim',
-	'watchdog',
-	'xmlto',
-	'xorg-minimal-fonts'
+	'webkitgtk',
 	]
 
 def is_excluded(package):
-- 
2.25.1

