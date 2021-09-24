Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.4690.1632464580248985005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 23:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="309567176"
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; 
   d="scan'208";a="309567176"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 23:22:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; 
   d="scan'208";a="585994240"
Received: from kellylim-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.112])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 23:22:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/3] Pull Request (cover letter only)
Date: Fri, 24 Sep 2021 14:22:52 +0800
Message-Id: <cover.1632464526.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes.

Thanks,

Anuj

The following changes since commit e99578cde6078828a3075e10f1bb97e1a373ce12:

  linux-yocto/5.4: update to v5.4.144 (2021-09-16 00:56:36 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Armin Kuster (1):
  tar: ignore node-tar CVEs

Kiran Surendran (1):
  ffmpeg: fix CVE-2021-38114

Richard Purdie (1):
  sstate: Avoid problems with recipes using SRCPV when fetching sstate

 meta/classes/sstate.bbclass                   |  4 ++
 meta/recipes-extended/tar/tar_1.34.bb         |  1 +
 .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 4 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch

-- 
2.31.1

