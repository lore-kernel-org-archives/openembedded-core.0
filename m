Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8D3D60621
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 14:57:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so11811798pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3yVInJidqmwYqmLAjqVSAZNmGMXBY4bTiv662Og687k=;
	b=f0nyTzTuHEnHsMg1oWzcqy6IN37MBOVqFOeo6BaoF+f4KxHFVTSGvLpB7L5T7/dLJ9
	cgyWOxzENMmxbnr8k0uSl80O9gFRA1E2PYirJBqll/2G5CVgHGFy6aUtmzn5bvL+Z4mv
	2wsPtUDXchE7C7ecgSvtF69RKXCZhl2f4vHY3cWkwgMEXO4viGnLKEdwppzsRH5YlIC5
	Zw+8N3RcBkvm0dJ/Wh25/dqHirHZDwDYxkztdodYTYzo7aOm0AkHd2et0v8vmUQ+zbNA
	4FXtWnfPqhcbL1xIfakE+UCjQ6MxKZSLTpV8Sw0m6kAXUFteXwwSTD9dqhrTFQF222uR
	lvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3yVInJidqmwYqmLAjqVSAZNmGMXBY4bTiv662Og687k=;
	b=IMUT4UjHD9JJy4gT5r7GrGm8HJ3cxO7U2C+3kIsFAFW6PTMXWWOWnwabT+FME9RIqr
	OI/TYv0kqnHbv9WSSm5Wv5EEwmCk+YHU2FII95tOR2VLLzLJoce/kR46LgYseZBxVh8w
	uozp7HHV8zjSujaGRy4y0TbEVtP79hRYMOVaQzv1WNFaG3xqF9B1OMozdUysCNFbmXCr
	kBJYEpQPw/6JuvmSJOOORMnnkp8AgSDe+6t/jElHb6y7gE5p/KrnMRpkJU9tMwDFu3mv
	scUOKtybSOFhE2F1xMD09p62738Fa/HWlZ4sUCNDRwxm3nH2FTfS/hyDV9Q2fCa+eqyg
	zEOw==
X-Gm-Message-State: ABUngveErk+NNW4/DpfWSKY/4VfmM/+pNr3jT4wAcPvD5A8+vmyExFmsEnhPVIefcGqWLw==
X-Received: by 10.98.223.203 with SMTP id d72mr5503209pfl.2.1479394621671;
	Thu, 17 Nov 2016 06:57:01 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:458:f56f:1b2c:d81e])
	by smtp.gmail.com with ESMTPSA id d1sm8530430pfb.76.2016.11.17.06.57.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 06:57:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 06:56:24 -0800
Message-Id: <cover.1479394077.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/32] Pull request for Krogoth-next
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
X-List-Received-Date: Thu, 17 Nov 2016 14:57:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for Krogoth-next

The following changes since commit 3bf928a3b6354bc09c87fcbf9e3972c8d368aaa3:

  dev-manual: Fixed typo for "${INC_PR}.0" (2016-11-16 10:38:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Adrian Dudau (2):
  qemu: Security fix CVE-2016-4439
  qemu: Security fix CVE-2016-4952

Armin Kuster (2):
  tzcode-native: update to 2016h
  tzdata: Update to 2016h

Daniel Díaz (1):
  weston: Add no-input-device patch to 1.9.0.

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

Ross Burton (4):
  classes/cross: set lt_cv_sys_lib_dlsearch_path_spec
  classes/native: set lt_cv_sys_lib_dlsearch_path_spec
  binutils: fix typo in libtool patch
  binutils: apply RPATH fixes from our libtool patches

Sona Sarmadi (11):
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

Yi Zhao (5):
  tiff: Security fix CVE-2016-3945
  tiff: Security fix CVE-2016-3990
  tiff: Security fix CVE-2016-3991
  tiff: Security fix CVE-2016-3623
  tiff: Security fix CVE-2016-3622

Zeeshan Ali (1):
  nss: Disable warning on deprecated API usage

 bitbake/lib/bb/build.py                            |   2 +-
 bitbake/lib/bb/siggen.py                           |  31 +-
 meta/classes/cross.bbclass                         |   2 +
 meta/classes/native.bbclass                        |   3 +-
 meta/classes/rm_work.bbclass                       |   2 +-
 meta/classes/sstate.bbclass                        |   2 +-
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
 .../binutils/binutils/0006-Use-libtool-2.4.patch   |   5 +-
 .../binutils/0014-libtool-remove-rpath.patch       | 100 ++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4441.patch |  78 +++
 .../recipes-devtools/qemu/qemu/CVE-2016-4952.patch | 105 ++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |   2 +
 ...code-native_2016g.bb => tzcode-native_2016h.bb} |   8 +-
 .../tzdata/{tzdata_2016g.bb => tzdata_2016h.bb}    |   4 +-
 .../add-config-option-for-no-input-device.patch    | 125 +++++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      |   1 +
 .../gstreamer/gstreamer1.0-libav.inc               |   1 +
 .../libtiff/files/CVE-2016-3622.patch              | 129 +++++
 .../libtiff/files/CVE-2016-3623.patch              |  52 ++
 .../libtiff/files/CVE-2016-3945.patch              | 118 ++++
 .../libtiff/files/CVE-2016-3990.patch              |  66 +++
 .../libtiff/files/CVE-2016-3991.patch              | 147 +++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   5 +
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
 .../nss/nss-disable-werror-on-deprecated-api.patch |  22 +
 meta/recipes-support/nss/nss_3.21.bb               |   1 +
 38 files changed, 2417 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4952.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016g.bb => tzcode-native_2016h.bb} (68%)
 rename meta/recipes-extended/tzdata/{tzdata_2016g.bb => tzdata_2016h.bb} (98%)
 create mode 100644 meta/recipes-graphics/wayland/weston/add-config-option-for-no-input-device.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
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
2.3.5


