Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 449B47E31D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:28 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t3so3930541pga.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mkUZ9bVqK0wzNZbDzgyEZKHnhsTsa0FTyE9kKQAeezQ=;
	b=Tt9LZhlcguhbPiJDpJXTSI8/ObmjiBqpG1ZyhKWxLK2iIqicl2CJE4dYAswWhQfrSl
	AD+S9uJQZ72FX36ksH3WbJbVjBBqnbJ3hmwbN5KHomcU3BFDFuTR78lYxUOsF4uBo/d2
	bgdAZ8+7bUuihSwQGD+05e/UNsxriapAtCuKNLa+MiKJL5zIl+wevagfUgNMr3cJJdXF
	Qi7vFGvj2kIkldZFUalnG2IFZ1MV8Cj10FrLzN84Z3hVGKL8g3mRBE/eNTkUEjsVOi4j
	eJh/Twbmi3Qbh/DsbESHoVG5cdQsHgCLN6MjUjYHefvMSCXYyR4DTOJ4/wGVu9kRNb1Z
	AX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mkUZ9bVqK0wzNZbDzgyEZKHnhsTsa0FTyE9kKQAeezQ=;
	b=O4J3whbUlvnYNDYZ9K9cSK9RLYGnMlM3qLvADTV/eLshFD3i50ehHRA9O1dHXAxVu8
	IdU+etRfSXtAhX4aFtAhI4RRKpl5GiWVsfbUadUEhL+vjel9fL8c4M0yhvBqbML/DnCP
	2rFSzmyRrjCy0mnS8lUL2fFgt3s875LwtnNhfTC3AMMH6+VdgAjq04CxRxUZ0l5QUUlq
	nG5xSCPDPzXLvTSp4AtFELapsZtADGIj8OIgiHnRJ/RmWaLsFnJ2EnUKJqpR+9nwb3gl
	x4l5eBIp8CNV34b5rHnXxok57s7HgAW74Qqq9GnLf5vtSGt00JLuMTao4CY+k7U7uEM6
	LcLQ==
X-Gm-Message-State: APjAAAWbcJYbw/kNJYSLAbR0kVVDw4wuRU7TgWxEyO7NMMhvoZjpYXeX
	T6lle3ZecPWx0Jb6z9JkArkjEu+N
X-Google-Smtp-Source: APXvYqw69fcfwVz+19Nm9Rni6F5+JBJct0yG61O8YbmADrb5xHTHFgxKi1VZNmCkeUPJPNdiflMlzg==
X-Received: by 2002:a63:ec4f:: with SMTP id r15mr11561675pgj.17.1570722568856; 
	Thu, 10 Oct 2019 08:49:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:12 -0700
Message-Id: <cover.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [thud 00/12] Thud pull request
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these to thud mainline

Clean AB full build

The following changes since commit f5be8c8309a932cde507ba24d042880a922df0b6:

  linux-yocto/4.14: update to v4.14.143 (2019-09-24 08:28:04 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/thud-next

Adrian Bunk (1):
  json-c: Don't --enable-rdrand

Andrii Bordunov via Openembedded-core (1):
  wget: Security fixes CVE-2018-20483

Armin Kuster (1):
  qemu: fix build issue on new hosts with glibc 2.30

Chen Qi (1):
  oeqa/selftest/context: ensure log directory exists

Dan Tran (3):
  qemu: Fix 4 CVEs
  unzip: fix CVE-2019-13232
  perl: Fix CVE-2018-18311 to 18314

Khem Raj (1):
  gnupg: Do not apply -Woverride-init guard for gcc >= 9

Michael Halstead (1):
  uninative: Update to 2.7 release

Sean Nyekjaer (1):
  libgpg-error: Fix build with gawk 5.x

Shubham Agrawal (2):
  elfutils: CVE fix for elfutils
  sqlite3: Security fix for CVE-2019-8457

 meta/conf/distro/include/yocto-uninative.inc       |  10 +-
 meta/lib/oeqa/selftest/context.py                  |   1 +
 meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   2 +
 .../elfutils/files/CVE-2019-7664.patch             |  65 ++++
 .../elfutils/files/CVE-2019-7665.patch             | 154 +++++++++
 meta/recipes-devtools/json-c/json-c_0.13.1.bb      |   2 -
 .../perl/perl/CVE-2018-18311.patch                 | 183 +++++++++++
 .../perl/perl/CVE-2018-18312.patch                 | Bin 0 -> 2125 bytes
 .../perl/perl/CVE-2018-18313.patch                 |  60 ++++
 .../perl/perl/CVE-2018-18314.patch                 | 271 ++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.4.bb          |   4 +
 ...nux-user-assume-__NR_gettid-always-exists.patch |  49 +++
 ...rename-gettid-to-sys_gettid-to-avoid-clas.patch |  95 ++++++
 .../qemu/qemu/CVE-2018-10839.patch                 |   2 +-
 .../qemu/qemu/CVE-2018-17958.patch                 |  52 ---
 .../qemu/qemu/CVE-2018-18954.patch                 |  50 +++
 .../recipes-devtools/qemu/qemu/CVE-2019-3812.patch |  39 +++
 .../recipes-devtools/qemu/qemu/CVE-2019-6778.patch |  41 +++
 .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 +++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |   8 +-
 .../unzip/unzip/CVE-2019-13232_p1.patch            |  33 ++
 .../unzip/unzip/CVE-2019-13232_p2.patch            | 356 +++++++++++++++++++++
 .../unzip/unzip/CVE-2019-13232_p3.patch            | 121 +++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   3 +
 .../wget/wget/CVE-2018-20483_p1.patch              |  73 +++++
 .../wget/wget/CVE-2018-20483_p2.patch              | 127 ++++++++
 meta/recipes-extended/wget/wget_1.19.5.bb          |   2 +
 ...1-Woverride-init-is-not-needed-with-gcc-9.patch |  31 ++
 ...c-use-a-custom-value-for-the-location-of-.patch |   6 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch    |   2 +-
 meta/recipes-support/gnupg/gnupg_2.2.12.bb         |   3 +-
 .../libgpg-error-1.35-gawk5-support.patch          | 161 ++++++++++
 .../libgpg-error/libgpg-error_1.32.bb              |   1 +
 .../sqlite/files/CVE-2019-8457.patch               | 126 ++++++++
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |   1 +
 35 files changed, 2283 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18311.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18312.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18313.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18314.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2018-20483_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2018-20483_p2.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-8457.patch

-- 
2.7.4


