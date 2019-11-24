Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3649C7FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:43 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id q16so1415671plr.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PGANuNOur+yrcId8z6sruzkXVPQWelTxi2upazSoOl8=;
	b=ae5YWlClvb2tCznpM9iX5UA86BZeV3LCp/wUJS1lMISpQIkrWlGO+57HXrwVTbnQe0
	3H46dLGuYiRs0y4WJMDn+43V/CpFoqwxxDqbjiiQFdricERgPkesovr6PyXwSNY/ni4P
	acLFHyYDb1TW6ftKeHpwVn/99r3HJ0cSgH0RL12uCxo+NxJP8dkkmfpH20zIPpmQ8UVA
	P9kJyREctpuHvxMNB/ualCq3wjZ4zIKPKo0BcyRHo8tJ1d7rA1Hj9Thp75qwp3Jb4Ge/
	kpy0M5mfKNcC5B1TV5WWNLETc596gpdrgjPMcXIFtR6m8lzSLPcZcoA39ReyJTmNG1HQ
	M6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PGANuNOur+yrcId8z6sruzkXVPQWelTxi2upazSoOl8=;
	b=CHl1Nvx8RSnZlMBtaweJEW1mJF8W78WG6gJnlFqPbJbGx+R3bxeVefWwewd4vFNRDy
	MSyEkvJ92621VLQkrzt7jUlzTim8Qsx59sCq4CaiOEsaNlJ86WD+Lz5aalCgJcSi5lmf
	C1b6K68XH1cYWLpV3LLjFjg4Ywlo/52omUYuFdI++mDodswZz4ix7qBq5M94W6JXz3St
	ksx0KZXBrvchHUcMEMvUvfKbDYwxzLrO9iPRl42L6b9qKUmmDIjPIdWN364Oi5+zMXv7
	O3Z+Dfh7ExTxRP6XLLZ/+b3QMozsEmupJ30q+hQ4qcqyUQ1/kv1z70MzOybUaGGo7EOK
	uv8w==
X-Gm-Message-State: APjAAAUzz5qhqAT9WD3946jhvPjxVS7aQiaiW0HIIH7qBnDYDBZjPjnu
	6YybW26STRIccmG3yiMi9GUmksZE
X-Google-Smtp-Source: APXvYqz6OZIfcuTBU/tdSYL8X4erHhgcVjtNT4YlMPIk51u5eqJosunrCwHxTfWJrlzmRdvt7SiwSw==
X-Received: by 2002:a17:90a:bf8b:: with SMTP id
	d11mr35699147pjs.87.1574639444001; 
	Sun, 24 Nov 2019 15:50:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:05 -0800
Message-Id: <cover.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus 00/35] pull request for Zeus next
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:43 -0000

Passed A-full build & test

Please merge this into Zeus mailine for 3.0.1 update

