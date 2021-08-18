Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.51512.1629275905185612371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 01:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="196541303"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="196541303"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 01:38:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="449620660"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.247])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 01:38:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/7] Pull request (cover letter only)
Date: Wed, 18 Aug 2021 16:38:06 +0800
Message-Id: <cover.1629275770.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes.

Thanks,

Anuj

The following changes since commit 49868162a1a1d088fbaabeffcc2debcbfc17b026:

  nettle: update 3.7.2 -> 3.7.3 (2021-08-09 10:19:38 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

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

