Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5E46078493
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 16:02:22 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id t10so17288705pgo.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 08:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xwUdxp58V6sGNJXNygm5ubjtAh9Pd8sFKzetKpwMdwk=;
	b=dwqPJ+2EELC8qsd1yHC+6ldKixz97mFXL83M9ROsY83JebdF4AmJfOWZBkSLTABOZy
	zRI8ZrURQsa2OJBpZHtWifWfQcA9vHK5kG9TDJidahriBuwM7wt2BTUfxQzayXb97r6s
	3osbu9RFSVV6u+OmBxAS2lcIeEhwf/sOzMuP3c8mXKbc3xTig3Nx2n22Rg0EEvn0bptQ
	7TiI/1Wa3hCoweEkTqpto2eUtHTR7fu0xvsgkQvFtC1SkeiT58+ybepg3xNkER7J/NGF
	kvIxI2e7M721Ziqi+UhgIV3hTZrU+pmsJnuKfEfwFmRldgXgLoaAf/emEo4z2wtfknSX
	Oxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xwUdxp58V6sGNJXNygm5ubjtAh9Pd8sFKzetKpwMdwk=;
	b=qiRB9BAnS0kCYO7HujChfcQG1mhn+f3BheMlf+SBw7fKnuH8Cf0UL6qyM6vz7qhweY
	m5nE1HhaKUXr8vX6n0BXK0YjQADRBYt45URXS6hcE2E1qvBKGcj8n7WwV5TmM6343GLW
	aX0pyljAatpBE8l/F/d9T9vAIZ4rjvYbRLoSnbThrX50xbD5I9iZFvNqi/qGa8x8cBEE
	B3h39EI98LnYAaMmztBAdvj6OL+P/wTI8yIceSkN11kIjAce9c2s0kAhJc+VgPSp9ydq
	Gl4mg2ljOcVH1bb8sxnFUQQhoFTGDy+VLfRnAkFG4RjfJUPQk1wKQrx17gxKJMVQ/Uxh
	V9AQ==
X-Gm-Message-State: AJaThX6WamhMDB3aRzlhcpzuJm3CgEMNE170wiPKHw1iHaFXdCRIynIF
	DlY/HAnxU6TBCDS08Ouk6GT9CQ==
X-Google-Smtp-Source: AGs4zMb41mGhmMwQHOel3ILuzrbMRUBYNttRUvdcdCarHugefyQsUM3X9PpbUoJwBjfOUg+iByHf1w==
X-Received: by 10.98.105.134 with SMTP id e128mr18346737pfc.29.1510761742859; 
	Wed, 15 Nov 2017 08:02:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:d04d:dd67:32c6:fbd1])
	by smtp.gmail.com with ESMTPSA id
	u131sm36839952pgc.89.2017.11.15.08.02.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Nov 2017 08:02:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 08:01:32 -0800
Message-Id: <cover.1510761449.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/47] Morty-next pull request #2
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
X-List-Received-Date: Wed, 15 Nov 2017 16:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cover letter only
Clean AB build

Please consider these changes for the next morty.

