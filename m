Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.8846.1624975716329766238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ogkHWaLO;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id i4so10967003plt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wjyMk9APBuWeKEA4EUhU1Os0cFpM8qGE2auF1h8D9gc=;
        b=ogkHWaLOC3dCKJBoFesi5NGFODVFg0yQGIPsH4Kniu0X3pbPlEB+IO8cAczj8LaLqP
         1k+InUFZDfP4q0p+9h2w9t0ROq7vjYeAF6+cAz0wH/C+ItRKQ9iFriYMCkSSN28fOivE
         /TFwBnCsAAey35Y0cfRKxM+ucKoZtpSGaBTVO67FtqK69CyjdVlyAg4uIShhugXxF6S2
         ezblnAK3addAWtDbUxPcYXIckfXKOEh9ntGq1InetenUcsdWzr1e80N2hKJdE2a3foA3
         w1n70os4XsUs9drES4wxt2qDZcC35sVwt4DfEL2c5NnL9Fwk1tl4Dpd1JvyWpWAOBfmD
         bRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wjyMk9APBuWeKEA4EUhU1Os0cFpM8qGE2auF1h8D9gc=;
        b=PY+AAuKuyBUW678BXomIZF7PrftB6cSS3avshpMemv8tROD6tvus02bRCDoasACZob
         4tTchMab2tL53hwXykIH++BuLFp+NaMHqxb7LeUddM8rRS6KkplgalIsGpmMLszQCpsF
         qoBQlKD9OE+WADMaTriAPkzoJV/wrLn1NsZUUgrGhPzAvIKhyxOMLozqbmXOL3uOl0dM
         ozsyKEr3KI2gEYImgFZ0I1BbuKHoF8g7PngA/B0KCx4wMhDOBIlV0nUn+crGcOVopKKj
         pVSYSvsMZmxgVpCdWdtUj7UzYeA++/KVbyVN5T2vpAcrqpOzANiZ6TW529WY3wDEnhmy
         tKrQ==
X-Gm-Message-State: AOAM533TRmXrjClmqO0O1dIiNVXeMsPu5OpyPnf5xYDVOjF7llbIoLKf
	4vVMiUpCXZyPWlst98cCx0ppZnppLdms5w==
X-Google-Smtp-Source: ABdhPJzIJC8m7pWvptap//UwdTSUG3l6GbLxvjwwHVfZZVkUbFSDc6m/KTNxqdDVv1dXLDSdUoxjmQ==
X-Received: by 2002:a17:90a:7e18:: with SMTP id i24mr33147443pjl.130.1624975714807;
        Tue, 29 Jun 2021 07:08:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3418:5ced:5b3e:373c])
        by smtp.gmail.com with ESMTPSA id h1sm3383373pji.14.2021.06.29.07.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 07:08:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>
Subject: [PATCH 6/8] PEP8 double aggressive E225 ~ E228 and E231
Date: Tue, 29 Jun 2021 07:08:24 -0700
Message-Id: <20210629140826.13243-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629140826.13243-1-akuster808@gmail.com>
References: <20210629140826.13243-1-akuster808@gmail.com>

From: persianpros <persianpros@yahoo.com>

---
 meta-selftest/lib/devtool/bbpath.py           |  2 +-
 meta-selftest/lib/recipetool/bbpath.py        |  2 +-
 meta/lib/oe/buildhistory_analysis.py          | 18 +++++++-------
 meta/lib/oe/cve_check.py                      |  2 +-
 meta/lib/oe/data.py                           |  4 ++--
 meta/lib/oe/distro_check.py                   |  4 ++--
 meta/lib/oe/elf.py                            | 14 +++++------
 meta/lib/oe/gpg_sign.py                       |  4 ++--
 meta/lib/oe/lsb.py                            |  2 +-
 meta/lib/oe/package.py                        |  2 +-
 meta/lib/oe/package_manager/__init__.py       |  4 ++--
 meta/lib/oe/package_manager/ipk/__init__.py   |  2 +-
 meta/lib/oe/package_manager/rpm/__init__.py   | 10 ++++----
 meta/lib/oe/patch.py                          |  2 +-
 meta/lib/oe/prservice.py                      | 12 +++++-----
 meta/lib/oe/recipeutils.py                    |  6 ++---
 meta/lib/oe/sdk.py                            |  2 +-
 meta/lib/oe/terminal.py                       |  4 ++--
 meta/lib/oe/utils.py                          |  2 +-
 meta/lib/oeqa/core/loader.py                  |  2 +-
 meta/lib/oeqa/core/tests/cases/data.py        |  2 +-
 meta/lib/oeqa/oetest.py                       |  6 ++---
 meta/lib/oeqa/runexported.py                  |  2 +-
 meta/lib/oeqa/runtime/cases/boot.py           |  2 +-
 meta/lib/oeqa/runtime/cases/df.py             |  2 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |  6 ++---
 .../oeqa/runtime/cases/ethernet_ip_connman.py |  6 ++---
 meta/lib/oeqa/runtime/cases/ltp.py            |  2 +-
 meta/lib/oeqa/runtime/cases/oe_syslog.py      |  2 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  2 +-
 meta/lib/oeqa/runtime/cases/ping.py           |  2 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |  2 +-
 meta/lib/oeqa/runtime/cases/systemd.py        |  6 ++---
 meta/lib/oeqa/selftest/cases/bbtests.py       |  6 ++---
 meta/lib/oeqa/selftest/cases/cve_check.py     | 24 +++++++++----------
 meta/lib/oeqa/selftest/cases/devtool.py       | 24 +++++++++----------
 meta/lib/oeqa/selftest/cases/fitimage.py      | 12 +++++-----
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  4 ++--
 meta/lib/oeqa/selftest/cases/manifest.py      |  2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |  2 +-
 .../oeqa/selftest/cases/oelib/buildhistory.py |  4 ++--
 meta/lib/oeqa/selftest/cases/oescripts.py     |  2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  8 +++----
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  8 +++----
 meta/lib/oeqa/utils/decorators.py             | 22 ++++++++---------
 meta/lib/oeqa/utils/package_manager.py        |  4 ++--
 meta/lib/oeqa/utils/qemurunner.py             |  6 ++---
 meta/lib/oeqa/utils/qemutinyrunner.py         |  8 +++----
 meta/lib/oeqa/utils/testexport.py             | 18 +++++++-------
 .../python/python3/create_manifest3.py        | 18 +++++++-------
 .../python/python3/get_module_deps3.py        | 14 +++++------
 .../perf/perf/sort-pmuevents.py               |  2 +-
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  2 +-
 scripts/combo-layer                           | 10 ++++----
 scripts/contrib/image-manifest                | 12 +++++-----
 scripts/contrib/list-packageconfig-flags.py   |  2 +-
 scripts/install-buildtools                    |  2 +-
 scripts/lib/buildstats.py                     |  2 +-
 scripts/lib/devtool/export.py                 |  2 +-
 scripts/lib/devtool/menuconfig.py             | 16 ++++++-------
 scripts/lib/devtool/standard.py               | 22 ++++++++---------
 scripts/lib/devtool/upgrade.py                |  6 ++---
 scripts/lib/recipetool/append.py              |  4 ++--
 scripts/lib/recipetool/create.py              |  2 +-
 scripts/lib/recipetool/create_buildsys.py     |  2 +-
 scripts/lib/resulttool/manualexecution.py     |  8 +++----
 scripts/lib/resulttool/report.py              |  2 +-
 scripts/lib/wic/engine.py                     |  2 +-
 scripts/lib/wic/plugins/imager/direct.py      |  4 ++--
 scripts/oe-pkgdata-util                       |  2 +-
 scripts/opkg-query-helper.py                  |  8 +++----
 scripts/pybootchartgui/pybootchartgui/draw.py |  2 +-
 .../pybootchartgui/pybootchartgui/parsing.py  |  4 ++--
 .../pybootchartgui/pybootchartgui/samples.py  |  2 +-
 .../pybootchartgui/tests/parser_test.py       |  2 +-
 .../pybootchartgui/tests/process_tree_test.py |  2 +-
 scripts/relocate_sdk.py                       |  6 ++---
 scripts/runqemu                               |  4 ++--
 scripts/tiny/ksize.py                         |  4 ++--
 scripts/wic                                   |  2 +-
 81 files changed, 235 insertions(+), 235 deletions(-)

diff --git a/meta-selftest/lib/devtool/bbpath.py b/meta-selftest/lib/devtool/bbpath.py
index 0204f13dd1..973ed779af 100644
--- a/meta-selftest/lib/devtool/bbpath.py
+++ b/meta-selftest/lib/devtool/bbpath.py
@@ -14,7 +14,7 @@ def print_name(args, config, basepath, workspace):
     print(__file__)
 
 def print_bbdir(args, config, basepath, workspace):
-    print(__file__.replace('/lib/devtool/bbpath.py',''))
+    print(__file__.replace('/lib/devtool/bbpath.py', ''))
 
 def print_registered(args, config, basepath, workspace):
     global kept_context
diff --git a/meta-selftest/lib/recipetool/bbpath.py b/meta-selftest/lib/recipetool/bbpath.py
index 23e6fa1b06..d0df800c3d 100644
--- a/meta-selftest/lib/recipetool/bbpath.py
+++ b/meta-selftest/lib/recipetool/bbpath.py
@@ -14,7 +14,7 @@ def print_name(opts):
     print(__file__)
 
 def print_bbdir(opts):
-    print(__file__.replace('/lib/recipetool/bbpath.py',''))
+    print(__file__.replace('/lib/recipetool/bbpath.py', ''))
 
 def print_registered(opts):
     #global kept_context
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index a54c09ca56..44b02c1ae0 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -79,9 +79,9 @@ class ChangeRecord:
 
         def pkglist_combine(depver):
             pkglist = []
-            for k,v in depver.items():
+            for k, v in depver.items():
                 if v:
-                    pkglist.append("%s (%s)" % (k,v))
+                    pkglist.append("%s (%s)" % (k, v))
                 else:
                     pkglist.append(k)
             return pkglist
@@ -98,9 +98,9 @@ class ChangeRecord:
                 rename = False
                 for dir2, files2 in files_ba:
                     if files1 == files2 and not rename:
-                        renamed_dirs.append((dir1,dir2))
+                        renamed_dirs.append((dir1, dir2))
                         # Make sure that we don't use this (dir, files) pair again.
-                        files_ba.remove((dir2,files2))
+                        files_ba.remove((dir2, files2))
                         # If a dir has already been found to have a rename, stop and go no further.
                         rename = True
 
@@ -261,7 +261,7 @@ def blob_to_dict(blob):
     alines = [line for line in blob.data_stream.read().decode('utf-8').splitlines()]
     adict = {}
     for line in alines:
-        splitv = [i.strip() for i in line.split('=',1)]
+        splitv = [i.strip() for i in line.split('=', 1)]
         if len(splitv) > 1:
             adict[splitv[0]] = splitv[1]
     return adict
@@ -271,7 +271,7 @@ def file_list_to_dict(lines):
     adict = {}
     for line in lines:
         # Leave the last few fields intact so we handle file names containing spaces
-        splitv = line.split(None,4)
+        splitv = line.split(None, 4)
         # Grab the path and remove the leading .
         path = splitv[4][1:].strip()
         # Handle symlinks
@@ -639,7 +639,7 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
             elif filename == 'sysroot':
                 alines = d.a_blob.data_stream.read().decode('utf-8').splitlines()
                 blines = d.b_blob.data_stream.read().decode('utf-8').splitlines()
-                filechanges = compare_file_lists(alines,blines, compare_ownership=False)
+                filechanges = compare_file_lists(alines, blines, compare_ownership=False)
                 if filechanges:
                     chg = ChangeRecord(path, filename, None, None, True)
                     chg.filechanges = filechanges
