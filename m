Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.46517.1597071175909435602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9NZNLOEFBmZytOfXcrFFRfR9z4Bp6ZofROMI91c3q8EOur7IHh0TQagL0VlRyaocdJ9ovNQMY9
 uYHPoCzeaDXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="238376816"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="238376816"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:54 -0700
IronPort-SDR: oGnoUo3pXk54/rpDUUQFHNI7MWi8LFFWjF7esDyjR8hPKQMmOyXktlFbojk9jSYhxNUyp/1CXY
 9Qxh2U1Nlu1w==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="494819249"
Received: from sshettyx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.64.39])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 0/4] zeus review request
Date: Mon, 10 Aug 2020 22:52:43 +0800
Message-Id: <cover.1597071024.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last set of changes before last zeus dot release. Please review.

Thanks,

Anuj

The following changes since commit 74e22d0d2b61d0014f408972725469bb7a024622:

  gstreamer1.0: fix builds with make 4.3 (2020-07-28 16:16:52 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/zeus

Konrad Weihmann (1):
  pypi.bbclass: mind package suffix on version check

Li Zhou (1):
  go: Security Advisory - go - CVE-2020-15586

Rahul Taya (1):
  libpcre: Add fix for CVE-2020-14155

Tim Orling (1):
  pypi.bbclass: use new pypi UPSTREAM_CHECK_URI

 meta/classes/pypi.bbclass                     |   4 +-
 meta/recipes-devtools/go/go-1.12.inc          |   1 +
 .../go/go-1.12/CVE-2020-15586.patch           | 131 ++++++++++++++++++
 .../libpcre/libpcre/CVE-2020-14155.patch      |  41 ++++++
 meta/recipes-support/libpcre/libpcre_8.43.bb  |   1 +
 5 files changed, 176 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-15586.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch

-- 
2.26.2

