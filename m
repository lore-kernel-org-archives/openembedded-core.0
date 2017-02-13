Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 824BB700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:27:36 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id u143so54365409oif.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 09:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2SPnxUM6Lb9gQ5lKiWRyGT+xeWlrzZSlBorGnRT5AeY=;
	b=ej3Qg1k7olRvDuJDZ9AksvbeuFVDda+S/b1Zy/u8/RMYTfl1W6DF4gXW4nZcZYqbTC
	mXTfdchU0K4LolfK1DgFDcQVrtUNviw0hGIHGwlIOf3TFTSb2P7rZunmYMYf9YNRnTHP
	B2qulOzGnGVvDPo7IqS5Fc1ewUF+iUTKem2uB1BBwg1b2RCRD2hESMKKn62tOiFJ5c4c
	ymYdz5GK/LhykzLXwt5OrIvOXWORW2v48U0i9yNJU7qtKrNom1VcRc4j52fdvoG4dqI/
	w6iSU3mNkDrq2rFNWlDMMBLOB5ZniI2fD2giXaSO9ILfL6HOwcwlEXLZ+rmpDDh0cnFM
	NB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2SPnxUM6Lb9gQ5lKiWRyGT+xeWlrzZSlBorGnRT5AeY=;
	b=d0+bDq2+twqYVRCrNA5Eh3NI9ovHKXOYR18SwiqPrhAFBN4Srtdg7N3m5gmUaDLV5n
	Eg2sCqujBx7GVV6PtBWofnbXM2p9QFlYqsqFgAhA1owppTmgvo+EBht4E9BrmjZJbgVZ
	nB+BWCkxIMsw0TvjvuC3mGMTRrYDUHVJxIg4O7NYgPsvVIML4M4si7PMhPcnUMrWAHRd
	M/7Z6LN1ET3HIulQyi0GyasVUSXPwnMHZKq59t/fRigYEvXe6PfQSB24/Spfn44Tgxsv
	PfLSwMWZr1lJEAWwlE8M1KkMQvTqRknY4w+pgex7w8aHRjL/hhlPguJMSKIVf9/C/kGY
	DKXA==
X-Gm-Message-State: AMke39kcm+hwagccYj+dMQT8QbSFFsWAjRSUOMROprpdcNUNMnuWwUoXxIjxY3TF1Mmrnw==
X-Received: by 10.84.197.131 with SMTP id n3mr4086644pld.43.1487006856937;
	Mon, 13 Feb 2017 09:27:36 -0800 (PST)
Received: from localhost.localdomain ([2601:202:4001:9ea0:c634:6bff:fe01:a196])
	by smtp.gmail.com with ESMTPSA id
	s24sm19980349pgo.25.2017.02.13.09.27.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 09:27:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 12:26:41 -0500
Message-Id: <cover.1487006493.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 00/52] akuster/krogoth-next pull request
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
X-List-Received-Date: Mon, 13 Feb 2017 17:27:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider this set for krogoth-next. I dropped a few SRC_URI changes as they are not in master.

There is one AB build failure for edsk on ppc so this set is mostly clean.

