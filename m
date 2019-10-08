Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5040060557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:26:48 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y72so10930934pfb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TKQuYQOLWrpbLWfXiXkAu4jQkVl5sQ3urTYwQm2SURo=;
	b=iDcLJkrXmt2kjCXEqXPVhXwxuxGYCszqmEF3gm3Ma0R8Q+kYpH4/x7Ddr0CAqF7f3D
	jYGTeBN0XtLgmTetnqf5XfPkgTnQTWnTOhtO0jXWC6hkP0/iTwD3Z6ZdBikzRiGRjwIg
	mQF+Fut+xLfEgWYeruTUaIdCkPoRpNhej9XKtY9/QukZaeCsq6oKks/nuSHLIGZD0dUO
	eSola8kuaDD8YYQ1rOea7SrndQWyhIvPH/6piVAKqEik+pt9KTYDDIOH6COglg3uHSm5
	jOEvt1JgI9Y2V3AXVOhd8yRLGnjH5KbbFGBMz5Bryw/VSOEMN81hToOpQjZC5qcwSM9J
	wMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TKQuYQOLWrpbLWfXiXkAu4jQkVl5sQ3urTYwQm2SURo=;
	b=kKyry0xnJOrntMNRdaOD5YTT2gXMuSuVoFzbn/UxTW1iKfK+bldsQ52grntrycXK6G
	6hKGFHxTE8mdfuQWCUigQXTvt1i/DJlNcYTiG7ed8dCp63+bev68A5V8Dso+7zSj3IUS
	Mu1ef4IczlzH1OfhZOk3L0F2+B4w4cNgbRVkshnPLCUr2rQh/APjoEJfo+v6V6i8srRl
	BWQRJkozOkDaqTqQKG5J7g8VINQHcoNp5Z1gqcP6zZCbSwl6YLHuCni+xAWV/V1IYgyw
	btop/bS5vjxxh/WHbszb2cxDlahwfKIvxRX8tpfQCL+mgvfe1sZuXwAV3H1wwUtV2yUM
	bAgA==
X-Gm-Message-State: APjAAAUU92QBT0MCPdFAuSbgfoV4Aa5PemMrIAXcCWM+ZsQzc0xzbX3Q
	dyw6mt52y+pNtZIf7XLix//VX/RrGr8=
X-Google-Smtp-Source: APXvYqwV+qJKrdxReByG5WaXLW4Zs5lppO+/w3Tz84qx+LnRN3qIBwefIDWLOoPxkJ8WMC8CZ8U7Yw==
X-Received: by 2002:a17:90a:e57:: with SMTP id
	p23mr6294062pja.126.1570548409000; 
	Tue, 08 Oct 2019 08:26:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.26.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:26:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:32 -0700
Message-Id: <cover.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [thud 00/12] patch review
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
X-List-Received-Date: Tue, 08 Oct 2019 15:26:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lastest thud changes. Most have been on the list already.

Commnets by Thursday

The following changes since commit f5be8c8309a932cde507ba24d042880a922df0b6:

  linux-yocto/4.14: update to v4.14.143 (2019-09-24 08:28:04 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-nmut
  http://cgit.openembedded.org//log/?h=stable/thud-nmut

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


