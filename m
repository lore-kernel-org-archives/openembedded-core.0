Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.4519.1590033959671416855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 21:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04L45u6Y017343
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 20 May 2020 21:05:57 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 20 May 2020
 21:05:56 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <pbarker@konsulko.com>
Subject: [PATCH 0/1] archiver.bbclass: Fix duplicated SRC_URIs for do_ar_original
Date: Wed, 20 May 2020 21:05:55 -0700
Message-ID: <cover.1590033901.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 586061c469a3340ec3a60ff59dae2e9ee33c3398:

  qemu: fix CVE-2020-11869 (2020-05-19 22:55:50 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ar_srcuri
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ar_srcuri

Robert Yang (1):
  archiver.bbclass: Fix duplicated SRC_URIs for  do_ar_original

 meta/classes/archiver.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.21.0

