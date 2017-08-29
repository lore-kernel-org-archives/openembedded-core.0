Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC7171A32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 13:37:19 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p69so2360038pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p2Zqm3BGHNz8h7rb8kt5dDX1327pbNMcyzH5Zjhex4Q=;
	b=I8yw1kHTmpDR0N1IZs7iGvjiFTkLZSS14vtrNtRMxlAKbrfTW3pl24D0FRe2H+UzK7
	k6KXGSz1yhoR/KXVgTdmh5q46FEEJ4RJFWaaBg7J2ZPTvIWKw+bt65TBdefLsC0LB8v4
	5InokehsUrNN2E1vqV2OTDzbMjtQZidHzLc60F7K0ddXLVJbec40QN77zy7Y5ntTugIw
	HVcCsrUgJA0AmiKjfLxCisOCa2TWE2JGr/+t0DekXpECClvJScpkqvedYNqSUtuBRNZM
	LpPHEhr6f8s9ixvau7exFfr3nMV/s1QGAYJCzztLBDa4pK0U31MpJPnwpU4FuKuaWje2
	xvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p2Zqm3BGHNz8h7rb8kt5dDX1327pbNMcyzH5Zjhex4Q=;
	b=Ro7UXNyUMDIhDKY02dIUR+YWzaKNQUb06QTR684AOhW4kzp16+hd8k4aEshMGbUdQr
	TvvceWeZsZK/IfY85nhrWsM60HAtinE+FTTzH2cs2GOSrzDTvCN4YdER6HgQOSkrnovo
	o8zqMzFLG93qCYqnyIbHwXscQZ/yKGWZNSkToDhhbS+n6fZdU/TS4vpeorb/XSO4F5Ln
	S2QMvVlwCM+2lR7DUTvn7jt02ItY76nx9fjT/aB6Wwep7g6GRDUssGY0igZwoVQpSQ7v
	cydWm5ABh9FPlv0ElQm9RlvCB96JcpMttH/8Mril35uq29Jm0yvTdmno6UNpagTfFVsS
	Rs3g==
X-Gm-Message-State: AHYfb5ilRda6RtkWeXiLLI75aHEXH5osAjSO0jeMH4lHTbfuYmPtlgMz
	ZVB5m5riqz22/Q==
X-Received: by 10.99.0.5 with SMTP id 5mr316543pga.427.1504013840861;
	Tue, 29 Aug 2017 06:37:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:3811:df20:51dd:86d9])
	by smtp.gmail.com with ESMTPSA id x4sm5008300pfx.63.2017.08.29.06.37.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Aug 2017 06:37:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 06:36:38 -0700
Message-Id: <cover.1504013598.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/39] Pyro-next pull request
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
X-List-Received-Date: Tue, 29 Aug 2017 13:37:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for Pryo. 
Clean nightly AB build

cover letter only

The following changes since commit 2b11266d670aa992a7ddb12f7f869ce4ec017f99:

  uninative: Update to 1.7 uninative release (2017-08-09 15:41:49 +0100)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/pyro-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/pyro-next

Andre McCurdy (4):
  lsof: minor recipe cleanup
  lsof: update SRC_URI
  gnu-config: update SRC_URI to new savannah.gnu.org hostname
  mirrors.bbclass: provide git repo fallbacks using the https protocol

André Draszik (1):
  linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl

Gan Yau Wai (1):
  insane.bbclass: fix override handling in RDEPENDS QA

Jackie Huang (1):
  ncurses: add SYSROOT_DESTDIR for siteconfig_gencache

Kai Kang (1):
  lsof: clear setuid

Khem Raj (1):
  gnu-efi: Fix build with gcc7

Martin Jansa (3):
  v86d, qemuboot-x86.inc: use
    KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead
    of fbsetup init script
  icecc.bbclass: prevent nativesdk builds depending on target specific
    KERNEL_CC
  mesa.inc: drop wrong path in --with-llvm-prefix and export LLVM_CONFIG

