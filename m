Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5708.1794388398479846986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oOZcFZgc;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so29554205e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794388396; x=1794993196; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxw52GGHWIpkX5c/HpxXJe91HAL6I3eNgEANLsmReVk=;
        b=oOZcFZgcjvmpVzIZyPvz03yiNLz+G/sUQlCD5Aj+KXSzPv6iv1gZQ6iism0JVAAu0T
         D61zeyfFIVtJWfo/YaUZNfj3ynbx1I3FH5xPobY4bG6MUvM3Gb62AKMPhF5V4Qb0XKut
         Ct6mzweZ2rirbgrTfNh3WkLmlZwa9jv+DrLH43WCHqhrLtzvWNaJn48pNzI5eVZ76Kn4
         Jha0dPfmGVgR7J2d5n460bW/JFiBSrDZKuia6k04CxmyRDohhXOvMyZET4cljuB+cnMG
         1QhwCfbLilsYxfGRu/tQx0vYjJshCqdBUQNUgfb4IZuBPqJO+vA414yH2jV6Bahu1tSY
         gigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388397; x=1794993197;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxw52GGHWIpkX5c/HpxXJe91HAL6I3eNgEANLsmReVk=;
        b=IbehsKOGQ8cdLx2l2LWKDB3FHWMKMzLCVAjlP4gF2hpamu+sRHZMiQJAMCr6EGyluB
         q7uCStLlgEDDnK6Nhh3Ny5IxQ9CE+RhTbKbeS5jtMRAgKTgjqM9II2tKJrXnjJdtxr+H
         sSXyYkIFxuy6XJ3FNi3+bjfUcErTw54A7mVJviTlBj5pfVJarVBkMuyT78LdfI0/O6kL
         NoTQ/82DVowvB8oQMl+X3sKhhRG1d7BY6AqoFWoOe1P5uYmDSU7wDuu1aBqXTWermqH8
         Ua41/Flq3uRj54oZZPFMzsjxbf6fdxqVg0gKa0EcBRFrwfAHareYXCAWYvT0I9WmxJ5Y
         tjrw==
X-Forwarded-Encrypted: i=1; AL+hErEAoABKBeFaeJ/toz9t4z9c3m38QVNusjuuFHdNNKZTw2iYRR+87XCr5wLGSzfUsMy1jilCRpo4a8vBzsdyM+qhPQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/WJX5mLrFLU3VEYeslp8hXVfmd/9K+0P0hY/vWN0WPBsPq2WGR
	etYkj9t3QfOD8kEW6qTQGXP5d+U48vcFQ34ttJZ7qOj+eD4i2+jzWBNwO4DUCHl1KybOJ8kA+99
	zvWQNBR0=
X-Gm-Gg: AYBFou0cjpe9hN9FPzWaenA7srrDHgLthkyMKAxt4AV5dgYfrbiBxAhVZ5CiqYOZH8x
	Hk0Mw0GgsXWc93sFZ/mqfnkVmCaPTPMBrjrSUiFts2EOu/K8SOiurEOf5lkEjymBu6/K9d+8Qbq
	jA7ndzxqkNXL+EkLOmgRVOJ5gjFJy1IBcwu7THwkTQwd5UHQbFjGBz39cZ8UBLBk6bjubewBy91
	im9foeGxMqPS21yQOMLT7mQWABLh1suwnELQUBZt8iOFvOJ3qvm19L2Eahas1LmmoO4u7PL0/tJ
	AfQGfyi6U/QycLVQJoLusxIuQkrihHE296AJvO7lrxJEFBUquE1NljrH/5zhHEhnSCQINTQ34rt
	HE7KZRFPd4E17VLnWeMWUAVX48BksIy8MbyMu/KHddT3/2S/rgi+2l/cMzPjJmJhbuITJ5THHia
	khssYOvpoQnY+XYT/hXWDhMPfSgyGzJIe9L1MIvSw716OZDho/fy4nPsFdyKqPYwyGzb2s44B9Y
	m3vmtUkb3YySZyepYQXz0uYBEDbh1996vqxkZ6Yj/8B9rOq6hOpgbKKSEg7cOLjdp+Ao9N29Jd/
	H4mfypN9mfnBwEvqQQ7ifmV3OTjoJUV2EKJztAUSE0a2YYYdk9/KB2UaUlc4FJRrL9ehkPdSnun
	QOzM2uuXrADIlAcCo2myDOq9EEhwVL8FshmD2Zw==
