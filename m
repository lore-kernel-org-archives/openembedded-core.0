Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9928.1589535082347406106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 02:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04F9V0SU006722
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 02:31:10 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 02:30:48 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] archiver.bbclass: Fix for do_populate_sdk
Date: Fri, 15 May 2020 02:30:47 -0700
Message-ID: <cover.1589535009.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit ce6c50ea68c34e02b487d54fdd9288e04833cdef:

  wayland: fix condition for strndup detection (2020-05-14 14:13:50 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/archiver
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/archiver

Robert Yang (1):
  archiver.bbclass: Fix for do_populate_sdk

 meta/classes/archiver.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.21.0