@@ -651,7 +651,7 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
                 if filename == 'files-in-image.txt':
                     alines = d.a_blob.data_stream.read().decode('utf-8').splitlines()
                     blines = d.b_blob.data_stream.read().decode('utf-8').splitlines()
-                    filechanges = compare_file_lists(alines,blines)
+                    filechanges = compare_file_lists(alines, blines)
                     if filechanges:
                         chg = ChangeRecord(path, filename, None, None, True)
                         chg.filechanges = filechanges
@@ -659,7 +659,7 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
                 elif filename == 'installed-package-names.txt':
                     alines = d.a_blob.data_stream.read().decode('utf-8').splitlines()
                     blines = d.b_blob.data_stream.read().decode('utf-8').splitlines()
-                    filechanges = compare_lists(alines,blines)
+                    filechanges = compare_lists(alines, blines)
                     if filechanges:
                         chg = ChangeRecord(path, filename, None, None, True)
                         chg.filechanges = filechanges
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 6db988d5d0..cb4c86cf29 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -27,7 +27,7 @@ class Version():
             raise Exception("Invalid version: '{0}'".format(version))
 
         self._version = _Version(
-            release=tuple(int(i) for i in match.group("release").replace("-",".").split(".")),
+            release=tuple(int(i) for i in match.group("release").replace("-", ".").split(".")),
             patch_l=match.group("patch_l") if str(suffix) in suffixes and match.group("patch_l") else "",
             pre_l=match.group("pre_l"),
             pre_v=match.group("pre_v")
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 602130a904..a340ce3b1b 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -21,7 +21,7 @@ def typed_value(key, d):
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
 
-def export2json(d, json_file, expand=True, searchString="",replaceString=""):
+def export2json(d, json_file, expand=True, searchString="", replaceString=""):
     data2export = {}
     keys2export = []
 
@@ -41,7 +41,7 @@ def export2json(d, json_file, expand=True, searchString="",replaceString=""):
 
     for key in keys2export:
         try:
-            data2export[key] = d.getVar(key, expand).replace(searchString,replaceString)
+            data2export[key] = d.getVar(key, expand).replace(searchString, replaceString)
         except bb.data_smart.ExpansionError:
             data2export[key] = ''
         except AttributeError:
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 0a9f4d162c..213c9e66e1 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -14,7 +14,7 @@ def get_links_from_url(url, d):
 
     from bs4 import BeautifulSoup, SoupStrainer
 
-    soup = BeautifulSoup(create_socket(url,d), "html.parser", parse_only=SoupStrainer("a"))
+    soup = BeautifulSoup(create_socket(url, d), "html.parser", parse_only=SoupStrainer("a"))
     hyperlinks = []
     for line in soup.find_all('a', href=True):
         hyperlinks.append(line['href'].strip('/'))
@@ -246,7 +246,7 @@ def compare_in_distro_packages_list(distro_check_dir, d):
 
     bb.note("Recipe: %s" % recipe_name)
 
-    distro_exceptions = dict({"OE-Core":'OE-Core', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "Windriver":'Windriver', "OSPDT":'OSPDT Approved', "Poky":'poky'})
+    distro_exceptions = dict({"OE-Core": 'OE-Core', "OpenedHand": 'OpenedHand', "Intel": 'Intel', "Upstream": 'Upstream', "Windriver": 'Windriver', "OSPDT": 'OSPDT Approved', "Poky": 'poky'})
     tmp = localdata.getVar('DISTRO_PN_ALIAS') or ""
     for str in tmp.split():
         if str and str.find("=") == -1 and distro_exceptions[str]:
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index acc4185544..b307e4a651 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -13,7 +13,7 @@ def machine_dict(d):
                       },
             "elf": {
                         "aarch64": (183, 0, 0, True, 64),
-                        "aarch64_be":(183, 0, 0, False, 64),
+                        "aarch64_be": (183, 0, 0, False, 64),
                         "i586": (3, 0, 0, True, 32),
                         "i686": (3, 0, 0, True, 32),
                         "x86_64": (62, 0, 0, True, 64),
@@ -22,14 +22,14 @@ def machine_dict(d):
                         "mips": (8, 0, 0, False, 32),
                         "mipsel": (8, 0, 0, True, 32),
                         "microblaze": (189, 0, 0, False, 32),
-                        "microblazeel":(189, 0, 0, True, 32),
+                        "microblazeel": (189, 0, 0, True, 32),
                         "powerpc": (20, 0, 0, False, 32),
                         "riscv32": (243, 0, 0, True, 32),
                         "riscv64": (243, 0, 0, True, 64),
                       },
             "linux": { 
                         "aarch64": (183, 0, 0, True, 64),
-                        "aarch64_be":(183, 0, 0, False, 64),
+                        "aarch64_be": (183, 0, 0, False, 64),
                         "arm": (40, 97, 0, True, 32),
                         "armeb": (40, 97, 0, False, 32),
                         "powerpc": (20, 0, 0, False, 32),
@@ -59,11 +59,11 @@ def machine_dict(d):
                         "sh4": (42, 0, 0, True, 32),
                         "sparc": (2, 0, 0, False, 32),
                         "microblaze": (189, 0, 0, False, 32),
-                        "microblazeel":(189, 0, 0, True, 32),
+                        "microblazeel": (189, 0, 0, True, 32),
                       },
             "linux-musl": { 
                         "aarch64": (183, 0, 0, True, 64),
-                        "aarch64_be":(183, 0, 0, False, 64),
+                        "aarch64_be": (183, 0, 0, False, 64),
                         "arm": (40, 97, 0, True, 32),
                         "armeb": (40, 97, 0, False, 32),
                         "powerpc": (20, 0, 0, False, 32),
@@ -79,7 +79,7 @@ def machine_dict(d):
                         "mips64": (8, 0, 0, False, 64),
                         "mips64el": (8, 0, 0, True, 64),
                         "microblaze": (189, 0, 0, False, 32),
-                        "microblazeel":(189, 0, 0, True, 32),
+                        "microblazeel": (189, 0, 0, True, 32),
                         "riscv32": (243, 0, 0, True, 32),
                         "riscv64": (243, 0, 0, True, 64),
                         "sh4": (42, 0, 0, True, 32),
@@ -118,7 +118,7 @@ def machine_dict(d):
                         "mips64": (8, 0, 0, False, 32),
                         "mips64el": (8, 0, 0, True, 32),
                         "mipsisa64r6": (8, 0, 0, False, 32),
-                        "mipsisa64r6el":(8, 0, 0, True, 32),
+                        "mipsisa64r6el": (8, 0, 0, True, 32),
                       },
         }
 
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 7686596ac8..805cedd963 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -41,7 +41,7 @@ class LocalSigner(object):
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
         gpg_args = '--no-permission-warning --batch --passphrase=%s --agent-program=%s|--auto-expand-secmem' % (passphrase, self.gpg_agent_bin)
-        if self.gpg_version > (2,1,):
+        if self.gpg_version > (2, 1,):
             gpg_args += ' --pinentry-mode=loopback'
         cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
         cmd += "--define '_binary_filedigest_algorithm %s' " % digest
@@ -74,7 +74,7 @@ class LocalSigner(object):
 
         #gpg > 2.1 supports password pipes only through the loopback interface
         #gpg < 2.1 errors out if given unknown parameters
-        if self.gpg_version > (2,1,):
+        if self.gpg_version > (2, 1,):
             cmd += ['--pinentry-mode', 'loopback']
 
         cmd += [input_file]
diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 791d529935..fa540b48b3 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -118,4 +118,4 @@ def distro_identifier(adjust_hook=None):
         id_str = '{0}-{1}'.format(distro_id, release)
     else:
         id_str = distro_id
-    return id_str.replace(' ','-').replace('/','-')
+    return id_str.replace(' ', '-').replace('/', '-')
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index fc5408d5f8..9dd6aef641 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -245,7 +245,7 @@ def filedeprunner(arg):
                 dep = dep.split()[0]
 
             # Put parentheses around any version specifications.
-            dep = r.sub(r'(\g<0>)',dep)
+            dep = r.sub(r'(\g<0>)', dep)
 
             if file not in i:
                 i[file] = []
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 5fac51aea7..633c5c4bf2 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -76,8 +76,8 @@ def opkg_query(cmd_output):
             if not filename:
                 filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
             if pkg:
-                output[pkg] = {"arch":arch, "ver":ver,
-                        "filename":filename, "deps": dep, "pkgarch":pkgarch, "provs": prov}
+                output[pkg] = {"arch": arch, "ver": ver,
+                        "filename": filename, "deps": dep, "pkgarch": pkgarch, "provs": prov}
             pkg = ""
             arch = ""
             ver = ""
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 965d542e08..504830cdec 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -166,7 +166,7 @@ class OpkgPM(OpkgDpkgPM):
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/'),target_rootfs)
+        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/'), target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS")
 
         if prepare_index:
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index f7cf436f61..1a38055891 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -65,9 +65,9 @@ class RpmPM(PackageManager):
         self.target_vendor = target_vendor
         self.task_name = task_name
         if arch_var == None:
-            self.archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
+            self.archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-", "_")
         else:
-            self.archs = self.d.getVar(arch_var).replace("-","_")
+            self.archs = self.d.getVar(arch_var).replace("-", "_")
         if task_name == "host":
             self.primary_arch = self.d.getVar('SDK_ARCH')
         else:
@@ -280,7 +280,7 @@ class RpmPM(PackageManager):
                 package_arch = package_info[1]
                 package_version = package_info[2]
                 package_rpm = package_info[3]
-                packages[current_package] = {"arch":package_arch, "ver":package_version, "filename":package_rpm}
+                packages[current_package] = {"arch": package_arch, "ver": package_version, "filename": package_rpm}
                 current_deps = []
             elif line.startswith("Dependencies:"):
                 current_state = "dependencies"
@@ -315,7 +315,7 @@ class RpmPM(PackageManager):
         cmd = [dnf_cmd] + standard_dnf_args + dnf_args
         bb.note('Running %s' % ' '.join(cmd))
         try:
-            output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
             if print_output:
                 bb.debug(1, output)
             return output
@@ -352,7 +352,7 @@ class RpmPM(PackageManager):
         args = ["-q", "--root=%s" % self.target_rootfs, "--queryformat", "%{postin}", pkg]
 
         try:
-            output = subprocess.check_output([cmd] + args,stderr=subprocess.STDOUT).decode("utf-8")
+            output = subprocess.check_output([cmd] + args, stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not invoke rpm. Command "
                      "'%s' returned %d:\n%s" % (' '.join([cmd] + args), e.returncode, e.output.decode("utf-8")))
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index e0f767bf65..4cab28a215 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -580,7 +580,7 @@ class QuiltTree(PatchSet):
     def Clean(self):
         try:
             self._runcmd(["pop", "-a", "-f"])
-            oe.path.remove(os.path.join(self.dir, "patches","series"))
+            oe.path.remove(os.path.join(self.dir, "patches", "series"))
         except Exception:
             pass
         self.initialized = True
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index afc8ea23bc..d71140980a 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -11,7 +11,7 @@ def prserv_make_conn(d, check=False):
         if check:
             if not conn.ping():
                 raise Exception('service not available')
-        d.setVar("__PRSERV_CONN",conn)
+        d.setVar("__PRSERV_CONN", conn)
     except Exception as exc:
         bb.fatal("Connecting to PR service %s:%s failed: %s" % (host_params[0], host_params[1], str(exc)))
 
@@ -63,13 +63,13 @@ def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksu
             try:
                 value = int(d.getVar(remain + '$' + version + '$' + pkgarch + '$' + checksum))
             except BaseException as exc:
-                bb.debug("Not valid value of %s:%s" % (v,str(exc)))
+                bb.debug("Not valid value of %s:%s" % (v, str(exc)))
                 continue