Mikko Rapeli (20):
  acpid.inc: set CVE_PRODUCT to acpid2
  bluez5.inc: set CVE_PRODUCT to bluez
  eglinfo.inc: set CVE_PRODUCT to eglinfo
  flac_1.3.1.bb: set CVE_PRODUCT to libflac
  gcc-common.inc: set CVE_PRODUCT to gcc
  glib.inc: set CVE_PRODUCT to glib
  glibc-common.inc: set CVE_PRODUCT to glibc
  icu.inc: set CVE_PRODUCT to international_components_for_unicode
  libpcre_8.40.bb: set CVE_PRODUCT to prce
  libpcre2_10.23.bb: set CVE_PRODUCT to pcre2
  libsamplerate0_0.1.9.bb: set CVE_PRODUCT to libsamplerate
  libsndfile1_1.0.28.bb: set CVE_PRODUCT to libsndfile
  nspr_4.14.bb: set CVE_PRODUCT to netscape_portable_runtime
  python.inc: set CVE_PRODUCT to python
  lttng-ust_2.9.1.bb: set CVE_PRODUCT to ust
  quota_4.03.bb: set CVE_PRODUCT to linux_diskquota
  sqlite3.inc: set CVE_PRODUCT to sqlite
  wpa-supplicant_2.6.bb: set CVE_PRODUCT to wpa_supplicant
  cve-check.bbclass: use weak assignment for default CVE_PRODUCT
  kernel.bbclass: set CVE_PRODUCT to linux_kernel if not set by recipe

Nicolas Dechesne (1):
  kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz

Richard Röjfors (1):
  package_manager: Fix support for NO_RECOMMENDATONS

Ross Burton (2):
  elfutils: use HTTP instead of FTP to fetch
  chrpath: use https for SRC_URI

Saul Wold (1):
  systemtap: ensure systemtap-native is available

Tom Rini (2):
  image.bbclass: Correct chaining compression support
  image: Fix "metadata is not deterministic" when chaining 2+
    CONVERSION_CMDs

 meta/classes/cve-check.bbclass                     |  2 +-
 meta/classes/icecc.bbclass                         |  1 +
 meta/classes/image.bbclass                         |  4 +-
 meta/classes/image_types_uboot.bbclass             | 13 +++---
 meta/classes/insane.bbclass                        |  2 +-
 meta/classes/kernel.bbclass                        | 20 +++++-----
 meta/classes/mirrors.bbclass                       | 11 ++++++
 meta/conf/machine/include/qemuboot-x86.inc         |  7 +++-
 meta/lib/oe/package_manager.py                     |  2 +-
 meta/recipes-bsp/acpid/acpid.inc                   |  2 +
 ...plicit-fall-through-so-Wextra-will-work-i.patch | 34 ++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb          |  3 +-
 meta/recipes-bsp/v86d/v86d/fbsetup                 |  3 --
 meta/recipes-bsp/v86d/v86d/uvesafb.conf            |  2 -
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               | 36 -----------------
 meta/recipes-connectivity/bluez5/bluez5.inc        |  2 +
 .../wpa-supplicant/wpa-supplicant_2.6.bb           |  2 +
 meta/recipes-core/glib-2.0/glib.inc                |  2 +
 meta/recipes-core/glibc/glibc-common.inc           |  1 +
 meta/recipes-core/ncurses/ncurses.inc              |  2 +
 meta/recipes-devtools/chrpath/chrpath_0.16.bb      |  2 +-
 meta/recipes-devtools/elfutils/elfutils_0.168.bb   |  2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |  2 +
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |  2 +-
 meta/recipes-devtools/python/python.inc            |  2 +
 meta/recipes-extended/lsof/lsof_4.89.bb            | 26 ++++++------
 meta/recipes-extended/quota/quota_4.03.bb          |  2 +
 meta/recipes-graphics/eglinfo/eglinfo.inc          |  2 +
 meta/recipes-graphics/mesa/mesa.inc                |  3 +-
 ....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 46 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.10.bb  |  1 +
 meta/recipes-kernel/lttng/lttng-ust_2.9.0.bb       |  2 +
 .../systemtap/systemtap-native_git.bb              |  7 ++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  2 +-
 meta/recipes-multimedia/flac/flac_1.3.2.bb         |  2 +
 .../libsamplerate/libsamplerate0_0.1.9.bb          |  2 +
 .../libsndfile/libsndfile1_1.0.27.bb               |  2 +
 meta/recipes-support/icu/icu.inc                   |  2 +
 meta/recipes-support/libpcre/libpcre2_10.22.bb     |  2 +
 meta/recipes-support/libpcre/libpcre_8.40.bb       |  2 +
 meta/recipes-support/nspr/nspr_4.13.1.bb           |  2 +
 meta/recipes-support/sqlite/sqlite3.inc            |  2 +
 42 files changed, 187 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
 delete mode 100755 meta/recipes-bsp/v86d/v86d/fbsetup
 delete mode 100644 meta/recipes-bsp/v86d/v86d/uvesafb.conf
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-native_git.bb

-- 
2.7.4


