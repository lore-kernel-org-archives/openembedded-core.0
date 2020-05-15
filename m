Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10164.1589536638825026327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 02:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04F9uuOc008220
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 02:57:07 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 02:56:45 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] archiver.bbclass: Add ENABLE_COPYLEFT_FILTER to enable/disable copyleft_filter.bbclass
Date: Fri, 15 May 2020 02:56:44 -0700
Message-ID: <cover.1589536566.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit ce6c50ea68c34e02b487d54fdd9288e04833cdef:

  wayland: fix condition for strndup detection (2020-05-14 14:13:50 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/archiver2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/archiver2

Robert Yang (1):
  archiver.bbclass: Add ENABLE_COPYLEFT_FILTER to enable/disable
    copyleft_filter.bbclass

 meta/classes/archiver.bbclass | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.21.0