-            ret = conn.importone(version,pkgarch,checksum,value)
+            ret = conn.importone(version, pkgarch, checksum, value)
             if ret != value:
-                bb.error("importing(%s,%s,%s,%d) failed. DB may have larger value %d" % (version,pkgarch,checksum,value,ret))
+                bb.error("importing(%s,%s,%s,%d) failed. DB may have larger value %d" % (version, pkgarch, checksum, value, ret))
             else:
-               imported.append((version,pkgarch,checksum,value))
+               imported.append((version, pkgarch, checksum, value))
     return imported
 
 def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
@@ -112,7 +112,7 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
                     (str(datainfo[i]['version']), pkgarch, str(datainfo[i]['checksum']), str(value)))
             if not nomax:
                 for i in idx:
-                    f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']),str(datainfo[idx[i]]['pkgarch']),str(datainfo[idx[i]]['value'])))
+                    f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']), str(datainfo[idx[i]]['pkgarch']), str(datainfo[idx[i]]['value'])))
     bb.utils.unlockfile(lf)
 
 def prserv_check_avail(d):
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 646cbdfa13..6842f7387d 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -353,7 +353,7 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None
     varfiles = get_var_files(fn, varlist, d)
     locs = localise_file_vars(fn, varfiles, varlist)
     patches = []
-    for f,v in locs.items():
+    for f, v in locs.items():
         vals = {k: varvalues[k] for k in v}
         f = os.path.abspath(f)
         if f == fn:
@@ -489,9 +489,9 @@ def get_recipe_local_files(d, patches=False, archives=False):
             if os.path.isdir(localpath):
                 for root, dirs, files in os.walk(localpath):
                     for fname in files:
-                        fileabspath = os.path.join(root,fname)
+                        fileabspath = os.path.join(root, fname)
                         srcdir = os.path.dirname(localpath)
-                        ret[os.path.relpath(fileabspath,srcdir)] = fileabspath
+                        ret[os.path.relpath(fileabspath, srcdir)] = fileabspath
             else:
                 ret[fname] = localpath
     return ret
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 190010691b..aad3f571da 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -144,7 +144,7 @@ def get_extra_sdkinfo(sstate_dir):
         for fn in files:
             if fn.endswith('.tgz'):
                 fsize = int(math.ceil(float(os.path.getsize(os.path.join(root, fn))) / 1024))
-                task = fn.rsplit(':',1)[1].split('_',1)[1].split(',')[0]
+                task = fn.rsplit(':', 1)[1].split('_', 1)[1].split(',')[0]
                 origtotal = extra_info['tasksizes'].get(task, 0)
                 extra_info['tasksizes'][task] = origtotal + fsize
                 extra_info['filesizes'][fn] = fsize
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 2d6a4ac792..4b9c71eea1 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -64,7 +64,7 @@ class Gnome(XTerminal):
         # clearing the LC_ALL environment variable so it uses the locale.
         # Once fixed on the gnome-terminal project, this should be removed.
         if os.getenv('LC_ALL'):
-            os.putenv('LC_ALL','')
+            os.putenv('LC_ALL', '')
 
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
@@ -274,7 +274,7 @@ def check_tmux_pane_size(tmux):
         return False
     try:
         p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
-                shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
+                shell=True, stdout=sub.PIPE, stderr=sub.PIPE)
         out, err = p.communicate()
         size = int(out.strip())
     except OSError as exc:
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index ea78b2b0e0..929ca9c5b1 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -107,7 +107,7 @@ def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
 
-def features_backfill(var,d):
+def features_backfill(var, d):
     # This construct allows the addition of new features to variable specified
     # as var
     # Example for var = "DISTRO_FEATURES"
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index df7cd5ecc2..7f7c96cdd6 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -316,7 +316,7 @@ class OETestLoader(unittest.TestLoader):
 
     # XXX After Python 3.5, remove backward compatibility hacks for
     # use_load_tests deprecation via *args and **kws.  See issue 16662.
-    if sys.version_info >= (3,5):
+    if sys.version_info >= (3, 5):
         def loadTestsFromModule(self, module, *args, pattern=None, **kws):
             """
                 Returns a suite of all tests cases contained in module.
diff --git a/meta/lib/oeqa/core/tests/cases/data.py b/meta/lib/oeqa/core/tests/cases/data.py
index 61f88547f7..42baa708bf 100644
--- a/meta/lib/oeqa/core/tests/cases/data.py
+++ b/meta/lib/oeqa/core/tests/cases/data.py
@@ -11,7 +11,7 @@ from oeqa.core.decorator.data import OETestDataDepends
 class DataTest(OETestCase):
     data_vars = ['IMAGE', 'ARCH']
 
-    @OETestDataDepends(['MACHINE',])
+    @OETestDataDepends(['MACHINE', ])
     @OETestTag('dataTestOk')
     def testDataOk(self):
         self.assertEqual(self.td.get('IMAGE'), 'core-image-minimal')
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index bd602637dc..815f2a4c02 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -81,7 +81,7 @@ class oeTest(unittest.TestCase):
         return False
 
     @classmethod
-    def hasFeature(self,feature):
+    def hasFeature(self, feature):
         if feature in oeTest.tc.imagefeatures or \
                 feature in oeTest.tc.distrofeatures:
             return True
@@ -431,7 +431,7 @@ class RuntimeTestContext(TestContext):
         extracted_path = self.d.getVar("TEST_EXTRACTED_DIR")
         packaged_path = self.d.getVar("TEST_PACKAGED_DIR")
 
-        for key,value in needed_packages.items():
+        for key, value in needed_packages.items():
             packages = ()
             if isinstance(value, dict):
                 packages = (value, )
@@ -491,7 +491,7 @@ class RuntimeTestContext(TestContext):
 
         with open(json_file) as f:
             test_packages = json.load(f)
-        for key,value in test_packages.items():
+        for key, value in test_packages.items():
             needed_packages[key] = value
 
         if test:
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index d11171bf45..fa0ec0ccf6 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -42,7 +42,7 @@ class FakeTarget(object):
         self.connection = None
         self.ip = None
         self.server_ip = None
-        self.datetime = time.strftime('%Y%m%d%H%M%S',time.gmtime())
+        self.datetime = time.strftime('%Y%m%d%H%M%S', time.gmtime())
         self.testdir = d.getVar("TEST_LOG_DIR")
         self.pn = d.getVar("PN")
 
diff --git a/meta/lib/oeqa/runtime/cases/boot.py b/meta/lib/oeqa/runtime/cases/boot.py
index b801d13fc0..03a1d4b501 100644
--- a/meta/lib/oeqa/runtime/cases/boot.py
+++ b/meta/lib/oeqa/runtime/cases/boot.py
@@ -29,5 +29,5 @@ class BootTest(OERuntimeTestCase):
             else:
                 count = 0
         msg = ('Expected 5 consecutive, got %d.\n'
-               'ping output is:\n%s' % (count,output))
+               'ping output is:\n%s' % (count, output))
         self.assertEqual(count, 5, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index 26752fb4bc..e7822af3b4 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -14,6 +14,6 @@ class DfTest(OERuntimeTestCase):
     @skipIfInDataVar('IMAGE_FEATURES', 'read-only-rootfs', 'Test case df requires a writable rootfs')
     def test_df(self):
         cmd = "df -P / | sed -n '2p' | awk '{print $4}'"
-        (status,output) = self.target.run(cmd)
+        (status, output) = self.target.run(cmd)
         msg = 'Not enough space on image. Current size is %s' % output
         self.assertTrue(int(output) > 5120, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 777dbe6bf1..18d562176f 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -162,9 +162,9 @@ class DnfRepoTest(DnfTest):
         self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1500)
         self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootpath, 1500)
         self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpath, 1500)
-        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath,rootpath), 1500)
-        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath,rootpath), 1500)
-        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath,rootpath), 1500)
+        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath, rootpath), 1500)
         self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
         self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
index e010612838..40ac36493b 100644
--- a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -19,7 +19,7 @@ class Ethernet_Test(OERuntimeTestCase):
         original_ip = output 
         virtual_ip = self.set_ip(original_ip)
         
-        (status, output) = self.target.run("ifconfig eth0:1 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 down" % (virtual_ip,virtual_ip))
+        (status, output) = self.target.run("ifconfig eth0:1 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 down" % (virtual_ip, virtual_ip))
         self.assertEqual(status, 0, msg='Failed to create virtual ip address, output: %s' % output)
         
     @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_ip'])  
@@ -32,5 +32,5 @@ class Ethernet_Test(OERuntimeTestCase):
         self.assertEqual(status, 0, msg='Failed to retrieve the default gateway, output: %s' % output)
         default_gateway = output
 
-        (status, output) = self.target.run("connmanctl config %s --ipv4 dhcp && sleep 2 && ping -c 5 %s" % (wired_interfaces,default_gateway))
-        self.assertEqual(status, 0, msg='Failed to get dynamic IP address via DHCP in connmand, output: %s' % output)
\ No newline at end of file
+        (status, output) = self.target.run("connmanctl config %s --ipv4 dhcp && sleep 2 && ping -c 5 %s" % (wired_interfaces, default_gateway))
+        self.assertEqual(status, 0, msg='Failed to get dynamic IP address via DHCP in connmand, output: %s' % output)
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 16fde55ccf..9fe9cb8def 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
 
 class LtpTest(LtpTestBase):
 
-    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
+    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input", "fs_perms_simple"]
 
     ltp_fs = ["fs", "fsx", "fs_bind"]
     # skip kernel cpuhotplug
diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index dbb49b6895..2e1a8f153d 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -122,7 +122,7 @@ class SyslogTestConfig(OERuntimeTestCase):
         self.test_syslog_restart()
 
         cmd = 'logger foobar && grep foobar /var/log/test'
-        status,output = self.target.run(cmd)
+        status, output = self.target.run(cmd)
         msg = 'Test log string not found. Output: %s ' % output
         self.assertEqual(status, 0, msg=msg)
 
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 345901d00d..c61969d3f2 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -195,7 +195,7 @@ ignore_errors = {
         ] + common_errors,
 }
 
-log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]
+log_locations = ["/var/log/", "/var/log/dmesg", "/tmp/dmesg_output.log"]
 
 class ParseLogsTest(OERuntimeTestCase):
 
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index d550efe17f..da40204614 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -22,5 +22,5 @@ class PingTest(OERuntimeTestCase):
             else:
                 count = 0
         msg = ('Expected 5 consecutive, got %d.\n'
-               'ping output is:\n%s' % (count,output))
+               'ping output is:\n%s' % (count, output))
         self.assertEqual(count, 5, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index cfaa729f30..df0a373c59 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -102,7 +102,7 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
 
     @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_install'])
     def test_rpm_remove(self):
-        status,output = self.target.run('rpm -e base-passwd-doc')
+        status, output = self.target.run('rpm -e base-passwd-doc')
         msg = 'Failed to remove base-passwd-doc package: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 668fc2a70e..a465eaa0b7 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -24,7 +24,7 @@ class SystemdTest(OERuntimeTestCase):
         return output
 
     #TODO: use pyjournalctl instead
-    def journalctl(self, args='',l_match_units=None):
+    def journalctl(self, args='', l_match_units=None):
         """
         Request for the journalctl output to the current target system
 
@@ -110,7 +110,7 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('stop', 'avahi-daemon.service')
         self.systemctl('is-active', 'avahi-daemon.service',
                        expected=3, verbose=True)
-        self.systemctl('start','avahi-daemon.service')
+        self.systemctl('start', 'avahi-daemon.service')
         self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
 
     @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
