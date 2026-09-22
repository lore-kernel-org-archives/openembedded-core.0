Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0CCC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 23:21:47 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58.1790119302291356846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 16:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bGU5nMck;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso2199575e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790119300; x=1790724100; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/Ra0lmHQwF8TbR/wViMbHfOkql4mGOSJfGXWJZrJ9w=;
        b=bGU5nMckIae0Kz6e1Y0GTSSRcbRmImoHnXMUGgDKICuZiXRAx2m/34XsvW4RyMODtY
         ATc2uBv7TFF6iB/MMECxWpMfSuyXmtyidV33OuRlVn/Ea9ZliYCKpRPlywG0GN8QZ2jI
         0aykTCufqYCCTrBuz8OdWQO8Y1dXBVpJAyIYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119300; x=1790724100;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/Ra0lmHQwF8TbR/wViMbHfOkql4mGOSJfGXWJZrJ9w=;
        b=V0AWk+ZUbWjo4P/yN0zeHH3t5QtCPlWUuv2o3FJ2OGHHBCEtOtGHVXfElQWIyUONbi
         CzMZrHSOyXT3lndQINZplT020iccelj1DZbqL3xAtpz7uCNREAG2yqY/1cTmHcjc3Rqc
         soon/xQTcxTfCk8C66vmKf/Zr/DNVplvcfa231OtTMlahdyiOhmDVrrGFy3cRFNYXR2J
         2z8mXS2oQ3TU/t/TK5DhbKwxdB0yU/0jKZtazJjaGW9MD/8P1Kp9pCh7AItWK9IQlJf6
         CnglYL3BOS/6BLZjjq9c7tq57Wmz1TQGrbPQpDbyTEAdYP7vkonmQyOfOctyVis3HCO4
         ws+A==
X-Gm-Message-State: AFuF++lB0O3kyl24V/qgqCX+s77WjNEj6l2GVA9TLRhBhP9Bg5MVfFfG
	5+SEzib7lKt8RG3ItVnTnhS6fcKDQXmyzsdjhDLG/qXTCRu36DsVyiqH3Xvn4hHe0je3UlX+sqW
	A3KCwxSE=
X-Gm-Gg: AYBFou0L7WYvpov07dtiHWowzSgzdUjqNN88eMZCD1dL718vnUery6dEQxa5hb6k49o
	bhVpLDSPkWVCEZjP43WOw8hGhd4Hq0d3BlE0MJtNQVYvhmzq7ncpPmarfXmaPt/sa/8E7loVFOv
	Te5fDmnio0Zvj+A2CU9QZ84t6L4thg+TPVuXtpgJcS0qhnAvBXboaoVLuWhuQ87Bb9tx2HvnBlC
	yFD+0ucASN9WIFQFvv8yyhb8BYsBaujBdiSK4jvsoSr5uB+5iK47OyONy6DG86Y8CpBFJoTuG0v
	Okvh0/pQLe+BQHuqBTy7cq2NbiSbA57dySgTFmtklCaFD5XJ0gbLPToLl/RM8HskxXpsxkA7p9k
	l017Z2fdgvgvUu3S1OlwbCWe9VGjiMBkb3t/zZIHW/n/BIvLdwMgZn+0Owc9ZwRzr+exN8bvzyn
	lj8twPjz4hlnowFeylLxDiZYDA1F0u5G+119TTN8+IvNUrgX+UHa7Nyu+VWS595Hu5+l/gmBhgw
	Q5KoMSggfb4cLiU8wqLSo7GhFqO9OeYAm60PtGT/MwDy6TOnEtyGDuT6CNY2EhKHocQxu8cFw==
X-Received: by 2002:a05:600c:3494:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49fdeffdde7mr6731505e9.8.1790119300163;
        Tue, 22 Sep 2026 16:21:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1893d5sm29914495e9.4.2026.09.22.16.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:21:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/79] Pull request (cover letter only)
