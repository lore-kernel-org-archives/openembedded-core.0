Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.9398.1588867647140657996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 09:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eZaE58eMxMPx1XrRKA/hYbyAyDzwDfpPcPtJVku5oq56xrOhOTbI9trSwxEBnPdbPUIjf2MVJr
 6h/a5tVn31sw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 09:07:26 -0700
IronPort-SDR: 5jBL7hN6LR+qIqujxl63kBb7TbYtWMuTZhbkrv2yGnAOjIblqUWqyQ2cfyAnyL/Zo8Hknpoylq
 WEB7Rcr+V2pQ==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; 
   d="scan'208";a="285044825"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 07 May 2020 09:07:25 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 00/18] zeus pull request - cover letter only
Date: Fri,  8 May 2020 00:07:15 +0800
Message-Id: <cover.1588867438.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4

Please merge these changes in zeus. Clean a-full on autobuilder.

Thanks,

Anuj

The following changes since commit bd3e0d724004a346921a25defa6d812d48d6108a:

  openssl: update to 1.1.1f (2020-04-20 19:26:57 -0700)

are available in the git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

Adrian Bunk (1):
  python: Upgrade 2.7.17 -> 2.17.18

Alex Kiernan (1):
  gnutls: upgrade 3.6.8 -> 3.6.11.1

Alexander Kanavin (1):
  gnutls: upgrade 3.6.11.1 -> 3.6.12

Changqing Li (1):
  qemu: fix CVE-2020-7039

Chee Yang Lee (1):
  qemu/slirp: fix CVE-2020-7211

Jan Luebbe (2):
  apt-native: don't let dpkg overwrite files by default
  openssl: upgrade 1.1.1f -> 1.1.1g

Jeremy Puhlman (1):
  python3-native: Should not search the system for headers/libraries.

Khem Raj (1):
  qemu: Replace stime() API with clock_settime

Lee Chee Yang (1):
  cve-update-db-native: clean DB if temporary file exist

Li Zhou (2):
  git: Security Advisory - git - CVE-2020-5260
  git: Security Advisory - git - CVE-2020-11008

Martin Jansa (1):
  prservice.py: fix do_package with newer Python in Ubuntu 20.04

Wang Mingyu (2):
  gnupg: upgrade 2.2.17 -> 2.2.19
  gnutls: upgrade 3.6.12 -> 3.6.13

Zhixiong Chi (1):
  glibc: CVE-2020-1751

haiqing (1):
  qemu: Add PACKAGECONFIG for glusterfs

wenlin.kang@windriver.com (1):
  systemd: Fix CVE-2020-1712

 meta/lib/oe/prservice.py                           |   4 +
 .../{openssl_1.1.1f.bb => openssl_1.1.1g.bb}       |   2 +-
 meta/recipes-core/glibc/glibc/CVE-2020-1751.patch  |  70 +++
 meta/recipes-core/glibc/glibc_2.30.bb              |   1 +
 meta/recipes-core/meta/cve-update-db-native.bb     |   9 +-
 .../0001-Merge-branch-polkit-ref-count.patch       | 520 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_243.2.bb         |   1 +
 meta/recipes-devtools/apt/files/apt.conf           |   2 +-
 meta/recipes-devtools/git/git.inc                  |  16 +-
 ...edential-use-test_i18ncmp-to-check-stderr.patch |  35 ++
 ...detect-unrepresentable-values-when-parsin.patch | 156 +++++++
 ...ct-gitmodules-URLs-with-embedded-newlines.patch | 103 ++++
 .../git/git/CVE-2020-11008-1.patch                 |  70 +++
 .../git/git/CVE-2020-11008-2.patch                 | 292 ++++++++++++
 .../git/git/CVE-2020-11008-3.patch                 |  97 ++++
 .../git/git/CVE-2020-11008-4.patch                 | 173 +++++++
 .../git/git/CVE-2020-11008-5.patch                 | 211 +++++++++
 .../git/git/CVE-2020-11008-6.patch                 |  84 ++++
 .../git/git/CVE-2020-11008-7.patch                 | 206 ++++++++
 .../git/git/CVE-2020-11008-8.patch                 | 114 +++++
 .../git/git/CVE-2020-11008-9.patch                 | 114 +++++
 meta/recipes-devtools/git/git/CVE-2020-5260.patch  |  65 +++
 ...on-native_2.7.17.bb => python-native_2.7.18.bb} |   0
 meta/recipes-devtools/python/python.inc            |   6 +-
 ...Don-t-search-system-for-headers-libraries.patch |  29 ++
 meta/recipes-devtools/python/python3_3.7.7.bb      |   1 +
 .../python/{python_2.7.17.bb => python_2.7.18.bb}  |   0
 meta/recipes-devtools/qemu/qemu.inc                |   6 +
 ...0011-linux-user-remove-host-stime-syscall.patch |  61 +++
 .../qemu/qemu/CVE-2020-7039-1.patch                |  44 ++
 .../qemu/qemu/CVE-2020-7039-2.patch                |  59 +++
 .../qemu/qemu/CVE-2020-7039-3.patch                |  64 +++
 .../recipes-devtools/qemu/qemu/CVE-2020-7211.patch |  46 ++
 .../gnupg/{gnupg_2.2.17.bb => gnupg_2.2.19.bb}     |   4 +-
 .../gnutls/gnutls/posix-shell.patch                |  39 --
 .../gnutls/{gnutls_3.6.8.bb => gnutls_3.6.13.bb}   |   5 +-
 36 files changed, 2658 insertions(+), 51 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb} (98%)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Merge-branch-polkit-ref-count.patch
 create mode 100644 meta/recipes-devtools/git/git/0001-t-lib-credential-use-test_i18ncmp-to-check-stderr.patch
 create mode 100644 meta/recipes-devtools/git/git/0002-credential-detect-unrepresentable-values-when-parsin.patch
 create mode 100644 meta/recipes-devtools/git/git/0003-fsck-detect-gitmodules-URLs-with-embedded-newlines.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-1.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-2.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-3.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-4.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-5.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-6.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-7.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-8.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-9.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-5260.patch
 rename meta/recipes-devtools/python/{python-native_2.7.17.bb => python-native_2.7.18.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
 rename meta/recipes-devtools/python/{python_2.7.17.bb => python_2.7.18.bb} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
 rename meta/recipes-support/gnupg/{gnupg_2.2.17.bb => gnupg_2.2.19.bb} (93%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/posix-shell.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.8.bb => gnutls_3.6.13.bb} (92%)

-- 
2.7.4