@@ -152,7 +152,7 @@ class SystemdJournalTests(SystemdTest):
         """
 
         # The expression chain that uniquely identifies the time boot message.
-        expr_items = ['Startup finished', 'kernel', 'userspace','\.$']
+        expr_items = ['Startup finished', 'kernel', 'userspace', '\.$']
         try:
             output = self.journalctl(args='-o cat --reverse')
         except AssertionError:
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 30afc962c9..d196bb16cf 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -191,7 +191,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
     def test_prefile(self):
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
-        ftools.write_file(preconf,"TEST_PREFILE=\"prefile\"")
+        ftools.write_file(preconf, "TEST_PREFILE=\"prefile\"")
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertIn('prefile', result.output)
         self.write_config("TEST_PREFILE=\"localconf\"")
@@ -216,13 +216,13 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 INHERIT_remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
-        self.write_recipeinc('man-db',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n")
+        self.write_recipeinc('man-db', "\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n")
         runCmd('bitbake -c cleanall man-db xcursor-transparent-theme')
         result = runCmd('bitbake -c unpack -k man-db xcursor-transparent-theme', ignore_status=True)
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
         manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
-        self.assertLess(errorpos,continuepos, msg="bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
+        self.assertLess(errorpos, continuepos, msg="bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
 
     def test_non_gplv3(self):
         self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 4f78bbaf55..bd89e9335f 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -24,21 +24,21 @@ class CVECheck(OESelftestTestCase):
 
         # ignore "p1" and "p2", so these should be equal
         result = Version("1.0p2") == Version("1.0p1")
-        self.assertTrue(result,msg="Failed to compare version '1.0p2' to '1.0p1'")
+        self.assertTrue(result, msg="Failed to compare version '1.0p2' to '1.0p1'")
         # ignore the "b" and "r"
         result = Version("1.0b") == Version("1.0r")
-        self.assertTrue(result,msg="Failed to compare version '1.0b' to '1.0r'")
+        self.assertTrue(result, msg="Failed to compare version '1.0b' to '1.0r'")
 
         # consider the trailing alphabet as patched level when comparing
-        result = Version("1.0b","alphabetical") < Version("1.0r","alphabetical")
-        self.assertTrue(result,msg="Failed to compare version with suffix '1.0b' < '1.0r'")
-        result = Version("1.0b","alphabetical") > Version("1.0","alphabetical")
-        self.assertTrue(result,msg="Failed to compare version with suffix '1.0b' > '1.0'")
+        result = Version("1.0b", "alphabetical") < Version("1.0r", "alphabetical")
+        self.assertTrue(result, msg="Failed to compare version with suffix '1.0b' < '1.0r'")
+        result = Version("1.0b", "alphabetical") > Version("1.0", "alphabetical")
+        self.assertTrue(result, msg="Failed to compare version with suffix '1.0b' > '1.0'")
 
         # consider the trailing "p" and "patch" as patched released when comparing
-        result = Version("1.0","patch") < Version("1.0p1","patch")
-        self.assertTrue(result,msg="Failed to compare version with suffix '1.0' < '1.0p1'")
-        result = Version("1.0p2","patch") > Version("1.0p1","patch")
-        self.assertTrue(result,msg="Failed to compare version with suffix '1.0p2' > '1.0p1'")
-        result = Version("1.0_patch2","patch") < Version("1.0_patch3","patch")
-        self.assertTrue(result,msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
+        result = Version("1.0", "patch") < Version("1.0p1", "patch")
+        self.assertTrue(result, msg="Failed to compare version with suffix '1.0' < '1.0p1'")
+        result = Version("1.0p2", "patch") > Version("1.0p1", "patch")
+        self.assertTrue(result, msg="Failed to compare version with suffix '1.0p2' > '1.0p1'")
+        result = Version("1.0_patch2", "patch") < Version("1.0_patch3", "patch")
+        self.assertTrue(result, msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6c3b3cbb3e..b90aac72bd 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1873,7 +1873,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         #Here is just generated the config file instead of all the kernel to optimize the
         #time of executing this test case.
         bitbake('%s -c configure' % kernel_provider)
-        bbconfig = os.path.join(get_bb_var('B', kernel_provider),'.config')
+        bbconfig = os.path.join(get_bb_var('B', kernel_provider), '.config')
         #Step 2
         runCmd('cp %s %s' % (bbconfig, tempdir_cfg))
         self.assertExists(os.path.join(tempdir_cfg, '.config'), 'Could not copy .config file from kernel')
@@ -1885,34 +1885,34 @@ class DevtoolUpgradeTests(DevtoolBase):
         runCmd('devtool modify virtual/kernel -x %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         #Step 4.2
-        configfile = os.path.join(tempdir,'.config')
+        configfile = os.path.join(tempdir, '.config')
         diff = runCmd('diff %s %s' % (tmpconfig, configfile))
-        self.assertEqual(0,diff.status,'Kernel .config file is not the same using bitbake and devtool')
+        self.assertEqual(0, diff.status, 'Kernel .config file is not the same using bitbake and devtool')
         #Step 4.3
         #NOTE: virtual/kernel is mapped to kernel_provider
         result = runCmd('devtool build %s' % kernel_provider)
-        self.assertEqual(0,result.status,'Cannot build kernel using `devtool build`')
+        self.assertEqual(0, result.status, 'Cannot build kernel using `devtool build`')
         kernelfile = os.path.join(get_bb_var('KBUILD_OUTPUT', kernel_provider), 'vmlinux')
         self.assertExists(kernelfile, 'Kernel was not build correctly')
 
         #Modify the kernel source
-        modfile = os.path.join(tempdir,'arch/x86/boot/header.S')
+        modfile = os.path.join(tempdir, 'arch/x86/boot/header.S')
         modstring = "Use a boot loader. Devtool testing."
         modapplied = runCmd("sed -i 's/Use a boot loader./%s/' %s" % (modstring, modfile))
-        self.assertEqual(0,modapplied.status,'Modification to %s on kernel source failed' % modfile)
+        self.assertEqual(0, modapplied.status, 'Modification to %s on kernel source failed' % modfile)
         #Modify the configuration
-        codeconfigfile = os.path.join(tempdir,'.config.new')
+        codeconfigfile = os.path.join(tempdir, '.config.new')
         modconfopt = "CONFIG_SG_POOL=n"
         modconf = runCmd("sed -i 's/CONFIG_SG_POOL=y/%s/' %s" % (modconfopt, codeconfigfile))
-        self.assertEqual(0,modconf.status,'Modification to %s failed' % codeconfigfile)
+        self.assertEqual(0, modconf.status, 'Modification to %s failed' % codeconfigfile)
         #Build again kernel with devtool
         rebuild = runCmd('devtool build %s' % kernel_provider)
-        self.assertEqual(0,rebuild.status,'Fail to build kernel after modification of source and config')
+        self.assertEqual(0, rebuild.status, 'Fail to build kernel after modification of source and config')
         #Step 4.4
         bzimagename = 'bzImage-' + get_bb_var('KERNEL_VERSION_NAME', kernel_provider)
-        bzimagefile = os.path.join(get_bb_var('D', kernel_provider),'boot', bzimagename)
+        bzimagefile = os.path.join(get_bb_var('D', kernel_provider), 'boot', bzimagename)
         checkmodcode = runCmd("grep '%s' %s" % (modstring, bzimagefile))
-        self.assertEqual(0,checkmodcode.status,'Modification on kernel source failed')
+        self.assertEqual(0, checkmodcode.status, 'Modification on kernel source failed')
         #Step 4.5
         checkmodconfg = runCmd("grep %s %s" % (modconfopt, codeconfigfile))
-        self.assertEqual(0,checkmodconfg.status,'Modification to configuration file failed')
+        self.assertEqual(0, checkmodconfg.status, 'Modification to configuration file failed')
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index f485593f1d..67000bb1c1 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -747,7 +747,7 @@ FIT_HASH_ALG = "sha256"
         machine = get_bb_var('MACHINE')
         fitimage_its_path = os.path.join(deploy_dir_image,
                     "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
-        fitimage_path = os.path.join(deploy_dir_image,"fitImage")
+        fitimage_path = os.path.join(deploy_dir_image, "fitImage")
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -793,7 +793,7 @@ FIT_HASH_ALG = "sha256"
             if node == exp_node_lines:
                 print("kernel node verified")
             else:
-                self.assertTrue(test_passed == True,"kernel node does not match expectation")
+                self.assertTrue(test_passed == True, "kernel node does not match expectation")
 
         rx_configs = re.compile("^conf-.*")
         its_configs = list(filter(rx_configs.match, its_lines))
@@ -811,23 +811,23 @@ FIT_HASH_ALG = "sha256"
             print("checking configuration " + cfg_str.rstrip(" {"))
             rx_desc_line = re.compile("^description.*1 Linux kernel.*")
             if len(list(filter(rx_desc_line.match, node))) != 1:
-                self.assertTrue(test_passed == True,"kernel keyword not found in the description line")
+                self.assertTrue(test_passed == True, "kernel keyword not found in the description line")
                 break
             else:
                 print("kernel keyword found in the description line")
 
             if 'kernel = "kernel-1";' not in node:
-                self.assertTrue(test_passed == True,"kernel line not found")
+                self.assertTrue(test_passed == True, "kernel line not found")
                 break
             else:
                 print("kernel line found")
 
             rx_sign_line = re.compile("^sign-images.*kernel.*")
             if len(list(filter(rx_sign_line.match, node))) != 1:
-                self.assertTrue(test_passed == True,"kernel hash not signed")
+                self.assertTrue(test_passed == True, "kernel hash not signed")
                 break
             else:
                 print("kernel hash signed")
 
             test_passed = True
-            self.assertTrue(test_passed == True,"Initramfs bundle test success")
+            self.assertTrue(test_passed == True, "Initramfs bundle test success")
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 53c549ac95..07e46d5cfd 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -290,5 +290,5 @@ PNBLACKLIST[busybox] = "Don't build this"
         res_dir = get_bb_var('DEPLOY_DIR_IMAGE')
         images = os.path.join(res_dir, "test-empty-image-*.manifest")
         result = glob.glob(images)
-        with open(result[1],"r") as f:
-                self.assertEqual(len(f.read().strip()),0)
+        with open(result[1], "r") as f:
+                self.assertEqual(len(f.read().strip()), 0)
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 56c8129a06..c7ba0ae5b7 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -116,7 +116,7 @@ class VerifyManifest(OESelftestTestCase):
                 self.classname, m_entry[k].file))
 
             m_entry[k].missing = self.check_manifest_entries(
-                                               m_entry[k].file,reverse_dir[k])
+                                               m_entry[k].file, reverse_dir[k])
             if m_entry[k].missing:
                 msg = '{}: {} Error has the following missing entries'\
                         .format(self.classname, m_entry[k].file)
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 6f10d30dc9..3c6371fba8 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
                         "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
-        self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS --disable-maintainer-mode','sed -i -e "/char \*program_name/d" src/global.c;'), 0,
+        self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS --disable-maintainer-mode', 'sed -i -e "/char \*program_name/d" src/global.c;'), 0,
                         msg="Running configure failed")
         self.assertEqual(self.project.run_make(), 0,
                         msg="Running make failed")
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 05c3268f3e..ad4ae8ccef 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -33,7 +33,7 @@ class TestBlobParsing(OESelftestTestCase):
             return
 
         for k in to_remove:
-            self.var_map.pop(x,None)
+            self.var_map.pop(x, None)
         for k in to_add:
             self.var_map[k] = to_add[k]
 
@@ -62,7 +62,7 @@ class TestBlobParsing(OESelftestTestCase):
         """
         from oe.buildhistory_analysis import compare_dict_blobs
 
