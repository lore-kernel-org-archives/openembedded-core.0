Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5595.1794387799105061079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=EaTlncyW;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso21204835e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387797; x=1794992597; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqkYWyAToJAzs8sBOheYc5Fa+7tSZiTT+mswOPzIAsY=;
        b=EaTlncyWjU6ZFBZmGcvOiD6u0QeT/r0o7QaeG++lMbpZcaHRAXE21KmKceBWfmPiVP
         SmmBQI9E3iL4rPCnubRZHrpVq6oNcLfjXLIhZwJQ2zuc1ma6BGyJxgpT57tn5LDsLJip
         RXZt558oSau1mDjYerB3561f00uP/n38cNkiWH56LiNBpN34vL1KEsm0oAQbkHcStH90
         IgaUHdxSUcOwXgKdI5aLBSk/ofPc7L9aLoTlpjXiIJOaunKcYwmr87QVQ0wb0tvwvALa
         NSyKw70UwNdFrTyFifSRwQS905OYLlASVzisHVY6Jg3/dDFRF9LYfezG4OmDb84vpn5Z
         2XGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387797; x=1794992597;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqkYWyAToJAzs8sBOheYc5Fa+7tSZiTT+mswOPzIAsY=;
        b=kQVp/26J1mpUssk6WRMVptT6l5OV2FJPAJr69enw0sJYkJbhJ3Fy4K5BJDM9vtlOMp
         cGCcCQx7Y0LLWz2MoIaACegK/MttHOdHAtf/romQEq4ZeWbwdSc7jKQxR9q4IeCM925+
         Yc9aMHjy84LX/JG2K9qpryuw/mdVfws6tMMV7jN3lhDhBU15Q7mPrvIdN5YcU1DgAkpd
         bsLKWW2EThEgqC89jzipikAB3fUBmeLSRnUvpPriJM/92kbbBknnRdWCzuafQ+O0/n9i
         y3s/SUbuuJxO673LqSBRgIB4fDIeuMNVKsVfiy0Yrd/Bhr1l/EBx+a9oBPe/YAgL1SMt
         WNqA==
X-Gm-Message-State: APuU4Z8mx4Syk1zIgxk2NaDKQkcSQ/pEQqbeBtv+z6L4WSMQEbMrBSx2
	L+B0KltAeXcciKgrKPGtg1CZq6B94bPGYDS7i1bVQplKKJS+91KzqAJMvjaEiKoaCEdqDe2yT7A
	3K1qxHEI=
X-Gm-Gg: AYBFou2MyRV223f8ucxzceKgk6v28r8AWqDJmRpvkx/g3mRJ2990RvMKiLTde874MNf
	NIuUccrfdlGyK2kdwxM/vpeOHwYI2ppu5Dv68zJ2zYWC7Yu9iCZ9cIoBegPbt6oiz5eP1iF3uVn
	6/x43FzlNiudMLVnbCOHATmXpc4NYUQxO+A26eqTrMeylEK1xvTmvsR3z4ccm38v1EnuMcuXmWH
	JtGsEfSNDI+eHbsvvPPOc3j9S6dkgXuTsE+hLrohB/XNizbXC5WlfAZwynU70f0N4yzvFx7M9Wf
	Aj1KnD03Vhl4vvdAi3Zmak9nvVuXlCIhy2UKDbsOtw28a3CWFwVwFfMuCZSJG4CWuPCrL9Fh39N
	EO6dHDhbX4W+guR/PMZrFXFbvs/m0m4BwbtVkW99qWI00samvzUvuW9sTes6TrtdPEptT90RJZb
	Oj3+tmG/QqRG9UwN3QwTRaI/7ZI66WmDt7JZXqCQipAXidf0EImPVkQ1JB1E6UWIyiKfTJ5Mp/W
	H9MACL1KdC73afjDOqaPs4fNW4Y61Z20QnS5sSqaa8B7ENhYCIWY7Dkm8mp+loE84vt8kWmQxOv
	tUpiVL4IdTbSsVqF59ArDdQAfS6zyj45+cih3EhF7d60P7/yonq515vGU9vXPzJxDSM0Qozffq6
	WAFg4LPhDonqQK3c4m1y9acpV+++H
