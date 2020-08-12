Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.7139.1597199929925206128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 19:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3BZHYa7gedYllwQc5rX8o6mZphVNGL338gDQdmK1CwCStHrMKJvBzlWN5lzkFhq7pIUzQd+SFr
 P7wVuK0mJjlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="215390092"
X-IronPort-AV: E=Sophos;i="5.76,302,1592895600"; 
   d="scan'208";a="215390092"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2020 19:38:48 -0700
IronPort-SDR: BRGpG1AfqrkAzaoxcRvj6Lx+Gc0bjNzQ+VOrBRu9b6OZ2xhTQd+a+IehsriG3tAUSpoNqk64V4
 u+3aOMANQsfA==
X-IronPort-AV: E=Sophos;i="5.76,302,1592895600"; 
   d="scan'208";a="495360331"
Received: from jessieta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.160.187])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2020 19:38:44 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [zeus][PATCH 0/4] zeus pull request - cover letter only
Date: Wed, 12 Aug 2020 10:38:37 +0800
Message-Id: <cover.1597199747.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in zeus. Clean a-full on autobuilder except
an unrelated virgl failure in oe-selftest on Ubuntu 18.04 (the test now
needs libdrm in zeus to be at a specific version for that OS).

Thanks,

Anuj

The following changes since commit 74e22d0d2b61d0014f408972725469bb7a024622:

  gstreamer1.0: fix builds with make 4.3 (2020-07-28 16:16:52 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

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

