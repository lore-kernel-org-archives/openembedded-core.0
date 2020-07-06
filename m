Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.48042.1593994429821880076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 17:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cbfpv5i30JtBOenF7SdUM9xCFKx992o6Y3w1LaW+s0r9x1ZdzE5PWW/VfUOONVR8Rz9FnsO/cM
 SaZZ9nLzUTwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="208850009"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
   d="scan'208";a="208850009"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 17:13:48 -0700
IronPort-SDR: 2RLAVc3RXMwehwXfbchVANEyXnsxDicDdBW+bTjPkrskzWbm02k+kuO8clGV+qLc9MnRiTn9wc
 L9NWc0mwrr/g==
X-IronPort-AV: E=Sophos;i="5.75,317,1589266800"; 
   d="scan'208";a="456510743"
Received: from mlee18-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.71.35])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 17:13:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 00/10] zeus pull request - cover letter only
Date: Mon,  6 Jul 2020 08:13:42 +0800
Message-Id: <cover.1593994030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in zeus. Clean a-full on autobuilder except a
bitbake-selftest failure fix for which has been merged.

Thanks,

Anuj

The following changes since commit ee95a399285abbde84e0148ca957b59d65bcad0a:

  mesa: fix meson configure fix when 'dri' is excluded from PACKAGECONFIG (2020-05-29 08:32:44 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

Alexander Kanavin (2):
  python3: make gdbm optional
  python3: un-break disabling the readline PACKAGECONFIG

Lee Chee Yang (1):
  qemu: fix CVE-2020-10702 & CVE-2020-13765

Lili Li (1):
  kernel.bbclass: Fix Module.symvers support

Peter Kjellerstedt (1):
  relocatable.bbclass: Avoid an exception if an empty pkgconfig dir
    exist

Richard Leitner (1):
  kernel-fitimage: introduce FIT_SIGN_ALG

haiqing (2):
  gnutls: fixed CVE-2020-13777
  libpam: Remove option 'obscure' from common-password

jason.lau (1):
  libjpeg-turbo: Fix CVE-2020-13790

wenlin.kang@windriver.com (1):
  nfs-utils: fix CVE-2019-3689

 meta/classes/kernel-fitimage.bbclass          |   6 +-
 meta/classes/kernel.bbclass                   |   2 +-
 meta/classes/relocatable.bbclass              |  20 +--
 ...atd-take-user-id-from-var-lib-nfs-sm.patch | 102 +++++++++++++
 .../nfs-utils/nfs-utils_2.4.1.bb              |   1 +
 ...report-missing-dependencies-for-disa.patch |  31 ++++
 ...tutils-prefix-is-inside-staging-area.patch |   2 +-
 meta/recipes-devtools/python/python3_3.7.7.bb |  19 ++-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2020-10702.patch            |  52 +++++++
 .../qemu/qemu/CVE-2020-13765.patch            |  48 ++++++
 .../pam/libpam/pam.d/common-password          |   5 +-
 ...buf-overrun-caused-by-bad-binary-PPM.patch |  81 +++++++++++
 .../jpeg/libjpeg-turbo_2.0.3.bb               |   1 +
 .../gnutls/gnutls/CVE-2020-13777-a.patch      |  90 ++++++++++++
 .../gnutls/gnutls/CVE-2020-13777-b.patch      | 137 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2020-13777-c.patch      |  68 +++++++++
 meta/recipes-support/gnutls/gnutls_3.6.13.bb  |   3 +
 18 files changed, 650 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch
 create mode 100644 meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13765.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-13777-a.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-13777-b.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-13777-c.patch

-- 
2.25.4