X-Received: by 2002:a05:600c:b86:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ba0931efefmr31997595e9.4.1794387796959;
        Wed, 11 Nov 2026 01:03:16 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/35] Patch review
Date: Wed, 11 Nov 2026 10:02:26 +0100
Message-ID: <cover.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249972
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for wrynose and have comments back by
end of day Thursday, November 12.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5102
* qemuarm64-musl-ptest failed with 15814 – qemuarm64 musl ptest failures
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/109/builds/1543

The following changes since commit 2285da08068a6d1b4a64c9a52d85a58be50e4679:

  openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-06 17:15:59 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-review

for you to fetch changes up to 33a6bd6cc8a9a976902081642414bd67adc74879:

  populate_sdk_ext: Fix locale error handling in SDK (2026-11-11 00:22:27 +0100)

----------------------------------------------------------------

Adrian Freihofer (1):
  kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps

Benjamin Robin (4):
  spdx_common: simplify get_patched_src() implementation
  spdx_common: modify UNPACKDIR instead of WORKDIR in get_patched_src()
  spdx_common: In get_patched_src() ensure kernel dir name to be ${BP}
  package: no longer modify paths in save_debugsources_info()

Bruce Ashfield (3):
  linux-yocto/6.18: aufs: refresh to upstream aufs6.18
  linux-yocto/6.18: update to v6.18.57
  linux-yocto/6.18: update to v6.18.59

Deepak Rathore (1):
  gnupg: Fix CVE-2026-105712

Jaipaul Cheernam (1):
  bind: upgrade 9.20.29 -> 9.20.30

Jeroen Hofstee (1):
  python3-pip: patch the vendored python3-certifi

Jinwang Li (5):
  bluez5: Fix error handling for AVDTP_OPEN cmd
  bluez5: Fix GET_CONFIGURATION cmd
  bluez5: Return correct error when SEP is inuse
  bluez5: Fix ABORT response being discarded
  bluez5: Fix u128_to_string skipping data[4]

Peter Marko (7):
  boost: patch CVE-2023-34399
  go: upgrade 1.26.9 -> 1.26.10
  glib-2.0: patch CVE-2026-16118
  python3: upgrade 3.14.9 -> 3.14.10
  systemd: add iproute2-devlink runtime dependency to udev
  dropbear: add follow-up patches for CVE-2019-6111
  dropbear: patch CVE-2026-35385

Richard Purdie (2):
  recipe_sanity: Drop rename overwrite detection
  populate_sdk_ext: Fix locale error handling in SDK

Ross Burton (4):
  python3: upgrade 3.14.7 -> 3.14.9
  python3: skip test.test_readline.TestHistoryManipulation on musl
  piglit: fix build with Python 3.14.9
  groff: build less in groff-native

Shantanu Majumdar (1):
  gstreamer1.0-plugins-bad: use gtk+3 dependency name

Theo Gaige (Schneider Electric) (1):
  python3-pyelftools: add missing runtime dependencies

Yoann Congal (1):
  scripts/install-buildtools: Update to 6.0.4

