Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.6233.1619160180017575858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 23:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2A4LpyG05a3Xdbk8E0U9loYXlE+AzKZG0p3EhDZO4wg5dfxE5xjvutf1GijcsfFF6i2JYME1IU
 GfwTjwxmAtsQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="176147707"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; 
   d="scan'208";a="176147707"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 23:42:58 -0700
IronPort-SDR: YCtV8SIZwnVqVnXzWraIXly+XEzEmT7kCGRjX+bofPByexLl/vbGVSbg9GZHLEosXdBWt2La72
 fjedna0q2UGQ==
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; 
   d="scan'208";a="392010621"
Received: from schang3-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.147.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 23:42:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/8] pull request (cover letter only)
Date: Fri, 23 Apr 2021 14:42:50 +0800
Message-Id: <cover.1619160020.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes.

Thanks,

Anuj

The following changes since commit d1283b74cc29d1cbcab56bf1075a244ea5082025:

  image-live.bbclass: optional depends when ROOTFS empty (2021-04-09 14:04:40 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Chen Qi (1):
  busybox: fix CVE-2021-28831

Douglas Royds (1):
  externalsrc: Detect code changes in submodules

Peter Budny (1):
  lib/oe/terminal: Fix tmux new-session on older tmux versions (<1.9)

Richard Purdie (3):
  pseudo: Upgrade to add trailing slashes ignore path fix
  oeqa/selftest: Hardcode test assumptions about heartbeat event timings
  sanity: Add error check for '%' in build path

Ross Burton (1):
  insane: clean up some more warning messages

Stefan Ghinea (1):
  wpa-supplicant: fix CVE-2021-30004

 meta/classes/externalsrc.bbclass              |  11 +-
 meta/classes/insane.bbclass                   |  12 +-
 meta/classes/sanity.bbclass                   |   2 +
 meta/lib/oe/terminal.py                       |  16 ++-
 meta/lib/oeqa/selftest/cases/buildoptions.py  |   6 +-
 .../wpa-supplicant/CVE-2021-30004.patch       | 123 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch |  58 +++++++++
 meta/recipes-core/busybox/busybox_1.32.0.bb   |   3 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 10 files changed, 215 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

-- 
2.30.2

