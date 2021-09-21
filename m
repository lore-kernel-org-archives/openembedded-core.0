Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.417.1632243845238279112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="287090250"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="287090250"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="549571161"
Received: from vanamadx-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.239.24])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/4] Review request
Date: Wed, 22 Sep 2021 01:03:08 +0800
Message-Id: <cover.1632216051.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. One intermittent ltp failure
seen for qemuarm64.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2625

Thanks,

Anuj

The following changes since commit e99578cde6078828a3075e10f1bb97e1a373ce12:

  linux-yocto/5.4: update to v5.4.144 (2021-09-16 00:56:36 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Armin Kuster (1):
  tar: ignore node-tar CVEs

Kiran Surendran (1):
  ffmpeg: fix CVE-2021-38114

Mark Hatle (1):
  externalsrc: Work with reproducible_build

Richard Purdie (1):
  sstate: Avoid problems with recipes using SRCPV when fetching sstate

 meta/classes/externalsrc.bbclass              | 10 +++
 meta/classes/sstate.bbclass                   |  4 ++
 meta/recipes-extended/tar/tar_1.34.bb         |  1 +
 .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 5 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch

-- 
2.31.1