Yogita Urade (3):
  python3-urllib3: Fix CVE-2026-44432
  python3-urllib3: Fix CVE-2026-97687
  python3-urllib3: Fix CVE-2026-97688

 meta/classes-recipe/kernel-fit-image.bbclass  |  14 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
 meta/classes/recipe_sanity.bbclass            |  21 -
 meta/lib/oe/package.py                        |  54 +--
 meta/lib/oe/spdx30_tasks.py                   |   1 -
 meta/lib/oe/spdx_common.py                    | 125 +++--
 ...1-avoid-start-failure-with-bind-user.patch |   2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
 ...d-V-and-start-log-hide-build-options.patch |   4 +-
 ...ching-for-json-headers-searches-sysr.patch |   4 +-
 .../recipes-connectivity/bind/bind/conf.patch |   2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |   2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |   2 +-
 .../bind/{bind_9.20.29.bb => bind_9.20.30.bb} |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   5 +
 ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch |  36 ++
 ...ix-error-handling-for-AVDTP_OPEN-cmd.patch |  48 ++
 ...turn-correct-error-when-SEP-is-inuse.patch |  32 ++
 ...x-Fix-ABORT-response-being-discarded.patch |  44 ++
 ...p-Fix-u128_to_string-skipping-data-4.patch |  33 ++
 .../dropbear/dropbear/CVE-2019-6111-01.patch  | 364 ++++++++++++++
 .../dropbear/dropbear/CVE-2019-6111-02.patch  |  43 ++
 .../dropbear/dropbear/CVE-2019-6111-03.patch  |  34 ++
 .../dropbear/dropbear/CVE-2019-6111-04.patch  |  43 ++
 .../dropbear/dropbear/CVE-2026-35385.patch    |  42 ++
 .../recipes-core/dropbear/dropbear_2025.89.bb |   5 +
 .../glib-2.0/files/CVE-2026-16118.patch       |  48 ++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 meta/recipes-core/systemd/systemd_259.5.bb    |   1 +
 .../go/{go-1.26.9.inc => go-1.26.10.inc}      |   2 +-
 ..._1.26.9.bb => go-binary-native_1.26.10.bb} |   6 +-
 ...1.26.9.bb => go-cross-canadian_1.26.10.bb} |   0
 ...go-cross_1.26.9.bb => go-cross_1.26.10.bb} |   0
 ...sssdk_1.26.9.bb => go-crosssdk_1.26.10.bb} |   0
 ...untime_1.26.9.bb => go-runtime_1.26.10.bb} |   0
 .../go/{go_1.26.9.bb => go_1.26.10.bb}        |   0
 .../python3-pip/0001-Remove-emsign-437.patch  | 142 ++++++
 ...tore-unaffected-emSign-roots-439-440.patch | 108 +++++
 .../python/python3-pip_26.0.1.bb              |   2 +
 .../python/python3-pyelftools_0.32.bb         |   8 +-
 .../python3-urllib3/CVE-2026-44432.patch      | 157 ++++++
 .../python3-urllib3/CVE-2026-97687_p1.patch   | 277 +++++++++++
 .../python3-urllib3/CVE-2026-97687_p2.patch   | 450 ++++++++++++++++++
 .../CVE-2026-97688-regression.patch           |  29 ++
 .../python3-urllib3/CVE-2026-97688.patch      | 107 +++++
 .../python/python3-urllib3_2.6.3.bb           |   5 +
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   2 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   2 +-
 .../python/python3/makerace.patch             |   2 +-
 .../{python3_3.14.7.bb => python3_3.14.10.bb} |   7 +-
 .../groff/files/build-less.patch              |  24 +
 meta/recipes-extended/groff/groff_1.24.1.bb   |   8 +-
 ...-reproducible_mtime-should-be-an-int.patch |  33 ++
 meta/recipes-graphics/piglit/piglit_git.bb    |   1 +
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
 .../gstreamer1.0-plugins-bad_1.28.5.bb        |   2 +-
 .../boost/boost/CVE-2023-34399.patch          |  35 ++
 meta/recipes-support/boost/boost_1.90.0.bb    |   1 +
 .../gnupg/CVE-2026-105712-regression.patch    |  39 ++
 .../gnupg/gnupg/CVE-2026-105712.patch         | 194 ++++++++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |   2 +
 scripts/install-buildtools                    |   4 +-
 66 files changed, 2554 insertions(+), 151 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.29.bb => bind_9.20.30.bb} (97%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-01.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-04.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch
 rename meta/recipes-devtools/go/{go-1.26.9.inc => go-1.26.10.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.9.bb => go-binary-native_1.26.10.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.9.bb => go-cross-canadian_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.9.bb => go-cross_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.9.bb => go-crosssdk_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.9.bb => go-runtime_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.9.bb => go_1.26.10.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-pip/0001-Remove-emsign-437.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/0002-Restore-unaffected-emSign-roots-439-440.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688.patch
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.10.bb} (98%)
 create mode 100644 meta/recipes-extended/groff/files/build-less.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
 create mode 100644 meta/recipes-support/boost/boost/CVE-2023-34399.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch

