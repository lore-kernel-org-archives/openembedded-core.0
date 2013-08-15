Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 569EA6B8A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:22:53 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so183398ead.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=dOpQE/IAvWga0FWVzmKy8fsAUGIwUgTb26ljjkvNP70=;
	b=hXewbFf/6RTpg9Qxx/+UsinJFgy/DyFQ8wOMiqsp1a+Y0SAdJ/qY2SjRVblKC+AgHp
	KUgJ1E9nExwE+BdoaCwaI+sixMsMVgClLYTWNLBtpEX4wmUPr1JDqoSgYd0dU3m+0YTp
	s9JqAncXxcGJ5H1Qqt/i49ClLW9Xiecm1g1Zmt4EXSZ0iOjo/lsOdnAnWkDSBBvJ9vYr
	RvLC5tMxoWksKAgw5Ah1zU1o45pOv+9YXSecyuDLX/EJzzys/7mRIUA3LzosEPM9evUn
	S69LopPh3M09O7Xyjs//y1BiUm3Nm3bVoUrDRv3Yg3UupHAttDJyGSmBrn2vygQKrxNp
	B9xg==
X-Received: by 10.14.95.2 with SMTP id o2mr240659eef.82.1376551373756;
	Thu, 15 Aug 2013 00:22:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm68769182eeh.8.2013.08.15.00.22.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:22:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:11 +0200
Message-Id: <cover.1376551401.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [for-dylan][PATCH 00/33] Backports for deterministic dependencies
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
X-List-Received-Date: Thu, 15 Aug 2013 07:22:53 -0000

The following changes since commit acf46cb2eb03c2ed3aadd7858044ba2837a83292:

  grub: disable floating ncurses dependency for GPLv2 version (2013-08-07 11:44:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/dylan-backports
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dylan-backports

Christopher Larson (1):
  quota: obey 'tcp-wrappers' PACKAGECONFIG

Eric Nelson (1):
  gst-plugins-gl: add explicit dependency on libpng

Hongxu Jia (1):
  wget: Add missing DEPENDS on zlib

Mark Hatle (1):
  libarchive: Fix build dependencies

Martin Jansa (26):
  (lib)telepathy*: add missing dependency on libxslt-native
  gst-plugins-bad: inherit gsettings
  gst-plugins-base: add missing dependency on glib-2.0-native
  taglib: add missing dependency on zlib
  quota: inherit pkgconfig
  libpam: inherit pkgconfig
  systemtap: inherit pkgconfig
  eglibc-locale: add missing dependency on
    virtual/${TARGET_PREFIX}binutils
  gst-plugins-bad: add few more PACKAGECONFIGs
  xkeyboard-config: add missing dependency on util-macros
  ccache: add zlib dependency
  cups: add PACKAGECONFIG for acl
  directfb: add PACKAGECONFIG for jpeg2000
  distcc: add PACKAGECONFIG for popt
  grub: add PACKAGECONFIG for grub-mount
  mailx: remove support for autodetection of krb5
  minicom: add configure option and PACKAGECONFIG for lockdev
  ltp: add acl, openssl dependency
  patch: add PACKAGECONFIG for attr
  python-imaging: add PACKAGECONFIG for lcms
  socat: add PACKAGECONFIG for tcp-wrappers
  sudo: add PACKAGECONFIG for zlib
  gst-plugins-good: add PACKAGECONFIG for jpeg, wavpack, gdkpixbuf, v4l,
    bzip2, orc
  gettext: disable nls when INHIBIT_DEFAULT_DEPS is set
  weston: backport patch for libunwind configure option and disable it
  mesa: inherit gettext

Richard Purdie (1):
  bdwgc-native: Add missing pkgconfig DEPENDS

Ross Burton (1):
  gst-plugins-bad: element selection rationalisation

Roy.Li (1):
  gcc: add build directory to include directories

 meta/classes/gettext.bbclass                       |  4 +-
 meta/recipes-bsp/grub/grub_2.00.bb                 |  3 +
 meta/recipes-connectivity/socat/socat_1.7.2.1.bb   |  3 +
 .../telepathy/libtelepathy_0.3.3.bb                |  2 +-
 .../telepathy/telepathy-glib_0.20.1.bb             |  3 +-
 .../telepathy/telepathy-idle_0.1.14.bb             |  3 +-
 .../telepathy/telepathy-mission-control_5.14.0.bb  |  4 +-
 .../telepathy/telepathy-python_0.15.19.bb          |  1 +
 meta/recipes-core/eglibc/eglibc-locale.inc         |  5 ++
 meta/recipes-devtools/ccache/ccache.inc            |  2 +
 meta/recipes-devtools/distcc/distcc_3.1.bb         |  4 +-
 meta/recipes-devtools/gcc/gcc_4.7.bb               |  2 +-
 meta/recipes-devtools/patch/patch.inc              |  3 +
 .../allow.to.disable.some.features.patch           | 65 ++++++++++++++++++++++
 .../python/python-imaging_1.1.7.bb                 | 10 +++-
 meta/recipes-extended/cups/cups16.inc              |  1 +
 .../libarchive/libarchive_2.8.5.bb                 | 20 ++++++-
 meta/recipes-extended/ltp/ltp_20120903.bb          |  2 +-
 .../explicitly.disable.krb5.support.patch          | 46 +++++++++++++++
 meta/recipes-extended/mailx/mailx_12.5.bb          |  1 +
 .../minicom-2.6.2/allow.to.disable.lockdev.patch   | 21 +++++++
 meta/recipes-extended/minicom/minicom_2.6.2.bb     |  7 ++-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |  2 +-
 meta/recipes-extended/quota/quota_4.01.bb          |  5 +-
 meta/recipes-extended/sudo/sudo.inc                |  3 +
 meta/recipes-extended/wget/wget.inc                |  2 +-
 meta/recipes-graphics/directfb/directfb.inc        |  3 +
 meta/recipes-graphics/mesa/mesa-common.inc         |  2 +-
 ...utotools-Add-a-libunwind-configure-switch.patch | 40 +++++++++++++
 meta/recipes-graphics/wayland/weston_1.0.6.bb      |  3 +-
 .../xorg-lib/xkeyboard-config_2.8.bb               |  2 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  2 +-
 .../gstreamer/gst-plugins-bad_0.10.23.bb           | 34 ++++++++---
 .../gstreamer/gst-plugins-base_0.10.36.bb          |  2 +-
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |  2 +-
 .../gstreamer/gst-plugins-good_0.10.31.bb          | 12 +++-
 meta/recipes-support/bdwgc/bdwgc_7.2.bb            |  2 +-
 meta/recipes-support/taglib/taglib_1.8.bb          |  2 +
 38 files changed, 292 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 create mode 100644 meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-autotools-Add-a-libunwind-configure-switch.patch

-- 
1.8.3.2