Date: Wed, 23 Sep 2026 01:21:25 +0200
Message-ID: <cover.1790119152.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 23:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246431

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1789681419.git.yoann.congal@smile.fr/
(No review, no change)
> This is a big series, hopefully this will make the patch queue more
> manageable.
> 
> In this series, there are 2 notable exceptions to the usual stable
> patches:
> * sbom-cve-check upgrade to 1.3.3 (and dependencies):
>  * python3-shacl2code: upgrade 1.0.1 -> 1.1.0
>  * python3-spdx-python-model: update from version 0.0.5 to 0.0.6
>  * python3-sbom-cve-check: update to version 1.3.2
>  * python3-sbom-cve-check: update to version 1.3.3
>  * The most user-visible change: disputed CVE will now be ignored.
> 
> * Work toward automatic upgrade of stable recipes:
>  * recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
>  * lib/oe/recipeutils: make stable_upgrade argument optional in get_recipe_upstream_version()
>  * upstream-stable-release-point.bbclass: add bbclass for stable point upgrade
>  * devtool/upgrade.py: add --stable option
>  * systemd, glib-2.0, dbus, xz, git, perl, libxml2, python3, openssl,
>    binutils, libgcrypt, sqlite3, lttng-tools, util-linux, lttng-ust,
>    babeltrace2, lttng-modules: inherit upstream-stable-release-point
>    Meaning they have stable policies that make good candidates for
>    stable upgrades.
> 
> 3 more worth mentioning:
> * "mesa: align x86 mesa config with LLVM graphics" will shrink mesa for
>   users that disable DISTRO_FEATURES opengl, opencl and vulkan.
> * "kbd: Fix CVE-2026-72693" will remove a corner use-case using openvt -u
>   and the root user.
> * "expat: upgrade 2.7.5 -> 2.8.3" has not only stable changes but this
>   allow us to remove a lot of patch and handle CVEs that where not
>   fixable with simple backports.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4761
  qemuarm64-armhost failed on 16233 – AB-INT: 502/520 and other errors on yocto gits
    retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/8/builds/4700
  qemux86-64-musl-ptest failed on 16348 – AB-INT PTEST: python3 ptest failure: in test_interrupt
    retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/110/builds/1211
    (master has the fix that I need to backport for this one)

