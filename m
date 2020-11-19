Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.3169.1605749492057332244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 17:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CmCfCAKG2Hr/99YNDDSAouG67IBveP937MJaObiRWoAdzao6sBKg7qCxQh94Ss1j7DQNUnMFdF
 G0OmaDMr4PXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="232826865"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; 
   d="scan'208";a="232826865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 17:31:31 -0800
IronPort-SDR: rXN40CSjLbYvauTwk/Ul6YdVhaX5tHr3teioBJNQrZI+xF5FPFMm3LvaS5XIuNHec9t8DUJbTo
 zhzXmksmyXmA==
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; 
   d="scan'208";a="534562597"
Received: from nnikmat-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.161.163])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 17:31:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/18] pull request (cover letter only)
Date: Thu, 19 Nov 2020 09:31:12 +0800
Message-Id: <cover.1605749122.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

I have dropped the kernel change from this request and will include it
along with the fix up sent by Bruce in next series.

Thanks,

Anuj

The following changes since commit a1db1e71129c3e67ddd9dbef21e1c5eb31552e00:

  grub: clean up CVE patches (2020-11-12 11:54:28 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Alexander Kanavin (2):
  clutter-gst-3.0: do not call out to host gstreamer plugin scanner
  conf-notes.txt: mention more important images than just sato

Denys Zagorui (1):
  binutils: reproducibility: reuse debug-prefix-map for stabs

Diego Santa Cruz (1):
  freetype: fix CVE-2020-15999, backport from 2.10.4

Gratian Crisan (1):
  kernel-module-split.bbclass: identify kernel modconf files as
    configuration files

Jose Quaresma (1):
  gstreamer1.0: warn the user when something is wrong with GstBufferPool

Khem Raj (2):
  lrzsz: Use Cross AR during compile
  gawk: Avoid using host ar during cross compile

Konrad Weihmann (3):
  oeqa/core/context: expose results as variable
  oeqa/core/context: initialize _run_end_time
  testimage: print results for interrupted runs

Mark Jonas (1):
  libbsd: Remove BSD-4-Clause from main package

Matt Madison (1):
  layer.conf: fix syntax error in PATH setting

Nathan Rossi (1):
  diffstat: add nativesdk to BBCLASSEXTEND

Richard Purdie (3):
  ptest-runner: Fix license as it contains 'or later' clause
  libdnf: Fix license as it contains 'or later' clause
  alsa-utils: Fix license to GPLv2 only

Steve Sakoman (1):
  openssh: whitelist CVE-2014-9278

 meta/classes/kernel-module-split.bbclass      |  1 +
 meta/classes/testimage.bbclass                | 19 ++++---
 meta/conf/conf-notes.txt                      |  2 +
 meta/conf/layer.conf                          |  2 +-
 meta/lib/oeqa/core/context.py                 |  4 ++
 ...mpilation-using-autoconf-detected-AR.patch | 36 +++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 .../openssh/openssh_8.3p1.bb                  |  4 ++
 .../binutils/binutils-2.35.inc                |  1 +
 ...oducibility-for-stabs-debugging-data.patch | 35 +++++++++++++
 .../diffstat/diffstat_1.63.bb                 |  2 +
 meta/recipes-devtools/libdnf/libdnf_0.48.0.bb |  2 +-
 .../0001-Use-cross-AR-during-compile.patch    | 35 +++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.0.bb      |  1 +
 .../clutter/clutter-gst-3.0.inc               |  2 +
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
 .../freetype/freetype_2.10.2.bb               |  1 +
 meta/recipes-multimedia/alsa/alsa-utils.inc   |  3 +-
 ...size-in-reset-when-maxsize-is-larger.patch | 49 ++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
 meta/recipes-support/libbsd/libbsd_0.10.0.bb  |  3 +-
 .../ptest-runner/ptest-runner_2.4.0.bb        |  2 +-
 22 files changed, 244 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch

-- 
2.28.0

