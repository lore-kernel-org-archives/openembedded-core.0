Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.5417.1619571277822987411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 17:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Jc9c22LlFJrNZf97wwWxaCbBpGc2wg79gvsne0iGKx6NvIhg/Ps8pyYFCIew858iL58Rmh4uzs
 AnKZe8ibk5ZA==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="194511298"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="194511298"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 17:54:37 -0700
IronPort-SDR: bP23psHw/vnVf4iVdJkkgUnUyShONdgKmYz4WWXuSiWlTw6YFwV16uKwAx9tQFWrMvdI+3mQd5
 0CITFUY8UhFQ==
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="386329683"
Received: from keanlait-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.213])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 17:54:35 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/8] pull request (cover letter only)
Date: Wed, 28 Apr 2021 08:54:31 +0800
Message-Id: <cover.1619571209.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit 147a08dced5e565f19f4987a3c199780dc00f878:

  busybox: fix CVE-2021-28831 (2021-04-20 10:37:33 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.109
  linux-yocto/5.4: update to v5.4.111
  linux-yocto/5.4: update to v5.4.112
  linux-yocto/5.4: fix arm defconfig warnings

Gavin Li (1):
  kmod: do not symlink config.guess/config.sub during autoreconf

Khem Raj (1):
  ca-certificates: Fix openssl runtime cert dependencies

Konrad Weihmann (1):
  cve-update-db-native: skip on empty cpe23Uri

Richard Purdie (1):
  sanity: Further improve directory sanity tests

 meta/classes/sanity.bbclass                   | 21 ++++++++++--------
 .../recipes-core/meta/cve-update-db-native.bb |  7 +++++-
 meta/recipes-kernel/kmod/kmod.inc             |  1 -
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 .../ca-certificates_20210119.bb               |  6 ++---
 7 files changed, 39 insertions(+), 32 deletions(-)

-- 
2.30.2

