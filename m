Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id F11E760557
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Nov 2014 21:12:53 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n8so7609156qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Nov 2014 13:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=vNzHIYJt4UWDTjIOORKiTdHyRUuNO/P9HJuIzveTT+o=;
	b=SGTv5X6fCx7O3Iu32KRKZc8k2cHTsR6AYG46CzhgNp+pSYocCxSXy+JZ6tbsK2gobT
	J6roXf5zVoz8GUgWbUIhdBmH880Vq2W9XjWnHmr1WtFammRvZ0qfFymtg3xmIP0dfKaR
	DMHCfA7VlJ0VjoZ9NnR0d3cF2zmq6GgSv9RAB32fnBqQ4gJrcW/rGSw5YGzb5IwmdDZ4
	jG1ZGmAUHVuCIUDV5x+Yd7siRKjDBdLZPZypK5rA36VdH+okXQQqkICnPbxFoZ3HepBo
	8qr/XLpW39HnUPigedfgaTI4PBW2uiFo35RC9eKkaQcFX3g+TFro0Cs6ToslCoZPEdHP
	MhBg==
X-Gm-Message-State: ALoCoQkNkW7NSNuJxdHv2c1tBJVtlkzvU3tEDeLP1DBziIvzYxRacV0wdK8xiDqXVkAOtVbY2Fpn
X-Received: by 10.140.94.246 with SMTP id g109mr25985642qge.77.1414962774053; 
	Sun, 02 Nov 2014 13:12:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Sun, 2 Nov 2014 13:12:33 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 2 Nov 2014 21:12:33 +0000
Message-ID: <CAJTo0LYSg5DaXzC+aYx8CDawNgJcxjM68ncWKQA3NNf5JoeM2g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH 00/35] Consolidated pull
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
X-List-Received-Date: Sun, 02 Nov 2014 21:13:03 -0000
Content-Type: multipart/alternative; boundary=001a113a81d684b20d0506e6b188

--001a113a81d684b20d0506e6b188
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

A consolidated pull for master.  Clean green builds on the autobuilder,
apart from the usual intermittent systemd failure in the sanity tests.

Ross

