Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBCD77087
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:08 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yy13so4044158pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=l0Pz57ve3087m4e/FPzK6Zad6QKbVQddeVdz2uAZfyI=;
	b=TF0RkU28wJ5X4slwk14KkWDvQrQ4RoZWhcfnpPxDBxZjZOJ8DjjZ9tOpWxB408X/3F
	cfFLe8Lw+jPYBqjTxrIpmc8Ak5U6xE6nyAAPVWU/NM4fLuVysy7VfLGTvkjrdpqlXe7j
	fyjDpPSsXDKkvfxCHl7ukqY4xX4s0DIGPL5+dW1Z2xWThj5wHk1M9PtjINmdRHK6P9lK
	iaQIVD8AR9gL1LnYjQW6ksMxG0wFTdXMNs+zm8hLhk9iAHQrfjpPAXvdxhs+EFHhtFU9
	yMntB3mDzvkQKT3+ZXnSh0OH6+aiKnnyDb16eckIfVWHBonZCcuwMoDKV1N7/91aLnGK
	KoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=l0Pz57ve3087m4e/FPzK6Zad6QKbVQddeVdz2uAZfyI=;
	b=TAbAxraGB/1FAFx0TwoW7hBaoVceBuMzTTGUpX/VI+EFI6iSrJ9NdbOpfNGVoogIjc
	RxAlJ7epX6LTzinu1c/+3ddhimtVQghdVNPBcD9rbdnAXf7V7l8l2COR5ngHUlZAjb5P
	Rfim3tUR7xNmjWKQe0bnbENPJ4Niwn29GyeyCTb9lwlOK26SvQ2dOPgtUPtDiy+QQ81u
	dpHZOTnJPtJEfit+aFF5NHo+VvBWmlEhC8omtDvEe2DxL1E7D/KCiXd448FDMlYtdWJW
	C7Shuh9HDeao1HBHG73XLEKCErD28wCHrYoxT7TYtAv5W9Q4t6VtgxDb3rsCtDSLEPDj
	GKPQ==
X-Gm-Message-State: AG10YOSthUmGl8uNaQzVRrBj9voRRz+P91HuT6lGAPODXsUcRBmD9w+Qw6iI9FAYXi9KxQ==
X-Received: by 10.66.159.38 with SMTP id wz6mr31028569pab.12.1454800509044;
	Sat, 06 Feb 2016 15:15:09 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:41 -0800
Message-Id: <cover.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 00/21][Fido v3] pull request
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:09 -0000

From: Armin Kuster <akuster@mvista.com>

forgot to append a change to bind recipe.

This includes a miss fire on the glibc request plus many others.
This supersedes the last tow fido pull request

The following changes since commit 9845a542a76156adb5aef6fd33ad5bc5777acf64:

  openssh: CVE-2016-077x (2016-01-20 17:08:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/fido_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fido_cve_fixes

Armin Kuster (18):
  glibc: CVE-2015-8777
  glibc: CVE-2015-8779
  glibc: CVE-2015-9761
  glibc: CVE-2015-8776
  openssl: Security fix CVE-2015-3197
  openssl: Security fix CVE-2016-0701
  qemu: Security fix CVE-2015-8504
  qemu: Security fix CVE-2015-7504
  qemu: Security fix CVE-2015-7512
  qemu: Security fix CVE-2015-8345
  qemu: Security fix CVE-2016-1568
  qemu: Security fix CVE-2015-7295
  tzcode: update to 2016a
  tzdata: update to 2016a
  dpkg: Security fix CVE-2015-0860
  libxml2: Security fix CVE-2015-8241
  libxml2: Security fix CVE-2015-8710
  bind: Security fix CVE-2015-8704

Paul Eggleton (1):
  tzdata: reinstate changes reverted in 2014c upgrade

Wenzong Fan (2):
  subversion: fix CVE-2015-3184
  subversion: fix CVE-2015-3187

 .../bind/bind/CVE-2015-8704.patch                  |   29 +
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    1 +
 .../openssl/openssl/CVE-2015-3197.patch            |   63 +
 .../openssl/openssl/CVE-2016-0701_1.patch          |  102 +
 .../openssl/openssl/CVE-2016-0701_2.patch          |  156 ++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |    3 +
 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch  |  155 ++
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch  |  122 ++
 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch  |  262 +++
 .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039 ++++++++++
 .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  388 ++++
 meta/recipes-core/glibc/glibc_2.21.bb              |    5 +
 meta/recipes-core/libxml/libxml2.inc               |    2 +
 .../libxml/libxml2/CVE-2015-8241.patch             |   40 +
 .../libxml/libxml2/CVE-2015-8710.patch             |   71 +
 .../recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch |   53 +
 meta/recipes-devtools/dpkg/dpkg_1.17.21.bb         |    1 +
 .../qemu/qemu/CVE-2015-7295_1.patch                |   63 +
 .../qemu/qemu/CVE-2015-7295_2.patch                |   58 +
 .../qemu/qemu/CVE-2015-7295_3.patch                |   52 +
 .../recipes-devtools/qemu/qemu/CVE-2015-7504.patch |   56 +
 .../recipes-devtools/qemu/qemu/CVE-2015-7512.patch |   44 +
 .../recipes-devtools/qemu/qemu/CVE-2015-8345.patch |   73 +
 .../recipes-devtools/qemu/qemu/CVE-2015-8504.patch |   51 +
 .../recipes-devtools/qemu/qemu/CVE-2016-1568.patch |   46 +
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |    8 +
 .../subversion-CVE-2015-3184.patch                 | 2082 ++++++++++++++++++++
 .../subversion-CVE-2015-3187.patch                 |  346 ++++
 .../subversion/subversion_1.8.11.bb                |    2 +
 ...code-native_2015g.bb => tzcode-native_2016a.bb} |   16 +-
 meta/recipes-extended/tzdata/tzdata.inc            |    5 +-
 .../tzdata/{tzdata_2015g.bb => tzdata_2016a.bb}    |   10 +-
 32 files changed, 5389 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.11/subversion-CVE-2015-3184.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.11/subversion-CVE-2015-3187.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2015g.bb => tzcode-native_2016a.bb} (40%)
 rename meta/recipes-extended/tzdata/{tzdata_2015g.bb => tzdata_2016a.bb} (96%)

-- 
2.3.5