The following changes since commit 6431e869998baa1ddfe04d2d1fb7a81f60725ed2:

  iputils: Whitelist CVE-2000-1213 CVE-2000-1214 (2019-11-19 00:24:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Adrian Bunk (1):
  lz4: Whitelist CVE-2014-4715

Alexander Kanavin (4):
  Revert "devtool/standard.py: Not filtering devtool workspace for
    devtool finish"
  python: update to 2.7.17
  cairo: the component is dual licensed
  selftest: check that 'devtool upgrade' correctly drops backported
    patches

Anuj Mittal (1):
  boost: fix build for x32

Carlos Rafael Giani (12):
  gstreamer1.0: upgrade to version 1.16.1
  gstreamer1.0-plugins-base: upgrade to version 1.16.1
  gstreamer1.0-plugins-good: upgrade to version 1.16.1
  gstreamer1.0-plugins-bad: upgrade to version 1.16.1
  gstreamer1.0-plugins-ugly: upgrade to version 1.16.1
  gstreamer1.0-libav: upgrade to version 1.16.1
  gstreamer1.0-vaapi: upgrade to version 1.16.1
  gstreamer1.0-omx: upgrade to version 1.16.1
  gstreamer1.0-python: upgrade to version 1.16.1
  gstreamer1.0-rtsp-server: upgrade to version 1.16.1
  gst-validate: upgrade to version 1.16.1
  gstreamer: Change SRC_URI to use HTTPS access instead of HTTP

Joshua Watt (1):
  oeqa: reproducible: Add option to capture bad packages

Kai Kang (1):
  bind: fix CVE-2019-6471 and CVE-2018-5743

Richard Purdie (5):
  opkg: Add upstream fixes for empty packages
  opkg-utils: Fix silent empty/broken opkg package creation
  core-image-full-cmdline: Add less
  sanity: Add check for tar older than 1.28
  oeqa/selftest/sstatetests: Ensure we don't use hashequiv for
    sstatesigs tests

Ross Burton (9):
  libsoup: set CVE_PRODUCT
  cve-check: we don't actually need to unpack to check
  cve-update-db-native: don't refresh more than once an hour
  cve-update-db-native: don't hardcode the database name
  cve-update-db-native: add an index on the CVE ID column
  cve-update-db-native: clean up proxy handling
  cve-check: rewrite look to fix false negatives
  cve-check: neaten get_cve_info
  cve-check: fetch CVE data once at a time instead of in a single call

Zheng Ruoqin (1):
  tiff: Refresh patch

 .../devtool-upgrade-test1-1.5.3/backported.patch   |  37 +
 .../devtool/devtool-upgrade-test1_1.5.3.bb         |   4 +-
 .../devtool-upgrade-test1_1.5.3.bb.upgraded        |   4 +-
 meta/classes/cve-check.bbclass                     |  98 ++-
 meta/classes/sanity.bbclass                        |   5 +-
 meta/lib/oeqa/selftest/cases/devtool.py            |  25 +-
 meta/lib/oeqa/selftest/cases/reproducible.py       |  20 +
 meta/lib/oeqa/selftest/cases/sstatetests.py        |  12 +
 .../bind/bind/0001-bind-fix-CVE-2019-6471.patch    |  64 ++
 .../0001-fix-enforcement-of-tcp-clients-v1.patch   |  60 ++
 ...02-tcp-clients-could-still-be-exceeded-v2.patch | 670 +++++++++++++++
 ...-reference-counter-for-pipeline-groups-v3.patch | 278 +++++++
 ...uota-accounting-and-client-mortality-chec.patch | 512 ++++++++++++
 ...pquota-and-pipeline-refs-allow-special-ca.patch | 911 +++++++++++++++++++++
 ...tore-allowance-for-tcp-clients-interfaces.patch |  80 ++
 ...mic-operations-in-bin-named-client.c-with.patch | 140 ++++
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb   |   8 +
 meta/recipes-core/meta/cve-update-db-native.bb     |  44 +-
 .../opkg-utils/opkg-utils/pipefail.patch           |  31 +
 .../opkg-utils/opkg-utils_0.4.1.bb                 |   3 +
 meta/recipes-devtools/opkg/opkg/open_inner.patch   |  46 ++
 meta/recipes-devtools/opkg/opkg/opkg_archive.patch |  54 ++
 meta/recipes-devtools/opkg/opkg_0.4.1.bb           |   2 +
 ...ative-fix-one-do_populate_sysroot-warning.patch |  25 +-
 ...on-native_2.7.16.bb => python-native_2.7.17.bb} |   2 +-
 meta/recipes-devtools/python/python.inc            |  10 +-
 ...55-Dont-parse-domains-containing-GH-13079.patch |  90 --
 ...43-Escape-the-server-title-of-DocXMLRPCSe.patch | 101 ---
 ...thon-Resolve-intermediate-staging-issues.patch} |  53 +-
 .../python/python/CVE-2018-20852.patch             | 123 ---
 .../python/python/CVE-2019-9740.patch              | 216 -----
 .../python/bpo-35907-cve-2019-9948-fix.patch       |  55 --
 .../python/python/bpo-35907-cve-2019-9948.patch    |  55 --
 .../python/bpo-36216-cve-2019-9636-fix.patch       |  28 -
 .../python/python/bpo-36216-cve-2019-9636.patch    | 111 ---
 .../python/python/bpo-36742-cve-2019-10160.patch   |  81 --
 .../python/{python_2.7.16.bb => python_2.7.17.bb}  |   3 -
 .../packagegroup-core-full-cmdline.bb              |   1 +
 meta/recipes-graphics/cairo/cairo_1.16.0.bb        |  12 +-
 ...t-validate_1.16.0.bb => gst-validate_1.16.1.bb} |   4 +-
 .../gstreamer1.0-libav/gtkdoc-no-tree.patch        |  35 -
 ...ibav_1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} |   7 +-
 ....0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb} |   6 +-
 ....16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} |   6 +-
 ...16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} |   6 +-
 ...Advertise-interleaved-layout-in-caps-temp.patch |  37 -
 .../gstreamer1.0-plugins-good/headerfix.patch      |  43 -
 ...16.0.bb => gstreamer1.0-plugins-good_1.16.1.bb} |   8 +-
 ...16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} |   6 +-
 ...hon_1.16.0.bb => gstreamer1.0-python_1.16.1.bb} |   6 +-
 ....16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} |   6 +-
 ...aapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb} |   4 +-
 ...treamer1.0_1.16.0.bb => gstreamer1.0_1.16.1.bb} |   6 +-
 .../libtiff/tiff/CVE-2019-7663.patch               |  71 +-
 .../0001-dont-setup-compiler-flags-m32-m64.patch   |  42 +
 meta/recipes-support/boost/boost_1.71.0.bb         |   1 +
 meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb |   2 +
 meta/recipes-support/lz4/lz4_1.9.2.bb              |   3 +
 scripts/lib/devtool/standard.py                    |   2 +-
 59 files changed, 3186 insertions(+), 1189 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch
 rename meta/recipes-devtools/python/{python-native_2.7.16.bb => python-native_2.7.17.bb} (97%)
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
 rename meta/recipes-devtools/python/python/{builddir.patch => 0001-python-Resolve-intermediate-staging-issues.patch} (58%)
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2018-20852.patch
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2019-9740.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
 rename meta/recipes-devtools/python/{python_2.7.16.bb => python_2.7.17.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.0.bb => gst-validate_1.16.1.bb} (87%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} (94%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.0.bb => gstreamer1.0-plugins-good_1.16.1.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} (83%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.0.bb => gstreamer1.0-python_1.16.1.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} (81%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.0.bb => gstreamer1.0_1.16.1.bb} (94%)
 create mode 100644 meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch

-- 
2.7.4