The following changes since commit 883075157987ca300af59185b903d6d1977234c3:

  gawk: skip randtest in ptest suite (2026-09-10 14:53:48 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to b73335d791d8bf349080704699742435e6a22eb8:

  mesa: align x86 mesa config with LLVM graphics (2026-09-17 18:14:27 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  expat: upgrade 2.7.5 -> 2.8.3

Alexander Kanavin (3):
  python3-shacl2code: upgrade 1.0.1 -> 1.1.0
  libslirp: fix upstream version check
  libslirp: upgrade 4.9.1 -> 4.9.3

AshishKumar Mishra (1):
  mesa: align x86 mesa config with LLVM graphics

Benjamin Robin (3):
  python3-sbom-cve-check: update to version 1.3.3
  sbom-cve-check-update-cvelist-native: update to version 2026-08-03
  sbom-cve-check-update-nvd-native: update to version 2026.08.03-000011

Benjamin Robin (Schneider Electric) (4):
  python3-spdx-python-model: update from version 0.0.5 to 0.0.6
  python3-sbom-cve-check: update to version 1.3.2
  sbom-cve-check-update-cvelist-native: update to version 2026-06-24
  sbom-cve-check-update-nvd-native: update to version 2026.06.24-000003

Bhavesh R Maheshwari (11):
  curl: Fix for CVE-2026-9079
  ffmpeg: Fix for CVE-2026-64830
  ffmpeg: Fix for CVE-2026-64831
  ffmpeg: Fix for CVE-2026-64832
  ffmpeg: Fix for CVE-2026-64833
  ffmpeg: Fix for CVE-2026-64834
  ffmpeg: Fix for CVE-2026-64835
  ffmpeg: Fix for CVE-2026-65703
  ffmpeg: Fix for CVE-2026-65704
  ffmpeg: Fix for CVE-2026-65705
  ffmpeg: Fix for CVE-2026-65706

Chen Qi (3):
  recipeutils: add optional stable_upgrade parameter to
    get_recipe_upgrade_status
  upstream-stable-release-point.bbclass: add bbclass for stable point
    upgrade
  devtool/upgrade.py: add --stable option

Daniel Turull (17):
  systemd: inherit upstream-stable-release-point
  glib-2.0: inherit upstream-stable-release-point
  dbus: inherit upstream-stable-release-point
  xz: inherit upstream-stable-release-point
  git: inherit upstream-stable-release-point
  perl: inherit upstream-stable-release-point
  libxml2: inherit upstream-stable-release-point
  python3: inherit upstream-stable-release-point
  openssl: inherit upstream-stable-release-point
  binutils: inherit upstream-stable-release-point
  libgcrypt: inherit upstream-stable-release-point
  sqlite3: inherit upstream-stable-release-point
  lttng-tools: inherit upstream-stable-release-point
  util-linux: inherit upstream-stable-release-point
  lttng-ust: inherit upstream-stable-release-point
  babeltrace2: inherit upstream-stable-release-point
  lttng-modules: inherit upstream-stable-release-point

Devansh Patel (3):
  vim: Fix CVE-2026-52858 regression
  python3-mako: correct CVE_PRODUCT mapping
  curl: set CVE_STATUS for CVE-2026-8458

Harish Sadineni (1):
  kernel-yocto-rust: Add clang toolchain check for riscv64

Himanshu Jadon (1):
  cmake-native: use bundled nghttp2 with bundled curl

Jaipaul Cheernam (8):
  ca-certificates: upgrade 20260601 -> 20260816
  libpcap: Fix CVE-2026-0799
  libpcap: Fix CVE-2026-31912
  libpcap: Fix CVE-2026-31911
  libpcap: Fix CVE-2026-6244
  libpcap: Fix CVE-2026-6554
  libpcap: Fix CVE-2026-18313
  libpcap: Fix CVE-2026-18238

Jakub Szczudlo (Nokia) (1):
  gnutls: fix CVE-2026-5419

Kyungjik Min (1):
  rootfs.py: fix run-postinsts removal on multilib images

Peter Marko (8):
  golang: fix homepage
  python3-certifi: fix homepage
  libslirp: add tag in SRC_URI
  curl: patch CVE-2026-7009
  curl: patch CVE-2026-8925
  curl: patch CVE-2026-9080
  curl: patch CVE-2026-9545
  curl: patch CVE-2026-9546

Richard Purdie (1):
  wireless-regdb: upgrade 2026.05.30 -> 2026.09.03

Ross Burton (1):
  lib/oe/recipeutils: make stable_upgrade argument optional in
    get_recipe_upstream_version()

Siddharth Doshi (5):
  libxml2: upgrade 2.15.3 -> 2.15.4
  curl: Security Fix for CVE-2026-13608
  curl: Security Fix for CVE-2026-18924
  curl: Security Fix for CVE-2026-80229
  curl: set CVE_STATUS for CVE-2026-82209

Tim Orling (2):
  sbom-cve-check-update-cvelist-native: -> 2026-07-23
  sbom-cve-check-update-nvd-native: -> 2026.07.23-000007

Vijay Anusuri (3):
  python3-cryptography: Fix CVE-2026-69248
  python3-cryptography: Fix CVE-2026-69249
  kbd: Fix CVE-2026-72693

Wang Mingyu (1):
  sbom-cve-check-update-nvd-native: upgrade 2026.05.07-000006 ->
    2026.06.09-000006

 meta/classes-recipe/kernel-yocto-rust.bbclass |  10 +
 .../upstream-stable-release-point.bbclass     |  21 +
 meta/lib/oe/recipeutils.py                    |  23 +-
 meta/lib/oe/rootfs.py                         |   3 +-
 .../libpcap/libpcap/01-CVE-2026-0799.patch    |  67 ++
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 597 ++++++++++++++++++
 .../libpcap/libpcap/03-CVE-2026-31911.patch   |  45 ++
 .../libpcap/libpcap/04-CVE-2026-6244.patch    |  50 ++
 .../libpcap/libpcap/05-CVE-2026-6554.patch    |  94 +++
 .../libpcap/libpcap/06-CVE-2026-18313.patch   |  90 +++
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 +++++++
 .../libpcap/libpcap_1.10.6.bb                 |   7 +
 .../openssl/openssl_3.5.8.bb                  |   5 +
 .../{libslirp_4.9.1.bb => libslirp_4.9.3.bb}  |   8 +-
 meta/recipes-core/dbus/dbus_1.16.2.bb         |   6 +
 .../expat/expat/CVE-2026-41080-1.patch        | 517 ---------------
 .../expat/expat/CVE-2026-41080-2.patch        |  33 -
 .../expat/expat/CVE-2026-45186-01.patch       |  70 --
 .../expat/expat/CVE-2026-45186-02.patch       | 318 ----------
 .../expat/expat/CVE-2026-45186-03.patch       |  46 --
 .../expat/expat/CVE-2026-45186-04.patch       |  32 -
 .../expat/expat/CVE-2026-45186-05.patch       |  32 -
 .../expat/expat/CVE-2026-45186-06.patch       |  87 ---
 .../expat/expat/CVE-2026-45186-07.patch       |  52 --
 .../expat/expat/CVE-2026-56132_p1.patch       |  90 ---
 .../expat/expat/CVE-2026-56132_p2.patch       |  63 --
 .../expat/expat/CVE-2026-56132_p3.patch       |  77 ---
 .../expat/expat/CVE-2026-56132_p4.patch       |  63 --
 .../expat/expat/CVE-2026-56132_p5.patch       |  58 --
 .../expat/expat/CVE-2026-56403_p1.patch       |  83 ---
 .../expat/expat/CVE-2026-56403_p2.patch       |  40 --
 .../expat/expat/CVE-2026-56404.patch          |  47 --
 .../expat/expat/CVE-2026-56405.patch          |  32 -
 .../expat/CVE-2026-56406-dependent.patch      |  58 --
 .../expat/expat/CVE-2026-56406.patch          |  37 --
 .../expat/expat/CVE-2026-56407.patch          |  44 --
 .../expat/expat/CVE-2026-56408.patch          |  36 --
 .../expat/expat/CVE-2026-56409.patch          |  53 --
 .../expat/expat/CVE-2026-56410_p1.patch       |  40 --
 .../expat/expat/CVE-2026-56410_p2.patch       |  41 --
 .../expat/expat/CVE-2026-56411.patch          |  47 --
 meta/recipes-core/expat/expat_2.7.5.bb        |  62 --
 meta/recipes-core/expat/expat_2.8.3.bb        |  33 +
 meta/recipes-core/glib-2.0/glib.inc           |   4 +-
 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 +++++
 meta/recipes-core/kbd/kbd_2.9.0.bb            |   1 +
 .../libxml/libxml2/CVE-2026-11979.patch       |  81 ---
 .../{libxml2_2.15.3.bb => libxml2_2.15.4.bb}  |   7 +-
 meta/recipes-core/systemd/systemd.inc         |   5 +
 meta/recipes-core/util-linux/util-linux.inc   |   4 +
 meta/recipes-devtools/binutils/binutils.inc   |   5 +
 .../cmake/cmake-native_4.3.1.bb               |   2 +
 meta/recipes-devtools/git/git_2.53.0.bb       |   4 +
 .../go/go-binary-native_1.26.7.bb             |   2 +-
 meta/recipes-devtools/go/go-common.inc        |   2 +-
 meta/recipes-devtools/perl/perl_5.42.0.bb     |   2 +-
 .../python/python3-certifi_2026.2.25.bb       |   2 +-
 .../python/python3-cryptography.bb            |   2 +
 .../python3-cryptography/CVE-2026-69248.patch | 302 +++++++++
 .../python3-cryptography/CVE-2026-69249.patch | 338 ++++++++++
 .../python/python3-mako_1.3.12.bb             |   2 +
 ...e_1.0.1.bb => python3-shacl2code_1.1.0.bb} |   2 +-
 ....bb => python3-spdx-python-model_0.0.6.bb} |   2 +-
 .../recipes-devtools/python/python3_3.14.7.bb |   4 +
 ...3.1.bb => python3-sbom-cve-check_1.3.3.bb} |   2 +-
 ...check-update-cvelist-native_2026-08-03.bb} |   2 +-
 ...ck-update-nvd-native_2026.08.03-000011.bb} |   2 +-
 meta/recipes-extended/xz/xz_5.8.2.bb          |   4 +
 meta/recipes-graphics/mesa/mesa.bb            |   8 +-
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |   4 +-
 .../lttng/lttng-modules_2.14.4.bb             |   6 +
 .../lttng/lttng-tools_2.14.1.bb               |   2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb |   4 +-
 ....05.30.bb => wireless-regdb_2026.09.03.bb} |   2 +-
 .../ffmpeg/ffmpeg/CVE-2026-64830.patch        |  65 ++
 .../ffmpeg/ffmpeg/CVE-2026-64831.patch        |  36 ++
 .../ffmpeg/ffmpeg/CVE-2026-64832.patch        |  47 ++
 .../ffmpeg/ffmpeg/CVE-2026-64833.patch        |  36 ++
 .../ffmpeg/ffmpeg/CVE-2026-64834.patch        |  36 ++
 .../ffmpeg/ffmpeg/CVE-2026-64835.patch        |  45 ++
 .../ffmpeg/ffmpeg/CVE-2026-65703.patch        |  47 ++
 .../ffmpeg/ffmpeg/CVE-2026-65704.patch        |  35 +
 .../ffmpeg/ffmpeg/CVE-2026-65705_p1.patch     |  68 ++
 .../ffmpeg/ffmpeg/CVE-2026-65705_p2.patch     | 115 ++++
 .../ffmpeg/ffmpeg/CVE-2026-65706.patch        |  52 ++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  11 +
 ...ertdata2pem.py-print-a-warning-for-e.patch |   6 +-
 ...icates-don-t-use-Debianisms-in-run-p.patch |   2 +-
 ...icates-use-relative-symlinks-from-ET.patch |   2 +-
 ...0260601.bb => ca-certificates_20260816.bb} |   2 +-
 .../curl/curl/CVE-2026-13608.patch            |  48 ++
 .../curl/curl/CVE-2026-18924.patch            |  39 ++
 .../curl/curl/CVE-2026-7009.patch             |  50 ++
 .../curl/curl/CVE-2026-80229.patch            |  35 +
 .../curl/curl/CVE-2026-8925.patch             |  57 ++
 .../curl/curl/CVE-2026-9079.patch             | 289 +++++++++
 .../curl/curl/CVE-2026-9080.patch             |  95 +++
 .../curl/curl/CVE-2026-9545-01.patch          | 157 +++++
 .../curl/curl/CVE-2026-9545-02.patch          |  67 ++
 .../curl/curl/CVE-2026-9546-01.patch          | 227 +++++++
 .../curl/curl/CVE-2026-9546-02.patch          | 218 +++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  13 +
 .../gnutls/gnutls/CVE-2026-5419.patch         | 248 ++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 .../libgcrypt/libgcrypt_1.12.1.bb             |   2 +-
 meta/recipes-support/sqlite/sqlite3.inc       |   2 +-
 .../vim/files/CVE-2026-52858-regression.patch |  93 +++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/lib/devtool/upgrade.py                |   9 +-
 109 files changed, 4379 insertions(+), 2280 deletions(-)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbclass
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb} (58%)
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.7.5.bb
 create mode 100644 meta/recipes-core/expat/expat_2.8.3.bb
 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.3.bb => libxml2_2.15.4.bb} (93%)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
 rename meta/recipes-devtools/python/{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} (81%)
 rename meta/recipes-devtools/python/{python3-spdx-python-model_0.0.5.bb => python3-spdx-python-model_0.0.6.bb} (93%)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.3.bb} (82%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-05-07.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.05.07-000006.bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} (89%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64830.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p2.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb => ca-certificates_20260816.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-13608.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7009.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80229.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8925.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9079.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9080.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9545-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9545-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9546-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9546-02.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858-regression.patch