X-Received: by 2002:a05:600c:354a:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ba0939cc9cmr29677955e9.6.1794388396543;
        Wed, 11 Nov 2026 01:13:16 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm116993285e9.15.2026.11.11.01.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 01:13:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:13:15 +0100
Message-Id: <DMS9LL1QL335.220KCSDGP7AF2@smile.fr>
Subject: Re: [OE-core][wrynose 00/35] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1794387482.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250008

On Wed Nov 11, 2026 at 10:02 AM CET, Yoann Congal wrote:
> Please review this set of changes for wrynose and have comments back by
> end of day Thursday, November 12.
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5102
> * qemuarm64-musl-ptest failed with 15814 =E2=80=93 qemuarm64 musl ptest f=
ailures
>   retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/10=
9/builds/1543
>
> The following changes since commit 2285da08068a6d1b4a64c9a52d85a58be50e46=
79:
>
>   openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-06 17:15:59 +0100=
)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/wrynose-r=
eview
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
wrynose-review
>
> for you to fetch changes up to 33a6bd6cc8a9a976902081642414bd67adc74879:
>
>   populate_sdk_ext: Fix locale error handling in SDK (2026-11-11 00:22:27=
 +0100)

I forgot to highlight 2 patches:
* "dropbear: add follow-up patches for CVE-2019-6111"
  I think this is a worthy fix but it has user-visible consequences:
  `scp -r host:dir <existing dir>` now exits 1 instead of overwriting
  files (which is the vulnerability being fixed).
* "python3-urllib3: Fix CVE-2026-97687"
  May throw a new warning in a unsecure configuration (related to TLS
  and proxies) that will be dropped in futur version. User code fix might
  be needed to avoid the warning (but the code will still work).

