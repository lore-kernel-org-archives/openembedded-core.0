Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.3907.1624428700620260400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 23:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y7l4AnuQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624428698; i=@fujitsu.com;
	bh=iAIVSHx1BydEMgM34QCWJ+qcq/lragYtghnC3cyzwAI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y7l4AnuQitXDG4bb9XR7oYjS8WYtIBl0admSSHS2xZm2gthvXKDAMr2kyg6k+Mess
	 pyZEUnrlR6Qec3NM7vX/lc4sCbLxh3l//YtRwHo/9oFesDhuwAYhrU9yGkh4di8JzI
	 Z7CZTXQLosTm8UM96NHbrkLAocBQlbTKK2Bf615RPShoQd4JLniZz65y6XtzZYrhkz
	 B6oy2HGeIqMsaRQkxNib6guUCHUu1t37Uk5YXm8C8WPTMVNcJMcRX83TDcCW/q1lbD
	 JWyg9VatQNVXNMUG9Poz79Q5BorlAgRRD99BvtpnzkeCyRCpCw2QN8fPPkwsgFnWzB
	 3ianP0kAlRmmQ==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 1E/EF-45811-A90D2D06; Wed, 23 Jun 2021 06:11:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVXfmhUs
  JBi/2qVvc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBlXV51iLnitVnH24x2mBsYLCl2MXBxCArOY
  JA5vbGGDcE4wSjzvfMbYxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg9jCAk4S/
  XO/sYDYLAKqEvP37AezeYHiF8+8ZwaxJQQUJKY8hLA5BZwlbuzfywZiCwHVPPu2gx2iXlDi5M
  wnLBDzJSQOvngB1asoMftyMwuEXSHx+vAl5gmM/LOQtMxC0rKAkWkVo3lSUWZ6RkluYmaOrqG
  Bga6hoZGuoaWJrpmZXmKVbqJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZgMKYUHHLawfj+
  9Qe9Q4ySHExKorzX2y8lCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgVT8PlBMsSk1PrUjLzAFGB
  kxagoNHSYQ3FiTNW1yQmFucmQ6ROsWoKCXOmwCSEABJZJTmwbXBovESo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHe0HNAU3gy80rgpr8CWswEtFjh90WQxSWJCCmpBqZFl/wbY0/uZwq/lLN
  B0ch3fuyaQ4Kv90vVFFb+unvJ67TdLI5+fZPt5l0fvx67Ft01T2jBx03/7j01OWGQr695WMgg
  9colt9mbZnJoKa3tdODImLXokJrDv2LDG9cnnJc6/8J0aV+ejtzRDXNEnsl0MfhpVZdO3PHMw
  NTuYu6VKVVrnp+dpHveIrLo4dXfGROazJx3f0ti9lBVmDHfpHbJA16hN59LY3ReZ76L4JqpaP
  Rs84IVZ5IPrzep5snhWV2hEah6+sWkM9NPbdv4SmDejkOnUsTipVce4eltvhRwTvqYwJvXV6/
  LMzvcWXT0zDGGr4Un+w49L/OzuXCFscrk27Xzske3Ln21W+xg4s6EY0osxRmJhlrMRcWJAGuY
  eBpBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-271.messagelabs.com!1624428697!202629!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17099 invoked from network); 23 Jun 2021 06:11:37 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jun 2021 06:11:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15N6BTZw032005
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 07:11:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 23 Jun 2021 07:11:33 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.20.3 -> 1.21.0
Date: Wed, 23 Jun 2021 14:11:06 +0800
Message-ID: <1624428666-81189-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624428666-81189-1-git-send-email-wangmy@fujitsu.com>
References: <1624428666-81189-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch

License-Updage: Copyright year updated to 2021

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-and-so-on-for-libraries-by-default-.patch | 19 +++++++++----------
 ...umpy_1.20.3.bb => python3-numpy_1.21.0.bb} |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.20.3.bb => python3-numpy_1.21.0.bb} (92%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index cdb6a473d2..9f5f25f9b5 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -8,16 +8,15 @@ Subject: [PATCH] Don't search /usr and so on for libraries by default to
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
- numpy/distutils/system_info.py | 42 ++++------------------------------
- 1 file changed, 5 insertions(+), 37 deletions(-)
+ numpy/distutils/system_info.py | 42 +++++-----------------------------
+ 1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index 3a6a7b2..6c2c3da 100644
+index 82e864a..135246d 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -309,45 +309,13 @@ if sys.platform == 'win32':
+@@ -323,44 +323,14 @@ if sys.platform == 'win32':
          add_system_root(os.path.join(conda_dir, 'Library'))
  
  else:
@@ -25,7 +24,7 @@ index 3a6a7b2..6c2c3da 100644
 -                                 '/opt/local/lib', '/sw/lib'], platform_bits)
      default_runtime_dirs = []
 -    default_include_dirs = ['/usr/local/include',
--                            '/opt/include', '/usr/include',
+-                            '/opt/include',
 -                            # path of umfpack under macports
 -                            '/opt/local/include/ufsparse',
 -                            '/opt/local/include', '/sw/include',
@@ -34,8 +33,7 @@ index 3a6a7b2..6c2c3da 100644
 -
 -    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
 -                                     '/usr/lib'], platform_bits)
--    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include',
--                                '/usr/include']
+-    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include']
 -
 -    if os.path.exists('/usr/lib/X11'):
 -        globbed_x11_dir = glob('/usr/lib/*/libX11.so')
@@ -59,15 +57,16 @@ index 3a6a7b2..6c2c3da 100644
 -                # gcc supports the "-print-multiarch" option
 -                default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
 -                default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
+ 
 +    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
 +    default_include_dirs = ['/deaddir/include']
 +    default_src_dirs = ['.', '/deaddir/src']
- 
++
 +    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
 +    default_x11_include_dirs = ['/deaddir/include']
  
  if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
      default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.0.bb
similarity index 92%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.21.0.bb
index d160fd655b..7ad2f061bf 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=aa1ecaef18152f75bfae546b29c49d3c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b076ad374a7d311ba3126a22b2d52596"
 
 SRCNAME = "numpy"
 
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "b7340f0628ce1823c151e3d2a2a8cba2a3ff1357fba4475a24b1816e75c21f90"
+SRC_URI[sha256sum] = "b662c841b29848c04d9134f31dbaa7d4c8e673f45bb3a5f28d02f49c424d558a"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1

