Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5607F7A9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 17:07:28 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 29so8411895pgm.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 09:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=tfg8532q7NxxJeMQpSmq3v/FDa1jEPGEmUpqLcmkK5k=;
	b=orS045/7FAfY/C7tk7A/6p4lDhTDz/Qbf/Pt2MuPR5Y19Ge0WkjLMlV+bAuf7isERc
	KTFCgNCcsuDx+CSbh+Cn9BlFGcIrB+ZMzpcVIHNUmvzDb0Hq8/jL6f0RTh5BC5WeONmy
	DJgE7RVG/cXTAh2fqwCKaoUoY9/SCgweZdriuUZro92p4d2Je0GRclv1GFvIsPM/4M8/
	y9CNLuwKVaUI30zUKjU0t2d0jyoLbmttRLz9WNwLrScPfMIrUHikxqQ8hYZLXtNH6gxT
	+xL2H+yFPyopffi8HQLhnxVoAkQ1/y/cIBUkl3OdFzBgGN5iM0669usicaCSTQd3qJ7I
	Bfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tfg8532q7NxxJeMQpSmq3v/FDa1jEPGEmUpqLcmkK5k=;
	b=k91p0tKurcpIPnc20bKsa8bMw0nesggSyfN7Neu5f2k54Kj2p4XNeJIIwZV+KFHFgt
	qZmrE6Q4fiHSv8C+uA3JyFcAUWRmzruHa9atuDH6ffDvIF+r6niOrytXWBpotEs7Rg/w
	+lpfZxS84FIjY6p4xRpJRhd3diHAfeq2iXuIe9u4dC4TZ2CLhKf+aeJ9sBaIPtdyoEDI
	cv7YsK/r+sJBIK51muoic3IqTSsb/y6EwVCt/GFs6U8SM90tppQAucH2FoylPJgSXxc9
	Ed3N6ydUnJ5IgGS0bIopRoH4Hd9fGdsxwHF2LBKMM+2OZM5F+Lu6tiuttUwCDK7OM/Mu
	+X/Q==
X-Gm-Message-State: APjAAAUX4FRsJgK0rUaUjtXOPfNMlSVWSXcyNMHmV+0Gh0oCtqfnz4PI
	5fQouuaP+sz90c+2rc0/cZb2Hxam
X-Google-Smtp-Source: APXvYqz/3LfgquHHkae6jQOjc/ULXuLdc6/16c1LE+Hrp05AHxDKQAa/lBI8s20/Rvau4ov5FxfpdQ==
X-Received: by 2002:a63:5511:: with SMTP id j17mr25672065pgb.70.1574010449141; 
	Sun, 17 Nov 2019 09:07:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	c1sm16843328pjc.23.2019.11.17.09.07.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Nov 2019 09:07:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2019 09:06:55 -0800
Message-Id: <cover.1574009986.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior 00/28] merge request
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
X-List-Received-Date: Sun, 17 Nov 2019 17:07:29 -0000

cover letter only

Please merge this series into warrior mainline

The following changes since commit 726c3b92298981f5aa2f2449ceeec7b4bf84ed29:

  build-appliance-image: Update to warrior head revision (2019-10-30 13:55:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-next

Adrian Bunk (2):
  go: Upgrade 1.12.5 -> 1.12.6
  python3: Upgrade 3.7.4 -> 3.7.5

Alexander Kanavin (1):
  go: update 1.12.1->1.12.5

Changqing Li (1):
  python3: fix do_install fail for parallel buiild

Chen Qi (1):
  python3: CVE-2019-16056

Jason Wessel (1):
  pseudo: Fix openat() with a symlink pointing to a directory

Joe Slater (2):
  libtiff: fix CVE-2019-17546
  libxslt: fix CVE-2019-18197

Joshua Watt (2):
  python3: Reformat sysconfig
  python3: Fix .pyc file reproduciblility

Khem Raj (1):
  go-1.12: update to 1.12.9 minor release

Matthias Schoepfer via Openembedded-core (1):
  python3: fix build on softfloat mips

Mingli Yu (1):
  python3: fix the test_locale output format

Niclas Svensson (1):
  devtool: finish: Keep patches ordered when updating bbappend

Peter Kjellerstedt (8):
  meson: Backport patch to handle strings in cross file args
  meson.bbclass: Remove the MESON_*_ARGS variables
  nativesdk-meson: Remove some unused variables
  devtool: Avoid failure for recipes with S == WORKDIR and no local
    files
  package_rpm.bbclass: Remove a misleading bb.note()
  tzdata: Correct the packaging of /etc/localtime and /etc/timezone
  devtool: finish: Add suppport for the --no-clean option
  lib/oe/lsb: Make sure the distro ID is always lowercased

Ricardo Ribalda Delgado (1):
  python3: python3: Fix build error x86->x86

Richard Purdie (2):
  pseudo: Drop static linking to sqlite3
  pseudo: Add statx support to fix fedora30 issues

Ross Burton (2):
  patch: the CVE-2019-13638 fix also handles CVE-2018-20969
  file: fix CVE-2019-18218

Trevor Gamblin (1):
  tiff: fix CVE-2019-14973

 meta/classes/meson.bbclass                         |  15 +-
 meta/classes/package_rpm.bbclass                   |   5 +-
 meta/conf/distro/include/no-static-libs.inc        |   4 -
 meta/lib/oe/lsb.py                                 |   8 +-
 .../file/file/CVE-2019-18218.patch                 |  55 +++
 meta/recipes-devtools/file/file_5.36.bb            |   3 +-
 meta/recipes-devtools/go/go-1.12.inc               |   6 +-
 meta/recipes-devtools/meson/meson.inc              |   1 +
 ...e-strings-in-cross-file-args.-Closes-4671.patch |  87 +++++
 .../meson/nativesdk-meson_0.49.2.bb                |   5 -
 ...ke-ed-directly-instead-of-using-the-shell.patch |   4 +-
 .../pseudo/files/0001-Add-statx.patch              | 106 ++++++
 meta/recipes-devtools/pseudo/pseudo.inc            |  19 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   3 +-
 ...code-lib-as-location-for-site-packages-an.patch |   2 +-
 ...ix-Issue36464-parallel-build-race-problem.patch |  34 ++
 ...-Use-FLAG_REF-always-for-interned-strings.patch |  35 ++
 ...roper-detection-of-mips-architecture-for-.patch | 201 ++++++++++
 ...-cc_basename-to-replace-CC-for-checking-c.patch |   2 +-
 ..._locale.py-correct-the-test-output-format.patch |  46 +++
 .../python/python3/crosspythonpath.patch           |  25 ++
 .../python/python3/reformat_sysconfig.py           |  21 ++
 .../python/{python3_3.7.4.bb => python3_3.7.5.bb}  |  17 +-
 meta/recipes-extended/timezone/tzdata.bb           |   5 +-
 .../libtiff/tiff/CVE-2019-14973.patch              | 415 +++++++++++++++++++++
 .../libtiff/tiff/CVE-2019-17546.patch              | 103 +++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |   4 +-
 .../libxslt/files/CVE-2019-18197.patch             |  33 ++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |   1 +
 scripts/lib/devtool/standard.py                    |  17 +-
 30 files changed, 1218 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-18218.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
 create mode 100644 meta/recipes-devtools/python/python3/crosspythonpath.patch
 create mode 100644 meta/recipes-devtools/python/python3/reformat_sysconfig.py
 rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb} (93%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-18197.patch

-- 
2.7.4


