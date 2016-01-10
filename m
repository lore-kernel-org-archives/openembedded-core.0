Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 80375731EC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:30:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 65so2202248pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=MlVkBkSW8mlXEc+4YGZrj0qnXDhhIpp3KUO+Pb7OyV4=;
	b=Df2OsCEngaWjYc5/tT3sj/getQQ5k6s4XcGDPYK6TIivrCsbHLdywlpKwx4raNQofI
	yKwdIfdCdoTsGzSeqwxkr8YmiBZzm9VmhfTVu77b8kRJBq+GZfMwicQmxULM3KKEVzz6
	Jq5flMkLlfFD3Li/bZdFodiDOZPZ+7B2J7bqXoESHdGApMEWJniqlOznxbyVfKlqmluv
	icza4nACzexV18EYr1yr69eUxa5DqwxR6zY0BkTayCbAwoJAK1BH/qmywUIrhQ/RCh2f
	W9WmA/FAD8kBtPhQx3YrTo+XIMOl9vr8hQ4TCwfTZsl/MklrrFacKihIVnuuVz47CdJT
	3HcA==
X-Received: by 10.98.73.6 with SMTP id w6mr14763042pfa.109.1452385857299;
	Sat, 09 Jan 2016 16:30:57 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	e14sm176269409pap.24.2016.01.09.16.30.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:30:55 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id AA420FCC838; Sat,  9 Jan 2016 16:30:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:26 -0800
Message-Id: <cover.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/20] Dizzy-next pull request 2016-1
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
X-List-Received-Date: Sun, 10 Jan 2016 00:30:57 -0000

Please consider these changes for dizzy-next community support.

The following changes since commit 6d34267e0a13e10ab91b60590b27a2b5ba3b7da6:

  documentation: Changed some 'intro' tags to resolve multiple mega-manual warnings. (2015-11-18 16:44:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Armin Kuster (2):
  openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565
  Fixes a heap buffer overflow in glibc wscanf.

Belal, Awais (1):
  grub2: Fix CVE-2015-8370

Chen Qi (1):
  image.bbclass: don't let do_rootfs depend on BUILDNAME

Martin Jansa (3):
  fontcache: allow to pass extra parameters and environment to fc-cache
  texinfo: don't create dependency on INHERIT variable
  linux-dtb.inc: drop unused DTB_NAME variable from do_install

Mike Crowe (1):
  allarch: Force TARGET_*FLAGS variable values

Richard Purdie (2):
  layer.conf: Add several allarch dependency exclusions
  layer.conf: Add missing dependency for allarch package
    initramfs-framework

Sergiy Kibrik (1):
  rsync: backport libattr checking patch

Sona Sarmadi (7):
  libtasn1: CVE-2015-3622
  grep2.19: CVE-2015-1345
  libxml2: CVE-2015-7942
  libxml2: CVE-2015-8035
  openssl: CVE-2015-3194, CVE-2015-3195
  libxml2: CVE-2015-8241
  bind: CVE-2015-8000

Tudor Florea (2):
  glibc: use patch for CVE-2015-1781
  unzip: CVE-2015-7696, CVE-2015-7697

 meta/classes/allarch.bbclass                       |   4 +
 meta/classes/fontcache.bbclass                     |  19 +-
 meta/classes/image.bbclass                         |   2 +-
 meta/conf/layer.conf                               |  11 ++
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  50 ++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |   1 +
 .../bind/bind/CVE-2015-8000.patch                  | 194 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
 .../openssh/openssh/CVE-2015-6563.patch            |  36 ++++
 .../openssh/openssh/CVE-2015-6564.patch            |  34 ++++
 .../openssh/openssh/CVE-2015-6565.patch            |  35 ++++
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |   5 +-
 .../CVE-2015-3194-Add-PSS-parameter-check.patch    |  37 ++++
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  61 +++++++
 .../recipes-connectivity/openssl/openssl_1.0.1p.bb |   2 +
 ...5-1472-wscanf-allocates-too-little-memory.patch | 108 ++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb              |   5 +-
 meta/recipes-core/libxml/libxml2.inc               |   3 +
 .../libxml/libxml2/CVE-2015-7942.patch             |  58 ++++++
 .../libxml/libxml2/CVE-2015-8035.patch             |  35 ++++
 .../libxml/libxml2/CVE-2015-8241.patch             |  41 +++++
 .../rsync/files/check_libattr.patch                |  33 ++++
 meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   3 +-
 .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch    | 129 ++++++++++++++
 meta/recipes-extended/grep/grep_2.19.bb            |   4 +-
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |   2 +-
 .../unzip/unzip/CVE-2015-7696.patch                |  38 ++++
 .../unzip/unzip/CVE-2015-7697.patch                |  31 ++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +
 meta/recipes-kernel/linux/linux-dtb.inc            |   1 -
 .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   |  44 +++++
 meta/recipes-support/gnutls/libtasn1_4.0.bb        |   1 +
 scripts/postinst-intercepts/update_font_cache      |   4 +-
 34 files changed, 1020 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
 create mode 100644 meta/recipes-devtools/rsync/files/check_libattr.patch
 create mode 100644 meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch

-- 
1.9.1