-        changesmap = {"foo-2": ("2", "8"), "bar": ("","4"), "bar-2": ("","5")}
+        changesmap = {"foo-2": ("2", "8"), "bar": ("", "4"), "bar-2": ("", "5")}
 
         self.commit_vars(to_add={"foo": "1", "foo-2": "2", "foo-3": "3"})
         blob1 = self.repo.heads.master.commit.tree.blobs[0]
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 59784bbc67..7b20d374dd 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -88,7 +88,7 @@ class OEGitproxyTests(OESelftestTestCase):
 
         # outside, use the proxy
         res = runCmd('%s%s/oe-git-proxy host.outside-example.com 9418' %
-                     (prefix,self.scripts_dir))
+                     (prefix, self.scripts_dir))
         self.assertIn('PROXY:', res.output)
         # match with wildcard suffix
         res = runCmd('%s%s/oe-git-proxy host.example.com 9418' %
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 332e0de41f..02eaf213cb 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -385,7 +385,7 @@ IMAGE_INSTALL_append = " systemtap-runtime"
         def test_crosstap_helloworld(self):
             self.write_config(self.default_config())
             bitbake('systemtap-native')
-            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR", "systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
             with runqemu(self.image) as qemu:
@@ -397,7 +397,7 @@ IMAGE_INSTALL_append = " systemtap-runtime"
             self.write_config(self.default_config())
 
             bitbake('systemtap-native')
-            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR", "systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
             with runqemu(self.image) as qemu:
@@ -409,7 +409,7 @@ IMAGE_INSTALL_append = " systemtap-runtime"
             self.write_config(self.default_config())
 
             bitbake('systemtap-native')
-            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR", "systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
             with runqemu(self.image) as qemu:
@@ -421,7 +421,7 @@ IMAGE_INSTALL_append = " systemtap-runtime"
             self.write_config(self.default_config())
 
             bitbake('systemtap-native')
-            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR", "systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
             with runqemu(self.image) as qemu:
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index d428462e9c..c3846f6771 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -558,7 +558,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/")
         files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/")
         # Remove items that are identical in both sets
-        for k,v in files1.items() & files2.items():
+        for k, v in files1.items() & files2.items():
             del files1[k]
             del files2[k]
         if not files1 and not files2:
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 72c25c634f..e2b2d28b25 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -244,7 +244,7 @@ class Wic(WicTestCase):
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         images = glob(self.resultdir + "mkefidisk-*.direct")
         result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))       
-        self.assertIn("kernel",result.output)
+        self.assertIn("kernel", result.output)
 
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
@@ -629,12 +629,12 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                 config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
                 self.append_config(config)
                 bitbake('core-image-minimal')
-                tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
+                tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'), 'build-wic')
 
                 # check each partition for permission
                 for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*')):
                     res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
-                    self.assertTrue(files_own_by_root(res.output),msg='Files permission incorrect using wks set "%s"' % test)
+                    self.assertTrue(files_own_by_root(res.output), msg='Files permission incorrect using wks set "%s"' % test)
 
                 # clean config and result directory for next cases
                 self.remove_config(config)
@@ -715,7 +715,7 @@ class Wic2(WicTestCase):
         wicvars = set(bb_vars['WICVARS'].split())
         # filter out optional variables
         wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
-                                      'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
+                                      'INITRD', 'INITRD_LIVE', 'ISODIR', 'INITRAMFS_IMAGE',
                                       'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME',
                                       'APPEND', 'IMAGE_EFI_BOOT_FILES'))
         with open(path) as envfile:
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index d97faefcab..752e4e6208 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -32,7 +32,7 @@ class getResults(object):
                 s = i[0].id()
                 #Handle the _ErrorHolder objects from skipModule failures
                 if "setUpModule (" in s:
-                    ret.append(s.replace("setUpModule (", "").replace(")",""))
+                    ret.append(s.replace("setUpModule (", "").replace(")", ""))
                 else:
                     ret.append(s)
                 # Append also the test without the full path
@@ -55,10 +55,10 @@ class getResults(object):
 
 class skipIfFailure(object):
 
-    def __init__(self,testcase):
+    def __init__(self, testcase):
         self.testcase = testcase
 
-    def __call__(self,f):
+    def __call__(self, f):
         @wraps(f)
         def wrapped_f(*args, **kwargs):
             res = getResults()
@@ -70,10 +70,10 @@ class skipIfFailure(object):
 
 class skipIfSkipped(object):
 
-    def __init__(self,testcase):
+    def __init__(self, testcase):
         self.testcase = testcase
 
-    def __call__(self,f):
+    def __call__(self, f):
         @wraps(f)
         def wrapped_f(*args, **kwargs):
             res = getResults()
@@ -85,10 +85,10 @@ class skipIfSkipped(object):
 
 class skipUnlessPassed(object):
 
-    def __init__(self,testcase):
+    def __init__(self, testcase):
         self.testcase = testcase
 
-    def __call__(self,f):
+    def __call__(self, f):
         @wraps(f)
         def wrapped_f(*args, **kwargs):
             res = getResults()
@@ -124,9 +124,9 @@ def LogResults(original_class):
 
     from time import strftime, gmtime
     caller = os.path.basename(sys.argv[0])
-    timestamp = strftime('%Y%m%d%H%M%S',gmtime())
-    logfile = os.path.join(os.getcwd(),'results-' + caller + '.' + timestamp + '.log')
-    linkfile = os.path.join(os.getcwd(),'results-' + caller + '.log')
+    timestamp = strftime('%Y%m%d%H%M%S', gmtime())
+    logfile = os.path.join(os.getcwd(), 'results-' + caller + '.' + timestamp + '.log')
+    linkfile = os.path.join(os.getcwd(), 'results-' + caller + '.log')
 
     def get_class_that_defined_method(meth):
         if inspect.ismethod(meth):
@@ -262,7 +262,7 @@ def gettag(obj, key, default=None):
 
 def getAllTags(obj):
     def __gettags(o):
-        r = {k[len(__tag_prefix):]:getattr(o,k) for k in dir(o) if k.startswith(__tag_prefix)}
+        r = {k[len(__tag_prefix):]: getattr(o, k) for k in dir(o) if k.startswith(__tag_prefix)}
         return r
     if not isinstance(obj, unittest.TestCase):
         return __gettags(obj)
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 6b67f22fdd..e763d93c43 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -80,7 +80,7 @@ def _get_needed_packages(json_file, test=None):
 
     with open(json_file) as f:
         test_packages = json.load(f)
-    for key,value in test_packages.items():
+    for key, value in test_packages.items():
         needed_packages[key] = value
 
     if test:
@@ -101,7 +101,7 @@ def extract_packages(d, needed_packages):
 
     extracted_path = d.getVar('TEST_EXTRACTED_DIR')
 
-    for key,value in needed_packages.items():
+    for key, value in needed_packages.items():
         packages = ()
         if isinstance(value, dict):
             packages = (value, )
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 2d7b1122d4..0e4fff2346 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -26,7 +26,7 @@ from collections import defaultdict
 import importlib
 
 # Get Unicode non printable control chars
-control_range = list(range(0,32)) + list(range(127,160))
+control_range = list(range(0, 32)) + list(range(127, 160))
 control_chars = [chr(x) for x in control_range
                 if chr(x) not in string.printable]
 re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
@@ -99,7 +99,7 @@ class QemuRunner:
         try:
             sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
             sock.setblocking(0)
-            sock.bind(("127.0.0.1",0))
+            sock.bind(("127.0.0.1", 0))
             sock.listen(2)
             port = sock.getsockname()[1]
             self.logger.debug("Created listening socket for qemu serial console on: 127.0.0.1:%s" % port)
@@ -621,7 +621,7 @@ class QemuRunner:
                 data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
                 break
             try:
-                sread, _, _ = select.select([self.server_socket],[],[], end - now)
+                sread, _, _ = select.select([self.server_socket], [], [], end - now)
             except InterruptedError:
                 continue
             if sread:
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 1807f92320..dc4efae9a0 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -94,7 +94,7 @@ class QemuTinyRunner(QemuRunner):
         self.qemuparams = '--append "root=/dev/ram0 console=ttyS0" -nographic -serial unix:%s,server,nowait' % self.socketfile
 
         launch_cmd = 'qemu-system-i386 -kernel %s -initrd %s %s' % (self.kernel, self.rootfs, self.qemuparams)
-        self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
+        self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setpgrp)
 
         bb.note("runqemu started, pid is %s" % self.runqemu.pid)
         bb.note("waiting at most %s seconds for qemu pid" % self.runqemutime)
@@ -122,7 +122,7 @@ class QemuTinyRunner(QemuRunner):
         endtime = time.time() + timeout
         while time.time() < endtime and not stopread:
                 try:
-                        sread, _, _ = select.select([self.server_socket],[],[],1)
+                        sread, _, _ = select.select([self.server_socket], [], [], 1)
                 except InterruptedError:
                         continue
                 for sock in sread:
@@ -138,7 +138,7 @@ class QemuTinyRunner(QemuRunner):
             data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
         return (status, str(data))
 
-    def find_child(self,parent_pid):
+    def find_child(self, parent_pid):
         #
         # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
         #
@@ -179,4 +179,4 @@ class QemuTinyRunner(QemuRunner):
             basecmd = commands[p].split()[0]
             basecmd = os.path.basename(basecmd)
             if "qemu-system" in basecmd and "-serial unix" in commands[p]:
-                return [int(p),commands[p]]
+                return [int(p), commands[p]]
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index 0221bbee67..141ba2e25a 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -82,8 +82,8 @@ def process_binaries(d, params):
         rpm_deploy_dir = d.getVar("DEPLOY_DIR_RPM")
         arch = get_dest_folder(d.getVar("TUNE_FEATURES"), os.listdir(rpm_deploy_dir))
         arch_rpm_dir = os.path.join(rpm_deploy_dir, arch)
-        extracted_bin_dir = os.path.join(exportpath,"binaries", arch, "extracted_binaries")
-        packaged_bin_dir = os.path.join(exportpath,"binaries", arch, "packaged_binaries")
+        extracted_bin_dir = os.path.join(exportpath, "binaries", arch, "extracted_binaries")
+        packaged_bin_dir = os.path.join(exportpath, "binaries", arch, "packaged_binaries")
         # creating necessary directory structure in case testing is done in poky env.
         if export_env == "0":
             if not os.path.exists(extracted_bin_dir):