The following changes since commit f19b4e995ea47f9243f152b39337330307453c9f=
:
  bitbake: bitbake: clarify startup message (2014-10-30 13:39:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 24b5903eeb440a385028ab0f1f19db2b1b908254:

  rootfs.py: tweak inner warn message catching (2014-10-31 10:18:16 +0000)

----------------------------------------------------------------
Andreas M=C3=BCller (1):
      gdb-cross: build with python support

Armin Kuster (2):
      tzcode: update to 2014i
      tzdata: update to 2014i

Bogdan Purcareata (1):
      shadow: enable support for subordinate IDs

Chen Qi (1):
      bind: fix to use correct environment file in service file

Chong Lu (4):
      xinetd: add systemd unit file
      kmod: fix debuginfo is missing in shared library
      curl: Security Advisory - curl - CVE-2014-3613
      docbook-xsl-stylesheets: add perl to RDEPENDS

Gary Thomas (1):
      python-pygtk: Restore pkg-config file

Hongxu Jia (7):
      classes/image: remove obsolete MULTILIB_VENDORS
      multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image
      opkg: fix remove pkg with --force-removal-of-dependent-packages faile=
d
      multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain
build failure
      man-pages/shadow: resolve man pages confliction
      python-smartpm: report warn rather than error during install with
--attempt
      rootfs.py: tweak inner warn message catching

Jackie Huang (1):
      license.bbclass: canonicalise the licenses named with 'X+'

Johan Hovold (1):
      udev: fix uevent-helper disable

Kai Kang (2):
      beecrypt: add option --with-dev-dsp
      python-2.7.3:remove BOM insertion code

Martin Hundeb=C3=B8ll (1):
      scripts: use '/usr/bin/env' in shebangs with python

Martin Jansa (1):
      systemd: don't move libgudev around, it breaks libgudev-1.0.la

Ming Liu (1):
      pciutils: Fix multilib header conflict - pci/config.h

Pascal Bach (1):
      image_types.bbclass: Make ubi depend on ubifs

Paul Barker (2):
      mc: Update patch status
      package_manager: Fix BAD_RECOMMENDATIONS for opkg

Ross Burton (1):
      systemd: don't add files and dependencies from units Conflicts

Roy Li (1):
      python3: do not replace ccache in the middle of a path

Roy.Li (1):
      iproute2: backport a patch to make adding vxlan link success

Shan Hai (1):
      ldconfig-native: fix a endian-ness bug

Yuanjie Huang (1):
      mtd-utils: Fix alignment trap triggered by NEON instructions

Yue Tao (2):
      subversion: Security Advisory - subversion - CVE-2014-3522
      subversion: Security Advisory - subversion - CVE-2014-3528

yadi.hu@windriver.com (1):
      BusyBox: Fixing broadcast address is not fed and rightly initialized

 bitbake/lib/progressbar.py                         |   2 +-
 meta/classes/image.bbclass                         |  11 -
 meta/classes/image_types.bbclass                   |   2 +
 meta/classes/license.bbclass                       |  11 +-
 meta/classes/multilib.bbclass                      |   4 +
 meta/classes/systemd.bbclass                       |   5 +-
 meta/lib/oe/package_manager.py                     |   7 +
 meta/lib/oe/rootfs.py                              |   2 +-
 meta/recipes-bsp/pciutils/pciutils_3.2.1.bb        |   4 +
 meta/recipes-connectivity/bind/bind/named.service  |   2 +-
 ...p-link-Remove-unnecessary-device-checking.patch |  35 ++
 .../iproute2/iproute2_3.16.0.bb                    |   1 +
 meta/recipes-core/busybox/files/simple.script      |   4 +-
 .../endian-ness_handling_fix.patch                 |  47 +++
 meta/recipes-core/glibc/ldconfig-native_2.12.1.bb  |   1 +
 meta/recipes-core/systemd/systemd_216.bb           |   9 +-
 meta/recipes-core/udev/udev/init                   |   2 +-
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |   2 +
 meta/recipes-devtools/gdb/gdb-cross.inc            |  13 +-
 .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   |  44 ++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   1 +
 ...g_remove.c-avoid-remove-pkg-repeatly-with.patch |  39 ++
 meta/recipes-devtools/opkg/opkg_0.2.2.bb           |   1 +
 .../python/python-pygtk/fix-pygtk-2.0.pc.patch     |  13 +
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |   2 +-
 .../python/python-smartpm/smart-attempt.patch      |  27 +-
 .../python/python/remove-BOM-insection-code.patch  |  24 ++
 meta/recipes-devtools/python/python3_3.3.3.bb      |   2 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |   1 +
 .../subversion-CVE-2014-3522.patch                 | 444
+++++++++++++++++++++
 .../subversion/subversion-CVE-2014-3522.patch      | 439
++++++++++++++++++++
 .../subversion/subversion-CVE-2014-3528.patch      |  29 ++
 .../subversion/subversion_1.6.15.bb                |   5 +-
 .../subversion/subversion_1.8.9.bb                 |   2 +
 meta/recipes-extended/man-pages/man-pages_3.71.bb  |   7 +
 meta/recipes-extended/mc/mc/mc-CTRL.patch          |   2 +-
 ..._of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch |  41 ++
 meta/recipes-extended/shadow/shadow.inc            |   7 +-
 .../recipes-extended/tzcode/tzcode-native_2014h.bb |  11 -
 .../recipes-extended/tzcode/tzcode-native_2014i.bb |  10 +
 meta/recipes-extended/tzdata/tzdata_2014h.bb       |   6 -
 meta/recipes-extended/tzdata/tzdata_2014i.bb       |   6 +
 meta/recipes-extended/xinetd/xinetd/xinetd.service |  13 +
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |  12 +-
 meta/recipes-kernel/kmod/kmod/run-ptest            |   2 +
 meta/recipes-kernel/kmod/kmod_git.bb               |   9 +-
 .../beecrypt/beecrypt/add-option-dev-dsp.patch     |  34 ++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |   1 +
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 +++++++++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   1 +
 scripts/lib/wic/conf.py                            |   2 +-
 scripts/lib/wic/creator.py                         |   2 +-
 scripts/lib/wic/imager/baseimager.py               |   2 +-
 scripts/lib/wic/kickstart/__init__.py              |   2 +-
 .../lib/wic/kickstart/custom_commands/micboot.py   |   2 +-
 .../wic/kickstart/custom_commands/micpartition.py  |   2 +-
 scripts/lib/wic/msger.py                           |   2 +-
 scripts/lib/wic/plugin.py                          |   2 +-
 scripts/lib/wic/pluginbase.py                      |   2 +-
 scripts/lib/wic/utils/errors.py                    |   2 +-
 scripts/lib/wic/utils/fs_related.py                |   2 +-
 scripts/lib/wic/utils/misc.py                      |   2 +-
 scripts/lib/wic/utils/partitionedfs.py             |   2 +-
 scripts/lib/wic/utils/runner.py                    |   2 +-
 scripts/pybootchartgui/pybootchartgui.py           |   2 +-
 65 files changed, 1627 insertions(+), 71 deletions(-)
 create mode 100644
meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary=
-device-checking.patch
 create mode 100644
meta/recipes-core/glibc/ldconfig-native-2.12.1/endian-ness_handling_fix.pat=
ch
 create mode 100644
meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
 create mode 100644
meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repe=
atly-with.patch
 create mode 100644
meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
 create mode 100644
meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
 create mode 100644
meta/recipes-devtools/subversion/subversion-1.8.9/subversion-CVE-2014-3522.=
patch
 create mode 100644
meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch
 create mode 100644
meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
 create mode 100644
meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_C=
HECK_SIZEOF.patch
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014h.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014i.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014h.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014i.bb
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.service
 create mode 100644
meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch

Andreas M=C3=BCller (1):
  gdb-cross: build with python support

Armin Kuster (2):
  tzcode: update to 2014i
  tzdata: update to 2014i

Bogdan Purcareata (1):
  shadow: enable support for subordinate IDs

Chen Qi (1):
  bind: fix to use correct environment file in service file

Chong Lu (4):
  xinetd: add systemd unit file
  kmod: fix debuginfo is missing in shared library
  curl: Security Advisory - curl - CVE-2014-3613
  docbook-xsl-stylesheets: add perl to RDEPENDS

Gary Thomas (1):
  python-pygtk: Restore pkg-config file

Hongxu Jia (7):
  classes/image: remove obsolete MULTILIB_VENDORS
  multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image
  opkg: fix remove pkg with --force-removal-of-dependent-packages failed
  multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain
    build failure
  man-pages/shadow: resolve man pages confliction
  python-smartpm: report warn rather than error during install with
    --attempt
  rootfs.py: tweak inner warn message catching

Jackie Huang (1):
  license.bbclass: canonicalise the licenses named with 'X+'

Johan Hovold (1):
  udev: fix uevent-helper disable

Kai Kang (2):
  beecrypt: add option --with-dev-dsp
  python-2.7.3:remove BOM insertion code

Martin Hundeb=C3=B8ll (1):
  scripts: use '/usr/bin/env' in shebangs with python

Martin Jansa (1):
  systemd: don't move libgudev around, it breaks libgudev-1.0.la

Ming Liu (1):
  pciutils: Fix multilib header conflict - pci/config.h

Pascal Bach (1):
  image_types.bbclass: Make ubi depend on ubifs

Paul Barker (2):
  mc: Update patch status
  package_manager: Fix BAD_RECOMMENDATIONS for opkg

Ross Burton (1):
  systemd: don't add files and dependencies from units Conflicts

Roy Li (1):
  python3: do not replace ccache in the middle of a path

Roy.Li (1):
  iproute2: backport a patch to make adding vxlan link success

Shan Hai (1):
  ldconfig-native: fix a endian-ness bug

Yuanjie Huang (1):
  mtd-utils: Fix alignment trap triggered by NEON instructions

Yue Tao (2):
  subversion: Security Advisory - subversion - CVE-2014-3522
  subversion: Security Advisory - subversion - CVE-2014-3528

yadi.hu@windriver.com (1):
  BusyBox: Fixing broadcast address is not fed and rightly initialized

 bitbake/lib/progressbar.py                         |   2 +-
 meta/classes/image.bbclass                         |  11 -
 meta/classes/image_types.bbclass                   |   2 +
 meta/classes/license.bbclass                       |  11 +-
 meta/classes/multilib.bbclass                      |   4 +
 meta/classes/systemd.bbclass                       |   5 +-
 meta/lib/oe/package_manager.py                     |   7 +
 meta/lib/oe/rootfs.py                              |   2 +-
 meta/recipes-bsp/pciutils/pciutils_3.2.1.bb        |   4 +
 meta/recipes-connectivity/bind/bind/named.service  |   2 +-
 ...p-link-Remove-unnecessary-device-checking.patch |  35 ++
 .../iproute2/iproute2_3.16.0.bb                    |   1 +
 meta/recipes-core/busybox/files/simple.script      |   4 +-
 .../endian-ness_handling_fix.patch                 |  47 +++
 meta/recipes-core/glibc/ldconfig-native_2.12.1.bb  |   1 +
 meta/recipes-core/systemd/systemd_216.bb           |   9 +-
 meta/recipes-core/udev/udev/init                   |   2 +-
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |   2 +
 meta/recipes-devtools/gdb/gdb-cross.inc            |  13 +-
 .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   |  44 ++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   1 +
 ...g_remove.c-avoid-remove-pkg-repeatly-with.patch |  39 ++
 meta/recipes-devtools/opkg/opkg_0.2.2.bb           |   1 +
 .../python/python-pygtk/fix-pygtk-2.0.pc.patch     |  13 +
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |   2 +-
 .../python/python-smartpm/smart-attempt.patch      |  27 +-
 .../python/python/remove-BOM-insection-code.patch  |  24 ++
 meta/recipes-devtools/python/python3_3.3.3.bb      |   2 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |   1 +
 .../subversion-CVE-2014-3522.patch                 | 444
+++++++++++++++++++++
 .../subversion/subversion-CVE-2014-3522.patch      | 439
++++++++++++++++++++
 .../subversion/subversion-CVE-2014-3528.patch      |  29 ++
 .../subversion/subversion_1.6.15.bb                |   5 +-
 .../subversion/subversion_1.8.9.bb                 |   2 +
 meta/recipes-extended/man-pages/man-pages_3.71.bb  |   7 +
 meta/recipes-extended/mc/mc/mc-CTRL.patch          |   2 +-
 ..._of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch |  41 ++
 meta/recipes-extended/shadow/shadow.inc            |   7 +-
 .../recipes-extended/tzcode/tzcode-native_2014h.bb |  11 -
 .../recipes-extended/tzcode/tzcode-native_2014i.bb |  10 +
 meta/recipes-extended/tzdata/tzdata_2014h.bb       |   6 -
 meta/recipes-extended/tzdata/tzdata_2014i.bb       |   6 +
 meta/recipes-extended/xinetd/xinetd/xinetd.service |  13 +
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |  12 +-
 meta/recipes-kernel/kmod/kmod/run-ptest            |   2 +
 meta/recipes-kernel/kmod/kmod_git.bb               |   9 +-
 .../beecrypt/beecrypt/add-option-dev-dsp.patch     |  34 ++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |   1 +
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 +++++++++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   1 +
 scripts/lib/wic/conf.py                            |   2 +-
 scripts/lib/wic/creator.py                         |   2 +-
 scripts/lib/wic/imager/baseimager.py               |   2 +-
 scripts/lib/wic/kickstart/__init__.py              |   2 +-
 .../lib/wic/kickstart/custom_commands/micboot.py   |   2 +-
 .../wic/kickstart/custom_commands/micpartition.py  |   2 +-
 scripts/lib/wic/msger.py                           |   2 +-
 scripts/lib/wic/plugin.py                          |   2 +-
 scripts/lib/wic/pluginbase.py                      |   2 +-
 scripts/lib/wic/utils/errors.py                    |   2 +-
 scripts/lib/wic/utils/fs_related.py                |   2 +-
 scripts/lib/wic/utils/misc.py                      |   2 +-
 scripts/lib/wic/utils/partitionedfs.py             |   2 +-
 scripts/lib/wic/utils/runner.py                    |   2 +-
 scripts/pybootchartgui/pybootchartgui.py           |   2 +-
 65 files changed, 1627 insertions(+), 71 deletions(-)
 create mode 100644
meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary=
-device-checking.patch
 create mode 100644
meta/recipes-core/glibc/ldconfig-native-2.12.1/endian-ness_handling_fix.pat=
ch
 create mode 100644
meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
 create mode 100644
meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repe=
atly-with.patch
 create mode 100644
meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
 create mode 100644
meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
 create mode 100644
meta/recipes-devtools/subversion/subversion-1.8.9/subversion-CVE-2014-3522.=
patch
 create mode 100644
meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch
 create mode 100644
meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
 create mode 100644
meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_C=
HECK_SIZEOF.patch
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014h.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014i.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014h.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014i.bb
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.service
 create mode 100644
meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch

--=20
1.9.3 (Apple Git-50)

--001a113a81d684b20d0506e6b188
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div><br></div><div>A consolidated pull =
for master.=C2=A0 Clean green builds on the autobuilder, apart from the usu=
al intermittent systemd failure in the sanity tests.</div><div><br></div><d=
iv>Ross</div><div><br></div><div>The following changes since commit f19b4e9=
95ea47f9243f152b39337330307453c9f:<br></div><div>=C2=A0 bitbake: bitbake: c=
larify startup message (2014-10-30 13:39:52 +0000)</div><div><br></div><div=
>are available in the git repository at:</div><div><br></div><div>=C2=A0 gi=
t://<a href=3D"http://git.yoctoproject.org/poky-contrib">git.yoctoproject.o=
rg/poky-contrib</a> ross/mut</div><div><br></div><div>for you to fetch chan=
ges up to 24b5903eeb440a385028ab0f1f19db2b1b908254:</div><div><br></div><di=
v>=C2=A0 rootfs.py: tweak inner warn message catching (2014-10-31 10:18:16 =
+0000)</div><div><br></div><div>-------------------------------------------=
---------------------</div><div>Andreas M=C3=BCller (1):</div><div>=C2=A0 =
=C2=A0 =C2=A0 gdb-cross: build with python support</div><div><br></div><div=
>Armin Kuster (2):</div><div>=C2=A0 =C2=A0 =C2=A0 tzcode: update to 2014i</=
div><div>=C2=A0 =C2=A0 =C2=A0 tzdata: update to 2014i</div><div><br></div><=
div>Bogdan Purcareata (1):</div><div>=C2=A0 =C2=A0 =C2=A0 shadow: enable su=
pport for subordinate IDs</div><div><br></div><div>Chen Qi (1):</div><div>=
=C2=A0 =C2=A0 =C2=A0 bind: fix to use correct environment file in service f=
ile</div><div><br></div><div>Chong Lu (4):</div><div>=C2=A0 =C2=A0 =C2=A0 x=
inetd: add systemd unit file</div><div>=C2=A0 =C2=A0 =C2=A0 kmod: fix debug=
info is missing in shared library</div><div>=C2=A0 =C2=A0 =C2=A0 curl: Secu=
rity Advisory - curl - CVE-2014-3613</div><div>=C2=A0 =C2=A0 =C2=A0 docbook=
-xsl-stylesheets: add perl to RDEPENDS</div><div><br></div><div>Gary Thomas=
 (1):</div><div>=C2=A0 =C2=A0 =C2=A0 python-pygtk: Restore pkg-config file<=
/div><div><br></div><div>Hongxu Jia (7):</div><div>=C2=A0 =C2=A0 =C2=A0 cla=
sses/image: remove obsolete MULTILIB_VENDORS</div><div>=C2=A0 =C2=A0 =C2=A0=
 multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image</div><div>=
=C2=A0 =C2=A0 =C2=A0 opkg: fix remove pkg with --force-removal-of-dependent=
-packages failed</div><div>=C2=A0 =C2=A0 =C2=A0 multilib.bbclass/package_ma=
nager.py: fix &lt;multilib&gt;-meta-toolchain build failure</div><div>=C2=
=A0 =C2=A0 =C2=A0 man-pages/shadow: resolve man pages confliction</div><div=
>=C2=A0 =C2=A0 =C2=A0 python-smartpm: report warn rather than error during =
install with --attempt</div><div>=C2=A0 =C2=A0 =C2=A0 rootfs.py: tweak inne=
r warn message catching</div><div><br></div><div>Jackie Huang (1):</div><di=
v>=C2=A0 =C2=A0 =C2=A0 license.bbclass: canonicalise the licenses named wit=
h &#39;X+&#39;</div><div><br></div><div>Johan Hovold (1):</div><div>=C2=A0 =
=C2=A0 =C2=A0 udev: fix uevent-helper disable</div><div><br></div><div>Kai =
Kang (2):</div><div>=C2=A0 =C2=A0 =C2=A0 beecrypt: add option --with-dev-ds=
p</div><div>=C2=A0 =C2=A0 =C2=A0 python-2.7.3:remove BOM insertion code</di=
v><div><br></div><div>Martin Hundeb=C3=B8ll (1):</div><div>=C2=A0 =C2=A0 =
=C2=A0 scripts: use &#39;/usr/bin/env&#39; in shebangs with python</div><di=
v><br></div><div>Martin Jansa (1):</div><div>=C2=A0 =C2=A0 =C2=A0 systemd: =
don&#39;t move libgudev around, it breaks <a href=3D"http://libgudev-1.0.la=
">libgudev-1.0.la</a></div><div><br></div><div>Ming Liu (1):</div><div>=C2=
=A0 =C2=A0 =C2=A0 pciutils: Fix multilib header conflict - pci/config.h</di=
v><div><br></div><div>Pascal Bach (1):</div><div>=C2=A0 =C2=A0 =C2=A0 image=
_types.bbclass: Make ubi depend on ubifs</div><div><br></div><div>Paul Bark=
er (2):</div><div>=C2=A0 =C2=A0 =C2=A0 mc: Update patch status</div><div>=
=C2=A0 =C2=A0 =C2=A0 package_manager: Fix BAD_RECOMMENDATIONS for opkg</div=
><div><br></div><div>Ross Burton (1):</div><div>=C2=A0 =C2=A0 =C2=A0 system=
d: don&#39;t add files and dependencies from units Conflicts</div><div><br>=
</div><div>Roy Li (1):</div><div>=C2=A0 =C2=A0 =C2=A0 python3: do not repla=
ce ccache in the middle of a path</div><div><br></div><div>Roy.Li (1):</div=
><div>=C2=A0 =C2=A0 =C2=A0 iproute2: backport a patch to make adding vxlan =
link success</div><div><br></div><div>Shan Hai (1):</div><div>=C2=A0 =C2=A0=
 =C2=A0 ldconfig-native: fix a endian-ness bug</div><div><br></div><div>Yua=
njie Huang (1):</div><div>=C2=A0 =C2=A0 =C2=A0 mtd-utils: Fix alignment tra=
p triggered by NEON instructions</div><div><br></div><div>Yue Tao (2):</div=
><div>=C2=A0 =C2=A0 =C2=A0 subversion: Security Advisory - subversion - CVE=
-2014-3522</div><div>=C2=A0 =C2=A0 =C2=A0 subversion: Security Advisory - s=
ubversion - CVE-2014-3528</div><div><br></div><div><a href=3D"mailto:yadi.h=
u@windriver.com">yadi.hu@windriver.com</a> (1):</div><div>=C2=A0 =C2=A0 =C2=
=A0 BusyBox: Fixing broadcast address is not fed and rightly initialized</d=
iv><div><br></div><div>=C2=A0bitbake/lib/progressbar.py =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 2 +-</div><div>=C2=A0meta/classes/image.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A011 -</d=
iv><div>=C2=A0meta/classes/image_types.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +</div><div>=C2=A0meta/classe=
s/license.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A011 +-</div><div>=C2=A0meta/classes/multilib.bb=
class =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 4 +</div><div>=C2=A0meta/classes/systemd.bbclass =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 5 +-</div><div>=C2=A0meta/lib/oe/package_manager.py =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 7 +</div><div>=C2=
=A0meta/lib/oe/rootfs.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><=
div>=C2=A0meta/recipes-bsp/pciutils/<a href=3D"http://pciutils_3.2.1.bb">pc=
iutils_3.2.1.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 4 +</div><div>=C2=
=A0meta/recipes-connectivity/bind/bind/named.service =C2=A0| =C2=A0 2 +-</d=
iv><div>=C2=A0...p-link-Remove-unnecessary-device-checking.patch | =C2=A035=
 ++</div><div>=C2=A0.../iproute2/<a href=3D"http://iproute2_3.16.0.bb">ipro=
ute2_3.16.0.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 1 +</div><div>=C2=A0meta/recipes-core/busybox/files/s=
imple.script =C2=A0 =C2=A0 =C2=A0| =C2=A0 4 +-</div><div>=C2=A0.../endian-n=
ess_handling_fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A047 +++</div><div>=C2=A0meta/recipes-core/glibc/<a href=3D"http:=
//ldconfig-native_2.12.1.bb">ldconfig-native_2.12.1.bb</a> =C2=A0| =C2=A0 1=
 +</div><div>=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_216.=
bb">systemd_216.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 9 +-</di=
v><div>=C2=A0meta/recipes-core/udev/udev/init =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-</div><div>=C2=A0.../docboo=
k-xml/<a href=3D"http://docbook-xsl-stylesheets_1.78.1.bb">docbook-xsl-styl=
esheets_1.78.1.bb</a> =C2=A0| =C2=A0 2 +</div><div>=C2=A0meta/recipes-devto=
ols/gdb/gdb-cross.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A013 +=
-</div><div>=C2=A0.../mtd/mtd-utils/fix-armv7-neon-alignment.patch =C2=A0 |=
 =C2=A044 ++</div><div>=C2=A0meta/recipes-devtools/mtd/<a href=3D"http://mt=
d-utils_git.bb">mtd-utils_git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1=
 +</div><div>=C2=A0...g_remove.c-avoid-remove-pkg-repeatly-with.patch | =C2=
=A039 ++</div><div>=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_=
0.2.2.bb">opkg_0.2.2.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +=
</div><div>=C2=A0.../python/python-pygtk/fix-pygtk-2.0.pc.patch =C2=A0 =C2=
=A0 | =C2=A013 +</div><div>=C2=A0.../recipes-devtools/python/<a href=3D"htt=
p://python-pygtk_2.24.0.bb">python-pygtk_2.24.0.bb</a> | =C2=A0 2 +-</div><=
div>=C2=A0.../python/python-smartpm/smart-attempt.patch =C2=A0 =C2=A0 =C2=
=A0| =C2=A027 +-</div><div>=C2=A0.../python/python/remove-BOM-insection-cod=
e.patch =C2=A0| =C2=A024 ++</div><div>=C2=A0meta/recipes-devtools/python/<a=
 href=3D"http://python3_3.3.3.bb">python3_3.3.3.bb</a> =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 2 +-</div><div>=C2=A0meta/recipes-devtools/python/<a href=3D"http:=
//python_2.7.3.bb">python_2.7.3.bb</a> =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +</d=
iv><div>=C2=A0.../subversion-CVE-2014-3522.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 444 +++++++++++++++++++++</div><div>=C2=
=A0.../subversion/subversion-CVE-2014-3522.patch =C2=A0 =C2=A0 =C2=A0| 439 =
++++++++++++++++++++</div><div>=C2=A0.../subversion/subversion-CVE-2014-352=
8.patch =C2=A0 =C2=A0 =C2=A0| =C2=A029 ++</div><div>=C2=A0.../subversion/<a=
 href=3D"http://subversion_1.6.15.bb">subversion_1.6.15.bb</a> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 5 +-</div><div>=C2=A0=
.../subversion/<a href=3D"http://subversion_1.8.9.bb">subversion_1.8.9.bb</=
a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +</di=
v><div>=C2=A0meta/recipes-extended/man-pages/<a href=3D"http://man-pages_3.=
71.bb">man-pages_3.71.bb</a> =C2=A0| =C2=A0 7 +</div><div>=C2=A0meta/recipe=
s-extended/mc/mc/mc-CTRL.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2=
 +-</div><div>=C2=A0..._of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch | =
=C2=A041 ++</div><div>=C2=A0meta/recipes-extended/shadow/shadow.inc =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 7 +-</div><div>=C2=A0.../recipes=
-extended/tzcode/<a href=3D"http://tzcode-native_2014h.bb">tzcode-native_20=
14h.bb</a> | =C2=A011 -</div><div>=C2=A0.../recipes-extended/tzcode/<a href=
=3D"http://tzcode-native_2014i.bb">tzcode-native_2014i.bb</a> | =C2=A010 +<=
/div><div>=C2=A0meta/recipes-extended/tzdata/<a href=3D"http://tzdata_2014h=
.bb">tzdata_2014h.bb</a> =C2=A0 =C2=A0 =C2=A0 | =C2=A0 6 -</div><div>=C2=A0=
meta/recipes-extended/tzdata/<a href=3D"http://tzdata_2014i.bb">tzdata_2014=
i.bb</a> =C2=A0 =C2=A0 =C2=A0 | =C2=A0 6 +</div><div>=C2=A0meta/recipes-ext=
ended/xinetd/xinetd/xinetd.service | =C2=A013 +</div><div>=C2=A0meta/recipe=
s-extended/xinetd/<a href=3D"http://xinetd_2.3.15.bb">xinetd_2.3.15.bb</a> =
=C2=A0 =C2=A0 =C2=A0| =C2=A012 +-</div><div>=C2=A0meta/recipes-kernel/kmod/=
kmod/run-ptest =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +</div><=
div>=C2=A0meta/recipes-kernel/kmod/<a href=3D"http://kmod_git.bb">kmod_git.=
bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 9 +-</div>=
<div>=C2=A0.../beecrypt/beecrypt/add-option-dev-dsp.patch =C2=A0 =C2=A0 | =
=C2=A034 ++</div><div>=C2=A0meta/recipes-support/beecrypt/<a href=3D"http:/=
/beecrypt_4.2.1.bb">beecrypt_4.2.1.bb</a> =C2=A0 =C2=A0| =C2=A0 1 +</div><d=
iv>=C2=A0meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 +++++++++=
++++</div><div>=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.37.=
1.bb">curl_7.37.1.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +</d=
iv><div>=C2=A0scripts/lib/wic/conf.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-=
</div><div>=C2=A0scripts/lib/wic/creator.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-</div><di=
v>=C2=A0scripts/lib/wic/imager/baseimager.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/kickstar=
t/__init__.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-=
</div><div>=C2=A0.../lib/wic/kickstart/custom_commands/micboot.py =C2=A0 | =
=C2=A0 2 +-</div><div>=C2=A0.../wic/kickstart/custom_commands/micpartition.=
py =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/msger.py =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/plugin.py =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/pluginbase.py =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 2 +-</div><div>=C2=A0scripts/lib/wic/utils/errors.py =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div=
>=C2=A0scripts/lib/wic/utils/fs_related.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/utils=
/misc.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/utils/partitionedfs=
.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-</div><div>=C2=
=A0scripts/lib/wic/utils/runner.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/pyboot=
chartgui/pybootchartgui.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-=
</div><div>=C2=A065 files changed, 1627 insertions(+), 71 deletions(-)</div=
><div>=C2=A0create mode 100644 meta/recipes-connectivity/iproute2/iproute2/=
0001-ip-link-Remove-unnecessary-device-checking.patch</div><div>=C2=A0creat=
e mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/endian-ness_ha=
ndling_fix.patch</div><div>=C2=A0create mode 100644 meta/recipes-devtools/m=
td/mtd-utils/fix-armv7-neon-alignment.patch</div><div>=C2=A0create mode 100=
644 meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-=
repeatly-with.patch</div><div>=C2=A0create mode 100644 meta/recipes-devtool=
s/python/python-pygtk/fix-pygtk-2.0.pc.patch</div><div>=C2=A0create mode 10=
0644 meta/recipes-devtools/python/python/remove-BOM-insection-code.patch</d=
iv><div>=C2=A0create mode 100644 meta/recipes-devtools/subversion/subversio=
n-1.8.9/subversion-CVE-2014-3522.patch</div><div>=C2=A0create mode 100644 m=
eta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch</=
div><div>=C2=A0create mode 100644 meta/recipes-devtools/subversion/subversi=
on/subversion-CVE-2014-3528.patch</div><div>=C2=A0create mode 100644 meta/r=
ecipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_S=
IZEOF.patch</div><div>=C2=A0delete mode 100644 meta/recipes-extended/tzcode=
/<a href=3D"http://tzcode-native_2014h.bb">tzcode-native_2014h.bb</a></div>=
<div>=C2=A0create mode 100644 meta/recipes-extended/tzcode/<a href=3D"http:=
//tzcode-native_2014i.bb">tzcode-native_2014i.bb</a></div><div>=C2=A0delete=
 mode 100644 meta/recipes-extended/tzdata/<a href=3D"http://tzdata_2014h.bb=
">tzdata_2014h.bb</a></div><div>=C2=A0create mode 100644 meta/recipes-exten=
ded/tzdata/<a href=3D"http://tzdata_2014i.bb">tzdata_2014i.bb</a></div><div=
>=C2=A0create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.servic=
e</div><div>=C2=A0create mode 100644 meta/recipes-support/beecrypt/beecrypt=
/add-option-dev-dsp.patch</div><div>=C2=A0create mode 100644 meta/recipes-s=
upport/curl/curl/CVE-2014-3613.patch</div><div><br></div><div>Andreas M=C3=
=BCller (1):</div><div>=C2=A0 gdb-cross: build with python support</div><di=
v><br></div><div>Armin Kuster (2):</div><div>=C2=A0 tzcode: update to 2014i=
</div><div>=C2=A0 tzdata: update to 2014i</div><div><br></div><div>Bogdan P=
urcareata (1):</div><div>=C2=A0 shadow: enable support for subordinate IDs<=
/div><div><br></div><div>Chen Qi (1):</div><div>=C2=A0 bind: fix to use cor=
rect environment file in service file</div><div><br></div><div>Chong Lu (4)=
:</div><div>=C2=A0 xinetd: add systemd unit file</div><div>=C2=A0 kmod: fix=
 debuginfo is missing in shared library</div><div>=C2=A0 curl: Security Adv=
isory - curl - CVE-2014-3613</div><div>=C2=A0 docbook-xsl-stylesheets: add =
perl to RDEPENDS</div><div><br></div><div>Gary Thomas (1):</div><div>=C2=A0=
 python-pygtk: Restore pkg-config file</div><div><br></div><div>Hongxu Jia =
(7):</div><div>=C2=A0 classes/image: remove obsolete MULTILIB_VENDORS</div>=
<div>=C2=A0 multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image=
</div><div>=C2=A0 opkg: fix remove pkg with --force-removal-of-dependent-pa=
ckages failed</div><div>=C2=A0 multilib.bbclass/package_manager.py: fix &lt=
;multilib&gt;-meta-toolchain</div><div>=C2=A0 =C2=A0 build failure</div><di=
v>=C2=A0 man-pages/shadow: resolve man pages confliction</div><div>=C2=A0 p=
ython-smartpm: report warn rather than error during install with</div><div>=
=C2=A0 =C2=A0 --attempt</div><div>=C2=A0 rootfs.py: tweak inner warn messag=
e catching</div><div><br></div><div>Jackie Huang (1):</div><div>=C2=A0 lice=
nse.bbclass: canonicalise the licenses named with &#39;X+&#39;</div><div><b=
r></div><div>Johan Hovold (1):</div><div>=C2=A0 udev: fix uevent-helper dis=
able</div><div><br></div><div>Kai Kang (2):</div><div>=C2=A0 beecrypt: add =
option --with-dev-dsp</div><div>=C2=A0 python-2.7.3:remove BOM insertion co=
de</div><div><br></div><div>Martin Hundeb=C3=B8ll (1):</div><div>=C2=A0 scr=
ipts: use &#39;/usr/bin/env&#39; in shebangs with python</div><div><br></di=
v><div>Martin Jansa (1):</div><div>=C2=A0 systemd: don&#39;t move libgudev =
around, it breaks <a href=3D"http://libgudev-1.0.la">libgudev-1.0.la</a></d=
iv><div><br></div><div>Ming Liu (1):</div><div>=C2=A0 pciutils: Fix multili=
b header conflict - pci/config.h</div><div><br></div><div>Pascal Bach (1):<=
/div><div>=C2=A0 image_types.bbclass: Make ubi depend on ubifs</div><div><b=
r></div><div>Paul Barker (2):</div><div>=C2=A0 mc: Update patch status</div=
><div>=C2=A0 package_manager: Fix BAD_RECOMMENDATIONS for opkg</div><div><b=
r></div><div>Ross Burton (1):</div><div>=C2=A0 systemd: don&#39;t add files=
 and dependencies from units Conflicts</div><div><br></div><div>Roy Li (1):=
</div><div>=C2=A0 python3: do not replace ccache in the middle of a path</d=
iv><div><br></div><div>Roy.Li (1):</div><div>=C2=A0 iproute2: backport a pa=
tch to make adding vxlan link success</div><div><br></div><div>Shan Hai (1)=
:</div><div>=C2=A0 ldconfig-native: fix a endian-ness bug</div><div><br></d=
iv><div>Yuanjie Huang (1):</div><div>=C2=A0 mtd-utils: Fix alignment trap t=
riggered by NEON instructions</div><div><br></div><div>Yue Tao (2):</div><d=
iv>=C2=A0 subversion: Security Advisory - subversion - CVE-2014-3522</div><=
div>=C2=A0 subversion: Security Advisory - subversion - CVE-2014-3528</div>=
<div><br></div><div><a href=3D"mailto:yadi.hu@windriver.com">yadi.hu@windri=
ver.com</a> (1):</div><div>=C2=A0 BusyBox: Fixing broadcast address is not =
fed and rightly initialized</div><div><br></div><div>=C2=A0bitbake/lib/prog=
ressbar.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-</div><div>=C2=A0meta/classes/image.bbcla=
ss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A011 -</div><div>=C2=A0meta/classes/image_types.bbclass=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 =
+</div><div>=C2=A0meta/classes/license.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A011 +-</div><div>=
=C2=A0meta/classes/multilib.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 4 +</div><div>=C2=A0meta/cla=
sses/systemd.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 5 +-</div><div>=C2=A0meta/lib/oe/package_=
manager.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 7 +</div><div>=C2=A0meta/lib/oe/rootfs.py =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0meta/recipes-bsp/pciutils/<a hre=
f=3D"http://pciutils_3.2.1.bb">pciutils_3.2.1.bb</a> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 4 +</div><div>=C2=A0meta/recipes-connectivity/bind/bind/name=
d.service =C2=A0| =C2=A0 2 +-</div><div>=C2=A0...p-link-Remove-unnecessary-=
device-checking.patch | =C2=A035 ++</div><div>=C2=A0.../iproute2/<a href=3D=
"http://iproute2_3.16.0.bb">iproute2_3.16.0.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +</div><div>=C2=A0m=
eta/recipes-core/busybox/files/simple.script =C2=A0 =C2=A0 =C2=A0| =C2=A0 4=
 +-</div><div>=C2=A0.../endian-ness_handling_fix.patch =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A047 +++</div><div>=C2=A0meta/rec=
ipes-core/glibc/<a href=3D"http://ldconfig-native_2.12.1.bb">ldconfig-nativ=
e_2.12.1.bb</a> =C2=A0| =C2=A0 1 +</div><div>=C2=A0meta/recipes-core/system=
d/<a href=3D"http://systemd_216.bb">systemd_216.bb</a> =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 9 +-</div><div>=C2=A0meta/recipes-core/udev/udev/in=
it =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
2 +-</div><div>=C2=A0.../docbook-xml/<a href=3D"http://docbook-xsl-styleshe=
ets_1.78.1.bb">docbook-xsl-stylesheets_1.78.1.bb</a> =C2=A0| =C2=A0 2 +</di=
v><div>=C2=A0meta/recipes-devtools/gdb/gdb-cross.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A013 +-</div><div>=C2=A0.../mtd/mtd-utils/fix-arm=
v7-neon-alignment.patch =C2=A0 | =C2=A044 ++</div><div>=C2=A0meta/recipes-d=
evtools/mtd/<a href=3D"http://mtd-utils_git.bb">mtd-utils_git.bb</a> =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +</div><div>=C2=A0...g_remove.c-avoid-remo=
ve-pkg-repeatly-with.patch | =C2=A039 ++</div><div>=C2=A0meta/recipes-devto=
ols/opkg/<a href=3D"http://opkg_0.2.2.bb">opkg_0.2.2.bb</a> =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +</div><div>=C2=A0.../python/python-pygtk/f=
ix-pygtk-2.0.pc.patch =C2=A0 =C2=A0 | =C2=A013 +</div><div>=C2=A0.../recipe=
s-devtools/python/<a href=3D"http://python-pygtk_2.24.0.bb">python-pygtk_2.=
24.0.bb</a> | =C2=A0 2 +-</div><div>=C2=A0.../python/python-smartpm/smart-a=
ttempt.patch =C2=A0 =C2=A0 =C2=A0| =C2=A027 +-</div><div>=C2=A0.../python/p=
ython/remove-BOM-insection-code.patch =C2=A0| =C2=A024 ++</div><div>=C2=A0m=
eta/recipes-devtools/python/<a href=3D"http://python3_3.3.3.bb">python3_3.3=
.3.bb</a> =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0meta/recipes-de=
vtools/python/<a href=3D"http://python_2.7.3.bb">python_2.7.3.bb</a> =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 1 +</div><div>=C2=A0.../subversion-CVE-2014-3522.pa=
tch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 444 +++++++++=
++++++++++++</div><div>=C2=A0.../subversion/subversion-CVE-2014-3522.patch =
=C2=A0 =C2=A0 =C2=A0| 439 ++++++++++++++++++++</div><div>=C2=A0.../subversi=
on/subversion-CVE-2014-3528.patch =C2=A0 =C2=A0 =C2=A0| =C2=A029 ++</div><d=
iv>=C2=A0.../subversion/<a href=3D"http://subversion_1.6.15.bb">subversion_=
1.6.15.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 5 +-</div><div>=C2=A0.../subversion/<a href=3D"http://subversion_1.8.9.=
bb">subversion_1.8.9.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 2 +</div><div>=C2=A0meta/recipes-extended/man-pages/<a =
href=3D"http://man-pages_3.71.bb">man-pages_3.71.bb</a> =C2=A0| =C2=A0 7 +<=
/div><div>=C2=A0meta/recipes-extended/mc/mc/mc-CTRL.patch =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0..._of_uid_t_and_gid_t_using=
_AC_CHECK_SIZEOF.patch | =C2=A041 ++</div><div>=C2=A0meta/recipes-extended/=
shadow/shadow.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 7 +-</d=
iv><div>=C2=A0.../recipes-extended/tzcode/<a href=3D"http://tzcode-native_2=
014h.bb">tzcode-native_2014h.bb</a> | =C2=A011 -</div><div>=C2=A0.../recipe=
s-extended/tzcode/<a href=3D"http://tzcode-native_2014i.bb">tzcode-native_2=
014i.bb</a> | =C2=A010 +</div><div>=C2=A0meta/recipes-extended/tzdata/<a hr=
ef=3D"http://tzdata_2014h.bb">tzdata_2014h.bb</a> =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 6 -</div><div>=C2=A0meta/recipes-extended/tzdata/<a href=3D"http://t=
zdata_2014i.bb">tzdata_2014i.bb</a> =C2=A0 =C2=A0 =C2=A0 | =C2=A0 6 +</div>=
<div>=C2=A0meta/recipes-extended/xinetd/xinetd/xinetd.service | =C2=A013 +<=
/div><div>=C2=A0meta/recipes-extended/xinetd/<a href=3D"http://xinetd_2.3.1=
5.bb">xinetd_2.3.15.bb</a> =C2=A0 =C2=A0 =C2=A0| =C2=A012 +-</div><div>=C2=
=A0meta/recipes-kernel/kmod/kmod/run-ptest =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 2 +</div><div>=C2=A0meta/recipes-kernel/kmod/<a href=3D"=
http://kmod_git.bb">kmod_git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 9 +-</div><div>=C2=A0.../beecrypt/beecrypt/add-option-d=
ev-dsp.patch =C2=A0 =C2=A0 | =C2=A034 ++</div><div>=C2=A0meta/recipes-suppo=
rt/beecrypt/<a href=3D"http://beecrypt_4.2.1.bb">beecrypt_4.2.1.bb</a> =C2=
=A0 =C2=A0| =C2=A0 1 +</div><div>=C2=A0meta/recipes-support/curl/curl/CVE-2=
014-3613.patch | 269 +++++++++++++</div><div>=C2=A0meta/recipes-support/cur=
l/<a href=3D"http://curl_7.37.1.bb">curl_7.37.1.bb</a> =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 1 +</div><div>=C2=A0scripts/lib/wic/conf.py =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/creator.py =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/imager/baseimager.=
py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-</div><div=
>=C2=A0scripts/lib/wic/kickstart/__init__.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0.../lib/wic/kickstart/cus=
tom_commands/micboot.py =C2=A0 | =C2=A0 2 +-</div><div>=C2=A0.../wic/kickst=
art/custom_commands/micpartition.py =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scr=
ipts/lib/wic/msger.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-</div><div>=C2=A0script=
s/lib/wic/plugin.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/li=
b/wic/pluginbase.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/utils/er=
rors.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/utils/fs_related.py =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=
=C2=A0scripts/lib/wic/utils/misc.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><div>=C2=A0scripts=
/lib/wic/utils/partitionedfs.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 2 +-</div><div>=C2=A0scripts/lib/wic/utils/runner.py =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-</div><=
div>=C2=A0scripts/pybootchartgui/pybootchartgui.py =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 2 +-</div><div>=C2=A065 files changed, 1627 insertions(=
+), 71 deletions(-)</div><div>=C2=A0create mode 100644 meta/recipes-connect=
ivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.pat=
ch</div><div>=C2=A0create mode 100644 meta/recipes-core/glibc/ldconfig-nati=
ve-2.12.1/endian-ness_handling_fix.patch</div><div>=C2=A0create mode 100644=
 meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch</div><d=
iv>=C2=A0create mode 100644 meta/recipes-devtools/opkg/opkg/libopkg-opkg_re=
move.c-avoid-remove-pkg-repeatly-with.patch</div><div>=C2=A0create mode 100=
644 meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch</div><=
div>=C2=A0create mode 100644 meta/recipes-devtools/python/python/remove-BOM=
-insection-code.patch</div><div>=C2=A0create mode 100644 meta/recipes-devto=
ols/subversion/subversion-1.8.9/subversion-CVE-2014-3522.patch</div><div>=
=C2=A0create mode 100644 meta/recipes-devtools/subversion/subversion/subver=
sion-CVE-2014-3522.patch</div><div>=C2=A0create mode 100644 meta/recipes-de=
vtools/subversion/subversion/subversion-CVE-2014-3528.patch</div><div>=C2=
=A0create mode 100644 meta/recipes-extended/shadow/files/check_size_of_uid_=
t_and_gid_t_using_AC_CHECK_SIZEOF.patch</div><div>=C2=A0delete mode 100644 =
meta/recipes-extended/tzcode/<a href=3D"http://tzcode-native_2014h.bb">tzco=
de-native_2014h.bb</a></div><div>=C2=A0create mode 100644 meta/recipes-exte=
nded/tzcode/<a href=3D"http://tzcode-native_2014i.bb">tzcode-native_2014i.b=
b</a></div><div>=C2=A0delete mode 100644 meta/recipes-extended/tzdata/<a hr=
ef=3D"http://tzdata_2014h.bb">tzdata_2014h.bb</a></div><div>=C2=A0create mo=
de 100644 meta/recipes-extended/tzdata/<a href=3D"http://tzdata_2014i.bb">t=
zdata_2014i.bb</a></div><div>=C2=A0create mode 100644 meta/recipes-extended=
/xinetd/xinetd/xinetd.service</div><div>=C2=A0create mode 100644 meta/recip=
es-support/beecrypt/beecrypt/add-option-dev-dsp.patch</div><div>=C2=A0creat=
e mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch</div><div>=
<br></div><div>--=C2=A0</div><div>1.9.3 (Apple Git-50)</div><div><br></div>=
</div>

--001a113a81d684b20d0506e6b188--