The following changes since commit 1b231d7b0628c5e19afc2987d25000f71030c000:

  documentation: Updated Doc set to 2.2.3 (2017-11-12 06:51:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/morty-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/morty-next

Andre McCurdy (2):
  libevdev: add libcheck dependency
  gmp_4.2.1: prevent calls to mpn_add_nc() if HAVE_NATIVE_mpn_sub_nc is
    false

André Draszik (1):
  coreutils_6.9: fix musl compilation

George McCollister (4):
  zlib: Fix CVE-2016-9840
  zlib: Fix CVE-2016-9841
  zlib: Fix CVE-2016-9842
  zlib: Fix CVE-2016-9843

Jan Kiszka (1):
  tcf-agent: Fix daemon termination

Joshua Lock (1):
  ruby: fix build of ruby-native with gcc7

Li Zhou (1):
  libtiff: Security Advisory - libtiff - CVE-2017-5225

Martin Kelly (1):
  tcf-agent: kill with USR2 in systemd stop

Rajkumar Veer (19):
  tiff: Security fix for CVE-2016-10271
  tiff: Secruity fix CVE-2016-10093
  tiff: Security fix CVE-2016-10268
  tiff: Security fix CVE-2016-10266
  tiff: Security fix CVE-2016-10267
  tiff: Security fix for CVE-2016-10269
  tiff: Security fix for CVE-2016-10270
  tiff: Security fix for CVE-2017-7592
  tiff: Security fix for CVE-2017-7594
  tiff: Security fix for CVE-2017-7595
  tiff: Security fix for CVE-2017-7596
  tiff: Security fix for CVE-2017-7598
  tiff: Security fix for CVE-2017-7601
  tiff: Security fix for CVE-2017-7602
  tiff: Security fix for CVE-2017-7593
  curl: Security fix for CVE-2017-1000100
  curl: Security fix for CVE-2017-1000101
  ruby: Security fix for CVE-2017-14033
  ruby: Security fix for CVE-2017-14064

Richard Purdie (1):
  coreutils_6.9: Disable broken man pages

Ross Burton (1):
  opkg: fix conffile errors in 'opkg status' calls

Thiruvadi Rajaraman (14):
  curl: Security fix for CVE-2016-8615
  curl: Security fix for CVE-2016-8618
  curl: Security fix for CVE-2016-8619
  curl: Security fix for CVE-2016-8620
  curl: Security fix for CVE-2016-8621
  curl: Security fix for CVE-2016-8623
  curl: Security fix for CVE-2016-8617
  curl: Security fix for CVE-2016-8624
  curl: Security fix for CVE-2016-9586
  ruby: Security fix for CVE-2016-7798
  ruby: Security fix for CVE-2017-9227
  ruby: Security fix for CVE-2017-9228
  ruby: Secruity fix for CVE-2017-9226
  ruby: Security fix for CVE-2017-9229

Yi Zhao (1):
  tiff: Security fixes

 ...-need-charset.alias-when-building-for-mus.patch |  46 +++
 .../coreutils/coreutils-6.9/no-man.patch           |  21 ++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   2 +
 .../zlib/zlib-1.2.8/CVE-2016-9840.patch            |  77 ++++++
 .../zlib/zlib-1.2.8/CVE-2016-9841.patch            | 230 +++++++++++++++
 .../zlib/zlib-1.2.8/CVE-2016-9842.patch            |  35 +++
 .../zlib/zlib-1.2.8/CVE-2016-9843.patch            |  55 ++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |   4 +
 .../opkg/opkg/status-conffile.patch                |  69 +++++
 meta/recipes-devtools/opkg/opkg_0.3.3.bb           |   1 +
 .../recipes-devtools/ruby/ruby/CVE-2016-7798.patch | 164 +++++++++++
 .../ruby/ruby/CVE-2017-14033.patch                 |  89 ++++++
 .../ruby/ruby/CVE-2017-14064.patch                 |  79 ++++++
 .../recipes-devtools/ruby/ruby/CVE-2017-9226.patch |  33 +++
 .../recipes-devtools/ruby/ruby/CVE-2017-9227.patch |  24 ++
 .../recipes-devtools/ruby/ruby/CVE-2017-9228.patch |  26 ++
 .../recipes-devtools/ruby/ruby/CVE-2017-9229.patch |  36 +++
 meta/recipes-devtools/ruby/ruby/prevent-gc.patch   |  32 +++
 meta/recipes-devtools/ruby/ruby_2.2.5.bb           |  10 +
 .../tcf-agent/tcf-agent/tcf-agent.init             |  12 +-
 .../tcf-agent/tcf-agent/tcf-agent.service          |   2 +
 .../libtiff/files/CVE-2016-10093.patch             |  47 ++++
 .../libtiff/files/CVE-2016-10266.patch             |  60 ++++
 .../libtiff/files/CVE-2016-10267.patch             |  70 +++++
 .../libtiff/files/CVE-2016-10268.patch             |  30 ++
 .../libtiff/files/CVE-2016-10269.patch             | 131 +++++++++
 .../libtiff/files/CVE-2016-10270.patch             | 134 +++++++++
 .../libtiff/files/CVE-2016-10271.patch             |  30 ++
 .../libtiff/files/CVE-2017-10688.patch             |  88 ++++++
 .../libtiff/files/CVE-2017-11335.patch             |  54 ++++
 .../libtiff/files/CVE-2017-7592.patch              |  40 +++
 .../libtiff/files/CVE-2017-7593.patch              |  98 +++++++
 .../libtiff/files/CVE-2017-7594-p1.patch           |  43 +++
 .../libtiff/files/CVE-2017-7594-p2.patch           |  50 ++++
 .../libtiff/files/CVE-2017-7595.patch              |  48 ++++
 .../libtiff/files/CVE-2017-7596.patch              | 308 +++++++++++++++++++++
 .../libtiff/files/CVE-2017-7598.patch              |  65 +++++
 .../libtiff/files/CVE-2017-7601.patch              |  52 ++++
 .../libtiff/files/CVE-2017-7602.patch              |  69 +++++
 .../libtiff/files/CVE-2017-9147.patch              | 203 ++++++++++++++
 .../libtiff/files/CVE-2017-9936.patch              |  46 +++
 .../libtiff/files/libtiff-CVE-2017-5225.patch      |  92 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.7.bb      |  23 +-
 meta/recipes-support/curl/curl/CVE-2016-8615.patch |  71 +++++
 meta/recipes-support/curl/curl/CVE-2016-8617.patch |  30 ++
 meta/recipes-support/curl/curl/CVE-2016-8618.patch |  49 ++++
 meta/recipes-support/curl/curl/CVE-2016-8619.patch |  56 ++++
 meta/recipes-support/curl/curl/CVE-2016-8620.patch | 146 ++++++++++
 meta/recipes-support/curl/curl/CVE-2016-8621.patch | 104 +++++++
 meta/recipes-support/curl/curl/CVE-2016-8623.patch | 174 ++++++++++++
 meta/recipes-support/curl/curl/CVE-2016-8624.patch |  68 +++++
 meta/recipes-support/curl/curl/CVE-2016-9586.patch |  66 +++++
 .../curl/curl/CVE-2017-1000100.patch               |  47 ++++
 .../curl/curl/CVE-2017-1000101.patch               |  94 +++++++
 meta/recipes-support/curl/curl_7.50.1.bb           |  14 +-
 ...ls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch |  78 ++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |   1 +
 meta/recipes-support/libevdev/libevdev_1.5.2.bb    |   2 +
 58 files changed, 3815 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/no-man.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9840.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9841.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9842.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9843.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2016-7798.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-14033.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-14064.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9226.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9227.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9228.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9229.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/prevent-gc.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10093.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10266.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10267.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10268.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10269.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10270.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10271.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7592.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7593.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7594-p1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7594-p2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7595.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7596.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7598.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7601.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7602.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8615.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8617.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8618.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8619.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8620.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8621.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8623.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8624.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-9586.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000100.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000101.patch
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch

-- 
2.7.4


