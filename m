Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1E15F6B513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:45 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w7so1184271plz.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=h/lzs4kMSHgsPKDJQUBJbKL1gg/TqWj58hyhAra4xKc=;
	b=GbXPn4RtS332bv15V0hvleNaBkqPFCUiqeSg1E2bUvqgubWwVR07YBvy71LJZA3yQn
	TnrV17Ps73oWau4Ripovef0QcVgeSf7HYBxA7fpzGnFJx7nTwdLX+OUDySuuEkfpdbR6
	7KGo/G/E9Z8sPlh6hmj9Xs3UWGGGvDhBiJfMs+NzA3B71KPWGzKpotus4v3ms12+x8mQ
	rsV/PN2mIosRBaXIcHe7seXzYwRWPDEg+16GD3c+0b4DGqziBUH1P7CsM1H9xra/Ghp4
	Xc+zestPfRdv9A6XfDf4hLwCiSMErSTofYfyVyNPhmMQwXxgWQHS5eIkN03OwddoUkB7
	WtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=h/lzs4kMSHgsPKDJQUBJbKL1gg/TqWj58hyhAra4xKc=;
	b=cbY+yVJz5L/rVMBH+7RN1EM3ip0O1aQQWcIHPIt5dCZcGNyji9Rv/i0MCvVEgnijAd
	sIeqDFuurzif6fnPniwOfMjz8aVdL7ivyTUkdCmXTOeH6X8f2hlsjTpTK9VvBFq0sLj3
	8Pvz9ZG1tn6w/B6B64IYs/m6GcuTGZHiGQS6JWdLfAsUL5X7tNz9caHn0gt4/zp0OOos
	iaqjIpMqDubL93/gENP35PIXTC5ioOHDVCj1njWyAfZfMwNgBLfs7tNKEex2JgTtlsiH
	07x8asXoD1cclLfr46AVWWfixfyF/z9SoVO4ot60PLWo2wePbQCpwCxe5tiuv7ObF4jS
	+9/Q==
X-Gm-Message-State: APjAAAU63vKajozxdOQph2mYhqRFiVrdorOXDW5v3S7HrhuDOsP4RE0i
	p4nuYwcLmDCWvculArOJzT/HTjN3
X-Google-Smtp-Source: APXvYqyoRJaHcwsK9uagQsDDUIDZoVeKTCRO59nqN6u6tY5nK79gqr5GLFpzz0ARYUcu9zrbrvykEg==
X-Received: by 2002:a17:902:74c6:: with SMTP id
	f6mr4392101plt.167.1573658385914; 
	Wed, 13 Nov 2019 07:19:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:03 -0800
Message-Id: <cover.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior 00/25] Patch review
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:45 -0000

Please provide comments by Friday

The following changes since commit 03b303dbc92521606ff4051bd253f8acc01fd9e5:

  go-1.12: update to 1.12.9 minor release (2019-11-07 21:56:23 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Adrian Bunk (1):
  python3: Upgrade 3.7.4 -> 3.7.5

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
 29 files changed, 1215 insertions(+), 61 deletions(-)
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


