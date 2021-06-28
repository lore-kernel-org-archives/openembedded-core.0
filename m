Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.7569.1624859962767763784
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 22:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NtVGNEXr;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id s14so11951039pfg.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 22:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XuDCy7rKZFs5VSoKa5OKaW37WHbZe6sbxdY3jyuLfTg=;
        b=NtVGNEXrVRuB6BqmtXdHtKIQGGDZDQXzk+t/35PWo4+udSpiTuQsMCxNlXvvUsdt0q
         8OpUrKhNf5E1k2RxeqHftaCGubI9sDvZ/oXN5+k5oePNTpUP7zc9qiWo4+oJtJUgvwXy
         1oBEthv5yB6AzY6WwTZuTzYvd4RyKKL9TCPpsQ7MEykJumMzbvHBQ42WO2c6SAY5o+VV
         U44t+pqIhwBDIz2G3rvQ8lhwMuxzLpQx7nMffBXxnCbR3H26GyUIyfMFe6JBDtygtVnU
         JKavuia9QAa5YvCBLd1di+n2oswj5Gxu6IIQ60z6WXNtJo9HCUnCHNx2Sm7KO/rELQ1q
         ItKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XuDCy7rKZFs5VSoKa5OKaW37WHbZe6sbxdY3jyuLfTg=;
        b=CldlgpyT23tskiqqhMQIaYc9QnCVyuM3UOcKaGAKb6rvTXpVfAfXCkXINHc9RAiJ9m
         fEFDWUIpb/9pQFvlEUMFX5cbGoYX4kwijy5XErtTVycJzlS1ZxDpq/jPoVE3axNYWUDw
         mVjpJn1YPqaBrELZy38raidndjK94LfnQ7yYsWRdzgwnXvptdhcEsbQgZuri+9j5Y/Pu
         jXFpTbw1bVF8vGj1QchEENqSdZ4QlFAppV+mD8oP1xyyHs6ockOPAdQQNlOsMpeBSPH7
         rcS7LKs1H+ndXLxcphL2asz6cBdFioYMiYln/I09UrVxa3EgKmc6GVBORit5NSQw2Wri
         o2fg==
X-Gm-Message-State: AOAM530Tedk2z3bPyKUAnRKuGJcWROtsYD+CceJPpFsg4yxgYO8kpPFk
	MFF9F10NXQNTawS3NMV298/C5od2xabNMQ==
X-Google-Smtp-Source: ABdhPJygJ/3HJDS1URvBTwNMuBy9fz94qVLlH25/QW7Pr7qbVbttaA6ISTDCOj1j0kbxRgU/KbI3Qg==
X-Received: by 2002:a62:1857:0:b029:302:fb56:df52 with SMTP id 84-20020a6218570000b0290302fb56df52mr23204717pfy.3.1624859961239;
        Sun, 27 Jun 2021 22:59:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id c18sm12768912pgf.66.2021.06.27.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:59:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/8] PEP8 double aggressive E20 and E211
Date: Sun, 27 Jun 2021 22:59:11 -0700
Message-Id: <20210628055915.1107-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628055915.1107-1-raj.khem@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-selftest/lib/devtool/bbpath.py           |   4 +-
 meta-selftest/lib/recipetool/bbpath.py        |   6 +-
 meta/lib/buildstats.py                        |   6 +-
 meta/lib/oe/distro_check.py                   |   6 +-
 meta/lib/oe/elf.py                            | 134 +++++++-------
 meta/lib/oe/lsb.py                            |   2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   |   2 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |   2 +-
 meta/lib/oe/patch.py                          |   4 +-
 meta/lib/oe/rootfs.py                         |   2 +-
 meta/lib/oe/sstatesig.py                      |   4 +-
 meta/lib/oe/terminal.py                       |   2 +-
 meta/lib/oe/utils.py                          |   2 +-
 meta/lib/oeqa/controllers/masterimage.py      |   2 +-
 meta/lib/oeqa/controllers/testtargetloader.py |   2 +-
 meta/lib/oeqa/core/case.py                    |  12 +-
 meta/lib/oeqa/core/runner.py                  |   2 +-
 meta/lib/oeqa/core/target/ssh.py              |   6 +-
 meta/lib/oeqa/core/tests/test_data.py         |   4 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |   2 +-
 meta/lib/oeqa/oetest.py                       |   2 +-
 meta/lib/oeqa/runexported.py                  |   2 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |   2 +-
 meta/lib/oeqa/runtime/cases/ltp.py            |   2 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  30 +--
 meta/lib/oeqa/runtime/cases/ptest.py          |   4 +-
 meta/lib/oeqa/sdk/cases/gcc.py                |   4 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |   4 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |   4 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   8 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py  |   2 +-
 .../lib/oeqa/selftest/cases/containerimage.py |   6 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  30 +--
 meta/lib/oeqa/selftest/cases/fitimage.py      |   4 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py |   2 +-
 .../oeqa/selftest/cases/kerneldevelopment.py  |   3 +-
 .../oeqa/selftest/cases/oelib/buildhistory.py |  16 +-
 meta/lib/oeqa/selftest/cases/oelib/path.py    |  46 ++---
 meta/lib/oeqa/selftest/cases/package.py       |  16 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |   4 +-
 meta/lib/oeqa/selftest/cases/wic.py           |   3 +-
 meta/lib/oeqa/targetcontrol.py                |   2 +-
 meta/lib/oeqa/utils/commands.py               |   2 +-
 meta/lib/oeqa/utils/logparser.py              |   2 +-
 meta/lib/oeqa/utils/sshcontrol.py             |   6 +-
 meta/lib/oeqa/utils/testexport.py             |   2 +-
 .../python/python3/create_manifest3.py        |   4 +-
 .../python/python3/get_module_deps3.py        |   8 +-
 .../perf/perf/sort-pmuevents.py               |  40 ++--
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |   4 +-
 scripts/buildstats-diff                       |   2 +-
 scripts/combo-layer                           |   2 +-
 scripts/lib/checklayer/cases/bsp.py           |   2 +-
 scripts/lib/devtool/upgrade.py                |   2 +-
 scripts/lib/resulttool/manualexecution.py     |   4 +-
 scripts/lib/resulttool/report.py              |  14 +-
 scripts/lib/scriptutils.py                    |   2 +-
 scripts/lib/wic/engine.py                     |   5 +-
 scripts/lib/wic/filemap.py                    |   2 +-
 scripts/lib/wic/misc.py                       |   6 +-
 .../wic/plugins/source/bootimg-biosplusefi.py |   6 +-
 scripts/oe-pkgdata-browser                    |   4 +-
 scripts/oe-trim-schemas                       |   4 +-
 scripts/oepydevshell-internal.py              |   2 +-
 .../pybootchartgui/pybootchartgui/batch.py    |  18 +-
 scripts/pybootchartgui/pybootchartgui/draw.py | 174 +++++++++---------
 scripts/pybootchartgui/pybootchartgui/gui.py  |  32 ++--
 .../pybootchartgui/pybootchartgui/main.py.in  |   4 +-
 .../pybootchartgui/pybootchartgui/parsing.py  | 102 +++++-----
 .../pybootchartgui/process_tree.py            |   8 +-
 .../pybootchartgui/pybootchartgui/samples.py  |  18 +-
 scripts/wic                                   |   2 +-
 72 files changed, 441 insertions(+), 444 deletions(-)

diff --git a/meta-selftest/lib/devtool/bbpath.py b/meta-selftest/lib/devtool/bbpath.py
index 5e8ffb3af6..0204f13dd1 100644
--- a/meta-selftest/lib/devtool/bbpath.py
+++ b/meta-selftest/lib/devtool/bbpath.py
@@ -11,10 +11,10 @@ def plugin_init(plugins):
     already_loaded = plugin_name(__file__) in (plugin_name(p.__name__) for p in plugins)
 
 def print_name(args, config, basepath, workspace):
-    print (__file__)
+    print(__file__)
 
 def print_bbdir(args, config, basepath, workspace):
-    print (__file__.replace('/lib/devtool/bbpath.py',''))
+    print(__file__.replace('/lib/devtool/bbpath.py',''))
 
 def print_registered(args, config, basepath, workspace):
     global kept_context
diff --git a/meta-selftest/lib/recipetool/bbpath.py b/meta-selftest/lib/recipetool/bbpath.py
index 783b2dc769..23e6fa1b06 100644
--- a/meta-selftest/lib/recipetool/bbpath.py
+++ b/meta-selftest/lib/recipetool/bbpath.py
@@ -11,15 +11,15 @@ def plugin_init(plugins):
     already_loaded = plugin_name(__file__) in (plugin_name(p.__name__) for p in plugins)
 
 def print_name(opts):
-    print (__file__)
+    print(__file__)
 
 def print_bbdir(opts):
-    print (__file__.replace('/lib/recipetool/bbpath.py',''))
+    print(__file__.replace('/lib/recipetool/bbpath.py',''))
 
 def print_registered(opts):
     #global kept_context
     #print(kept_context.loaded)
-    print ("1")
+    print("1")
 
 def multiloaded(opts):
     global already_loaded
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 8627ed3c31..051daf7a5d 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -92,10 +92,10 @@ class SystemStats:
             # for that point in the past.
             interval = time - self.diskstats_ltime
             if interval > 0:
-                sums = [ a - b for a, b in zip(diskdata, self.diskstats_data) ]
+                sums = [a - b for a, b in zip(diskdata, self.diskstats_data)]
                 readTput = sums[0] / 2.0 * 100.0 / interval
                 writeTput = sums[1] / 2.0 * 100.0 / interval
-                util = float( sums[2] ) / 10 / interval
+                util = float(sums[2]) / 10 / interval
                 util = max(0.0, min(1.0, util))
                 reduced = (self.diskstats_ltime, (readTput, writeTput, util))
 
@@ -112,7 +112,7 @@ class SystemStats:
             return None
         # CPU times {user, nice, system, idle, io_wait, irq, softirq} from first line
         tokens = data.split(b'\n', 1)[0].split()
