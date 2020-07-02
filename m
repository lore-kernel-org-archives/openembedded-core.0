Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QbQK4RM7RF62i8Jd8W7IwCv3nD5BUiCngaAjP2J2BhuMP350cNBoFYD7lYr9ZzyU3Je9zJp/cd
 2/8HtSrkdRmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628763"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628763"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:20 -0700
IronPort-SDR: Zz+1UgcKGXCZ9oVq3mT9ccXY/wtxvaXm6xb4F0LP5O2EeVaOe8bdoW4b0uRRNnNs2p5xtxh4W1
 oBSc7GIA4sNg==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801477"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 00/10] zeus review request
Date: Thu,  2 Jul 2020 08:54:02 +0800
Message-Id: <cover.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for zeus.

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