The following changes since commit ae9b341ecfcc60e970f29cfe04306411ad26c0cf:

  bitbake: bitbake: toaster: settings set ALLOWED_HOSTS to * in debug mode (2016-11-28 14:23:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Adrian Dudau (2):
  qemu: Security fix CVE-2016-4439
  qemu: Security fix CVE-2016-4952

Armin Kuster (10):
  tzcode-native: update to 2016h
  tzdata: Update to 2016h
  openssl: Security fix CVE-2016-8610
  tzcode: update to 2016i
  tzdata: update to 2016i
  libpcre: update SRC_URI
  libpng: update SRC_URI back to SF
  libxslt: update SRC_URI
  libpng -lsb: update SRC_URI
  mesa: update SRC_URI

Daniel Díaz (1):
  weston: Add no-input-device patch to 1.9.0.

Ed Bartosh (2):
  populate_sdk_ext: fix working with uninative sstate
  populate_sdk_ext: whitelist do_package tasks

Joshua Lock (1):
  zlib: update SRC_URI to fix fetching

Mingli Yu (2):
  tiff: Security fix CVE-2016-9535
  tiff: Security fix CVE-2016-9538

Otavio Salvador (1):
  gstreamer1.0-libav: Add 'valgrind' config option

Richard Purdie (5):
  sstate: Ensure we don't remove sigbasedata files
  rm_work: Ensure we don't remove sigbasedata files
  bitbake: build: Ensure we preserve sigbasedata files as well as
    sigdata ones
  bitbake: siggen: Pass basehash to worker processes and sanity check
    reparsing result
  bitbake: siggen: Ensure taskhash mismatches don't override existing
    data

Ross Burton (6):
  classes/cross: set lt_cv_sys_lib_dlsearch_path_spec
  classes/native: set lt_cv_sys_lib_dlsearch_path_spec
  binutils: fix typo in libtool patch
  binutils: apply RPATH fixes from our libtool patches
  oeqa: fix hasPackage, add hasPackageMatch
  bitbake: fetch2/wget: attempt checkstatus again if it fails

Sona Sarmadi (12):
  curl: CVE-2016-8615
  curl: CVE-2016-8616
  curl: CVE-2016-8617
  curl: CVE-2016-8618
  curl: CVE-2016-8619
  curl: CVE-2016-8620
  curl: CVE-2016-8621
  curl: CVE-2016-8622
  curl: CVE-2016-8623
  curl: CVE-2016-8624
  curl: CVE-2016-8625
  expat: CVE-2012-6702, CVE-2016-5300

Yi Zhao (6):
  tiff: Security fix CVE-2016-3945
  tiff: Security fix CVE-2016-3990
  tiff: Security fix CVE-2016-3991
  tiff: Security fix CVE-2016-3623
  tiff: Security fix CVE-2016-3622
  tiff: Security fix CVE-2016-3632

Zeeshan Ali (1):
  nss: Disable warning on deprecated API usage

Zhixiong Chi (3):
  tiff: Security fix CVE-2016-3658
  tiff: Security fix CVE-2016-9540
  tiff: Security fix CVE-2016-9539

 bitbake/lib/bb/build.py                            |   2 +-
 bitbake/lib/bb/fetch2/wget.py                      |  12 +-
 bitbake/lib/bb/siggen.py                           |  31 +-
 meta/classes/cross.bbclass                         |   2 +
 meta/classes/native.bbclass                        |   3 +-
 meta/classes/populate_sdk_ext.bbclass              |   8 +-
 meta/classes/rm_work.bbclass                       |   2 +-
 meta/classes/sstate.bbclass                        |   2 +-
 meta/lib/oeqa/oetest.py                            |  28 +-
 meta/lib/oeqa/runtime/_ptest.py                    |   4 +-
 meta/lib/oeqa/runtime/python.py                    |   2 +-
 meta/lib/oeqa/runtime/smart.py                     |   2 +-
 meta/lib/oeqa/sdk/buildsudoku.py                   |   2 +-
 .../openssl/openssl/CVE-2016-8610.patch            | 124 +++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
 .../expat-2.1.0/CVE-2016-5300_CVE-2012-6702.patch  | 123 +++++
 meta/recipes-core/expat/expat_2.1.0.bb             |   4 +
 meta/recipes-core/zlib/zlib_1.2.8.bb               |   2 +-
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
 .../binutils/binutils/0006-Use-libtool-2.4.patch   |   5 +-
 .../binutils/0014-libtool-remove-rpath.patch       | 100 ++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4441.patch |  78 +++
 .../recipes-devtools/qemu/qemu/CVE-2016-4952.patch | 105 ++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |   2 +
 ...code-native_2016g.bb => tzcode-native_2016i.bb} |   8 +-
 .../tzdata/{tzdata_2016g.bb => tzdata_2016i.bb}    |   4 +-
 meta/recipes-graphics/mesa/mesa_11.1.1.bb          |   2 +-
 .../add-config-option-for-no-input-device.patch    | 125 +++++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      |   1 +
 meta/recipes-lsb4/libpng/libpng12_1.2.56.bb        |   2 +-
 .../gstreamer/gstreamer1.0-libav.inc               |   1 +
 meta/recipes-multimedia/libpng/libpng_1.6.21.bb    |   4 +-
 .../libtiff/files/CVE-2016-3622.patch              | 129 +++++
 .../libtiff/files/CVE-2016-3623.patch              |  52 ++
 .../libtiff/files/CVE-2016-3632.patch              |  34 ++
 .../libtiff/files/CVE-2016-3658.patch              | 111 ++++
 .../libtiff/files/CVE-2016-3945.patch              | 118 ++++
 .../libtiff/files/CVE-2016-3990.patch              |  66 +++
 .../libtiff/files/CVE-2016-3991.patch              | 147 +++++
 .../libtiff/files/CVE-2016-9535-1.patch            | 423 ++++++++++++++
 .../libtiff/files/CVE-2016-9535-2.patch            |  67 +++
 .../libtiff/files/CVE-2016-9538.patch              |  67 +++
 .../libtiff/files/CVE-2016-9539.patch              |  60 ++
 .../libtiff/files/CVE-2016-9540.patch              |  60 ++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  12 +
 meta/recipes-support/curl/curl/CVE-2016-8615.patch |  77 +++
 meta/recipes-support/curl/curl/CVE-2016-8616.patch |  49 ++
 meta/recipes-support/curl/curl/CVE-2016-8617.patch |  28 +
 meta/recipes-support/curl/curl/CVE-2016-8618.patch |  52 ++
 meta/recipes-support/curl/curl/CVE-2016-8619.patch |  52 ++
 meta/recipes-support/curl/curl/CVE-2016-8620.patch |  44 ++
 meta/recipes-support/curl/curl/CVE-2016-8621.patch | 120 ++++
 meta/recipes-support/curl/curl/CVE-2016-8622.patch |  94 ++++
 meta/recipes-support/curl/curl/CVE-2016-8623.patch | 209 +++++++
 meta/recipes-support/curl/curl/CVE-2016-8624.patch |  51 ++
 meta/recipes-support/curl/curl/CVE-2016-8625.patch | 615 +++++++++++++++++++++
 .../url-remove-unconditional-idn2.h-include.patch  |  29 +
 meta/recipes-support/curl/curl_7.47.1.bb           |  12 +
 meta/recipes-support/libpcre/libpcre_8.38.bb       |   2 +-
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |   3 +-
 .../nss/nss-disable-werror-on-deprecated-api.patch |  22 +
 meta/recipes-support/nss/nss_3.21.bb               |   1 +
 62 files changed, 3547 insertions(+), 51 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch
 create mode 100644 meta/recipes-core/expat/expat-2.1.0/CVE-2016-5300_CVE-2012-6702.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4952.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016g.bb => tzcode-native_2016i.bb} (68%)
 rename meta/recipes-extended/tzdata/{tzdata_2016g.bb => tzdata_2016i.bb} (98%)
 create mode 100644 meta/recipes-graphics/wayland/weston/add-config-option-for-no-input-device.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8615.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8616.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8617.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8618.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8619.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8620.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8621.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8622.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8623.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8624.patch
 create mode 100755 meta/recipes-support/curl/curl/CVE-2016-8625.patch
 create mode 100644 meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch
 create mode 100644 meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch

-- 
2.9.3


