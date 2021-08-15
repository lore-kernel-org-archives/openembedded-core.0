Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.12594.1629043013474094407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780154"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780154"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820004"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/7] Review request
Date: Sun, 15 Aug 2021 23:56:39 +0800
Message-Id: <cover.1629041998.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for hardknott. Two intermittent
and unrelated failures seen while testing - a valgrind ptest failure and
a bitbake timeout while running a oe-selftest.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2434

Thanks,

Anuj

The following changes since commit 49868162a1a1d088fbaabeffcc2debcbfc17b026:

  nettle: update 3.7.2 -> 3.7.3 (2021-08-09 10:19:38 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Armin Kuster (1):
  gnutls: Enable seccomp if FEATURE is set

Khem Raj (1):
  gnutls: Point to staging area for finding seccomp libs and includes

Sakib Sajal (3):
  qemu: fix CVE-2021-3582
  qemu: fix CVE-2021-3607
  qemu: fix CVE-2021-3608

Vinay Kumar (1):
  glibc: Fix CVE-2021-35942

wangmy (1):
  gnutls: upgrade 3.7.1 -> 3.7.2

 .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 meta/recipes-devtools/qemu/qemu.inc           |  3 ++
 .../qemu/qemu/CVE-2021-3582.patch             | 47 +++++++++++++++++++
 .../qemu/qemu/CVE-2021-3607.patch             | 43 +++++++++++++++++
 .../qemu/qemu/CVE-2021-3608.patch             | 43 +++++++++++++++++
 .../{gnutls_3.7.1.bb => gnutls_3.7.2.bb}      |  6 +--
 7 files changed, 184 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
 rename meta/recipes-support/gnutls/{gnutls_3.7.1.bb => gnutls_3.7.2.bb} (89%)

-- 
2.31.1