-        times = [ int(token) for token in tokens[1:] ]
+        times = [int(token) for token in tokens[1:]]
         reduced = None
         if self.stat_ltimes:
             user = float((times[0] + times[1]) - (self.stat_ltimes[0] + self.stat_ltimes[1]))
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 3daff5f547..508dcdb7d4 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -183,10 +183,10 @@ def update_distro_data(distro_check_dir, datetime, d):
     The operations has to be protected by a lock so that
     only one thread performes it at a time.
     """
-    if not os.path.isdir (distro_check_dir):
+    if not os.path.isdir(distro_check_dir):
         try:
-            bb.note ("Making new directory: %s" % distro_check_dir)
-            os.makedirs (distro_check_dir)
+            bb.note("Making new directory: %s" % distro_check_dir)
+            os.makedirs(distro_check_dir)
         except OSError:
             raise Exception('Unable to create directory %s' % (distro_check_dir))
 
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index df0a4593fa..6549e8f09b 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -5,120 +5,120 @@
 def machine_dict(d):
 #           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little Endian, 32bit?
     machdata = {
-            "darwin9" : { 
-                        "arm" :       (40,     0,    0,          True,          32),
+            "darwin9": { 
+                        "arm":       (40,     0,    0,          True,          32),
                       },
-            "eabi" : {
-                        "arm" :       (40,     0,    0,          True,          32),
+            "eabi": {
+                        "arm":       (40,     0,    0,          True,          32),
                       },
-            "elf" : {
-                        "aarch64" :   (183,    0,    0,          True,          64),
-                        "aarch64_be" :(183,    0,    0,          False,         64),
-                        "i586" :      (3,      0,    0,          True,          32),
-                        "i686" :      (3,      0,    0,          True,          32),
+            "elf": {
+                        "aarch64":   (183,    0,    0,          True,          64),
+                        "aarch64_be":(183,    0,    0,          False,         64),
+                        "i586":      (3,      0,    0,          True,          32),
+                        "i686":      (3,      0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
                         "epiphany":   (4643,   0,    0,          True,          32),
                         "lm32":       (138,    0,    0,          False,         32),
-                        "mips":       ( 8,     0,    0,          False,         32),
-                        "mipsel":     ( 8,     0,    0,          True,          32),
+                        "mips":       (8,     0,    0,          False,         32),
+                        "mipsel":     (8,     0,    0,          True,          32),
                         "microblaze":  (189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
                         "powerpc":    (20,     0,    0,          False,         32),
                         "riscv32":    (243,    0,    0,          True,          32),
                         "riscv64":    (243,    0,    0,          True,          64),
                       },
-            "linux" : { 
-                        "aarch64" :   (183,    0,    0,          True,          64),
-                        "aarch64_be" :(183,    0,    0,          False,         64),
-                        "arm" :       (40,    97,    0,          True,          32),
+            "linux": { 
+                        "aarch64":   (183,    0,    0,          True,          64),
+                        "aarch64_be":(183,    0,    0,          False,         64),
+                        "arm":       (40,    97,    0,          True,          32),
                         "armeb":      (40,    97,    0,          False,         32),
                         "powerpc":    (20,     0,    0,          False,         32),
                         "powerpc64":  (21,     0,    0,          False,         64),
                         "powerpc64le":  (21,     0,    0,          True,         64),
-                        "i386":       ( 3,     0,    0,          True,          32),
-                        "i486":       ( 3,     0,    0,          True,          32),
-                        "i586":       ( 3,     0,    0,          True,          32),
-                        "i686":       ( 3,     0,    0,          True,          32),
+                        "i386":       (3,     0,    0,          True,          32),
+                        "i486":       (3,     0,    0,          True,          32),
+                        "i586":       (3,     0,    0,          True,          32),
+                        "i686":       (3,     0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
                         "ia64":       (50,     0,    0,          True,          64),
                         "alpha":      (36902,  0,    0,          True,          64),
                         "hppa":       (15,     3,    0,          False,         32),
-                        "m68k":       ( 4,     0,    0,          False,         32),
-                        "mips":       ( 8,     0,    0,          False,         32),
-                        "mipsel":     ( 8,     0,    0,          True,          32),
-                        "mips64":     ( 8,     0,    0,          False,         64),
-                        "mips64el":   ( 8,     0,    0,          True,          64),
-                        "mipsisa32r6":   ( 8,  0,    0,          False,         32),
-                        "mipsisa32r6el": ( 8,  0,    0,          True,          32),
-                        "mipsisa64r6":   ( 8,  0,    0,          False,         64),
-                        "mipsisa64r6el": ( 8,  0,    0,          True,          64),
+                        "m68k":       (4,     0,    0,          False,         32),
+                        "mips":       (8,     0,    0,          False,         32),
+                        "mipsel":     (8,     0,    0,          True,          32),
+                        "mips64":     (8,     0,    0,          False,         64),
+                        "mips64el":   (8,     0,    0,          True,          64),
+                        "mipsisa32r6":   (8,  0,    0,          False,         32),
+                        "mipsisa32r6el": (8,  0,    0,          True,          32),
+                        "mipsisa64r6":   (8,  0,    0,          False,         64),
+                        "mipsisa64r6el": (8,  0,    0,          True,          64),
                         "nios2":      (113,    0,    0,          True,          32),
                         "riscv32":    (243,    0,    0,          True,          32),
                         "riscv64":    (243,    0,    0,          True,          64),
                         "s390":       (22,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
-                        "sparc":      ( 2,     0,    0,          False,         32),
+                        "sparc":      (2,     0,    0,          False,         32),
                         "microblaze":  (189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
                       },
-            "linux-musl" : { 
-                        "aarch64" :   (183,    0,    0,            True,          64),
-                        "aarch64_be" :(183,    0,    0,            False,         64),
-                        "arm" :       (  40,    97,    0,          True,          32),
-                        "armeb":      (  40,    97,    0,          False,         32),
-                        "powerpc":    (  20,     0,    0,          False,         32),
-                        "powerpc64":  (  21,     0,    0,          False,         64),
+            "linux-musl": { 
+                        "aarch64":   (183,    0,    0,            True,          64),
+                        "aarch64_be":(183,    0,    0,            False,         64),
+                        "arm":       (40,    97,    0,          True,          32),
+                        "armeb":      (40,    97,    0,          False,         32),
+                        "powerpc":    (20,     0,    0,          False,         32),
+                        "powerpc64":  (21,     0,    0,          False,         64),
                         "powerpc64le":  (21,     0,    0,          True,         64),
-                        "i386":       (   3,     0,    0,          True,          32),
-                        "i486":       (   3,     0,    0,          True,          32),
-                        "i586":       (   3,     0,    0,          True,          32),
-                        "i686":       (   3,     0,    0,          True,          32),
-                        "x86_64":     (  62,     0,    0,          True,          64),
-                        "mips":       (   8,     0,    0,          False,         32),
-                        "mipsel":     (   8,     0,    0,          True,          32),
-                        "mips64":     (   8,     0,    0,          False,         64),
-                        "mips64el":   (   8,     0,    0,          True,          64),
+                        "i386":       (3,     0,    0,          True,          32),
+                        "i486":       (3,     0,    0,          True,          32),
+                        "i586":       (3,     0,    0,          True,          32),
+                        "i686":       (3,     0,    0,          True,          32),
+                        "x86_64":     (62,     0,    0,          True,          64),
+                        "mips":       (8,     0,    0,          False,         32),
+                        "mipsel":     (8,     0,    0,          True,          32),
+                        "mips64":     (8,     0,    0,          False,         64),
+                        "mips64el":   (8,     0,    0,          True,          64),
                         "microblaze":  (189,     0,    0,          False,         32),
                         "microblazeel":(189,     0,    0,          True,          32),
                         "riscv32":    (243,      0,    0,          True,          32),
                         "riscv64":    (243,      0,    0,          True,          64),
-                        "sh4":        (  42,     0,    0,          True,          32),
+                        "sh4":        (42,     0,    0,          True,          32),
                       },
-            "uclinux-uclibc" : {
-                        "bfin":       ( 106,     0,    0,          True,         32),
+            "uclinux-uclibc": {
+                        "bfin":       (106,     0,    0,          True,         32),
                       }, 
-            "linux-gnueabi" : {
-                        "arm" :       (40,     0,    0,          True,          32),
-                        "armeb" :     (40,     0,    0,          False,         32),
+            "linux-gnueabi": {
+                        "arm":       (40,     0,    0,          True,          32),
+                        "armeb":     (40,     0,    0,          False,         32),
                       },
-            "linux-musleabi" : {
-                        "arm" :       (40,     0,    0,          True,          32),
-                        "armeb" :     (40,     0,    0,          False,         32),
+            "linux-musleabi": {
+                        "arm":       (40,     0,    0,          True,          32),
+                        "armeb":     (40,     0,    0,          False,         32),
                       },
-            "linux-gnuspe" : {
+            "linux-gnuspe": {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
-            "linux-muslspe" : {
+            "linux-muslspe": {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
-            "linux-gnu" :       {
+            "linux-gnu":       {
                         "powerpc":    (20,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
                       },
-            "linux-gnu_ilp32" :     {
-                        "aarch64" :   (183,    0,    0,          True,          32),
+            "linux-gnu_ilp32":     {
+                        "aarch64":   (183,    0,    0,          True,          32),
                       },
-            "linux-gnux32" :       {
+            "linux-gnux32":       {
                         "x86_64":     (62,     0,    0,          True,          32),
                       },
-            "linux-muslx32" :       {
+            "linux-muslx32":       {
                         "x86_64":     (62,     0,    0,          True,          32),
                       },
-            "linux-gnun32" :       {
-                        "mips64":       ( 8,     0,    0,          False,         32),
-                        "mips64el":     ( 8,     0,    0,          True,          32),
-                        "mipsisa64r6":  ( 8,     0,    0,          False,         32),
-                        "mipsisa64r6el":( 8,     0,    0,          True,          32),
+            "linux-gnun32":       {
+                        "mips64":       (8,     0,    0,          False,         32),
+                        "mips64el":     (8,     0,    0,          True,          32),
+                        "mipsisa64r6":  (8,     0,    0,          False,         32),
+                        "mipsisa64r6el":(8,     0,    0,          True,          32),
                       },
         }
 
@@ -127,7 +127,7 @@ def machine_dict(d):
     extra_machdata = (d and d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS" or None) or "").split()
     for m in extra_machdata:
         call = m + "(machdata, d)"
-        locs = { "machdata" : machdata, "d" : d}
+        locs = {"machdata": machdata, "d": d}
         machdata = bb.utils.better_eval(call, locs)
 
     return machdata
diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 43e46380d7..791d529935 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -37,7 +37,7 @@ def release_dict_lsb():
     except bb.process.CmdError as exc:
         return {}
 
-    lsb_map = { 'Distributor ID': 'DISTRIB_ID',
+    lsb_map = {'Distributor ID': 'DISTRIB_ID',
                 'Release': 'DISTRIB_RELEASE'}
     lsb_keys = lsb_map.keys()
 
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4cd3963111..8e2086a6f3 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -166,7 +166,7 @@ class OpkgPM(OpkgDpkgPM):
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
+        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/'),target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS")
 
         if prepare_index:
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index c5419a3bc7..9acb2b2ea3 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -300,7 +300,7 @@ class RpmPM(PackageManager):
     def update(self):
         self._invoke_dnf(["makecache", "--refresh"])
 
-    def _invoke_dnf(self, dnf_args, fatal=True, print_output=True ):
+    def _invoke_dnf(self, dnf_args, fatal=True, print_output=True):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index eeea18ef04..a191a613bd 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -35,7 +35,7 @@ def runcmd(args, dir=None):
         # print("cwd: %s -> %s" % (olddir, dir))
 
     try:
-        args = [ pipes.quote(str(arg)) for arg in args ]
+        args = [pipes.quote(str(arg)) for arg in args]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
         proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
@@ -190,7 +190,7 @@ class PatchTree(PatchSet):
     def _appendPatchFile(self, patch, strippath):
         with open(self.seriespath, 'a') as f:
             f.write(os.path.basename(patch) + "," + strippath + "\n")
-        shellcmd = ["cat", patch, ">" , self.patchdir + "/" + os.path.basename(patch)]
+        shellcmd = ["cat", patch, ">", self.patchdir + "/" + os.path.basename(patch)]
         runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
 
     def _removePatch(self, p):
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ad9fd77c8b..0043df18d7 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -46,7 +46,7 @@ class Rootfs(object, metaclass=ABCMeta):
         # Ignore any lines containing log_check to avoid recursion, and ignore
         # lines beginning with a + since sh -x may emit code which isn't
         # actually executed, but may contain error messages
-        excludes = [ 'log_check', r'^\+' ]
+        excludes = ['log_check', r'^\+']
         if hasattr(self, 'log_check_expected_regexes'):
             excludes.extend(self.log_check_expected_regexes)
         # Insert custom log_check excludes
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5198203367..560c6a40dd 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -107,7 +107,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.mismatch_msgs = []
         self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES") or
                                 "").split()
-        self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
+        self.unlockedrecipes = {k: "" for k in self.unlockedrecipes}
         self.buildarch = data.getVar('BUILD_ARCH')
         self._internal = False
         pass
@@ -180,7 +180,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
 
             # If any unlocked recipe is in the direct dependencies then the
             # current recipe should be unlocked as well.
-            depnames = [ recipename_from_dep(x) for x in deps if mc == bb.runqueue.mc_from_tid(x)]
+            depnames = [recipename_from_dep(x) for x in deps if mc == bb.runqueue.mc_from_tid(x)]
             if any(x in y for y in depnames for x in self.unlockedrecipes):
                 self.unlockedrecipes[recipename] = ''
                 unlocked = True
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 116c104536..04585afd42 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -42,7 +42,7 @@ class Terminal(Popen, metaclass=Registry):
                 raise
 
     def format_command(self, sh_cmd, title):
-        fmt = {'title': title or 'Terminal', 'command': sh_cmd, 'cwd': os.getcwd() }
+        fmt = {'title': title or 'Terminal', 'command': sh_cmd, 'cwd': os.getcwd()}
         if isinstance(self.command, str):
             return shlex.split(self.command.format(**fmt))
         else:
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index b33d049722..123ad07fe4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -8,7 +8,7 @@ import traceback
 
 def read_file(filename):
     try:
-        f = open( filename, "r" )
+        f = open(filename, "r")
     except IOError as reason:
         return "" # WARNING: can't raise an error now because of the new RDEPENDS handling. This is a bit ugly. :M:
     else:
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 0bf5917e48..c22bc2833d 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -42,7 +42,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         self.server_ip = d.getVar("TEST_SERVER_IP")
         if not self.server_ip:
             try:
-                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
+                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip]).split("\n")[0].split()[-1]
             except Exception as e:
                 bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
         bb.note("Server IP: %s" % self.server_ip)
diff --git a/meta/lib/oeqa/controllers/testtargetloader.py b/meta/lib/oeqa/controllers/testtargetloader.py
index 23101c7371..9ef039050e 100644
--- a/meta/lib/oeqa/controllers/testtargetloader.py
+++ b/meta/lib/oeqa/controllers/testtargetloader.py
@@ -65,7 +65,7 @@ class TestTargetLoader:
             obj = getattr(module, target)
             if obj: 
                 from oeqa.targetcontrol import BaseTarget
-                if( not issubclass(obj, BaseTarget)):
+                if(not issubclass(obj, BaseTarget)):
                     bb.warn("Target {0} found, but subclass is not BaseTarget".format(target))
         except:
             obj = None
diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index 84daa343d8..7ddfd07677 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -67,16 +67,16 @@ class OEPTestResultTestCase:
         logdata = log.encode("utf-8") if isinstance(log, str) else log
         logdata = zlib.compress(logdata)
         logdata = base64.b64encode(logdata).decode("utf-8")
-        return {"compressed" : logdata}
+        return {"compressed": logdata}
 
     def ptest_rawlog(self, log):
         if not hasattr(self, "extraresults"):
-            self.extraresults = {"ptestresult.sections" : {}}
-        self.extraresults["ptestresult.rawlogs"] = {"log" : self._compress_log(log)}
+            self.extraresults = {"ptestresult.sections": {}}
+        self.extraresults["ptestresult.rawlogs"] = {"log": self._compress_log(log)}
 
     def ptest_section(self, section, duration=None, log=None, logfile=None, exitcode=None):
         if not hasattr(self, "extraresults"):
-            self.extraresults = {"ptestresult.sections" : {}}
+            self.extraresults = {"ptestresult.sections": {}}
 
         sections = self.extraresults.get("ptestresult.sections")
         if section not in sections:
@@ -95,11 +95,11 @@ class OEPTestResultTestCase:
 
     def ptest_result(self, section, test, result):
         if not hasattr(self, "extraresults"):
-            self.extraresults = {"ptestresult.sections" : {}}
+            self.extraresults = {"ptestresult.sections": {}}
 
         sections = self.extraresults.get("ptestresult.sections")
         if section not in sections:
             sections[section] = {}
         resultname = "ptestresult.{}.{}".format(section, test)
-        self.extraresults[resultname] = {"status" : result}
+        self.extraresults[resultname] = {"status": result}
 
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 1d325e188d..72078eb8bd 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -93,7 +93,7 @@ class OETestResult(_TestResult):
     def _getTestResultDetails(self, case):
         result_types = {'failures': 'FAILED', 'errors': 'ERROR', 'skipped': 'SKIPPED',
                         'expectedFailures': 'EXPECTEDFAIL', 'successes': 'PASSED',
-                        'unexpectedSuccesses' : 'PASSED'}
+                        'unexpectedSuccesses': 'PASSED'}
 
         for rtype in result_types:
             found = False
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 923a223b25..9493e186b3 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -38,11 +38,11 @@ class OESSHTarget(OETarget):
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
                 ]
-        self.ssh = ['ssh', '-l', self.user ] + ssh_options
+        self.ssh = ['ssh', '-l', self.user] + ssh_options
         self.scp = ['scp'] + ssh_options
         if port:
-            self.ssh = self.ssh + [ '-p', port ]
-            self.scp = self.scp + [ '-P', port ]
+            self.ssh = self.ssh + ['-p', port]
+            self.scp = self.scp + ['-P', port]
         self._monitor_dumper = None
 
     def start(self, **kwargs):
diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index acd726f3a0..6fddbb4e96 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -33,7 +33,7 @@ class TestData(TestBase):
 
     def test_data_fail_wrong_variable(self):
         expectedError = 'AssertionError'
-        d = {'IMAGE' : 'core-image-weston', 'ARCH' : 'arm'}
+        d = {'IMAGE': 'core-image-weston', 'ARCH': 'arm'}
 
         tc = self._testLoader(d=d, modules=self.modules)
         results = tc.runTests()
@@ -46,7 +46,7 @@ class TestData(TestBase):
             self.assertTrue(expect)
 
     def test_data_ok(self):
-        d = {'IMAGE' : 'core-image-minimal', 'ARCH' : 'x86', 'MACHINE' : 'qemuarm'}
+        d = {'IMAGE': 'core-image-minimal', 'ARCH': 'x86', 'MACHINE': 'qemuarm'}
 
         tc = self._testLoader(d=d, modules=self.modules)
         self.assertEqual(True, tc.runTests().wasSuccessful())
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 678484243b..e82acbd368 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -128,7 +128,7 @@ class ExtraResultsDecoderTestResult(ProxyTestResult):
 class ExtraResultsEncoderTestResult(ProxyTestResult):
     def _addResult(self, method, test, *args, exception=False, **kwargs):
         if hasattr(test, "extraresults"):
-            extras = lambda : [json.dumps(test.extraresults).encode()]
+            extras = lambda: [json.dumps(test.extraresults).encode()]
             kwargs = kwargs.copy()
             if "details" not in kwargs:
                 kwargs["details"] = {}
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 2ee67586f6..e1c74958bd 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -123,7 +123,7 @@ class oeRuntimeTest(oeTest):
             self.tc.host_dumper.dump_host()
             self.target.target_dumper.dump_target(
                     self.tc.host_dumper.dump_dir)
-            print ("%s dump data stored in %s" % (self._testMethodName,
+            print("%s dump data stored in %s" % (self._testMethodName,
                      self.tc.host_dumper.dump_dir))
 
         self.tearDownLocal()
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 5f087bc950..1e994bc655 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -135,7 +135,7 @@ def extract_sdk(d):
     tarball_path = os.path.join(export_dir, tools_dir, tarball_name)
     extract_path = os.path.join(export_dir, "sysroot")
     if os.path.isfile(tarball_path):
-        print ("Found SDK tarball %s. Extracting..." % tarball_path)
+        print("Found SDK tarball %s. Extracting..." % tarball_path)
         result = runCmd("%s -y -d %s" % (tarball_path, extract_path))
         for f in os.listdir(extract_path):
             if f.startswith("environment-setup"):
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index aeef8c6086..51f46cc4ba 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -187,5 +187,5 @@ class DnfRepoTest(DnfTest):
         self.assertEqual(1, status, "%s was not removed,  is listed as installed"%excludepkg)
         self.dnf_with_repo('install -y --exclude=%s --exclude=curl-staticdev curl*' % excludepkg)
         #check curl-dev is not installed after being excluded
-        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg , 1500)
+        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg, 1500)
         self.assertEqual(1, status, "%s was not excluded, is listed as installed"%excludepkg)
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index a66d5d13d7..a1d59c39d2 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -76,7 +76,7 @@ class LtpTest(LtpTestBase):
             self.extras['ltpresult.rawlogs']['log'] = self.extras['ltpresult.rawlogs']['log'] + output
 
             # copy nice log from DUT
-            dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
+            dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group)
             remote_src = "/opt/ltp/results/%s" % ltp_group 
             (status, output) = self.target.copyFrom(remote_src, dst, True)
             msg = 'File could not be copied. Output: %s' % output
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index d58968923e..3638ed529f 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -93,22 +93,22 @@ qemux86_common = [
 ] + common_errors
 
 ignore_errors = {
-    'default' : common_errors,
-    'qemux86' : [
+    'default': common_errors,
+    'qemux86': [
         'Failed to access perfctr msr (MSR',
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
         ] + qemux86_common,
-    'qemux86-64' : qemux86_common,
-    'qemumips' : [
+    'qemux86-64': qemux86_common,
+    'qemumips': [
         'Failed to load module "glx"',
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
         'cacheinfo: Failed to find cpu0 device node',
         ] + common_errors,
-    'qemumips64' : [
+    'qemumips64': [
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
         'cacheinfo: Failed to find cpu0 device node',
          ] + common_errors,
-    'qemuppc' : [
+    'qemuppc': [
         'PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]',
         'host side 80-wire cable detection failed, limiting max speed',
         'mode "640x480" test failed',
@@ -116,12 +116,12 @@ ignore_errors = {
         'can\'t handle BAR above 4GB',
         'Cannot reserve Legacy IO',
         ] + common_errors,
-    'qemuppc64' : [
+    'qemuppc64': [
         'vio vio: uevent: failed to send synthetic uevent',
         'synth uevent: /devices/vio: failed to send uevent',
         'PCI 0000:00 Cannot reserve Legacy IO [io  0x10000-0x10fff]',
         ] + common_errors,
-    'qemuarm' : [
+    'qemuarm': [
         'mmci-pl18x: probe of fpga:05 failed with error -22',
         'mmci-pl18x: probe of fpga:0b failed with error -22',
         'Failed to load module "glx"',
@@ -136,14 +136,14 @@ ignore_errors = {
         'Failed to initialize \'/amba/timer@101e3000\': -22',
         'jitterentropy: Initialization failed with host not compliant with requirements: 2',
         ] + common_errors,
-    'qemuarm64' : [
+    'qemuarm64': [
         'Fatal server error:',
         '(EE) Server terminated with error (1). Closing log file.',
         'dmi: Firmware registration failed.',
         'irq: type mismatch, failed to map hwirq-27 for /intc',
         'logind: failed to get session seat',
         ] + common_errors,
-    'intel-core2-32' : [
+    'intel-core2-32': [
         'ACPI: No _BQC method, cannot determine initial brightness',
         '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
         '(EE) Failed to load module "psb"',
@@ -155,7 +155,7 @@ ignore_errors = {
         'dmi: Firmware registration failed.',
         'ioremap error for 0x78',
         ] + x86_common,
-    'intel-corei7-64' : [
+    'intel-corei7-64': [
         'can\'t set Max Payload Size to 256',
         'intel_punit_ipc: can\'t request region for resource',
         '[drm] parse error at position 4 in video mode \'efifb\'',
@@ -170,8 +170,8 @@ ignore_errors = {
         'Bluetooth: hci0: Failed to send firmware data (-38)',
         'atkbd serio0: Failed to enable keyboard on isa0060/serio0',
         ] + x86_common,
-    'genericx86' : x86_common,
-    'genericx86-64' : [
+    'genericx86': x86_common,
+    'genericx86-64': [
         'Direct firmware load for i915',
         'Failed to load firmware i915',
         'Failed to fetch GuC',
@@ -179,13 +179,13 @@ ignore_errors = {
         'Failed to load DMC firmware',
         'The driver is built-in, so to load the firmware you need to',
         ] + x86_common,
-    'edgerouter' : [
+    'edgerouter': [
         'not creating \'/sys/firmware/fdt\'',
         'Failed to find cpu0 device node',
         'Fatal server error:',
         'Server terminated with error',
         ] + common_errors,
-    'beaglebone-yocto' : [
+    'beaglebone-yocto': [
         'Direct firmware load for regulatory.db',
         'failed to load regulatory.db',
         'l4_wkup_cm',
diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 0800f3c27f..a8a4d17003 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -54,7 +54,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         ptest_runner_log = os.path.join(ptest_log_dir, 'ptest-runner.log')
 
         libdir = self.td.get('libdir', '')
-        ptest_dirs = [ '/usr/lib' ]
+        ptest_dirs = ['/usr/lib']
         if not libdir in ptest_dirs:
             ptest_dirs.append(libdir)
         status, output = self.target.run('ptest-runner -d \"{}\"'.format(' '.join(ptest_dirs)), 0)
@@ -95,7 +95,7 @@ class PtestRunnerTest(OERuntimeTestCase):
                 failed_tests[section] = sections[section]["log"]
 
         for section in results:
-            failed_testcases = [ "_".join(test.translate(trans).split()) for test in results[section] if results[section][test] == 'FAILED' ]
+            failed_testcases = ["_".join(test.translate(trans).split()) for test in results[section] if results[section][test] == 'FAILED']
             if failed_testcases:
                 failed_tests[section] = failed_testcases
 
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index 71e71dee0a..7146f368e9 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -17,8 +17,8 @@ class GccCompileTest(OESDKTestCase):
 
     @classmethod
     def setUpClass(self):
-        files = {'test.c' : self.tc.files_dir, 'test.cpp' : self.tc.files_dir,
-                'testsdkmakefile' : self.tc.sdk_files_dir} 
+        files = {'test.c': self.tc.files_dir, 'test.cpp': self.tc.files_dir,
+                'testsdkmakefile': self.tc.sdk_files_dir} 
         for f in files:
             shutil.copyfile(os.path.join(files[f], f),
                     os.path.join(self.tc.sdk_dir, f))
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index ef5dea1f47..8c07d5e3b3 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -72,7 +72,7 @@ class DevtoolTest(OESDKExtTestCase):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "librdfa"
         self._run('devtool sdk-install libxml2')
-        self._run('devtool add %s %s' % (recipe, req) )
+        self._run('devtool add %s %s' % (recipe, req))
         try:
             self._run('devtool build %s' % recipe)
         finally:
@@ -81,7 +81,7 @@ class DevtoolTest(OESDKExtTestCase):
     def test_devtool_kernelmodule(self):
         docfile = 'https://git.yoctoproject.org/git/kernel-module-hello-world'
         recipe = 'kernel-module-hello-world'
-        self._run('devtool add %s %s' % (recipe, docfile) )
+        self._run('devtool add %s %s' % (recipe, docfile))
         try:
             self._run('devtool build %s' % recipe)
         finally:
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index ddd08ecf84..35b3ddb5fb 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -86,8 +86,8 @@ class Archiver(OESelftestTestCase):
         Author:      André Draszik <adraszik@tycoint.com>
         """
 
