Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.3336.1594439293505136637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.100, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: /tmIVll6idmhNpeJ1xG8w78ChK8sRtWnxbfOblJsuKc1Wub2XasKqTqrdQSc4nWhWiAcmq2Kn8
 IJE6/ADG8FTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="213206804"
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="213206804"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2020 20:48:12 -0700
IronPort-SDR: kjMdKzDTueTRtDMv0a4+uUMexg0331nFZEgcRw98pb3W4LYagQCpyBI/JhkqZt48Bw7sARpP9l
 OIELju6JxyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="484376786"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2020 20:48:12 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] recipetool fixes
Date: Fri, 10 Jul 2020 20:48:06 -0700
Message-Id: <cover.1594438523.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some issues with the existing recipetool codebase:
(1) It is _impossible_ to insert the AUTHOR variable in the recommended
    location [1]. And the BBCLASSEXTEND variable is also missing from
    the list (although inserting that in the recommended location is
    trivial).
(2) Several regex patterns are missing the r' prefix, which leads tools
    like pylint/autopep8 to throw warnings because the regex patterns...
    are not identified as regex patterns.

[1] http://www.openembedded.org/wiki/Styleguide

The following changes since commit b3c96103a5063eeefb0c537227eab3f77616b9c0:

  libnl: Extend for native/nativesdk (2020-07-08 10:56:11 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/oe-recipetool-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/oe-recipetool-fixes

Tim Orling (2):
  lib/oe/recipeutils.py: add AUTHOR; BBCLASSEXTEND
  scripts/lib/recipetool/create.py: fix regex strings

 meta/lib/oe/recipeutils.py       |  2 +-
 scripts/lib/recipetool/create.py | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.24.0

