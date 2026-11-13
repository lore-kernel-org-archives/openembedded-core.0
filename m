Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7291.1794561182277298781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ldZ3Mcws;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9952465e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 01:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794561180; x=1795165980; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUBSFumKsamOqqBLuHffr3OF9S2rv2q1WeCgm21TUBU=;
        b=ldZ3McwsZCqPy8sfDs/hkYGZUVwVrUEtfitHi1biKqDsei+179+Ni6eePsKFTAAUGV
         hZYCM5Vdk2GxPdNVhOA+SE/mUOMU1L+5oVh9NjS/LU1hgWVeqPlHS+o7SkwrKnbeboAc
         obNy+RzMylED4pQEFZf+kQQa4Q5ghJLKueu+7zHH/H3EgXZKGXDSpvdh8fQe9b9cYLRo
         M/by0XC5D+UjNbkQNVqHOOsYnMJivXGquy1Onw+1cUlZJpgMem1XJZJdZNYxtNm4UzWf
         /VOJNUDUpXGZoKoJaZQQf6e/f2q7Tgn++nJT3nJIlTP0/43n3I7UroTla2bvjqYtAEQy
         c5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561180; x=1795165980;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iUBSFumKsamOqqBLuHffr3OF9S2rv2q1WeCgm21TUBU=;
        b=VHeVQ2QL5ZzC6WqfgcygOcler+hotDlpSvkQF2q/nopE78cMjudL2+4xjoop9y1H1k
         1up/oT1RpZCtOJLlsgM6yL4LiNwdnwwZKvPqoJUE5y6C3kRE/uCE8d2i9PKdR2IineRP
         /7nhYYE1DEMzMjSzRxu++fcJadFL0Hlv4NuftnfnpuzbJ1tI+JEQSC5jwWVvhr5cnBjt
         Q+M5+50xLv2GEHAt/q8MxZ6J2PRvzdPn6rAZzKuV+AEunL2W4qZhhLwxNj5e5WuPAnCz
         P5s1VnyZQvJD5L048zkI21t3VUEoo9fth5VclWDrivyshWMqNg7So46vSOd5ZAkxldsM
         vkAw==
X-Gm-Message-State: APuU4Z9zeMvabcl4GIWnWM59YPIZum9ApsmTI6CMOwls3lsL/GLZNn+e
	0JtXctMlRFhDIgvHwiNoY+yHefWk+wmMgOaZiCPv1GS+tkMAhTM8cu+FeLHVWcKFzWUvnWNV1cO
	HQLDYxZY=
X-Gm-Gg: AYBFou3qtwmfn2j4NhpE0mixg0Sowmc6gaCH0jhT2oIepUQzOr6yu7Qy54B5xdJ06JK
	uUi21c9ew0USoSlnwZsKelndLrOSSRXYWwWhEp3uyPDQT8jFymuj8X9s5iFI7IMdYa8L5SvT33h
	a8epDzDxK4p3B0wGBLJGE++MoGcwh17mi0UR7EfaSp9EN+GacHjQ1Pt9jFWX1pfL9pcerZmAxDi
	8/ISNqkaPSvNgpWcH9lX3puJZZaze2ATdEp4fiRepPTWvre+mafCqgqdLCM7d+udHbOJUpuNJhv
	u95Kh++1200Qc5F5E8CDl6dosePahAuDjRPlTXCde9GYPF/MRDAzBxcHetoRij/mRZN5I5ufy23
	UsnWyPsTFHo841Adg2tEle/AdimcKI5U6pr7R6g/xhmyBhZeLXwoVnP8WE77KFAumYfE1ptD507
	sA44IzKTHH7vbFJbvfaYOOtMfCwrt0Pomknq/j9xfl4QndDxyvPdRxuVSqZFzYC9+Zw4TeBtghI
	qYH4Z3X+QCSdrSn0GXEH084M/qpC25hLf6UJ/n5rI4e8ye5f46dNw1+JP1Jjrv67PLqXXwWuZq8
	roHtxCJNtt3jJXNOSsGbL28p+mVS/WHbsaAcrsoeDWO7plZGVZ9IgnlI0qbN7MSZzNDDaRPx1lt
	dpOFRFW2Kk9pBub7QP7TN5VMC2HMz3A==
X-Received: by 2002:a05:600c:859c:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4bb55a9646dmr29238385e9.22.1794561180458;
        Fri, 13 Nov 2026 01:13:00 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00d795e58479169e39.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d795:e584:7916:9e39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm137401165e9.4.2026.11.13.01.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:12:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/35] Pull request (cover letter only)
Date: Fri, 13 Nov 2026 10:12:38 +0100
Message-ID: <cover.1794561052.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 09:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250154
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1794387482.git.yoann.congal@smile.fr/

Interesting patches:
* "dropbear: add follow-up patches for CVE-2019-6111"
  I think this is a worthy fix but it has user-visible consequences:
  `scp -r host:dir <existing dir>` now exits 1 instead of overwriting
  files (which is the vulnerability being fixed).
* "python3-urllib3: Fix CVE-2026-97687"
  May throw a new warning in a unsecure configuration (related to TLS
  and proxies) that will be dropped in futur version. User code fix might
  be needed to avoid the warning (but the code will still work).

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5102
* qemuarm64-musl-ptest failed with 15814 – qemuarm64 musl ptest failures
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/109/builds/1543

The following changes since commit 2285da08068a6d1b4a64c9a52d85a58be50e4679:

  openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-06 17:15:59 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

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