-        target_recipes = [ 'initscripts', 'selftest-ed' ]
-        native_recipes = [ 'update-rc.d-native', 'selftest-ed-native' ]
+        target_recipes = ['initscripts', 'selftest-ed']
+        native_recipes = ['update-rc.d-native', 'selftest-ed-native']
 
         features = 'INHERIT += "archiver"\n'
         features += 'ARCHIVER_MODE[src] = "original"\n'
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index e8ce78480b..524d7b6828 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -51,7 +51,7 @@ class BitbakeTests(OESelftestTestCase):
         bitbake('m4-native -cclean')
         result = bitbake('m4-native')
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
-        self.assertTrue(find_setscene, msg="No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
+        self.assertTrue(find_setscene, msg="No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output)
 
     def test_bitbake_invalid_recipe(self):
         result = bitbake('-b asdf', ignore_status=True)
@@ -191,7 +191,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
     def test_prefile(self):
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
-        ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
+        ftools.write_file(preconf,"TEST_PREFILE=\"prefile\"")
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertIn('prefile', result.output)
         self.write_config("TEST_PREFILE=\"localconf\"")
@@ -201,7 +201,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
     def test_postfile(self):
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
-        ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
+        ftools.write_file(postconf, "TEST_POSTFILE=\"postfile\"")
         self.write_config("TEST_POSTFILE=\"localconf\"")
         result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
         self.assertIn('postfile', result.output)
@@ -216,7 +216,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 INHERIT_remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
-        self.write_recipeinc('man-db',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
+        self.write_recipeinc('man-db',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n")
         runCmd('bitbake -c cleanall man-db xcursor-transparent-theme')
         result = runCmd('bitbake -c unpack -k man-db xcursor-transparent-theme', ignore_status=True)
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 35ff0cbcf2..6621287696 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -45,7 +45,7 @@ class ImageOptionsTests(OESelftestTestCase):
         log_compile = os.path.join(get_bb_var("WORKDIR", recipe), "temp/log.do_compile")
         with open(log_compile, "r") as f:
             loglines = "".join(f.readlines())
-        self.assertIn("ccache", loglines, msg="No match for ccache in %s log.do_compile. For further details: %s" % (recipe , log_compile))
+        self.assertIn("ccache", loglines, msg="No match for ccache in %s log.do_compile. For further details: %s" % (recipe, log_compile))
 
     def test_read_only_image(self):
         distro_features = get_bb_var('DISTRO_FEATURES')
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 79cc8a0f2e..730ffe42c9 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -28,7 +28,7 @@ class ContainerImageTests(OESelftestTestCase):
 
         def get_each_path_part(path):
             if path:
-                part = [ '.' + path + '/' ]
+                part = ['.' + path + '/']
                 result = get_each_path_part(path.rsplit('/', 1)[0])
                 if result:
                     return part + result
@@ -63,10 +63,10 @@ IMAGE_INSTALL_remove = "ssh-pregen-hostkeys"
                     '.{localstatedir}/lib/'
                 ]
 
-        expected_files = [ x.format(bindir=bbvars['bindir'],
+        expected_files = [x.format(bindir=bbvars['bindir'],
                                     sysconfdir=bbvars['sysconfdir'],
                                     localstatedir=bbvars['localstatedir'])
-                                    for x in expected_files ]
+                                    for x in expected_files]
 
         # Since tar lists all directories individually, make sure each element
         # from bindir, sysconfdir, etc is added
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index d1947baffc..4f78bbaf55 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -5,40 +5,40 @@ class CVECheck(OESelftestTestCase):
 
     def test_version_compare(self):
         result = Version("100") > Version("99")
-        self.assertTrue( result, msg="Failed to compare version '100' > '99'")
+        self.assertTrue(result, msg="Failed to compare version '100' > '99'")
         result = Version("2.3.1") > Version("2.2.3")
-        self.assertTrue( result, msg="Failed to compare version '2.3.1' > '2.2.3'")
+        self.assertTrue(result, msg="Failed to compare version '2.3.1' > '2.2.3'")
         result = Version("2021-01-21") > Version("2020-12-25")
-        self.assertTrue( result, msg="Failed to compare version '2021-01-21' > '2020-12-25'")
+        self.assertTrue(result, msg="Failed to compare version '2021-01-21' > '2020-12-25'")
         result = Version("1.2-20200910") < Version("1.2-20200920")
-        self.assertTrue( result, msg="Failed to compare version '1.2-20200910' < '1.2-20200920'")
+        self.assertTrue(result, msg="Failed to compare version '1.2-20200910' < '1.2-20200920'")
 
         result = Version("1.0") >= Version("1.0beta")
-        self.assertTrue( result, msg="Failed to compare version '1.0' >= '1.0beta'")
+        self.assertTrue(result, msg="Failed to compare version '1.0' >= '1.0beta'")
         result = Version("1.0-rc2") > Version("1.0-rc1")
-        self.assertTrue( result, msg="Failed to compare version '1.0-rc2' > '1.0-rc1'")
+        self.assertTrue(result, msg="Failed to compare version '1.0-rc2' > '1.0-rc1'")
         result = Version("1.0.alpha1") < Version("1.0")
-        self.assertTrue( result, msg="Failed to compare version '1.0.alpha1' < '1.0'")
+        self.assertTrue(result, msg="Failed to compare version '1.0.alpha1' < '1.0'")
         result = Version("1.0_dev") <= Version("1.0")
-        self.assertTrue( result, msg="Failed to compare version '1.0_dev' <= '1.0'")
+        self.assertTrue(result, msg="Failed to compare version '1.0_dev' <= '1.0'")
 
         # ignore "p1" and "p2", so these should be equal
         result = Version("1.0p2") == Version("1.0p1")
-        self.assertTrue( result ,msg="Failed to compare version '1.0p2' to '1.0p1'")
+        self.assertTrue(result,msg="Failed to compare version '1.0p2' to '1.0p1'")
         # ignore the "b" and "r"
         result = Version("1.0b") == Version("1.0r")
-        self.assertTrue( result ,msg="Failed to compare version '1.0b' to '1.0r'")
+        self.assertTrue(result,msg="Failed to compare version '1.0b' to '1.0r'")
 
         # consider the trailing alphabet as patched level when comparing
         result = Version("1.0b","alphabetical") < Version("1.0r","alphabetical")
-        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' < '1.0r'")
+        self.assertTrue(result,msg="Failed to compare version with suffix '1.0b' < '1.0r'")
         result = Version("1.0b","alphabetical") > Version("1.0","alphabetical")
-        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' > '1.0'")
+        self.assertTrue(result,msg="Failed to compare version with suffix '1.0b' > '1.0'")
 
         # consider the trailing "p" and "patch" as patched released when comparing
         result = Version("1.0","patch") < Version("1.0p1","patch")
-        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0' < '1.0p1'")
+        self.assertTrue(result,msg="Failed to compare version with suffix '1.0' < '1.0p1'")
         result = Version("1.0p2","patch") > Version("1.0p1","patch")
-        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0p2' > '1.0p1'")
+        self.assertTrue(result,msg="Failed to compare version with suffix '1.0p2' > '1.0p1'")
         result = Version("1.0_patch2","patch") < Version("1.0_patch3","patch")
-        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
+        self.assertTrue(result,msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 815ee48c05..67cae977d9 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -785,7 +785,7 @@ FIT_HASH_ALG = "sha256"
 
         test_passed = False
 
-        print ("checking kernel node\n")
+        print("checking kernel node\n")
 
         if node_str in its_lines:
             node_start_idx = its_lines.index(node_str)
@@ -803,7 +803,7 @@ FIT_HASH_ALG = "sha256"
             line_idx = cfg_start_idx + 2
             node_end = False
             while node_end == False:
-                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};" :
+                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};":
                     node_end = True
                 line_idx = line_idx + 1
 
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 2de22d3404..53c549ac95 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -128,7 +128,7 @@ class ImageFeatures(OESelftestTestCase):
         Author:      Tom Rini <trini@konsulko.com>
         """
 
-        img_types = [ 'vmdk', 'vdi', 'qcow2' ]
+        img_types = ['vmdk', 'vdi', 'qcow2']
         features = ""
         for itype in img_types:
             features += 'IMAGE_FSTYPES += "wic.%s"\n' % itype
diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
index a61876ee61..697f6a94a5 100644
--- a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
+++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
@@ -12,8 +12,7 @@ class KernelDev(OESelftestTestCase):
         cls.layername = 'meta-kerneltest'
         runCmd('bitbake-layers create-layer %s' % cls.layername)
         runCmd('mkdir -p %s/recipes-kernel/linux/linux-yocto' % cls.layername)
-        cls.recipes_linuxyocto_dir = os.path.join \
-            (cls.builddir, cls.layername, 'recipes-kernel', 'linux', 'linux-yocto')
+        cls.recipes_linuxyocto_dir = os.path.join(cls.builddir, cls.layername, 'recipes-kernel', 'linux', 'linux-yocto')
         cls.recipeskernel_dir = os.path.dirname(cls.recipes_linuxyocto_dir)
         runCmd('bitbake-layers add-layer %s' % cls.layername)
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 8b0fb8a8f6..e0bfd44f4e 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -49,7 +49,7 @@ class TestBlobParsing(OESelftestTestCase):
         Test conversion of git blobs to dictionary
         """
         from oe.buildhistory_analysis import blob_to_dict
-        valuesmap = { "foo" : "1", "bar" : "2" }
+        valuesmap = {"foo": "1", "bar": "2"}
         self.commit_vars(to_add=valuesmap)
 
         blob = self.repo.head.commit.tree.blobs[0]
@@ -62,18 +62,18 @@ class TestBlobParsing(OESelftestTestCase):
         """
         from oe.buildhistory_analysis import compare_dict_blobs
 
-        changesmap = { "foo-2" : ("2", "8"), "bar" : ("","4"), "bar-2" : ("","5")}
+        changesmap = {"foo-2": ("2", "8"), "bar": ("","4"), "bar-2": ("","5")}
 
-        self.commit_vars(to_add={ "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
+        self.commit_vars(to_add={"foo": "1", "foo-2": "2", "foo-3": "3"})
         blob1 = self.repo.heads.master.commit.tree.blobs[0]
 
-        self.commit_vars(to_add={ "foo-2" : "8", "bar" : "4", "bar-2" : "5" })
+        self.commit_vars(to_add={"foo-2": "8", "bar": "4", "bar-2": "5"})
         blob2 = self.repo.heads.master.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
             blob1, blob2, False, False)
 
-        var_changes = { x.fieldname : (x.oldvalue, x.newvalue) for x in change_records}
+        var_changes = {x.fieldname: (x.oldvalue, x.newvalue) for x in change_records}
         self.assertEqual(changesmap, var_changes, "Changes not reported correctly")
 
     def test_compare_dict_blobs_default(self):
@@ -81,12 +81,12 @@ class TestBlobParsing(OESelftestTestCase):
         Test default values for comparisson of git blob dictionaries
         """
         from oe.buildhistory_analysis import compare_dict_blobs
-        defaultmap = { x : ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
+        defaultmap = {x: ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
 
-        self.commit_vars(to_add={ "foo" : "1" })
+        self.commit_vars(to_add={"foo": "1"})
         blob1 = self.repo.heads.master.commit.tree.blobs[0]
 
-        self.commit_vars(to_add={ "PKG" : "1", "PKGE" : "1", "PKGV" : "1", "PKGR" : "1" })
+        self.commit_vars(to_add={"PKG": "1", "PKGE": "1", "PKGV": "1", "PKGR": "1"})
         blob2 = self.repo.heads.master.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index 39e683ab5a..e5d36513fb 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -11,36 +11,36 @@ import errno
 import shutil
 
 class TestRealPath(TestCase):
-    DIRS = [ "a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX", "usr/sbin", "usr/include", "usr/include/gdbm" ]
-    FILES = [ "etc/passwd", "b/file" ]
+    DIRS = ["a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX", "usr/sbin", "usr/include", "usr/include/gdbm"]
+    FILES = ["etc/passwd", "b/file"]
     LINKS = [
-        ( "bin",             "/usr/bin",             "/usr/bin" ),
-        ( "binX",            "usr/binX",             "/usr/binX" ),
-        ( "c",               "broken",               "/broken" ),
-        ( "etc/passwd-1",    "passwd",               "/etc/passwd" ),
-        ( "etc/passwd-2",    "passwd-1",             "/etc/passwd" ),
-        ( "etc/passwd-3",    "/etc/passwd-1",        "/etc/passwd" ),
-        ( "etc/shadow-1",    "/etc/shadow",          "/etc/shadow" ),
-        ( "etc/shadow-2",    "/etc/shadow-1",        "/etc/shadow" ),
-        ( "prog-A",          "bin/prog-A",           "/usr/bin/prog-A" ),
-        ( "prog-B",          "/bin/prog-B",          "/usr/bin/prog-B" ),
-        ( "usr/bin/prog-C",  "../../sbin/prog-C",    "/sbin/prog-C" ),
-        ( "usr/bin/prog-D",  "/sbin/prog-D",         "/sbin/prog-D" ),
-        ( "usr/binX/prog-E", "../sbin/prog-E",       None ),
-        ( "usr/bin/prog-F",  "../../../sbin/prog-F", "/sbin/prog-F" ),
-        ( "loop",            "a/loop",               None ),
-        ( "a/loop",          "../loop",              None ),
-        ( "b/test",          "file/foo",             "/b/file/foo" ),
+        ("bin",             "/usr/bin",             "/usr/bin"),
+        ("binX",            "usr/binX",             "/usr/binX"),
+        ("c",               "broken",               "/broken"),
+        ("etc/passwd-1",    "passwd",               "/etc/passwd"),
+        ("etc/passwd-2",    "passwd-1",             "/etc/passwd"),
+        ("etc/passwd-3",    "/etc/passwd-1",        "/etc/passwd"),
+        ("etc/shadow-1",    "/etc/shadow",          "/etc/shadow"),
+        ("etc/shadow-2",    "/etc/shadow-1",        "/etc/shadow"),
+        ("prog-A",          "bin/prog-A",           "/usr/bin/prog-A"),
+        ("prog-B",          "/bin/prog-B",          "/usr/bin/prog-B"),
+        ("usr/bin/prog-C",  "../../sbin/prog-C",    "/sbin/prog-C"),
+        ("usr/bin/prog-D",  "/sbin/prog-D",         "/sbin/prog-D"),
+        ("usr/binX/prog-E", "../sbin/prog-E",       None),
+        ("usr/bin/prog-F",  "../../../sbin/prog-F", "/sbin/prog-F"),
+        ("loop",            "a/loop",               None),
+        ("a/loop",          "../loop",              None),
+        ("b/test",          "file/foo",             "/b/file/foo"),
     ]
 
     LINKS_PHYS = [
-        ( "./",          "/",                "" ),
-        ( "binX/prog-E", "/usr/sbin/prog-E", "/sbin/prog-E" ),
+        ("./",          "/",                ""),
+        ("binX/prog-E", "/usr/sbin/prog-E", "/sbin/prog-E"),
     ]
 
     EXCEPTIONS = [
-        ( "loop",   errno.ELOOP ),
-        ( "b/test", errno.ENOENT ),
+        ("loop",   errno.ELOOP),
+        ("b/test", errno.ENOENT),
     ]
 
     def setUp(self):
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 82aa1bde1c..eb39136b43 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -43,33 +43,33 @@ class VersionOrdering(OESelftestTestCase):
 
     def test_dpkg(self):
         for ver1, ver2, sort in self.tests:
-            op = { -1: "<<", 0: "=", 1: ">>" }[sort]
+            op = {-1: "<<", 0: "=", 1: ">>"}[sort]
             status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
             self.assertEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
             # Now do it again but with incorrect operations
-            op = { -1: ">>", 0: ">>", 1: "<<" }[sort]
+            op = {-1: ">>", 0: ">>", 1: "<<"}[sort]
             status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
             # Now do it again but with incorrect operations
-            op = { -1: "=", 0: "<<", 1: "=" }[sort]
+            op = {-1: "=", 0: "<<", 1: "="}[sort]
             status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
     def test_opkg(self):
         for ver1, ver2, sort in self.tests:
-            op = { -1: "<<", 0: "=", 1: ">>" }[sort]
+            op = {-1: "<<", 0: "=", 1: ">>"}[sort]
             status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
             self.assertEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
             # Now do it again but with incorrect operations
-            op = { -1: ">>", 0: ">>", 1: "<<" }[sort]
+            op = {-1: ">>", 0: ">>", 1: "<<"}[sort]
             status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
             # Now do it again but with incorrect operations
-            op = { -1: "=", 0: "<<", 1: "=" }[sort]
+            op = {-1: "=", 0: "<<", 1: "="}[sort]
             status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
@@ -163,13 +163,13 @@ class PackageTests(OESelftestTestCase):
             self.logger.info("Check ownership of %s", path)
             status, output = qemu.run_serial(r'/bin/stat -c "%U %G" ' + path, timeout=60)
             output = output.split(" ")
-            if output[0] != uid or output[1] != gid :
+            if output[0] != uid or output[1] != gid:
                 self.logger.error("Incrrect ownership %s [%s:%s]", path, output[0], output[1])
                 return False
             return True
 
         with runqemu('core-image-minimal') as qemu:
-            for path in [ sysconfdir + "/selftest-chown/file",
+            for path in [sysconfdir + "/selftest-chown/file",
                           sysconfdir + "/selftest-chown/dir",
                           sysconfdir + "/selftest-chown/symlink",
                           sysconfdir + "/selftest-chown/fifotest/fifo"]:
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 9b62e5164e..3159eb3a3c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -75,9 +75,9 @@ class SStateTests(SStateBase):
             file_tracker = results
 
         if should_pass:
-            self.assertTrue(file_tracker , msg="Could not find sstate files for: %s" % ', '.join(map(str, targets)))
+            self.assertTrue(file_tracker, msg="Could not find sstate files for: %s" % ', '.join(map(str, targets)))
         else:
-            self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
+            self.assertTrue(not file_tracker, msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
 
     def test_sstate_creation_distro_specific_pass(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ad1c1fbe67..9be2d2c39c 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -634,8 +634,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                 # check each partition for permission
                 for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*')):
                     res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
-                    self.assertTrue(files_own_by_root(res.output)
-                        ,msg='Files permission incorrect using wks set "%s"' % test)
+                    self.assertTrue(files_own_by_root(res.output),msg='Files permission incorrect using wks set "%s"' % test)
 
                 # clean config and result directory for next cases
                 self.remove_config(config)
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 751d1303cf..047f5d16c7 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -223,7 +223,7 @@ class SimpleRemoteTarget(BaseTarget):
         self.server_ip = d.getVar("TEST_SERVER_IP")
         if not self.server_ip:
             try:
-                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
+                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip]).split("\n")[0].split()[-1]
             except Exception as e:
                 bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
         self.logger.info("Server IP: %s" % self.server_ip)
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 024261410e..3f297967ab 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -223,7 +223,7 @@ def bitbake(command, ignore_status=False, timeout=None, postconfig=None, output_
     if isinstance(command, str):
         cmd = "bitbake " + extra_args + " " + command
     else:
-        cmd = [ "bitbake" ] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
+        cmd = ["bitbake"] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
 
     try:
         return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 60e16d500e..6da2f6945a 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -29,7 +29,7 @@ class PtestParser(object):
         markers = ("PASS:", "FAIL:", "SKIP:", "BEGIN:", "END:", "DURATION:", "ERROR: Exit", "TIMEOUT:")
 
         def newsection():
-            return { 'name': "No-section", 'log': [] }
+            return {'name': "No-section", 'log': []}
 
         current_section = newsection()
 
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 403bad7b1f..a1f71a8d38 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -109,11 +109,11 @@ class SSHControl(object):
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
                 ]
-        self.ssh = ['ssh', '-l', self.user ] + self.ssh_options
+        self.ssh = ['ssh', '-l', self.user] + self.ssh_options
         self.scp = ['scp'] + self.ssh_options
         if port:
-            self.ssh = self.ssh + [ '-p', port ]
-            self.scp = self.scp + [ '-P', port ]
+            self.ssh = self.ssh + ['-p', port]
+            self.scp = self.scp + ['-P', port]
 
     def log(self, msg):
         if self.logfile:
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index e90462d127..8fc6748e23 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -245,7 +245,7 @@ def send_bin_to_DUT(d,params):
                 break
         else:
             bb.warn("No rpm package found for %s %s in .rpm files dir %s. Skipping deployment." %
-                    (param_list[0], "ver. " + param_list[1] if param_list[1] else "", rpms_file_dir) )
+                    (param_list[0], "ver. " + param_list[1] if param_list[1] else "", rpms_file_dir))
             return
         (status, output) = oeRuntimeTest.tc.target.copy_to(os.path.join(arch_rpms_dir, rpm_to_send), remote_path)
         if status != 0:
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 045240ea0b..3dee1f71b7 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -327,7 +327,7 @@ for pypkg in old_manifest:
                     check_path = pymodule_dep
                 else:
                     check_path = os.path.dirname(pymodule_dep)
-                if folder in check_path :
+                if folder in check_path:
                     inFolders = True # Did we find a folder?
                     folderFound = False # Second flag to break inner for
                     # Loop only through packages which contain folders
@@ -336,7 +336,7 @@ for pypkg in old_manifest:
                             # print('Checking folder %s on package %s' % (pymodule_dep,pypkg_with_folder))
                             for folder_dep in old_manifest[pypkg_with_folder]['files'] or folder_dep in old_manifest[pypkg_with_folder]['cached']:
                                 if folder_dep == folder:
-                                    print ('%s directory found in %s' % (folder, pypkg_with_folder))
+                                    print('%s directory found in %s' % (folder, pypkg_with_folder))
                                     folderFound = True
                                     if pypkg_with_folder not in new_manifest[pypkg]['rdepends'] and pypkg_with_folder != pypkg:
                                         new_manifest[pypkg]['rdepends'].append(pypkg_with_folder)
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 1f4c982aed..53acc8cd71 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -118,7 +118,7 @@ for item in dif:
     if 'sitecustomize' in dep_path:
         dep_path = '${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py'
         # Prints out result, which is what will be used by create_manifest
-        print (dep_path)
+        print(dep_path)
         continue
 
     dep_path = fix_path(dep_path)
@@ -130,7 +130,7 @@ for item in dif:
         if debug == True:
             log.write('Shared library found in %s\n' % dep_path)
         dep_path = dep_path.replace(soabi,'*')
-        print (dep_path)
+        print(dep_path)
         continue
     if "_sysconfigdata" in dep_path:
         dep_path = dep_path.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
@@ -138,7 +138,7 @@ for item in dif:
     if debug == True:
         log.write(dep_path+'\n')
     # Prints out result, which is what will be used by create_manifest
-    print (dep_path)
+    print(dep_path)
 
 
     cpython_tag = sys.implementation.cache_tag
@@ -168,7 +168,7 @@ for item in dif:
         cached = cached.replace(cpython_tag,'*')
         if "_sysconfigdata" in cached:
             cached = cached.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
-        print (cached)
+        print(cached)
 
 if debug == True:
     log.close()
diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 5ddf0f144f..c4d25e7f9f 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -13,50 +13,50 @@ import re
 from collections import OrderedDict
 
 if len(sys.argv) < 2:
-    print( "[ERROR]: input and output pmu files missing" )
+    print("[ERROR]: input and output pmu files missing")
     sys.exit(1)
 
 if len(sys.argv) < 3:
-    print( "[ERROR]: output pmu file missing" )
+    print("[ERROR]: output pmu file missing")
     sys.exit(1)
 
 infile = sys.argv[1]
 outfile = sys.argv[2]
 
 if not os.path.exists(infile):
-    print( "ERROR. input file does not exist: %s" % infile )
+    print("ERROR. input file does not exist: %s" % infile)
     sys.exit(1)
 
 if os.path.exists(outfile):
-    print( "WARNING. output file will be overwritten: %s" % infile )
+    print("WARNING. output file will be overwritten: %s" % infile)
 
 with open(infile, 'r') as file:
     data = file.read()
 
-preamble_regex = re.compile( '^(.*?)^struct', re.MULTILINE | re.DOTALL )
+preamble_regex = re.compile('^(.*?)^struct', re.MULTILINE | re.DOTALL)
 
-preamble = re.search( preamble_regex, data )
-struct_block_regex = re.compile( '^struct.*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
-field_regex =  re.compile( '{.*?},', re.MULTILINE | re.DOTALL )
-cpuid_regex = re.compile( '\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
-name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
+preamble = re.search(preamble_regex, data)
+struct_block_regex = re.compile('^struct.*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL)
+field_regex =  re.compile('{.*?},', re.MULTILINE | re.DOTALL)
+cpuid_regex = re.compile('\.cpuid = (.*?),', re.MULTILINE | re.DOTALL)
+name_regex = re.compile('\.name = (.*?),', re.MULTILINE | re.DOTALL)
 
 # create a dictionary structure to store all the structs, their
 # types and then their fields.
 entry_dict = {}
-for struct in re.findall( struct_block_regex, data ):
+for struct in re.findall(struct_block_regex, data):
     # print( "struct: %s %s" % (struct[0],struct[1]) )
     entry_dict[struct[1]] = {}
     entry_dict[struct[1]]['type'] = struct[0]
     entry_dict[struct[1]]['fields'] = {}
-    for entry in re.findall( field_regex, struct[2] ):
+    for entry in re.findall(field_regex, struct[2]):
         #print( "    entry: %s" % entry )
-        cpuid = re.search( cpuid_regex, entry )
+        cpuid = re.search(cpuid_regex, entry)
         if cpuid:
             #print( "    cpuid found: %s" % cpuid.group(1) )
             entry_dict[struct[1]]['fields'][cpuid.group(1)] = entry
             
-        name = re.search( name_regex, entry )
+        name = re.search(name_regex, entry)
         if name:
             #print( "    name found: %s" % name.group(1) )
             entry_dict[struct[1]]['fields'][name.group(1)] = entry
@@ -78,16 +78,16 @@ for i in sorted(entry_dict.keys()):
         entry_dict_sorted[i]['fields'][f] = entry_dict[i]['fields'][f] 
 
 # dump the sorted elements to the outfile
-outf = open( outfile, 'w' )
+outf = open(outfile, 'w')
 
-print( preamble.group(1) )
-outf.write( preamble.group(1) )
+print(preamble.group(1))
+outf.write(preamble.group(1))
 for d in entry_dict_sorted:
-    outf.write( "struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'],d) )
+    outf.write("struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'],d))
     for f in entry_dict_sorted[d]['fields']:
-        outf.write( entry_dict_sorted[d]['fields'][f] + '\n' )
+        outf.write(entry_dict_sorted[d]['fields'][f] + '\n')
 
-    outf.write( "};\n" )
+    outf.write("};\n")
 
 outf.close()
     
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 7c87a14758..b29a48dca7 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -130,7 +130,7 @@ def log_test_header(seq_no, nr_of_tests, name):
 #-------------------------------------------------------------------------------
 
 def start_stress(*args):
-        stress_cmd         = [ "stress-ng" ]
+        stress_cmd         = ["stress-ng"]
         added_stress_types = []
         req_stress_types   = set(args)
         cpu_cnt            = str(multiprocessing.cpu_count())
@@ -220,7 +220,7 @@ def set_hung_tmo(new_tmo):
 
         orig_tmo = int(subprocess.check_output(["cat", tmo_file]).strip())
         if new_tmo != orig_tmo:
-                cmd = ( "echo " + str(new_tmo) + " > " + tmo_file )
+                cmd = ("echo " + str(new_tmo) + " > " + tmo_file)
                 subprocess.check_output(cmd, shell=True)
                 log("Changed timeout for detection of hung tasks: ",
                     orig_tmo, " -> ", new_tmo)
diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 2f6498ab67..aed4f49923 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -202,7 +202,7 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
     total1 = sum_vals(bs1)
     total2 = sum_vals(bs2)
     print("\nCumulative {}:".format(val_type))
-    print ("  {}    {:+.1f}%    {} ({}) -> {} ({})".format(
+    print("  {}    {:+.1f}%    {} ({}) -> {} ({})".format(
                 val_to_str(total2 - total1), 100 * (total2-total1) / total1,
                 val_to_str(total1, True), val_to_str(total1),
                 val_to_str(total2, True), val_to_str(total2)))
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 5aea6971c7..e42f428cc3 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -564,7 +564,7 @@ def get_repos(conf, repo_names):
             sys.exit(1)
 
     if not repos:
-        repos = [ repo for repo in conf.repos if conf.repos[repo].get("update", True) ]
+        repos = [repo for repo in conf.repos if conf.repos[repo].get("update", True)]
 
     return repos
 
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index f019d88f17..bd80f1132a 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -125,7 +125,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
                 if color.setdefault(task, WHITE) == WHITE:
                     visit(task)
 
-        taskname_order = dict([(task, index) for index, task in enumerate(taskname_list) ])
+        taskname_order = dict([(task, index) for index, task in enumerate(taskname_list)])
         def task_key(task):
             pn, taskname = task.rsplit(':', 1)
             return (pn, taskname_order.get(taskname, len(taskname_list)), taskname)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index c6d98299da..0c85d8c13f 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -605,7 +605,7 @@ def check_upgrade_status(args, config, basepath, workspace):
     for result in results:
         # pn, update_status, current, latest, maintainer, latest_commit, no_update_reason
         if args.all or result[1] != 'MATCH':
-            logger.info("{:25} {:15} {:15} {} {} {}".format(   result[0],
+            logger.info("{:25} {:15} {:15} {} {} {}".format(result[0],
                                                                result[2],
                                                                result[1] if result[1] != 'UPDATE' else (result[3] if not result[3].endswith("new-commits-available") else "new commits"),
                                                                result[4],
diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index ecb27c5933..c5283c514e 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -130,7 +130,7 @@ class ManualTestRunner(object):
         if testcase_config_file:
             test_case_config = load_json_file(testcase_config_file)
             test_case_to_execute = test_case_config['testcases']
-            for case in copy.deepcopy(cases) :
+            for case in copy.deepcopy(cases):
                 if case['test']['@alias'] not in test_case_to_execute:
                     cases.remove(case)
 
@@ -232,4 +232,4 @@ def register_commands(subparsers):
     parser_build.add_argument('-t', '--testcase-config-file', default='',
                               help='the testcase configuration file to enable user to run a selected set of test case or make a testcase configuration file')
     parser_build.add_argument('-d', '--make-testcase-config-file', action='store_true',
-                    help='make the testcase configuration file to run a set of test cases based on user selection')
\ No newline at end of file
+                    help='make the testcase configuration file to run a set of test cases based on user selection')
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index f0ca50ebe2..7aa2b5aefe 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -33,7 +33,7 @@ class ResultsTextReport(object):
             for suite in result['ptestresult.sections']:
                 if suite not in self.ptests[machine]:
                     self.ptests[machine][suite] = {
-                            'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-',
+                            'passed': 0, 'failed': 0, 'skipped': 0, 'duration': '-',
                             'failed_testcases': [], "testcases": set(),
                             }
                 if 'duration' in result['ptestresult.sections'][suite]:
@@ -59,7 +59,7 @@ class ResultsTextReport(object):
 
         if suite not in self.ptests[machine]:
             self.ptests[machine][suite] = {
-                    'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-',
+                    'passed': 0, 'failed': 0, 'skipped': 0, 'duration': '-',
                     'failed_testcases': [], "testcases": set(),
                     }
 
@@ -82,7 +82,7 @@ class ResultsTextReport(object):
             # Ensure tests without any test results still show up on the report
             for suite in result['ltpresult.sections']:
                 if suite not in self.ltptests[machine]:
-                    self.ltptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                    self.ltptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration': '-', 'failed_testcases': []}
                 if 'duration' in result['ltpresult.sections'][suite]:
                     self.ltptests[machine][suite]['duration'] = result['ltpresult.sections'][suite]['duration']
                 if 'timeout' in result['ltpresult.sections'][suite]:
@@ -101,7 +101,7 @@ class ResultsTextReport(object):
             except ValueError:
                 pass
         if suite not in self.ltptests[machine]:
-            self.ltptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+            self.ltptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration': '-', 'failed_testcases': []}
         for tk in self.result_types:
             if status in self.result_types[tk]:
                 self.ltptests[machine][suite][tk] += 1
@@ -114,7 +114,7 @@ class ResultsTextReport(object):
             # Ensure tests without any test results still show up on the report
             for suite in result['ltpposixresult.sections']:
                 if suite not in self.ltpposixtests[machine]:
-                    self.ltpposixtests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                    self.ltpposixtests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration': '-', 'failed_testcases': []}
                 if 'duration' in result['ltpposixresult.sections'][suite]:
                     self.ltpposixtests[machine][suite]['duration'] = result['ltpposixresult.sections'][suite]['duration']
             return
@@ -131,7 +131,7 @@ class ResultsTextReport(object):
             except ValueError:
                 pass
         if suite not in self.ltpposixtests[machine]:
-            self.ltpposixtests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+            self.ltpposixtests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration': '-', 'failed_testcases': []}
         for tk in self.result_types:
             if status in self.result_types[tk]:
                 self.ltpposixtests[machine][suite][tk] += 1
@@ -167,7 +167,7 @@ class ResultsTextReport(object):
         reportvalues = []
         machines = []
         cols = ['passed', 'failed', 'skipped']
-        maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 ,'ltptest': 0, 'ltpposixtest': 0}
+        maxlen = {'passed': 0, 'failed': 0, 'skipped': 0, 'result_id': 0, 'testseries': 0, 'ptest': 0,'ltptest': 0, 'ltpposixtest': 0}
         for line in test_count_reports:
             total_tested = line['passed'] + line['failed'] + line['skipped']
             vals = {}
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index b3a51c7553..50c9c95cd6 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -80,7 +80,7 @@ def load_plugins(logger, plugins, pluginpath):
 
     def load_plugin(name):
         logger.debug('Loading plugin %s' % name)
-        spec = importlib.machinery.PathFinder.find_spec(name, path=[pluginpath] )
+        spec = importlib.machinery.PathFinder.find_spec(name, path=[pluginpath])
         if spec:
             return spec.loader.load_module()
 
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index bee6b391e7..46e4d0f028 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -363,7 +363,7 @@ class Disk:
         cmd = "{} {} -wR 'rm \"{}\"'".format(self.debugfs,
                                             self._get_part_image(pnum),
                                             abs_path)
-        out = exec_cmd(cmd , as_shell=True)
+        out = exec_cmd(cmd, as_shell=True)
         for line in out.splitlines():
             if line.startswith("rm:"):
                 if "file is a directory" in line:
@@ -379,8 +379,7 @@ class Disk:
 
                     rmdir_out = exec_cmd("{} {} -wR 'rmdir \"{}\"'".format(self.debugfs,
                                                     self._get_part_image(pnum),
-                                                    abs_path.rstrip('/'))
-                                                    , as_shell=True)
+                                                    abs_path.rstrip('/')), as_shell=True)
 
                     for rmdir_line in rmdir_out.splitlines():
                         if "directory not empty" in rmdir_line:
diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 65987d4c94..b7de950c7c 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -401,7 +401,7 @@ class FilemapFiemap(_FilemapBase):
 
         offset = _FIEMAP_SIZE + _FIEMAP_EXTENT_SIZE * index
         return struct.unpack(_FIEMAP_EXTENT_FORMAT,
-                             self._buf[offset : offset + _FIEMAP_EXTENT_SIZE])
+                             self._buf[offset: offset + _FIEMAP_EXTENT_SIZE])
 
     def _do_get_mapped_ranges(self, start, count):
         """
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 767b34dd24..bb362b64a8 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -30,9 +30,9 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "grub-mkimage": "grub-efi",
                   "isohybrid": "syslinux",
                   "mcopy": "mtools",
-                  "mdel" : "mtools",
-                  "mdeltree" : "mtools",
-                  "mdir" : "mtools",
+                  "mdel": "mtools",
+                  "mdeltree": "mtools",
+                  "mdir": "mtools",
                   "mkdosfs": "dosfstools",
                   "mkisofs": "cdrtools",
                   "mkfs.btrfs": "btrfs-tools",
diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
index 5bd7390680..8c6c645c39 100644
--- a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
@@ -124,7 +124,7 @@ class BootimgBiosPlusEFIPlugin(SourcePlugin):
         disk image.
         """
 
-        if ( (not cls.__imgEFIObj) or (not cls.__imgBiosObj) ):
+        if ((not cls.__imgEFIObj) or (not cls.__imgBiosObj)):
             cls.__instanciateSubClasses()
 
         cls.__imgEFIObj.do_install_disk(
@@ -155,7 +155,7 @@ class BootimgBiosPlusEFIPlugin(SourcePlugin):
         Called before do_prepare_partition()
         """
 
-        if ( (not cls.__imgEFIObj) or (not cls.__imgBiosObj) ):
+        if ((not cls.__imgEFIObj) or (not cls.__imgBiosObj)):
             cls.__instanciateSubClasses()
 
         cls.__imgEFIObj.do_configure_partition(
@@ -187,7 +187,7 @@ class BootimgBiosPlusEFIPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         """
 
-        if ( (not cls.__imgEFIObj) or (not cls.__imgBiosObj) ):
+        if ((not cls.__imgEFIObj) or (not cls.__imgBiosObj)):
             cls.__instanciateSubClasses()
 
         cls.__imgEFIObj.do_prepare_partition(
diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index ade13e244b..3715282262 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -28,10 +28,10 @@ import time
 def timeit(f):
     def timed(*args, **kw):
         ts = time.time()
-        print ("func:%r calling" % f.__name__)
+        print("func:%r calling" % f.__name__)
         result = f(*args, **kw)
         te = time.time()
-        print ('func:%r args:[%r, %r] took: %2.4f sec' %
+        print('func:%r args:[%r, %r] took: %2.4f sec' %
           (f.__name__, args, kw, te-ts))
         return result
     return timed
diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index bf77c8cf64..596da2d849 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -9,13 +9,13 @@ try:
 except:
     import xml.etree.ElementTree as etree
 
-def child (elem, name):
+def child(elem, name):
     for e in elem.getchildren():
         if e.tag == name:
             return e
     return None
 
-def children (elem, name=None):
+def children(elem, name=None):
     l = elem.getchildren()
     if name:
         l = [e for e in l if e.tag == name]
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 96c078ef3d..51e425eff8 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -63,7 +63,7 @@ try:
             writers = []
             if i:
                 writers.append(sys.stdout)
-            (ready, _, _) = select.select([pty, sys.stdin], writers , [], 0)
+            (ready, _, _) = select.select([pty, sys.stdin], writers, [], 0)
             try:
                 if pty in ready:
                     readdata = pty.read()
diff --git a/scripts/pybootchartgui/pybootchartgui/batch.py b/scripts/pybootchartgui/pybootchartgui/batch.py
index 1fc2b9b882..1b9df3c1cd 100644
--- a/scripts/pybootchartgui/pybootchartgui/batch.py
+++ b/scripts/pybootchartgui/pybootchartgui/batch.py
@@ -31,16 +31,16 @@ def render(writer, trace, app_options, filename):
         fmt = app_options.format
 
     if not (fmt in handlers):
-        writer.error ("Unknown format '%s'." % fmt)
+        writer.error("Unknown format '%s'." % fmt)
         return 10
 
     make_surface, write_surface = handlers[fmt]
-    options = RenderOptions (app_options)
-    (w, h) = draw.extents (options, 1.0, trace)
-    w = max (w, draw.MIN_IMG_W)
-    surface = make_surface (w, h)
-    ctx = cairo.Context (surface)
-    draw.render (ctx, options, 1.0, trace)
-    write_surface (surface)
-    writer.status ("bootchart written to '%s'" % filename)
+    options = RenderOptions(app_options)
+    (w, h) = draw.extents(options, 1.0, trace)
+    w = max(w, draw.MIN_IMG_W)
+    surface = make_surface(w, h)
+    ctx = cairo.Context(surface)
+    draw.render(ctx, options, 1.0, trace)
+    write_surface(surface)
+    writer.status("bootchart written to '%s'" % filename)
 
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 802ca7d5a9..e6198e1c79 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -31,7 +31,7 @@ class RenderOptions:
         self.kernel_only = False
         self.app_options = app_options
 
-    def proc_tree (self, trace):
+    def proc_tree(self, trace):
         if self.kernel_only:
             return trace.kernel_tree
         else:
@@ -202,10 +202,10 @@ def draw_sec_labels(ctx, options, rect, sec_w, nsecs):
     ctx.set_font_size(AXIS_FONT_SIZE)
     prev_x = 0
     for i in range(0, rect[2] + 1, sec_w):
-        if ((i / sec_w) % nsecs == 0) :
-            if options.app_options.as_minutes :
+        if ((i / sec_w) % nsecs == 0):
+            if options.app_options.as_minutes:
                 label = "%.1f" % (i / sec_w / 60.0)
-            else :
+            else:
                 label = "%d" % (i / sec_w)
             label_w = ctx.text_extents(label)[2]
             x = rect[0] + i - label_w/2
@@ -219,15 +219,15 @@ def draw_box_ticks(ctx, rect, sec_w):
     ctx.set_line_cap(cairo.LINE_CAP_SQUARE)
 
     for i in range(sec_w, rect[2] + 1, sec_w):
-        if ((i / sec_w) % 10 == 0) :
+        if ((i / sec_w) % 10 == 0):
             ctx.set_line_width(1.5)
-        elif sec_w < 5 :
+        elif sec_w < 5:
             continue
-        else :
+        else:
             ctx.set_line_width(1.0)
-        if ((i / sec_w) % 30 == 0) :
+        if ((i / sec_w) % 30 == 0):
             ctx.set_source_rgba(*TICK_COLOR_BOLD)
-        else :
+        else:
             ctx.set_source_rgba(*TICK_COLOR)
         ctx.move_to(rect[0] + i, rect[1] + 1)
         ctx.line_to(rect[0] + i, rect[1] + rect[3] - 1)
@@ -262,12 +262,12 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
         y = (point[1] - y_base) * -yscale + y_trans + chart_bounds[3]
         return x, y
 
-    max_x = max (x for (x, y) in data)
-    max_y = max (y for (x, y) in data)
+    max_x = max(x for (x, y) in data)
+    max_y = max(y for (x, y) in data)
     # avoid divide by zero
     if max_y == 0:
         max_y = 1.0
-    xscale = float (chart_bounds[2]) / (max_x - x_shift)
+    xscale = float(chart_bounds[2]) / (max_x - x_shift)
     # If data_range is given, scale the chart so that the value range in
     # data_range matches the chart bounds exactly.
     # Otherwise, scale so that the actual data matches the chart bounds.
@@ -278,15 +278,15 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
         yscale = float(chart_bounds[3]) / max_y
         ybase = 0
 
-    first = transform_point_coords (data[0], x_shift, ybase, xscale, yscale,
+    first = transform_point_coords(data[0], x_shift, ybase, xscale, yscale,
                         chart_bounds[0], chart_bounds[1])
-    last =  transform_point_coords (data[-1], x_shift, ybase, xscale, yscale,
+    last =  transform_point_coords(data[-1], x_shift, ybase, xscale, yscale,
                         chart_bounds[0], chart_bounds[1])
 
     ctx.set_source_rgba(*color)
     ctx.move_to(*first)
     for point in data:
-        x, y = transform_point_coords (point, x_shift, ybase, xscale, yscale,
+        x, y = transform_point_coords(point, x_shift, ybase, xscale, yscale,
                            chart_bounds[0], chart_bounds[1])
         ctx.line_to(x, y)
     if fill:
@@ -329,7 +329,7 @@ def extents(options, xscale, trace):
         start = trace.min
         end = trace.max
 
-    w = int ((end - start) * sec_w_base * xscale) + 2 * off_x
+    w = int((end - start) * sec_w_base * xscale) + 2 * off_x
     h = proc_h * processes + header_h + 2 * off_y
 
     if options.charts:
@@ -349,10 +349,10 @@ def extents(options, xscale, trace):
     return (w, h)
 
 def clip_visible(clip, rect):
-    xmax = max (clip[0], rect[0])
-    ymax = max (clip[1], rect[1])
-    xmin = min (clip[0] + clip[2], rect[0] + rect[2])
-    ymin = min (clip[1] + clip[3], rect[1] + rect[3])
+    xmax = max(clip[0], rect[0])
+    ymax = max(clip[1], rect[1])
+    xmin = min(clip[0] + clip[2], rect[0] + rect[2])
+    ymin = min(clip[1] + clip[3], rect[1] + rect[3])
     return (xmin > xmax and ymin > ymax)
 
 def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
@@ -367,14 +367,14 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
         # render I/O wait
         chart_rect = (off_x, curr_y+30, w, bar_h)
-        if clip_visible (clip, chart_rect):
-            draw_box_ticks (ctx, chart_rect, sec_w)
-            draw_annotations (ctx, proc_tree, trace.times, chart_rect)
-            draw_chart (ctx, IO_COLOR, True, chart_rect,
+        if clip_visible(clip, chart_rect):
+            draw_box_ticks(ctx, chart_rect, sec_w)
+            draw_annotations(ctx, proc_tree, trace.times, chart_rect)
+            draw_chart(ctx, IO_COLOR, True, chart_rect,
                     [(sample.time, sample.user + sample.sys + sample.io) for sample in trace.cpu_stats],
                     proc_tree, None)
             # render CPU load
-            draw_chart (ctx, CPU_COLOR, True, chart_rect,
+            draw_chart(ctx, CPU_COLOR, True, chart_rect,
                     [(sample.time, sample.user + sample.sys) for sample in trace.cpu_stats],
                     proc_tree, None)
 
@@ -387,17 +387,17 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
         # render I/O utilization
         chart_rect = (off_x, curr_y+30, w, bar_h)
-        if clip_visible (clip, chart_rect):
-            draw_box_ticks (ctx, chart_rect, sec_w)
-            draw_annotations (ctx, proc_tree, trace.times, chart_rect)
-            draw_chart (ctx, IO_COLOR, True, chart_rect,
+        if clip_visible(clip, chart_rect):
+            draw_box_ticks(ctx, chart_rect, sec_w)
+            draw_annotations(ctx, proc_tree, trace.times, chart_rect)
+            draw_chart(ctx, IO_COLOR, True, chart_rect,
                     [(sample.time, sample.util) for sample in trace.disk_stats],
                     proc_tree, None)
 
         # render disk throughput
-        max_sample = max (trace.disk_stats, key=lambda s: s.tput)
-        if clip_visible (clip, chart_rect):
-            draw_chart (ctx, DISK_TPUT_COLOR, False, chart_rect,
+        max_sample = max(trace.disk_stats, key=lambda s: s.tput)
+        if clip_visible(clip, chart_rect):
+            draw_chart(ctx, DISK_TPUT_COLOR, False, chart_rect,
                     [(sample.time, sample.tput) for sample in trace.disk_stats],
                     proc_tree, None)
 
@@ -407,8 +407,8 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
         if (pos_x < off_x + 245):
             shift_x, shift_y = 5, 40
 
-        label = "%dMB/s" % round ((max_sample.tput) / 1024.0)
-        draw_text (ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
+        label = "%dMB/s" % round((max_sample.tput) / 1024.0)
+        draw_text(ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
 
         curr_y = curr_y + 30 + bar_h
 
@@ -446,11 +446,11 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
         # render used amount of disk space
         chart_rect = (off_x, curr_y+30, w, bar_h)
-        if clip_visible (clip, chart_rect):
-            draw_box_ticks (ctx, chart_rect, sec_w)
-            draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+        if clip_visible(clip, chart_rect):
+            draw_box_ticks(ctx, chart_rect, sec_w)
+            draw_annotations(ctx, proc_tree, trace.times, chart_rect)
             for i in range(len(volumes), 0, -1):
-                draw_chart (ctx, VOLUME_COLORS[(i - 1) % len(VOLUME_COLORS)], True, chart_rect,
+                draw_chart(ctx, VOLUME_COLORS[(i - 1) % len(VOLUME_COLORS)], True, chart_rect,
                             [(sample.time,
                               # Sum up used space of all volumes including the current one
                               # so that the graphs appear as stacked on top of each other.
@@ -467,7 +467,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
     # render mem usage
     chart_rect = (off_x, curr_y+30, w, meminfo_bar_h)
     mem_stats = trace.mem_stats
-    if mem_stats and clip_visible (clip, chart_rect):
+    if mem_stats and clip_visible(clip, chart_rect):
         mem_scale = max(sample.buffers for sample in mem_stats)
         draw_legend_box(ctx, "Mem cached (scale: %u MiB)" % (float(mem_scale) / 1024), MEM_CACHED_COLOR, off_x, curr_y+20, leg_s)
         draw_legend_box(ctx, "Used", MEM_USED_COLOR, off_x + 240, curr_y+20, leg_s)
@@ -494,19 +494,19 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
     return curr_y
 
 def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
-    chart_rect = [off_x, curr_y+header_h, w, h - curr_y - 1 * off_y - header_h  ]
+    chart_rect = [off_x, curr_y+header_h, w, h - curr_y - 1 * off_y - header_h]
 
-    draw_legend_box (ctx, "Configure",
-             TASK_COLOR_CONFIGURE, off_x  , curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Compile",
+    draw_legend_box(ctx, "Configure",
+             TASK_COLOR_CONFIGURE, off_x, curr_y + 45, leg_s)
+    draw_legend_box(ctx, "Compile",
              TASK_COLOR_COMPILE, off_x+120, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Install",
+    draw_legend_box(ctx, "Install",
              TASK_COLOR_INSTALL, off_x+240, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Populate Sysroot",
+    draw_legend_box(ctx, "Populate Sysroot",
              TASK_COLOR_SYSROOT, off_x+360, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Package",
+    draw_legend_box(ctx, "Package",
              TASK_COLOR_PACKAGE, off_x+480, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Package Write",
+    draw_legend_box(ctx, "Package Write",
              TASK_COLOR_PACKAGE_WRITE, off_x+600, curr_y + 45, leg_s)
 
     ctx.set_font_size(PROC_TEXT_FONT_SIZE)
@@ -563,14 +563,14 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
 # Render the chart.
 #
 def render(ctx, options, xscale, trace):
-    (w, h) = extents (options, xscale, trace)
+    (w, h) = extents(options, xscale, trace)
     global OPTIONS
     OPTIONS = options.app_options
 
     # x, y, w, h
     clip = ctx.clip_extents()
 
-    sec_w = int (xscale * sec_w_base)
+    sec_w = int(xscale * sec_w_base)
     ctx.set_line_width(1.0)
     ctx.select_font_face(FONT_NAME)
     draw_fill_rect(ctx, WHITE, (0, 0, max(w, MIN_IMG_W), h))
@@ -578,13 +578,13 @@ def render(ctx, options, xscale, trace):
     curr_y = off_y
 
     if options.charts:
-        curr_y = render_charts (ctx, options, clip, trace, curr_y, w, h, sec_w)
+        curr_y = render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w)
 
-    curr_y = render_processes_chart (ctx, options, trace, curr_y, w, h, sec_w)
+    curr_y = render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w)
 
     return
 
-    proc_tree = options.proc_tree (trace)
+    proc_tree = options.proc_tree(trace)
 
     # draw the title and headers
     if proc_tree.idle:
@@ -593,7 +593,7 @@ def render(ctx, options, xscale, trace):
         duration = proc_tree.duration
 
     if not options.kernel_only:
-        curr_y = draw_header (ctx, trace.headers, duration)
+        curr_y = draw_header(ctx, trace.headers, duration)
     else:
         curr_y = off_y
 
@@ -612,39 +612,39 @@ def render(ctx, options, xscale, trace):
     # draw a cumulative CPU-time-per-process graph
     if proc_tree.taskstats and options.cumulative:
         cuml_rect = (off_x, curr_y + off_y, w, CUML_HEIGHT/2 - off_y * 2)
-        if clip_visible (clip, cuml_rect):
+        if clip_visible(clip, cuml_rect):
             draw_cuml_graph(ctx, proc_tree, cuml_rect, duration, sec_w, STAT_TYPE_CPU)
 
     # draw a cumulative I/O-time-per-process graph
     if proc_tree.taskstats and options.cumulative:
         cuml_rect = (off_x, curr_y + off_y * 100, w, CUML_HEIGHT/2 - off_y * 2)
-        if clip_visible (clip, cuml_rect):
+        if clip_visible(clip, cuml_rect):
             draw_cuml_graph(ctx, proc_tree, cuml_rect, duration, sec_w, STAT_TYPE_IO)
 
 def draw_process_bar_chart(ctx, clip, options, proc_tree, times, curr_y, w, h, sec_w):
     header_size = 0
     if not options.kernel_only:
-        draw_legend_box (ctx, "Running (%cpu)",
-                 PROC_COLOR_R, off_x    , curr_y + 45, leg_s)
-        draw_legend_box (ctx, "Unint.sleep (I/O)",
+        draw_legend_box(ctx, "Running (%cpu)",
+                 PROC_COLOR_R, off_x, curr_y + 45, leg_s)
+        draw_legend_box(ctx, "Unint.sleep (I/O)",
                  PROC_COLOR_D, off_x+120, curr_y + 45, leg_s)
-        draw_legend_box (ctx, "Sleeping",
+        draw_legend_box(ctx, "Sleeping",
                  PROC_COLOR_S, off_x+240, curr_y + 45, leg_s)
-        draw_legend_box (ctx, "Zombie",
+        draw_legend_box(ctx, "Zombie",
                  PROC_COLOR_Z, off_x+360, curr_y + 45, leg_s)
         header_size = 45
 
     chart_rect = [off_x, curr_y + header_size + 15,
               w, h - 2 * off_y - (curr_y + header_size + 15) + proc_h]
-    ctx.set_font_size (PROC_TEXT_FONT_SIZE)
+    ctx.set_font_size(PROC_TEXT_FONT_SIZE)
 
-    draw_box_ticks (ctx, chart_rect, sec_w)
+    draw_box_ticks(ctx, chart_rect, sec_w)
     if sec_w > 100:
         nsec = 1
     else:
         nsec = 5
-    draw_sec_labels (ctx, options, chart_rect, sec_w, nsec)
-    draw_annotations (ctx, proc_tree, times, chart_rect)
+    draw_sec_labels(ctx, options, chart_rect, sec_w, nsec)
+    draw_annotations(ctx, proc_tree, times, chart_rect)
 
     y = curr_y + 60
     for root in proc_tree.process_tree:
@@ -652,7 +652,7 @@ def draw_process_bar_chart(ctx, clip, options, proc_tree, times, curr_y, w, h, s
         y = y + proc_h * proc_tree.num_nodes([root])
 
 
-def draw_header (ctx, headers, duration):
+def draw_header(ctx, headers, duration):
     toshow = [
       ('system.uname', 'uname', lambda s: s),
       ('system.release', 'release', lambda s: s),
@@ -680,11 +680,11 @@ def draw_header (ctx, headers, duration):
         txt = txt + '      max pid: %s' % (headers.get('system.maxpid'))
 
     header_y += ctx.font_extents()[2]
-    draw_text (ctx, txt, TEXT_COLOR, off_x, header_y)
+    draw_text(ctx, txt, TEXT_COLOR, off_x, header_y)
 
     return header_y
 
-def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip) :
+def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip):
     x = rect[0] +  ((proc.start_time - proc_tree.start_time) * rect[2] / proc_tree.duration)
     w = ((proc.duration) * rect[2] / proc_tree.duration)
 
@@ -724,7 +724,7 @@ def draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect, cl
     draw_fill_rect(ctx, PROC_COLOR_S, (x, y, w, proc_h))
 
     last_tx = -1
-    for sample in proc.samples :
+    for sample in proc.samples:
         tx = rect[0] + round(((sample.time - proc_tree.start_time) * rect[2] / proc_tree.duration))
 
         # samples are sorted chronologically
@@ -737,14 +737,14 @@ def draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect, cl
         if last_tx != -1 and abs(last_tx - tx) <= tw:
             tw -= last_tx - tx
             tx = last_tx
-        tw = max (tw, 1) # nice to see at least something
+        tw = max(tw, 1) # nice to see at least something
 
         last_tx = tx + tw
-        state = get_proc_state( sample.state )
+        state = get_proc_state(sample.state)
 
         color = STATE_COLORS[state]
         if state == STATE_RUNNING:
-            alpha = min (sample.cpu_sample.user + sample.cpu_sample.sys, 1.0)
+            alpha = min(sample.cpu_sample.user + sample.cpu_sample.sys, 1.0)
             color = tuple(list(PROC_COLOR_R[0:3]) + [alpha])
 #            print "render time %d [ tx %d tw %d ], sample state %s color %s alpha %g" % (sample.time, tx, tw, state, color, alpha)
         elif state == STATE_SLEEPING:
@@ -777,12 +777,12 @@ class CumlSample:
     def __init__(self, proc):
         self.cmd = proc.cmd
         self.samples = []
-        self.merge_samples (proc)
+        self.merge_samples(proc)
         self.color = None
 
     def merge_samples(self, proc):
-        self.samples.extend (proc.samples)
-        self.samples.sort (key=lambda p: p.time)
+        self.samples.extend(proc.samples)
+        self.samples.sort(key=lambda p: p.time)
 
     def next(self):
         global palette_idx
@@ -797,7 +797,7 @@ class CumlSample:
                 h = (1.0 * i) / HSV_MAX_MOD
             s = 0.5
             v = 1.0
-            c = colorsys.hsv_to_rgb (h, s, v)
+            c = colorsys.hsv_to_rgb(h, s, v)
             self.color = (c[0], c[1], c[2], 1.0)
         return self.color
 
@@ -825,14 +825,14 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
 
         # merge pids with the same cmd
         if not proc.cmd in m_proc_list:
-            m_proc_list[proc.cmd] = CumlSample (proc)
+            m_proc_list[proc.cmd] = CumlSample(proc)
             continue
         s = m_proc_list[proc.cmd]
-        s.merge_samples (proc)
+        s.merge_samples(proc)
 
     # all the sample times
     times = sorted(time_hash)
-    if len (times) < 2:
+    if len(times) < 2:
         print("degenerate boot chart")
         return
 
@@ -847,7 +847,7 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
         below[time] = chart_bounds[1] + chart_bounds[3]
 
     # same colors each time we render
-    random.seed (0)
+    random.seed(0)
 
     ctx.set_line_width(1)
 
@@ -886,7 +886,7 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
 
             # did we move up a pixel increase ?
             if time in row:
-                nc = round (row[time] * pix_per_ns)
+                nc = round(row[time] * pix_per_ns)
                 if nc != cuml:
                     last_cuml = cuml
                     cuml = nc
@@ -898,20 +898,20 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
             # draw the trailing rectangle from the last time to
             # before now, at the height of the last segment.
             if render_seg:
-                w = math.ceil ((time - last_time) * chart_bounds[2] / proc_tree.duration) + 1
+                w = math.ceil((time - last_time) * chart_bounds[2] / proc_tree.duration) + 1
                 x = chart_bounds[0] + round((last_time - proc_tree.start_time) * chart_bounds[2] / proc_tree.duration)
-                ctx.rectangle (x, below[last_time] - last_cuml, w, last_cuml)
+                ctx.rectangle(x, below[last_time] - last_cuml, w, last_cuml)
                 ctx.fill()
 #                ctx.stroke()
                 last_time = time
-                y = below [time] - cuml
+                y = below[time] - cuml
 
             row[time] = y
 
         # render the last segment
         x = chart_bounds[0] + round((last_time - proc_tree.start_time) * chart_bounds[2] / proc_tree.duration)
         y = below[last_time] - cuml
-        ctx.rectangle (x, y, chart_bounds[2] - x, cuml)
+        ctx.rectangle(x, y, chart_bounds[2] - x, cuml)
         ctx.fill()
 #        ctx.stroke()
 
@@ -928,7 +928,7 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
             if cs in legends:
                 print("ARGH - duplicate process in list !")
 
-        legends.append ((cs, process_total_time))
+        legends.append((cs, process_total_time))
 
         below = row
 
@@ -944,7 +944,7 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
     label_width = 300
     LEGENDS_PER_COL = 15
     LEGENDS_TOTAL = 45
-    ctx.set_font_size (TITLE_FONT_SIZE)
+    ctx.set_font_size(TITLE_FONT_SIZE)
     dur_secs = duration / 100
     cpu_secs = total_time / 1000000000
 
@@ -966,7 +966,7 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
     for t in legends:
         cs = t[0]
         time = t[1]
-        x = chart_bounds[0] + off_x + int (i/LEGENDS_PER_COL) * label_width
+        x = chart_bounds[0] + off_x + int(i/LEGENDS_PER_COL) * label_width
         y = chart_bounds[1] + font_height * ((i % LEGENDS_PER_COL) + 2)
         str = "%s - %.0f(ms) (%2.2f%%)" % (cs.cmd, time/1000000, (time/total_time) * 100.0)
         draw_legend_box(ctx, str, cs.color, x, y, leg_s)
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index e1fe915563..99e5914405 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -26,9 +26,9 @@ from .draw import RenderOptions
 
 class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
     __gsignals__ = {
-            'clicked' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, Gdk.Event)),
-            'position-changed' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_INT, gobject.TYPE_INT)),
-            'set-scroll-adjustments' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gtk.Adjustment, gtk.Adjustment))
+            'clicked': (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, Gdk.Event)),
+            'position-changed': (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_INT, gobject.TYPE_INT)),
+            'set-scroll-adjustments': (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gtk.Adjustment, gtk.Adjustment))
     }
 
     hadjustment = GObject.property(type=Gtk.Adjustment,
@@ -101,12 +101,12 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
 
     ZOOM_INCREMENT = 1.25
 
-    def zoom_image (self, zoom_ratio):
+    def zoom_image(self, zoom_ratio):
         self.zoom_ratio = zoom_ratio
         self._set_scroll_adjustments()
         self.queue_draw()
 
-    def zoom_to_rect (self, rect):
+    def zoom_to_rect(self, rect):
         zoom_ratio = float(rect.width)/float(self.chart_width)
         self.zoom_image(zoom_ratio)
         self.x = 0
@@ -117,13 +117,13 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
         self.xscale = xscale
         self.chart_width, self.chart_height = draw.extents(self.options, self.xscale, self.trace)
         new_x = old_mid_x
-        self.zoom_image (self.zoom_ratio)
+        self.zoom_image(self.zoom_ratio)
 
     def on_expand(self, action):
-        self.set_xscale (int(self.xscale * 1.5 + 0.5))
+        self.set_xscale(int(self.xscale * 1.5 + 0.5))
 
     def on_contract(self, action):
-        self.set_xscale (max(int(self.xscale / 1.5), 1))
+        self.set_xscale(max(int(self.xscale / 1.5), 1))
 
     def on_zoom_in(self, action):
         self.zoom_image(self.zoom_ratio * self.ZOOM_INCREMENT)
@@ -139,7 +139,7 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
         self.set_xscale(1.0)
 
     def show_toggled(self, button):
-        self.options.app_options.show_all = button.get_property ('active')
+        self.options.app_options.show_all = button.get_property('active')
         self.chart_width, self.chart_height = draw.extents(self.options, self.xscale, self.trace)
         self._set_scroll_adjustments()
         self.queue_draw()
@@ -224,8 +224,8 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
             adj.set_upper(upper)
 
     def _set_scroll_adjustments(self):
-        self._set_adj_upper (self.hadj, self.zoom_ratio * (self.chart_width - self.our_width))
-        self._set_adj_upper (self.vadj, self.zoom_ratio * (self.chart_height - self.our_height))
+        self._set_adj_upper(self.hadj, self.zoom_ratio * (self.chart_width - self.our_width))
+        self._set_adj_upper(self.vadj, self.zoom_ratio * (self.chart_height - self.our_height))
 
     def on_adjustments_changed(self, adj):
         self.x = self.hadj.get_value() / self.zoom_ratio
@@ -301,9 +301,9 @@ class PyBootchartShell(gtk.VBox):
         if not options.kernel_only:
             # Misc. options
             button = gtk.CheckButton("Show more")
-            button.connect ('toggled', self.widget2.show_toggled)
+            button.connect('toggled', self.widget2.show_toggled)
             button.set_active(options.app_options.show_all)
-            hbox.pack_start (button, False, True, 0)
+            hbox.pack_start(button, False, True, 0)
 
         self.pack_start(hbox, False, True, 0)
         self.pack_start(scrolled, True, True, 0)
@@ -328,15 +328,15 @@ class PyBootchartWindow(gtk.Window):
 
         full_opts = RenderOptions(app_options)
         full_tree = PyBootchartShell(window, trace, full_opts, 1.0)
-        tab_page.append_page (full_tree, gtk.Label("Full tree"))
+        tab_page.append_page(full_tree, gtk.Label("Full tree"))
 
-        if trace.kernel is not None and len (trace.kernel) > 2:
+        if trace.kernel is not None and len(trace.kernel) > 2:
             kernel_opts = RenderOptions(app_options)
             kernel_opts.cumulative = False
             kernel_opts.charts = False
             kernel_opts.kernel_only = True
             kernel_tree = PyBootchartShell(window, trace, kernel_opts, 5.0)
-            tab_page.append_page (kernel_tree, gtk.Label("Kernel boot"))
+            tab_page.append_page(kernel_tree, gtk.Label("Kernel boot"))
 
         full_tree.grab_focus(self)
         self.show()
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index a954b125da..cd64a716c7 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -124,7 +124,7 @@ def main(argv=None):
 
 		if len(args) == 0:
 			print("No path given, trying /var/log/bootchart.tgz")
-			args = [ "/var/log/bootchart.tgz" ]
+			args = ["/var/log/bootchart.tgz"]
 
 		res = parsing.Trace(writer, args, options)
 
@@ -142,7 +142,7 @@ def main(argv=None):
 			print('%02d:%05.2f' % (math.floor(dur/60), dur - 60 * math.floor(dur/60)))
 		else:
 			if options.annotate_file:
-				f = open (options.annotate_file, "w")
+				f = open(options.annotate_file, "w")
 				try:
 					for time in res[4]:
 						if time is not None:
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index d527bce2fc..43c8cf65ad 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -52,7 +52,7 @@ class Trace:
         self.times = [] # Always empty, but expected by draw.py when drawing system charts.
 
         if len(paths):
-            parse_paths (writer, self, paths)
+            parse_paths(writer, self, paths)
             if not self.valid():
                 raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
 
@@ -82,12 +82,12 @@ class Trace:
         # Crop the chart to the end of the first idle period after the given
         # process
         if options.crop_after:
-            idle = self.crop (writer, options.crop_after)
+            idle = self.crop(writer, options.crop_after)
         else:
             idle = None
 
         # Annotate other times as the first start point of given process lists
-        self.times = [ idle ]
+        self.times = [idle]
         if options.annotate:
             for procnames in options.annotate:
                 names = [x[:15] for x in procnames.split(",")]
@@ -135,9 +135,9 @@ class Trace:
                 # many of these double forks are so short lived
                 # that we have no samples, or process info for them
                 # so climb the parent hierarcy to find one
-                if int (ppid * 1000) not in self.ps_stats.process_map:
+                if int(ppid * 1000) not in self.ps_stats.process_map:
 #                    print "Pid '%d' short lived with no process" % ppid
-                    ppid = find_parent_id_for (ppid)
+                    ppid = find_parent_id_for(ppid)
 #                else:
 #                    print "Pid '%d' has an entry" % ppid
             else:
@@ -148,7 +148,7 @@ class Trace:
         # merge in the cmdline data
         if self.cmdline is not None:
             for proc in self.ps_stats.process_map.values():
-                rpid = int (proc.pid // 1000)
+                rpid = int(proc.pid // 1000)
                 if rpid in self.cmdline:
                     cmd = self.cmdline[rpid]
                     proc.exe = cmd['exe']
@@ -159,17 +159,17 @@ class Trace:
         # re-parent any stray orphans if we can
         if self.parent_map is not None:
             for process in self.ps_stats.process_map.values():
-                ppid = find_parent_id_for (int(process.pid // 1000))
+                ppid = find_parent_id_for(int(process.pid // 1000))
                 if ppid:
                     process.ppid = ppid * 1000
 
         # stitch the tree together with pointers
         for process in self.ps_stats.process_map.values():
-            process.set_parent (self.ps_stats.process_map)
+            process.set_parent(self.ps_stats.process_map)
 
         # count on fingers variously
         for process in self.ps_stats.process_map.values():
-            process.calc_stats (self.ps_stats.sample_period)
+            process.calc_stats(self.ps_stats.sample_period)
 
     def crop(self, writer, crop_after):
 
@@ -218,15 +218,15 @@ class Trace:
                 break
 
         if idle is None:
-            writer.warn ("not idle after proc '%s'" % crop_after)
+            writer.warn("not idle after proc '%s'" % crop_after)
             return None
 
         crop_at = idle + 300
-        writer.info ("cropping at time %d" % crop_at)
-        while len (self.cpu_stats) \
+        writer.info("cropping at time %d" % crop_at)
+        while len(self.cpu_stats) \
                     and self.cpu_stats[-1].time > crop_at:
             self.cpu_stats.pop()
-        while len (self.disk_stats) \
+        while len(self.disk_stats) \
                     and self.disk_stats[-1].time > crop_at:
             self.disk_stats.pop()
 
@@ -238,8 +238,8 @@ class Trace:
                 cropped_map[key] = value
 
         for proc in cropped_map.values():
-            proc.duration = min (proc.duration, crop_at - proc.start_time)
-            while len (proc.samples) \
+            proc.duration = min(proc.duration, crop_at - proc.start_time)
+            while len(proc.samples) \
                         and proc.samples[-1].time > crop_at:
                 proc.samples.pop()
 
@@ -262,7 +262,7 @@ def _parse_headers(file):
     def parse(acc, line):
         (headers, last) = acc
         if '=' in line:
-            last, value = map (lambda x: x.strip(), line.split('=', 1))
+            last, value = map(lambda x: x.strip(), line.split('=', 1))
         else:
             value = line.strip()
         headers[last] += value
@@ -326,13 +326,13 @@ def _parse_proc_ps_log(writer, file):
             process.last_sys_cpu_time = sysCpu
         ltime = time
 
-    if len (timed_blocks) < 2:
+    if len(timed_blocks) < 2:
         return None
 
     startTime = timed_blocks[0][0]
-    avgSampleLength = (ltime - startTime)/(len (timed_blocks) - 1)
+    avgSampleLength = (ltime - startTime)/(len(timed_blocks) - 1)
 
-    return ProcessStats (writer, processMap, len (timed_blocks), avgSampleLength, startTime, ltime)
+    return ProcessStats(writer, processMap, len(timed_blocks), avgSampleLength, startTime, ltime)
 
 def _parse_taskstats_log(writer, file):
     """
@@ -379,7 +379,7 @@ def _parse_taskstats_log(writer, file):
                     pid += 1
                     pidRewrites[opid] = pid
 #                                       print "process mutation ! '%s' vs '%s' pid %s -> pid %s\n" % (process.cmd, cmd, opid, pid)
-                    process = process.split (writer, pid, cmd, ppid, time)
+                    process = process.split(writer, pid, cmd, ppid, time)
                     processMap[pid] = process
                 else:
                     process.cmd = cmd
@@ -387,9 +387,9 @@ def _parse_taskstats_log(writer, file):
                 process = Process(writer, pid, cmd, ppid, time)
                 processMap[pid] = process
 
-            delta_cpu_ns = (float) (cpu_ns - process.last_cpu_ns)
-            delta_blkio_delay_ns = (float) (blkio_delay_ns - process.last_blkio_delay_ns)
-            delta_swapin_delay_ns = (float) (swapin_delay_ns - process.last_swapin_delay_ns)
+            delta_cpu_ns = (float)(cpu_ns - process.last_cpu_ns)
+            delta_blkio_delay_ns = (float)(blkio_delay_ns - process.last_blkio_delay_ns)
+            delta_swapin_delay_ns = (float)(swapin_delay_ns - process.last_swapin_delay_ns)
 
             # make up some state data ...
             if delta_cpu_ns > 0:
@@ -413,13 +413,13 @@ def _parse_taskstats_log(writer, file):
             process.last_swapin_delay_ns = swapin_delay_ns
         ltime = time
 
-    if len (timed_blocks) < 2:
+    if len(timed_blocks) < 2:
         return None
 
     startTime = timed_blocks[0][0]
     avgSampleLength = (ltime - startTime)/(len(timed_blocks)-1)
 
-    return ProcessStats (writer, processMap, len (timed_blocks), avgSampleLength, startTime, ltime)
+    return ProcessStats(writer, processMap, len(timed_blocks), avgSampleLength, startTime, ltime)
 
 def _parse_proc_stat_log(file):
     samples = []
@@ -430,7 +430,7 @@ def _parse_proc_stat_log(file):
             continue
         # CPU times {user, nice, system, idle, io_wait, irq, softirq}
         tokens = lines[0].split()
-        times = [ int(token) for token in tokens[1:] ]
+        times = [int(token) for token in tokens[1:]]
         if ltimes:
             user = float((times[0] + times[1]) - (ltimes[0] + ltimes[1]))
             system = float((times[2] + times[5] + times[6]) - (ltimes[2] + ltimes[5] + ltimes[6]))
@@ -438,7 +438,7 @@ def _parse_proc_stat_log(file):
             iowait = float(times[4] - ltimes[4])
 
             aSum = max(user + system + idle + iowait, 1)
-            samples.append( CPUSample(time, user/aSum, system/aSum, iowait/aSum) )
+            samples.append(CPUSample(time, user/aSum, system/aSum, iowait/aSum))
 
         ltimes = times
         # skip the rest of statistics lines
@@ -456,7 +456,7 @@ def _parse_proc_disk_stat_log(file):
     not sda1, sda2 etc. The format of relevant lines should be:
     {major minor name rio rmerge rsect ruse wio wmerge wsect wuse running use aveq}
     """
-    disk_regex_re = re.compile ('^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
+    disk_regex_re = re.compile('^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
 
     # this gets called an awful lot.
     def is_relevant_line(linetokens):
@@ -469,7 +469,7 @@ def _parse_proc_disk_stat_log(file):
 
     for time, lines in _parse_timed_blocks(file):
         sample = DiskStatSample(time)
-        relevant_tokens = [linetokens for linetokens in map (lambda x: x.split(),lines) if is_relevant_line(linetokens)]
+        relevant_tokens = [linetokens for linetokens in map(lambda x: x.split(),lines) if is_relevant_line(linetokens)]
 
         for tokens in relevant_tokens:
             disk, rsect, wsect, use = tokens[2], int(tokens[5]), int(tokens[9]), int(tokens[12])
@@ -482,10 +482,10 @@ def _parse_proc_disk_stat_log(file):
         interval = sample1.time - sample2.time
         if interval == 0:
             interval = 1
-        sums = [ a - b for a, b in zip(sample1.diskdata, sample2.diskdata) ]
+        sums = [a - b for a, b in zip(sample1.diskdata, sample2.diskdata)]
         readTput = sums[0] / 2.0 * 100.0 / interval
         writeTput = sums[1] / 2.0 * 100.0 / interval
-        util = float( sums[2] ) / 10 / interval
+        util = float(sums[2]) / 10 / interval
         util = max(0.0, min(1.0, util))
         disk_stats.append(DiskSample(sample2.time, readTput, writeTput, util))
 
@@ -570,8 +570,8 @@ def _parse_monitor_disk_log(file):
 # [    0.039993] calling  migration_init+0x0/0x6b @ 1
 # [    0.039993] initcall migration_init+0x0/0x6b returned 1 after 0 usecs
 def _parse_dmesg(writer, file):
-    timestamp_re = re.compile ("^\[\s*(\d+\.\d+)\s*]\s+(.*)$")
-    split_re = re.compile ("^(\S+)\s+([\S\+_-]+) (.*)$")
+    timestamp_re = re.compile("^\[\s*(\d+\.\d+)\s*]\s+(.*)$")
+    split_re = re.compile("^(\S+)\s+([\S\+_-]+) (.*)$")
     processMap = {}
     idx = 0
     inc = 1.0 / 1000000
@@ -580,12 +580,12 @@ def _parse_dmesg(writer, file):
     base_ts = False
     max_ts = 0
     for line in file.read().split('\n'):
-        t = timestamp_re.match (line)
+        t = timestamp_re.match(line)
         if t is None:
 #                       print "duff timestamp " + line
             continue
 
-        time_ms = float (t.group(1)) * 1000
+        time_ms = float(t.group(1)) * 1000
         # looks like we may have a huge diff after the clock
         # has been set up. This could lead to huge graph:
         # so huge we will be killed by the OOM.
@@ -599,7 +599,7 @@ def _parse_dmesg(writer, file):
         if base_ts:
 #                       print "fscked clock: used %f instead of %f" % (time_ms - base_ts, time_ms)
             time_ms -= base_ts
-        m = split_re.match (t.group(2))
+        m = split_re.match(t.group(2))
 
         if m is None:
             continue
@@ -608,19 +608,19 @@ def _parse_dmesg(writer, file):
         func = m.group(2)
         rest = m.group(3)
 
-        if t.group(2).startswith ('Write protecting the') or \
-           t.group(2).startswith ('Freeing unused kernel memory'):
+        if t.group(2).startswith('Write protecting the') or \
+           t.group(2).startswith('Freeing unused kernel memory'):
             kernel.duration = time_ms / 10
             continue
 
 #               print "foo: '%s' '%s' '%s'" % (type, func, rest)
         if type == "calling":
             ppid = kernel.pid
-            p = re.match ("\@ (\d+)", rest)
+            p = re.match("\@ (\d+)", rest)
             if p is not None:
-                ppid = float (p.group(1)) // 1000
+                ppid = float(p.group(1)) // 1000
 #                               print "match: '%s' ('%g') at '%s'" % (func, ppid, time_ms)
-            name = func.split ('+', 1) [0]
+            name = func.split('+', 1)[0]
             idx += inc
             processMap[func] = Process(writer, ppid + idx, name, ppid, time_ms / 10)
         elif type == "initcall":
@@ -655,13 +655,13 @@ def _parse_pacct(writer, file):
             print("Invalid version 0x%x" % (ord(ver)))
             return None
 
-        file.seek (14, 1)     # user, group etc.
-        pid = _read_le_int32 (file)
-        ppid = _read_le_int32 (file)
+        file.seek(14, 1)     # user, group etc.
+        pid = _read_le_int32(file)
+        ppid = _read_le_int32(file)
 #               print "Parent of %d is %d" % (pid, ppid)
         parent_map[pid] = ppid
-        file.seek (4 + 4 + 16, 1) # timings
-        file.seek (16, 1)         # acct_comm
+        file.seek(4 + 4 + 16, 1) # timings
+        file.seek(16, 1)         # acct_comm
     return parent_map
 
 def _parse_paternity_log(writer, file):
@@ -671,7 +671,7 @@ def _parse_paternity_log(writer, file):
         if not line:
             continue
         elems = line.split(' ') # <Child> <Parent>
-        if len (elems) >= 2:
+        if len(elems) >= 2:
 #                       print "paternity of %d is %d" % (int(elems[0]), int(elems[1]))
             parent_map[int(elems[0])] = int(elems[1])
         else:
@@ -682,9 +682,9 @@ def _parse_cmdline_log(writer, file):
     cmdLines = {}
     for block in file.read().split('\n\n'):
         lines = block.split('\n')
-        if len (lines) >= 3:
+        if len(lines) >= 3:
 #                       print "Lines '%s'" % (lines[0])
-            pid = int (lines[0])
+            pid = int(lines[0])
             values = {}
             values['exe'] = lines[1].lstrip(':')
             args = lines[2].lstrip(':').split('\0')
@@ -714,14 +714,14 @@ def get_num_cpus(headers):
     if headers is None:
         return 1
     if headers.get("system.cpu.num"):
-        return max (int (headers.get("system.cpu.num")), 1)
+        return max(int(headers.get("system.cpu.num")), 1)
     cpu_model = headers.get("system.cpu")
     if cpu_model is None:
         return 1
     mat = re.match(".*\\((\\d+)\\)", cpu_model)
     if mat is None:
         return 1
-    return max (int(mat.group(1)), 1)
+    return max(int(mat.group(1)), 1)
 
 def _do_parse(writer, state, filename, file):
     writer.info("parsing '%s'" % filename)
diff --git a/scripts/pybootchartgui/pybootchartgui/process_tree.py b/scripts/pybootchartgui/pybootchartgui/process_tree.py
index 5572c5d19c..b429e4b9ba 100644
--- a/scripts/pybootchartgui/pybootchartgui/process_tree.py
+++ b/scripts/pybootchartgui/pybootchartgui/process_tree.py
@@ -111,7 +111,7 @@ class ProcessTree:
         """
         if not process_subtree:
             return 100000000
-        return min( [min(proc.start_time, self.get_start_time(proc.child_list)) for proc in process_subtree] )
+        return min([min(proc.start_time, self.get_start_time(proc.child_list)) for proc in process_subtree])
 
     def get_end_time(self, process_subtree):
         """Returns the end time of the process subtree.  This is the end time
@@ -120,13 +120,13 @@ class ProcessTree:
         """
         if not process_subtree:
             return -100000000
-        return max( [max(proc.start_time + proc.duration, self.get_end_time(proc.child_list)) for proc in process_subtree] )
+        return max([max(proc.start_time + proc.duration, self.get_end_time(proc.child_list)) for proc in process_subtree])
 
     def get_max_pid(self, process_subtree):
         """Returns the max PID found in the process tree."""
         if not process_subtree:
             return -100000000
-        return max( [max(proc.pid, self.get_max_pid(proc.child_list)) for proc in process_subtree] )
+        return max([max(proc.pid, self.get_max_pid(proc.child_list)) for proc in process_subtree])
 
     def update_ppids_for_daemons(self, process_list):
         """Fedora hack: when loading the system services from rc, runuser(1)
@@ -284,7 +284,7 @@ class ProcessTree:
     def merge_processes(self, p1, p2):
         """Merges two process' samples."""
         p1.samples.extend(p2.samples)
-        p1.samples.sort( key=lambda p: p.time )
+        p1.samples.sort(key=lambda p: p.time)
         p1time = p1.start_time
         p2time = p2.start_time
         p1.start_time = min(p1time, p2time)
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 69299fbd21..0b46c1491c 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -19,7 +19,7 @@ class DiskStatSample:
         self.time = time
         self.diskdata = [0, 0, 0]
     def add_diskdata(self, new_diskdata):
-        self.diskdata = [ a + b for a, b in zip(self.diskdata, new_diskdata) ]
+        self.diskdata = [a + b for a, b in zip(self.diskdata, new_diskdata)]
 
 class CPUSample:
     def __init__(self, time, user, sys, io=0.0, swap=0.0):
@@ -35,7 +35,7 @@ class CPUSample:
 
     def __str__(self):
         return str(self.time) + "\t" + str(self.user) + "\t" + \
-               str(self.sys) + "\t" + str(self.io) + "\t" + str (self.swap)
+               str(self.sys) + "\t" + str(self.io) + "\t" + str(self.swap)
 
 class MemSample:
     used_values = ('MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree',)
@@ -96,8 +96,8 @@ class ProcessStats:
         self.sample_period = sample_period
         self.start_time = start_time
         self.end_time = end_time
-        writer.info ("%d samples, avg. sample length %f" % (self.sample_count, self.sample_period))
-        writer.info ("process list size: %d" % len (self.process_map.values()))
+        writer.info("%d samples, avg. sample length %f" % (self.sample_count, self.sample_period))
+        writer.info("process list size: %d" % len(self.process_map.values()))
 
 class Process:
     def __init__(self, writer, pid, cmd, ppid, start_time):
@@ -123,7 +123,7 @@ class Process:
 
     # split this process' run - triggered by a name change
     def split(self, writer, pid, cmd, ppid, start_time):
-        split = Process (writer, pid, cmd, ppid, start_time)
+        split = Process(writer, pid, cmd, ppid, start_time)
 
         split.last_cpu_ns = self.last_cpu_ns
         split.last_blkio_delay_ns = self.last_blkio_delay_ns
@@ -132,7 +132,7 @@ class Process:
         return split
 
     def __str__(self):
-        return " ".join([str(self.pid), self.cmd, str(self.ppid), '[ ' + str(len(self.samples)) + ' samples ]' ])
+        return " ".join([str(self.pid), self.cmd, str(self.ppid), '[ ' + str(len(self.samples)) + ' samples ]'])
 
     def calc_stats(self, samplePeriod):
         if self.samples:
@@ -141,8 +141,8 @@ class Process:
             self.start_time = min(firstSample.time, self.start_time)
             self.duration = lastSample.time - self.start_time + samplePeriod
 
-        activeCount = sum( [1 for sample in self.samples if sample.cpu_sample and sample.cpu_sample.sys + sample.cpu_sample.user + sample.cpu_sample.io > 0.0] )
-        activeCount = activeCount + sum( [1 for sample in self.samples if sample.state == 'D'] )
+        activeCount = sum([1 for sample in self.samples if sample.cpu_sample and sample.cpu_sample.sys + sample.cpu_sample.user + sample.cpu_sample.io > 0.0])
+        activeCount = activeCount + sum([1 for sample in self.samples if sample.state == 'D'])
         self.active = (activeCount>2)
 
     def calc_load(self, userCpu, sysCpu, interval):
@@ -157,7 +157,7 @@ class Process:
 
     def set_parent(self, processMap):
         if self.ppid != None:
-            self.parent = processMap.get (self.ppid)
+            self.parent = processMap.get(self.ppid)
             if self.parent == None and self.pid // 1000 > 1 and \
                 not (self.ppid == 2000 or self.pid == 2000): # kernel threads: ppid=2
                 self.writer.warn("Missing CONFIG_PROC_EVENTS: no parent for pid '%i' ('%s') with ppid '%i'"
diff --git a/scripts/wic b/scripts/wic
index a741aed364..9fd2551b6f 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -337,7 +337,7 @@ def wic_init_parser_create(subparser):
                       dest='compressor',
                       help="compress image with specified compressor")
     subparser.add_argument("-m", "--bmap", action="store_true", help="generate .bmap")
-    subparser.add_argument("--no-fstab-update" ,action="store_true",
+    subparser.add_argument("--no-fstab-update",action="store_true",
                       help="Do not change fstab file.")
     subparser.add_argument("-v", "--vars", dest='vars_dir',
                       help="directory with <image>.env files that store "
-- 
2.32.0