> ----------------------------------------------------------------
>
> Adrian Freihofer (1):
>   kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
>
> Benjamin Robin (4):
>   spdx_common: simplify get_patched_src() implementation
>   spdx_common: modify UNPACKDIR instead of WORKDIR in get_patched_src()
>   spdx_common: In get_patched_src() ensure kernel dir name to be ${BP}
>   package: no longer modify paths in save_debugsources_info()
>
> Bruce Ashfield (3):
>   linux-yocto/6.18: aufs: refresh to upstream aufs6.18
>   linux-yocto/6.18: update to v6.18.57
>   linux-yocto/6.18: update to v6.18.59
>
> Deepak Rathore (1):
>   gnupg: Fix CVE-2026-105712
>
> Jaipaul Cheernam (1):
>   bind: upgrade 9.20.29 -> 9.20.30
>
> Jeroen Hofstee (1):
>   python3-pip: patch the vendored python3-certifi
>
> Jinwang Li (5):
>   bluez5: Fix error handling for AVDTP_OPEN cmd
>   bluez5: Fix GET_CONFIGURATION cmd
>   bluez5: Return correct error when SEP is inuse
>   bluez5: Fix ABORT response being discarded
>   bluez5: Fix u128_to_string skipping data[4]
>
> Peter Marko (7):
>   boost: patch CVE-2023-34399
>   go: upgrade 1.26.9 -> 1.26.10
>   glib-2.0: patch CVE-2026-16118
>   python3: upgrade 3.14.9 -> 3.14.10
>   systemd: add iproute2-devlink runtime dependency to udev
>   dropbear: add follow-up patches for CVE-2019-6111
>   dropbear: patch CVE-2026-35385
>
> Richard Purdie (2):
>   recipe_sanity: Drop rename overwrite detection
>   populate_sdk_ext: Fix locale error handling in SDK
>
> Ross Burton (4):
>   python3: upgrade 3.14.7 -> 3.14.9
>   python3: skip test.test_readline.TestHistoryManipulation on musl
>   piglit: fix build with Python 3.14.9
>   groff: build less in groff-native
>
> Shantanu Majumdar (1):
>   gstreamer1.0-plugins-bad: use gtk+3 dependency name
>
> Theo Gaige (Schneider Electric) (1):
>   python3-pyelftools: add missing runtime dependencies
>
> Yoann Congal (1):
>   scripts/install-buildtools: Update to 6.0.4
>
> Yogita Urade (3):
>   python3-urllib3: Fix CVE-2026-44432
>   python3-urllib3: Fix CVE-2026-97687
>   python3-urllib3: Fix CVE-2026-97688
>
>  meta/classes-recipe/kernel-fit-image.bbclass  |  14 +-
>  meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
>  meta/classes/recipe_sanity.bbclass            |  21 -
>  meta/lib/oe/package.py                        |  54 +--
>  meta/lib/oe/spdx30_tasks.py                   |   1 -
>  meta/lib/oe/spdx_common.py                    | 125 +++--
>  ...1-avoid-start-failure-with-bind-user.patch |   2 +-
>  ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
>  ...d-V-and-start-log-hide-build-options.patch |   4 +-
>  ...ching-for-json-headers-searches-sysr.patch |   4 +-
>  .../recipes-connectivity/bind/bind/conf.patch |   2 +-
>  ...t.d-add-support-for-read-only-rootfs.patch |   2 +-
>  .../bind/make-etc-initd-bind-stop-work.patch  |   2 +-
>  .../bind/{bind_9.20.29.bb =3D> bind_9.20.30.bb} |   2 +-
>  meta/recipes-connectivity/bluez5/bluez5.inc   |   5 +
>  ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch |  36 ++
>  ...ix-error-handling-for-AVDTP_OPEN-cmd.patch |  48 ++
>  ...turn-correct-error-when-SEP-is-inuse.patch |  32 ++
>  ...x-Fix-ABORT-response-being-discarded.patch |  44 ++
>  ...p-Fix-u128_to_string-skipping-data-4.patch |  33 ++
>  .../dropbear/dropbear/CVE-2019-6111-01.patch  | 364 ++++++++++++++
>  .../dropbear/dropbear/CVE-2019-6111-02.patch  |  43 ++
>  .../dropbear/dropbear/CVE-2019-6111-03.patch  |  34 ++
>  .../dropbear/dropbear/CVE-2019-6111-04.patch  |  43 ++
>  .../dropbear/dropbear/CVE-2026-35385.patch    |  42 ++
>  .../recipes-core/dropbear/dropbear_2025.89.bb |   5 +
>  .../glib-2.0/files/CVE-2026-16118.patch       |  48 ++
>  meta/recipes-core/glib-2.0/glib.inc           |   1 +
>  meta/recipes-core/systemd/systemd_259.5.bb    |   1 +
>  .../go/{go-1.26.9.inc =3D> go-1.26.10.inc}      |   2 +-
>  ..._1.26.9.bb =3D> go-binary-native_1.26.10.bb} |   6 +-
>  ...1.26.9.bb =3D> go-cross-canadian_1.26.10.bb} |   0
>  ...go-cross_1.26.9.bb =3D> go-cross_1.26.10.bb} |   0
>  ...sssdk_1.26.9.bb =3D> go-crosssdk_1.26.10.bb} |   0
>  ...untime_1.26.9.bb =3D> go-runtime_1.26.10.bb} |   0
>  .../go/{go_1.26.9.bb =3D> go_1.26.10.bb}        |   0
>  .../python3-pip/0001-Remove-emsign-437.patch  | 142 ++++++
>  ...tore-unaffected-emSign-roots-439-440.patch | 108 +++++
>  .../python/python3-pip_26.0.1.bb              |   2 +
>  .../python/python3-pyelftools_0.32.bb         |   8 +-
>  .../python3-urllib3/CVE-2026-44432.patch      | 157 ++++++
>  .../python3-urllib3/CVE-2026-97687_p1.patch   | 277 +++++++++++
>  .../python3-urllib3/CVE-2026-97687_p2.patch   | 450 ++++++++++++++++++
>  .../CVE-2026-97688-regression.patch           |  29 ++
>  .../python3-urllib3/CVE-2026-97688.patch      | 107 +++++
>  .../python/python3-urllib3_2.6.3.bb           |   5 +
>  ...shebang-overflow-on-python-config.py.patch |   2 +-
>  ...-use-prefix-value-from-build-configu.patch |   2 +-
>  ...-qemu-wrapper-when-gathering-profile.patch |   2 +-
>  ...est_sysconfig-for-posix_user-purelib.patch |   2 +-
>  .../python/python3/makerace.patch             |   2 +-
>  .../{python3_3.14.7.bb =3D> python3_3.14.10.bb} |   7 +-
>  .../groff/files/build-less.patch              |  24 +
>  meta/recipes-extended/groff/groff_1.24.1.bb   |   8 +-
>  ...-reproducible_mtime-should-be-an-int.patch |  33 ++
>  meta/recipes-graphics/piglit/piglit_git.bb    |   1 +
>  .../linux/linux-yocto-rt_6.18.bb              |   6 +-
>  .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
>  .../gstreamer1.0-plugins-bad_1.28.5.bb        |   2 +-
>  .../boost/boost/CVE-2023-34399.patch          |  35 ++
>  meta/recipes-support/boost/boost_1.90.0.bb    |   1 +
>  .../gnupg/CVE-2026-105712-regression.patch    |  39 ++
>  .../gnupg/gnupg/CVE-2026-105712.patch         | 194 ++++++++
>  meta/recipes-support/gnupg/gnupg_2.5.17.bb    |   2 +
>  scripts/install-buildtools                    |   4 +-
>  66 files changed, 2554 insertions(+), 151 deletions(-)
>  rename meta/recipes-connectivity/bind/{bind_9.20.29.bb =3D> bind_9.20.30=
.bb} (97%)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fi=
x-GET_CONFIGURATION-cmd.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fi=
x-error-handling-for-AVDTP_OPEN-cmd.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Re=
turn-correct-error-when-SEP-is-inuse.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fi=
x-ABORT-response-being-discarded.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pb=
ap-Fix-u128_to_string-skipping-data-4.patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-01.=
patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.=
patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.=
patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-04.=
patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2026-35385.pa=
tch
>  create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch
>  rename meta/recipes-devtools/go/{go-1.26.9.inc =3D> go-1.26.10.inc} (90%=
)
>  rename meta/recipes-devtools/go/{go-binary-native_1.26.9.bb =3D> go-bina=
ry-native_1.26.10.bb} (80%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.26.9.bb =3D> go-cro=
ss-canadian_1.26.10.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.26.9.bb =3D> go-cross_1.26.1=
0.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.26.9.bb =3D> go-crosssdk_=
1.26.10.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.26.9.bb =3D> go-runtime_1.=
26.10.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.26.9.bb =3D> go_1.26.10.bb} (100%)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/0001-Remove-=
emsign-437.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pip/0002-Restore=
-unaffected-emSign-roots-439-440.patch
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-44432.patch
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-97687_p1.patch
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-97687_p2.patch
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-97688-regression.patch
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-97688.patch
>  rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.14=
.10.bb} (98%)
>  create mode 100644 meta/recipes-extended/groff/files/build-less.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-serial=
izer-reproducible_mtime-should-be-an-int.patch
>  create mode 100644 meta/recipes-support/boost/boost/CVE-2023-34399.patch
>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regr=
ession.patch
>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patc=
h


--=20
Yoann Congal
Smile ECS

