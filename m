Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 319776010D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 May 2017 14:46:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id w69so12608891pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 May 2017 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7KNCLcvTuBe2GA3JctU6PN0CBEB5G43YDhvz5Lm+UfI=;
	b=fq0v10ENZ/MoxbG7F4Cc1IMEmAfeoYZbsWgEwGJCF2/YY3JR1AlVO7zS/TK91yjGU1
	CO7aC+iSoMHBS326tnttAnQSH+Vs9wHuJURgLkQKAD/g/o3/uaYOgGhURItGZzom6zoO
	Qn6nYkDgfqhOuVfIUI8oQxp/goIctgfq/2uzBS9kNsNzwKsBchXIPc+WK6dXAIIqT7Or
	LKjnsV239cxjPtom79F9r4xCWgOPLJc10A8BXL1qiBgZQiE6UXESzliufB4/hGbWW7EZ
	dPJ0qj9NO8nzgvrk/Uk0V6cNSEDWimuk1tCkpcbeXQKraLvRzNDo+b6SIOnkGjdTm25V
	KsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7KNCLcvTuBe2GA3JctU6PN0CBEB5G43YDhvz5Lm+UfI=;
	b=gAT5RlkFMAUSXp2xX2iT50sJlxz1XSKrdF0t3VBMMqvu7nXhG0ChoDqEuGPRosUKW7
	/Th0R7//xOo7vFai+d7oMfSKHIf694RoLei/tmf8HQx89mB42TGwLJpyO84yX14hWoId
	qdh6dVZMWlo9gI0InHXLFCErAIQSdEUOfFu5XNRIVkly/r4pU3liM3Fsa5z6+WW925lb
	dei9frOyUsdpQRkbmx7X+M63aTar5AAXxTEK3HFKgnfVLlUwYTlqJ9pTsFO3/ppZ5Ry6
	q1nrBDXdFRrxRPSq2ppiFHptcFHSq8FKmIXRLN0lySC2hYSWntq4/tj0QB4RjqEuTxUc
	6c3w==
X-Gm-Message-State: AODbwcCIiAMvWohU/4bJq0Rx3EXIwUMqgtzrD5l7IPK9zKCWWgAX2kmT
	Q1PQldpEgT92ew==
X-Received: by 10.98.157.207 with SMTP id a76mr1684226pfk.17.1494773173178;
	Sun, 14 May 2017 07:46:13 -0700 (PDT)
Received: from pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	h15sm15724946pfk.120.2017.05.14.07.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 May 2017 07:46:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 14 May 2017 07:45:20 -0700
Message-Id: <cover.1494772869.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 00/49] for morty next
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
X-List-Received-Date: Sun, 14 May 2017 14:46:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for the next Morty release 2.2.2.
Clean AB build