@@ -104,7 +104,7 @@ def process_binaries(d, params):
             else: # nothing to do here; running tests under bitbake, so we asume native binaries are in sysroots dir.
                 if param_list[1] or param_list[4]:
                     bb.warn("Native binary %s %s%s. Running tests under bitbake environment. Version can't be checked except when the test itself does it"
-                            " and binary can't be removed." % (param_list[0],"has assigned ver. " + param_list[1] if param_list[1] else "",
+                            " and binary can't be removed." % (param_list[0], "has assigned ver. " + param_list[1] if param_list[1] else "",
                             ", is marked for removal" if param_list[4] else ""))
         else:# the package is target aka DUT intended and it is either required to be delivered in an extracted form or in a packaged version
             target_rpm_file_list = [item for item in os.listdir(arch_rpm_dir) if re.search(param_list[0] + "-([0-9]+\.*)", item)]
@@ -121,7 +121,7 @@ def process_binaries(d, params):
                 if param_list[1]: # the package is versioned
                     for item in target_rpm_file_list:
                         if re.match(".*-{}-.*\.rpm".format(param_list[1]), item):
-                            destination = os.path.join(extracted_bin_dir,param_list[0], param_list[1])
+                            destination = os.path.join(extracted_bin_dir, param_list[0], param_list[1])
                             bb.utils.mkdirhier(destination)
                             extract_binary(os.path.join(arch_rpm_dir, item), destination)
                             break
@@ -130,7 +130,7 @@ def process_binaries(d, params):
                         return ""
                     return "extracted"
                 else: # no version provided, just extract one binary
-                    destination = os.path.join(extracted_bin_dir,param_list[0],
+                    destination = os.path.join(extracted_bin_dir, param_list[0],
                                                re.search(".*-([0-9]+\.[0-9]+)-.*rpm", target_rpm_file_list[0]).group(1))
                     bb.utils.mkdirhier(destination)
                     extract_binary(os.path.join(arch_rpm_dir, target_rpm_file_list[0]), destination)
@@ -168,9 +168,9 @@ def process_binaries(d, params):
                 for item in packaged_bin_file_list:
                     if param_list[1]:
                         if re.match("%s-%s.*rpm" % (param_list[0], param_list[1]), item): # package with version
-                            if not os.path.exists(os.path.join(extracted_bin_path, param_list[0],param_list[1])):
+                            if not os.path.exists(os.path.join(extracted_bin_path, param_list[0], param_list[1])):
                                 os.makedirs(os.path.join(extracted_bin_path, param_list[0], param_list[1]))
-                                extract_binary(os.path.join(packaged_bin_path, item), os.path.join(extracted_bin_path, param_list[0],param_list[1]))
+                                extract_binary(os.path.join(packaged_bin_path, item), os.path.join(extracted_bin_path, param_list[0], param_list[1]))
                                 bb.plain("Using {} for {}".format(os.path.join(packaged_bin_path, item), param_list[0]))
                             break
                     else:
@@ -210,7 +210,7 @@ def files_to_copy(base_dir):
     return files_list
 
 
-def send_bin_to_DUT(d,params):
+def send_bin_to_DUT(d, params):
     from oeqa.oetest import oeRuntimeTest
     param_list = params
     cleanup_list = list()
@@ -264,7 +264,7 @@ def send_bin_to_DUT(d,params):
 def rm_bin(removal_list): # need to know both if the binary is sent archived and the path where it is sent if archived
     from oeqa.oetest import oeRuntimeTest
     for item in removal_list:
-        (status,output) = oeRuntimeTest.tc.target.run("rm " + item)
+        (status, output) = oeRuntimeTest.tc.target.run("rm " + item)
         if status != 0:
             bb.warn("Failed to remove: %s. Please ensure connection with the target device is up and running and "
                      "you have the needed rights." % item)
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index f172555504..9a76e86d47 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -71,8 +71,8 @@ hasfolders = []
 allfolders = []
 
 def isFolder(value):
-    value = value.replace('${PYTHON_MAJMIN}',pyversion)
-    if os.path.isdir(value.replace('${libdir}',nativelibfolder + '/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder + '/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder + '/usr/lib32')):
+    value = value.replace('${PYTHON_MAJMIN}', pyversion)
+    if os.path.isdir(value.replace('${libdir}', nativelibfolder + '/usr/lib')) or os.path.isdir(value.replace('${libdir}', nativelibfolder + '/usr/lib64')) or os.path.isdir(value.replace('${libdir}', nativelibfolder + '/usr/lib32')):
         return True
     else:
         return False
@@ -122,7 +122,7 @@ print_indent('Getting dependencies for package: core', 0)
 
 output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package', '%s' % debugFlag]).decode('utf8')
 for coredep in output.split():
-    coredep = coredep.replace(pyversion,'${PYTHON_MAJMIN}')
+    coredep = coredep.replace(pyversion, '${PYTHON_MAJMIN}')
     if isCached(coredep):
         if coredep not in old_manifest['core']['cached']:
             old_manifest['core']['cached'].append(coredep)
@@ -173,7 +173,7 @@ for filedep in old_manifest['core']['files']:
 
 
     for pymodule_dep in output.split():
-        pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
+        pymodule_dep = pymodule_dep.replace(pyversion, '${PYTHON_MAJMIN}')
 
         if isCached(pymodule_dep):
             if pymodule_dep not in old_manifest['core']['cached']:
@@ -254,7 +254,7 @@ for pypkg in old_manifest:
         if isFolder(filedep):
             new_manifest[pypkg]['files'].append(filedep)
             # Asyncio (and others) are both the package and the folder name, we should not skip those...
-            path,mod = os.path.split(filedep)
+            path, mod = os.path.split(filedep)
             if mod != pypkg:
                 continue
         if '${bindir}' in filedep:
@@ -318,7 +318,7 @@ for pypkg in old_manifest:
             #   is folder_string inside path/folder1/folder2/filename?, 
             #   Yes, it works, but we waste a couple of milliseconds.
 
-            pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
+            pymodule_dep = pymodule_dep.replace(pyversion, '${PYTHON_MAJMIN}')
             inFolders = False
             for folder in allfolders:
                 # The module could have a directory named after it, e.g. xml, if we take out the filename from the path
@@ -427,11 +427,11 @@ for pypkg in new_manifest:
     new_manifest[pypkg]['rdepends'].sort()
 
 # Create the manifest from the data structure that was built
-with open('python3-manifest.json.new','w') as outfile:
-    json.dump(new_manifest,outfile, indent=4)
+with open('python3-manifest.json.new', 'w') as outfile:
+    json.dump(new_manifest, outfile, indent=4)
     outfile.write('\n')
 
-prepend_comments(comments,'python3-manifest.json.new')
+prepend_comments(comments, 'python3-manifest.json.new')
 
 if (repeated):
     error_msg = '\n\nERROR:\n'
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 2a6e7f7bd9..62629c6870 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -36,13 +36,13 @@ def fix_path(dep_path):
 
     # Handle multilib, is there a better way?
     if '/usr/lib32' in dep_path:
-        dep_path = dep_path.replace('/usr/lib32','${libdir}')
+        dep_path = dep_path.replace('/usr/lib32', '${libdir}')
     if '/usr/lib64' in dep_path:
-        dep_path = dep_path.replace('/usr/lib64','${libdir}')
+        dep_path = dep_path.replace('/usr/lib64', '${libdir}')
     if '/usr/lib' in dep_path:
-        dep_path = dep_path.replace('/usr/lib','${libdir}')
+        dep_path = dep_path.replace('/usr/lib', '${libdir}')
     if '/usr/include' in dep_path:
-        dep_path = dep_path.replace('/usr/include','${includedir}')
+        dep_path = dep_path.replace('/usr/include', '${includedir}')
     if '__init__.' in dep_path:
         dep_path = os.path.split(dep_path)[0]
     return dep_path
@@ -51,7 +51,7 @@ def fix_path(dep_path):
 # Module to import was passed as an argument
 current_module = str(sys.argv[1]).rstrip()
 if debug == True:
-    log = open('temp/log_%s' % current_module.strip('.*'),'w')
+    log = open('temp/log_%s' % current_module.strip('.*'), 'w')
     log.write('Module %s generated the following dependencies:\n' % current_module)
 try:
     m = importlib.import_module(current_module)
@@ -129,7 +129,7 @@ for item in dif:
     if soabi in dep_path:
         if debug == True:
             log.write('Shared library found in %s\n' % dep_path)
-        dep_path = dep_path.replace(soabi,'*')
+        dep_path = dep_path.replace(soabi, '*')
         print(dep_path)
         continue
     if "_sysconfigdata" in dep_path:
@@ -165,7 +165,7 @@ for item in dif:
         if debug == True:
             log.write(cached + '\n')
         cached = fix_path(cached)
-        cached = cached.replace(cpython_tag,'*')
+        cached = cached.replace(cpython_tag, '*')
         if "_sysconfigdata" in cached:
             cached = cached.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
         print(cached)
diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index be25d4982d..5e29fab2ce 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -83,7 +83,7 @@ outf = open(outfile, 'w')
 print(preamble.group(1))
 outf.write(preamble.group(1))
 for d in entry_dict_sorted:
-    outf.write("struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'],d))
+    outf.write("struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'], d))
     for f in entry_dict_sorted[d]['fields']:
         outf.write(entry_dict_sorted[d]['fields'][f] + '\n')
 
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 65d7e3fd86..0b7dff1712 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -378,7 +378,7 @@ class cyclictest_runner:
 
                         print()
                         print(tc_name(name), "[Min/us,Avg/us,Max/us]:",)
-                        print("%d,%.1f,%d" % (bm_min,bm_avg, bm_max))
+                        print("%d,%.1f,%d" % (bm_min, bm_avg, bm_max))
                         print("PASS:", tc_name(name))
                         print()
 
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 2c2568fc19..81d9badbc0 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -31,7 +31,7 @@ __version__ = "0.2.1"
 def logger_create():
     logger = logging.getLogger("")
     loggerhandler = logging.StreamHandler()
-    loggerhandler.setFormatter(logging.Formatter("[%(asctime)s] %(message)s","%H:%M:%S"))
+    loggerhandler.setFormatter(logging.Formatter("[%(asctime)s] %(message)s", "%H:%M:%S"))
     logger.addHandler(loggerhandler)
     logger.setLevel(logging.INFO)
     return logger
@@ -159,7 +159,7 @@ class Configuration(object):
             dest_dir = os.path.normpath(self.repos[name].get("dest_dir", "."))
             self.repos[name]["dest_dir"] = "." if not dest_dir else dest_dir
         if msg != "":
-            logger.error("configuration file %s has the following error: %s" % (self.conffile,msg))
+            logger.error("configuration file %s has the following error: %s" % (self.conffile, msg))
             if self.localconffile and 'last_revision' in missing_options:
                 logger.error("local configuration file %s may be missing configuration for combo branch %s" % (self.localconffile, self.combobranch))
             sys.exit(1)
@@ -169,7 +169,7 @@ class Configuration(object):
             logger.error("ERROR: patchutils package is missing, please install it (e.g. # apt-get install patchutils)")
             sys.exit(1)
 
-def runcmd(cmd,destdir=None,printerr=True,out=None,env=None):
+def runcmd(cmd, destdir=None, printerr=True, out=None, env=None):
     """
         execute command, raise CalledProcessError if fail
         return output if succeed
@@ -686,7 +686,7 @@ def update_with_patches(conf, components, revisions, repos):
             patch_cmd_range = "%s..%s" % (repo['last_revision'], top_revision)
             rev_cmd_range = patch_cmd_range
 
-        file_filter = repo.get('file_filter',".")
+        file_filter = repo.get('file_filter', ".")
 
         # Filter out unwanted files
         exclude = repo.get('file_exclude', '')
@@ -696,7 +696,7 @@ def update_with_patches(conf, components, revisions, repos):
                 file_filter += " ':!%s'" % p
 
         patch_cmd = "git format-patch -N %s --output-directory %s %s -- %s" % \
-            (prefix,repo_patch_dir, patch_cmd_range, file_filter)
+            (prefix, repo_patch_dir, patch_cmd_range, file_filter)
         output = runcmd(patch_cmd, ldir)
         logger.debug("generated patch set:\n%s" % output)
         patchlist = output.splitlines()
diff --git a/scripts/contrib/image-manifest b/scripts/contrib/image-manifest
index ebca44a365..f342e6b5dd 100755
--- a/scripts/contrib/image-manifest
+++ b/scripts/contrib/image-manifest
@@ -79,7 +79,7 @@ def get_recipe_list(manifest, tinfoil):
     pkglist = get_pkg_list(manifest)
     recipelist = []
     for pkg in pkglist:
-        recipe = pkg2recipe(tinfoil,pkg)
+        recipe = pkg2recipe(tinfoil, pkg)
         if recipe:
             if not recipe in recipelist:
                 recipelist.append(recipe)
@@ -251,16 +251,16 @@ def pkg_dependencies(args):
             data = recipe_info[p]
             if "-native" not in data.pn:
                 if "cross" not in data.pn:
-                    print(" %s (%s)" % (data.pn,p))
+                    print(" %s (%s)" % (data.pn, p))
 
         if args.native:
             print('\nThe following native packages are required to build %s' % recipe)
             for p in sorted(packages):
                 data = recipe_info[p]
                 if "-native" in data.pn:
-                    print(" %s(%s)" % (data.pn,p))
+                    print(" %s(%s)" % (data.pn, p))
                 if "cross" in data.pn:
-                    print(" %s(%s)" % (data.pn,p))
+                    print(" %s(%s)" % (data.pn, p))
 
 def default_config():
     vlist = OrderedDict()
@@ -324,7 +324,7 @@ def export_manifest_info(args):
     logger.debug('tmp dir: %s' % tmpoutdir)
 
     # export manifest
-    shutil.copy2(args.manifest,os.path.join(tmpoutdir, "manifest"))
+    shutil.copy2(args.manifest, os.path.join(tmpoutdir, "manifest"))
 
     with bb.tinfoil.Tinfoil(tracking=True) as tinfoil:
         tinfoil.logger.setLevel(logger.getEffectiveLevel())
@@ -339,7 +339,7 @@ def export_manifest_info(args):
 
         recipelist = []
         for pkg in pkglist:
-            recipe = pkg2recipe(tinfoil,pkg)
+            recipe = pkg2recipe(tinfoil, pkg)
             if recipe:
                 if not recipe in recipelist:
                     recipelist.append(recipe)
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index d88de43bd2..fda0b35e9d 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -120,7 +120,7 @@ def display_all(data_dict):
             packageconfig = 'None'
         print('PACKAGECONFIG %s' % packageconfig)
 
-        for flag,flag_val in data_dict[fn].getVarFlags("PACKAGECONFIG").items():
+        for flag, flag_val in data_dict[fn].getVarFlags("PACKAGECONFIG").items():
             if flag == "doc":
                 continue
             print('PACKAGECONFIG[%s] %s' % (flag, flag_val))
diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 8554a5db67..213edb5b15 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -55,7 +55,7 @@ import scriptpath
 PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
-DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
+DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0], 'buildtools')
 DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
 DEFAULT_RELEASE = 'yocto-3.2_M3'
 DEFAULT_INSTALLER_VERSION = '3.1+snapshot'
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 56f5bb24d2..3b251a697b 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -8,7 +8,7 @@ import json
 import logging
 import os
 import re
-from collections import namedtuple,OrderedDict
+from collections import namedtuple, OrderedDict
 from statistics import mean
 
 
diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
index 01174edae5..8e8800c0aa 100644
--- a/scripts/lib/devtool/export.py
+++ b/scripts/lib/devtool/export.py
@@ -52,7 +52,7 @@ def export(args, config, basepath, workspace):
         logger.info('Workspace contains no recipes, nothing to export')
         return 0
     else:
-        for param, recipes in {'include':args.include,'exclude':args.exclude}.items():
+        for param, recipes in {'include': args.include, 'exclude': args.exclude}.items():
             for recipe in recipes:
                 if recipe not in workspace:
                     logger.error('Recipe (%s) on %s argument not in the current workspace' % (recipe, param))
diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
index 95384c5333..9275ba7c52 100644
--- a/scripts/lib/devtool/menuconfig.py
+++ b/scripts/lib/devtool/menuconfig.py
@@ -45,19 +45,19 @@ def menuconfig(args, config, basepath, workspace):
         check_workspace_recipe(workspace, args.component)
         pn = rd.getVar('PN', True)
 
-        if not rd.getVarFlag('do_menuconfig','task'):
+        if not rd.getVarFlag('do_menuconfig', 'task'):
             raise DevtoolError("This recipe does not support menuconfig option")
 
-        workspace_dir = os.path.join(config.workspace_path,'sources')
+        workspace_dir = os.path.join(config.workspace_path, 'sources')
         kconfigpath = rd.getVar('B')
-        pn_src = os.path.join(workspace_dir,pn)
+        pn_src = os.path.join(workspace_dir, pn)
 
         # add check to see if oe_local_files exists or not
-        localfilesdir = os.path.join(pn_src,'oe-local-files')
+        localfilesdir = os.path.join(pn_src, 'oe-local-files')
         if not os.path.exists(localfilesdir):
             bb.utils.mkdirhier(localfilesdir)
             # Add gitignore to ensure source tree is clean
-            gitignorefile = os.path.join(localfilesdir,'.gitignore')
+            gitignorefile = os.path.join(localfilesdir, '.gitignore')
             with open(gitignorefile, 'w') as f:
                 f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
                 f.write('*\n')
@@ -68,12 +68,12 @@ def menuconfig(args, config, basepath, workspace):
     logger.info('Launching menuconfig')
     exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True)
     fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
-    res = standard._create_kconfig_diff(pn_src,rd,fragment)
+    res = standard._create_kconfig_diff(pn_src, rd, fragment)
 
     return 0
 
 def register_commands(subparsers, context):
     """register devtool subcommands from this plugin"""
-    parser_menuconfig = subparsers.add_parser('menuconfig',help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command (for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced')
+    parser_menuconfig = subparsers.add_parser('menuconfig', help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command (for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced')
     parser_menuconfig.add_argument('component', help='compenent to alter config')
-    parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
+    parser_menuconfig.set_defaults(func=menuconfig, fixed_setup=context.fixed_setup)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2bf65ad072..27f50b7ab1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -457,7 +457,7 @@ def sync(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
-def symlink_oelocal_files_srctree(rd,srctree):
+def symlink_oelocal_files_srctree(rd, srctree):
     import oe.patch
     if os.path.abspath(rd.getVar('S')) == os.path.abspath(rd.getVar('WORKDIR')):
         # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
@@ -648,9 +648,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
 
             if os.path.exists(workshareddir) and (not os.listdir(workshareddir) or kernelVersion != staging_kerVer):
                 shutil.rmtree(workshareddir)
-                oe.path.copyhardlinktree(srcsubdir,workshareddir)
+                oe.path.copyhardlinktree(srcsubdir, workshareddir)
             elif not os.path.exists(workshareddir):
-                oe.path.copyhardlinktree(srcsubdir,workshareddir)
+                oe.path.copyhardlinktree(srcsubdir, workshareddir)
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
@@ -680,7 +680,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                 shutil.move(tempdir_localdir, srcsubdir)
 
             shutil.move(srcsubdir, srctree)
-            symlink_oelocal_files_srctree(d,srctree)
+            symlink_oelocal_files_srctree(d, srctree)
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
@@ -753,7 +753,7 @@ def get_staging_kver(srcdir):
     kerver = []
     staging_kerVer = ""
     if os.path.exists(srcdir) and os.listdir(srcdir):
-        with open(os.path.join(srcdir,"Makefile")) as f:
+        with open(os.path.join(srcdir, "Makefile")) as f:
             version = [next(f) for x in range(5)][1:4]
             for word in version:
                 kerver.append(word.split('= ')[1].split('\n')[0])
@@ -824,10 +824,10 @@ def modify(args, config, basepath, workspace):
             staging_kerVer = get_staging_kver(srcdir)
             staging_kbranch = get_staging_kbranch(srcdir)
             if (os.path.exists(srcdir) and os.listdir(srcdir)) and (kernelVersion in staging_kerVer and staging_kbranch == kbranch):
-                oe.path.copyhardlinktree(srcdir,srctree)
+                oe.path.copyhardlinktree(srcdir, srctree)
                 workdir = rd.getVar('WORKDIR')
                 srcsubdir = rd.getVar('S')
-                localfilesdir = os.path.join(srctree,'oe-local-files')
+                localfilesdir = os.path.join(srctree, 'oe-local-files')
                 # Move local source files into separate subdir
                 recipe_patches = [os.path.basename(patch) for patch in oe.recipeutils.get_recipe_patches(rd)]
                 local_files = oe.recipeutils.get_recipe_local_files(rd)
@@ -853,7 +853,7 @@ def modify(args, config, basepath, workspace):
                     with open(os.path.join(srctree, 'oe-local-files', '.gitignore'), 'w') as f:
                         f.write('# Ignore local files, by default. Remove this file ''if you want to commit the directory to Git\n*\n')
 
-                symlink_oelocal_files_srctree(rd,srctree)
+                symlink_oelocal_files_srctree(rd, srctree)
 
                 task = 'do_configure'
                 res = tinfoil.build_targets(pn, task, handle_events=True)
@@ -861,7 +861,7 @@ def modify(args, config, basepath, workspace):
                 # Copy .config to workspace
                 kconfpath = rd.getVar('B')
                 logger.info('Copying kernel config to workspace')
-                shutil.copy2(os.path.join(kconfpath, '.config'),srctree)
+                shutil.copy2(os.path.join(kconfpath, '.config'), srctree)
 
                 # Set this to true, we still need to get initial_rev
                 # by parsing the git repo
@@ -964,7 +964,7 @@ def modify(args, config, basepath, workspace):
                         '        mv ${S}/.config ${S}/.config.old\n'
                         '    fi\n'
                         '}\n')
-            if rd.getVarFlag('do_menuconfig','task'):
+            if rd.getVarFlag('do_menuconfig', 'task'):
                 f.write('\ndo_configure_append() {\n'
                 '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
                 '        cp ${B}/.config ${S}/.config.baseline\n'
@@ -1648,7 +1648,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
         if filter_patches:
             new_p = OrderedDict()
-            upd_p = OrderedDict((k,v) for k,v in upd_p.items() if k in filter_patches)
+            upd_p = OrderedDict((k, v) for k, v in upd_p.items() if k in filter_patches)
             remove_files = [f for f in remove_files if f in filter_patches]
         updatefiles = False
         updaterecipe = False
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 1a75252321..0605a01f87 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -27,7 +27,7 @@ from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_r
 logger = logging.getLogger('devtool')
 
 def _run(cmd, cwd=''):
-    logger.debug("Running command %s> %s" % (cwd,cmd))
+    logger.debug("Running command %s> %s" % (cwd, cmd))
     return bb.process.run('%s' % cmd, cwd=cwd)
 
 def _get_srctree(tmpdir):
@@ -47,7 +47,7 @@ def _copy_source_code(orig, dest):
 def _remove_patch_dirs(recipefolder):
     for root, dirs, files in os.walk(recipefolder):
         for d in dirs:
-            shutil.rmtree(os.path.join(root,d))
+            shutil.rmtree(os.path.join(root, d))
 
 def _recipe_contains(rd, var):
     rf = rd.getVar('FILE')
@@ -236,7 +236,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         # Copy in new ones
         _copy_source_code(tmpsrctree, srctree)
 
-        (stdout,_) = __run('git ls-files --modified --others')
+        (stdout, _) = __run('git ls-files --modified --others')
         filelist = stdout.splitlines()
         pbar = bb.ui.knotty.BBProgress('Adding changed files', len(filelist))
         pbar.start()
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index e9d52bb67b..ce91c3713c 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -49,7 +49,7 @@ def find_target_file(targetpath, d, pkglist=None):
                       '/etc/group': '/etc/group should be managed through the useradd and extrausers classes',
                       '/etc/shadow': '/etc/shadow should be managed through the useradd and extrausers classes',
                       '/etc/gshadow': '/etc/gshadow should be managed through the useradd and extrausers classes',
-                      '${sysconfdir}/hostname': '${sysconfdir}/hostname contents should be set by setting hostname_pn-base-files = "value" in configuration',}
+                      '${sysconfdir}/hostname': '${sysconfdir}/hostname contents should be set by setting hostname_pn-base-files = "value" in configuration', }
 
     for pthspec, message in invalidtargets.items():
         if fnmatch.fnmatchcase(targetpath, d.expand(pthspec)):
@@ -231,7 +231,7 @@ def appendfile(args):
             logger.warning('This file looks like it is a binary or otherwise the output of compilation. If it is, you should consider building it properly instead of substituting a binary file directly.')
 
     if args.recipe:
-        recipes = {args.targetpath: [args.recipe],}
+        recipes = {args.targetpath: [args.recipe], }
     else:
         try:
             recipes = find_target_file(args.targetpath, tinfoil.config_data)
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 67f3f4980a..9d531948e5 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1113,7 +1113,7 @@ def crunch_license(licfile):
             # Squash spaces, and replace smart quotes, double quotes
             # and backticks with single quotes
             line = oe.utils.squashspaces(line.strip())
-            line = line.replace(u"\u2018", "'").replace(u"\u2019", "'").replace(u"\u201c","'").replace(u"\u201d", "'").replace('"', '\'').replace('`', '\'')
+            line = line.replace(u"\u2018", "'").replace(u"\u2019", "'").replace(u"\u201c", "'").replace(u"\u201d", "'").replace('"', '\'').replace('`', '\'')
             if line:
                 lictext.append(line)
 
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index b9bfa936fa..44b398d792 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -680,7 +680,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 process_macro(in_keyword, partial)
 
         if extravalues:
-            for k,v in list(extravalues.items()):
+            for k, v in list(extravalues.items()):
                 if v:
                     if v.startswith('$') or v.startswith('@') or v.startswith('%'):
                         del extravalues[k]
diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index a847dd9caf..2bd4f6f136 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -98,10 +98,10 @@ class ManualTestRunner(object):
                 print('Expected output: %s' % expected_output)
         while True:
             done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n').lower()
-            result_types = {'p':'PASSED',
-                            'f':'FAILED',
-                            'b':'BLOCKED',
-                            's':'SKIPPED'}
+            result_types = {'p': 'PASSED',
+                            'f': 'FAILED',
+                            'b': 'BLOCKED',
+                            's': 'SKIPPED'}
             if done in result_types:
                 for r in result_types:
                     if done == r:
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 0c56b64cb2..a4f1d11bef 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -167,7 +167,7 @@ class ResultsTextReport(object):
         reportvalues = []
         machines = []
         cols = ['passed', 'failed', 'skipped']
-        maxlen = {'passed': 0, 'failed': 0, 'skipped': 0, 'result_id': 0, 'testseries': 0, 'ptest': 0,'ltptest': 0, 'ltpposixtest': 0}
+        maxlen = {'passed': 0, 'failed': 0, 'skipped': 0, 'result_id': 0, 'testseries': 0, 'ptest': 0, 'ltptest': 0, 'ltpposixtest': 0}
         for line in test_count_reports:
             total_tested = line['passed'] + line['failed'] + line['skipped']
             vals = {}
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 174bd27f2f..cef201aec8 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -280,7 +280,7 @@ class Disk:
     def __getattr__(self, name):
         """Get path to the executable in a lazy way."""
         if name in ("mdir", "mcopy", "mdel", "mdeltree", "sfdisk", "e2fsck",
-                    "resize2fs", "mkswap", "mkdosfs", "debugfs","blkid"):
+                    "resize2fs", "mkswap", "mkdosfs", "debugfs", "blkid"):
             aname = "_%s" % name
             if aname not in self.__dict__:
                 setattr(self, aname, find_executable(name, self.paths))
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 5f9a1f64bf..9ae3f52dea 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -344,9 +344,9 @@ class PartitionedImage():
                 #make sure the fsuuid for vfat/msdos align with format 0xYYYYYYYY
                 if part.fstype == 'vfat' or part.fstype == 'msdos':
                     if part.fsuuid.upper().startswith("0X"):
-                        part.fsuuid = '0x' + part.fsuuid.upper()[2:].rjust(8,"0")
+                        part.fsuuid = '0x' + part.fsuuid.upper()[2:].rjust(8, "0")
                     else:
-                        part.fsuuid = '0x' + part.fsuuid.upper().rjust(8,"0")
+                        part.fsuuid = '0x' + part.fsuuid.upper().rjust(8, "0")
 
     def prepare(self, imager):
         """Prepare an image. Call prepare method of all image partitions."""
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 75dd23efa3..aef04a18c0 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -497,7 +497,7 @@ def find_path(args):
     found = False
     for root, dirs, files in os.walk(os.path.join(args.pkgdata_dir, 'runtime')):
         for fn in files:
-            with open(os.path.join(root,fn)) as f:
+            with open(os.path.join(root, fn)) as f:
                 for line in f:
                     if line.startswith('FILES_INFO:'):
                         val = line.split(':', 1)[1].strip()
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index bc3ab43823..9e50f30962 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -43,26 +43,26 @@ for line in fileinput.input(args):
             if archmode:
                 if line.startswith("Architecture:"):
                     arch = line.split(": ")[1]
-                    print("%s %s" % (pkg,arch))
+                    print("%s %s" % (pkg, arch))
             elif filemode:
                 if line.startswith("Version:"):
                     ver = line.split(": ")[1]
                 elif line.startswith("Architecture:"):
                     arch = line.split(": ")[1]
-                    print("%s %s_%s_%s.ipk %s" % (pkg,pkg,ver,arch,arch))
+                    print("%s %s_%s_%s.ipk %s" % (pkg, pkg, ver, arch, arch))
             elif vermode:
                 if line.startswith("Version:"):
                     ver = line.split(": ")[1]
                 elif line.startswith("Architecture:"):
                     arch = line.split(": ")[1]
-                    print("%s %s %s" % (pkg,arch,ver))
+                    print("%s %s %s" % (pkg, arch, ver))
             else:
                 if line.startswith("Depends:"):
                     depval = line.split(": ")[1]
                     deps = depval.split(", ")
                     for dep in deps:
                         dep = verregex.sub('', dep)
-                        print("%s|%s" % (pkg,dep))
+                        print("%s|%s" % (pkg, dep))
                 elif line.startswith("Recommends:"):
                     recval = line.split(": ")[1]
                     recs = recval.split(", ")
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index b6e49567f1..7572b59b8d 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -454,7 +454,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                             [(sample.time,
                               # Sum up used space of all volumes including the current one
                               # so that the graphs appear as stacked on top of each other.
-                              functools.reduce(lambda x,y: x + y,
+                              functools.reduce(lambda x, y: x + y,
                                      [sample.records[volume] - min_used[volume]
                                       for volume in volumes[0:i]
                                       if volume in sample.records],
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 3dc5da081b..2de03937ce 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -267,7 +267,7 @@ def _parse_headers(file):
             value = line.strip()
         headers[last] += value
         return headers, last
-    return reduce(parse, file.read().split('\n'), (defaultdict(str),''))[0]
+    return reduce(parse, file.read().split('\n'), (defaultdict(str), ''))[0]
 
 def _parse_timed_blocks(file):
     """Parses (ie., splits) a file into so-called timed-blocks. A
@@ -469,7 +469,7 @@ def _parse_proc_disk_stat_log(file):
 
     for time, lines in _parse_timed_blocks(file):
         sample = DiskStatSample(time)
-        relevant_tokens = [linetokens for linetokens in map(lambda x: x.split(),lines) if is_relevant_line(linetokens)]
+        relevant_tokens = [linetokens for linetokens in map(lambda x: x.split(), lines) if is_relevant_line(linetokens)]
 
         for tokens in relevant_tokens:
             disk, rsect, wsect, use = tokens[2], int(tokens[5]), int(tokens[9]), int(tokens[12])
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 4a55427655..301583e9aa 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -161,7 +161,7 @@ class Process:
             if self.parent == None and self.pid // 1000 > 1 and \
                 not (self.ppid == 2000 or self.pid == 2000): # kernel threads: ppid=2
                 self.writer.warn("Missing CONFIG_PROC_EVENTS: no parent for pid '%i' ('%s') with ppid '%i'"
-                                 % (self.pid,self.cmd,self.ppid))
+                                 % (self.pid, self.cmd, self.ppid))
 
     def get_end_time(self):
         return self.start_time + self.duration
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
index 1f66027a6e..3ea3592441 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
@@ -28,7 +28,7 @@ class TestBCParser(unittest.TestCase):
 		self.name = "My first unittest"
 		self.rootdir = bootchart_dir
 
-	def mk_fname(self,f):
+	def mk_fname(self, f):
 		return os.path.join(self.rootdir, f)
 
 	def testParseHeader(self):
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
index a30e13ca06..f9f49cc340 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
@@ -27,7 +27,7 @@ class TestProcessTree(unittest.TestCase):
         self.processtree = process_tree.ProcessTree(writer, None, trace.ps_stats,
             trace.ps_stats.sample_period, None, options.prune, None, None, False, for_testing=True)
 
-    def mk_fname(self,f):
+    def mk_fname(self, f):
         return os.path.join(self.rootdir, f)
 
     def flatten(self, process_tree):
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index b919e0167d..4269eacb34 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -32,7 +32,7 @@ old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
 def get_arch():
     f.seek(0)
     e_ident = f.read(16)
-    ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
+    ei_mag0, ei_mag1_3, ei_class = struct.unpack("<B3sB11x", e_ident)
 
     if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
         return 0
@@ -69,7 +69,7 @@ def change_interpreter(elf_file_name):
         ph_fmt = "<IIQQQQQQ"
 
     """ look for PT_INTERP section """
-    for i in range(0,e_phnum):
+    for i in range(0, e_phnum):
         f.seek(e_phoff + i * e_phentsize)
         ph_hdr = f.read(e_phentsize)
         if arch == 32:
@@ -123,7 +123,7 @@ def change_dl_sysdirs(elf_file_name):
     sysdirs = sysdirs_len = ""
 
     """ change ld.so.cache path and default libs path for dynamic loader """
-    for i in range(0,e_shnum):
+    for i in range(0, e_shnum):
         f.seek(e_shoff + i * e_shentsize)
         sh_hdr = f.read(e_shentsize)
 
diff --git a/scripts/runqemu b/scripts/runqemu
index fceebfce4c..259d32cd2a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -795,7 +795,7 @@ class BaseConfig(object):
 
         mach = self.get('MACHINE')
         if not mach.startswith('qemumips'):
-            self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
+            self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m', '').strip() + 'M'
 
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
 
@@ -1241,7 +1241,7 @@ class BaseConfig(object):
                     elif drive_type.startswith("/dev/vdb"):
                         logger.info('Using block virtio drive')
                         vm_drive = '-drive id=disk0,file=%s,if=none,format=%s -device virtio-blk-device,drive=disk0%s' \
-                                    % (self.rootfs, rootfs_format,qb_rootfs_extra_opt)
+                                    % (self.rootfs, rootfs_format, qb_rootfs_extra_opt)
                     else:
                         # virtio might have been selected explicitly (just use it), or
                         # is used as fallback (then warn about that).
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index b9c1c42f41..dbdff0714f 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -80,8 +80,8 @@ class Report:
         self.title = title
         self.sizes = Sizes(glob)
         self.parts = []
-        self.totals = {"total":0, "text":0, "data":0, "bss":0}
-        self.deltas = {"total":0, "text":0, "data":0, "bss":0}
+        self.totals = {"total": 0, "text": 0, "data": 0, "bss": 0}
+        self.deltas = {"total": 0, "text": 0, "data": 0, "bss": 0}
 
     def show(self, indent=""):
         rule = str.ljust(indent, 80, '-')
diff --git a/scripts/wic b/scripts/wic
index 17ed688bf4..6c62f9e84e 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -337,7 +337,7 @@ def wic_init_parser_create(subparser):
                       dest='compressor',
                       help="compress image with specified compressor")
     subparser.add_argument("-m", "--bmap", action="store_true", help="generate .bmap")
-    subparser.add_argument("--no-fstab-update",action="store_true",
+    subparser.add_argument("--no-fstab-update", action="store_true",
                       help="Do not change fstab file.")
     subparser.add_argument("-v", "--vars", dest='vars_dir',
                       help="directory with <image>.env files that store "
-- 
2.17.1