The following changes since commit 924e576b8930fd2268d85f0b151e5f68a3c2afce:

  bitbake: lib/bs4: Fix imports from html5lib >= 0.9999999/1.0b8 (2017-03-26 13:19:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/morty-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/morty-next

Anders Darander (1):
  python-3-manifest: fix adding imp to importlib

Andre McCurdy (1):
  image_types.bbclass: fix image dependency chain collection

Andrej Valek (1):
  busybox: Security fix CVE-2016-6301

Armin Kuster (4):
  tzdata: update to 2016j
  tzcode-native: update to 2016j
  tzcode-native: update to 2017a
  tzdata: update to 2017a

Bruce Ashfield (9):
  linux-yocto/4.4: update to v4.4.41
  linux-yocto/4.8: -stable update to v4.8.17
  linux-yocto/4.1: update to v4.1.37
  linux-yocto/4.8: update to -rt10
  linux-yocto/4.8: update to v4.8.18
  linux-yocto/4.1: update to v4.1.38
  linux-yocto/4.4: update to v4.4.53
  linux-yocto/4.4: update to v4.4.56
  linux-yocto/4.4: update to v4.4.60

Catalin Enache (3):
  libxml2: CVE-2016-9318
  ghostscript: CVE-2017-7207
  ghostscript : CVE-2016-10219, CVE-2016-10220, CVE-2017-5951

Choong YinThong (1):
  logrotate: replace fedorahosted.org SRC_URI with github.com source

Daniel Díaz (1):
  base-files: resize only serial tty's in profile

Daniel Schultz (2):
  wic: filemap: Fixed spared_copy skip
  wic: plugins: rawcopy: Fixed wrong variable type

Ed Bartosh (1):
  sstate.bbclass: update .siginfo atime

Haiqing Bai (1):
  busybox: ifupdown:pass interface device name for ipv6 route command

Joe Slater (1):
  volatile-binds: correct some errors reported by systemd

Juro Bystricky (1):
  sanity.bbclass: modify check for shell

Jussi Kukkonen (3):
  mkfontdir: Remove x11 requirement for -native
  mkfontscale: Remove x11 requirement for -native
  xorg-font-common.inc: Remove x11 requirement for -native

Li Zhou (1):
  bash: fix CVE-2016-9401

Lukasz Nowak (1):
  busybox: allow libiproute to handle table ids larger than 255

Martin Balik (1):
  busybox: Security fix BUG9071

Martin Jansa (2):
  package_manager.py: respect OPKGLIBDIR
  rootfs.py: Respect OPKGLIBDIR variable

Maxin John (1):
  busybox: refresh the flock patch

Patrick Ohly (1):
  codeparser.py: support deeply nested tokens

Randy Witt (1):
  image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types

Richard Purdie (1):
  tzcode-native: Set cc to ${CC}

Robert Yang (2):
  runqemu-export-rootfs: fix inconsistent var names
  runqemu: support multiple qemus running when nfs

Sona Sarmadi (1):
  tar: CVE-2016-6321

Sullivan, California L (1):
  parselogs: Whitelist NUC6 firmware load error message on genericx86-64

Yi Zhao (2):
  bind: Security fix CVE-2016-8864
  bind: Security fix CVE-2016-6170

Yuanjie Huang (2):
  binutils: Fix CVE-2017-6965 and CVE-2017-6966
  glibc: Fix use after free in pthread_create()

Zubair Lutfullah Kakakhel (2):
  openssl: Add support for many MIPS configurations
  gmp: Disable assembly for MIPS R6

 bitbake/lib/bb/codeparser.py                       |   29 +-
 meta/classes/image_types.bbclass                   |   16 +-
 meta/classes/sanity.bbclass                        |    4 +-
 meta/classes/sstate.bbclass                        |    2 +
 meta/lib/oe/package_manager.py                     |   21 +-
 meta/lib/oe/rootfs.py                              |    4 +-
 meta/lib/oeqa/runtime/parselogs.py                 |    1 +
 .../bind/bind/CVE-2016-6170.patch                  | 1090 ++++++++++++++++++++
 .../bind/bind/CVE-2016-8864.patch                  |  219 ++++
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |    2 +
 meta/recipes-connectivity/openssl/openssl.inc      |   24 +-
 meta/recipes-core/base-files/base-files/profile    |    2 +-
 ...ss-interface-device-name-for-ipv6-route-c.patch |   52 +
 ...e-the-behaviour-of-c-parameter-to-match-u.patch |   77 +-
 ...biproute-handle-table-ids-larger-than-255.patch |  134 +++
 .../busybox/BUG9071_buffer_overflow_arp.patch      |   53 +
 .../busybox/busybox/CVE-2016-6301.patch            |   37 +
 meta/recipes-core/busybox/busybox_1.24.1.bb        |    4 +
 ...0116-Fix-use-after-free-in-pthread_create.patch |  668 ++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb              |    1 +
 .../libxml/libxml2/CVE-2016-9318.patch             |  207 ++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |    1 +
 meta/recipes-core/volatile-binds/volatile-binds.bb |    9 +
 meta/recipes-devtools/binutils/binutils-2.27.inc   |    2 +
 .../binutils/binutils/CVE-2017-6965.patch          |  127 +++
 .../binutils/binutils/CVE-2017-6966.patch          |  240 +++++
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |   50 +
 meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
 .../ghostscript/ghostscript/CVE-2016-10219.patch   |   49 +
 .../ghostscript/ghostscript/CVE-2016-10220.patch   |   55 +
 .../ghostscript/ghostscript/CVE-2017-5951.patch    |   44 +
 .../ghostscript/ghostscript/CVE-2017-7207.patch    |   39 +
 .../ghostscript/ghostscript_9.19.bb                |    4 +
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |   17 +-
 meta/recipes-extended/tar/tar/CVE-2016-6321.patch  |   66 ++
 meta/recipes-extended/tar/tar_1.29.bb              |    1 +
 ...code-native_2016i.bb => tzcode-native_2017a.bb} |   10 +-
 .../tzdata/{tzdata_2016i.bb => tzdata_2017a.bb}    |    4 +-
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb  |    3 +
 .../recipes-graphics/xorg-app/mkfontscale_1.1.2.bb |    2 +
 .../xorg-font/xorg-font-common.inc                 |    1 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       |   20 +-
 meta/recipes-support/gmp/gmp_6.1.1.bb              |    1 +
 scripts/contrib/python/generate-manifest-3.5.py    |    2 +-
 scripts/lib/wic/filemap.py                         |    6 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |    2 +-
 scripts/runqemu                                    |   57 +-
 scripts/runqemu-export-rootfs                      |   21 +-
 56 files changed, 3385 insertions(+), 172 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
 create mode 100644 meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
 create mode 100644 meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-6301.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Bug-20116-Fix-use-after-free-in-pthread_create.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2016-6321.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016i.bb => tzcode-native_2017a.bb} (67%)
 rename meta/recipes-extended/tzdata/{tzdata_2016i.bb => tzdata_2017a.bb} (98%)

-- 
2.5.0


