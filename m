Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD01271A5E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 01:44:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0B1iUUm032170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 Jan 2017 17:44:30 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 10 Jan 2017 17:44:29 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 20:44:27 -0500
Message-ID: <cover.1484098871.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: randy.e.witt@intel.com
Subject: [PATCH 0/1] Fix RPM backend does not honor package overrides for PACKAGE_ARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2017 01:44:32 -0000
Content-Type: text/plain

The following changes since commit e016eb10b075e280b4e78a04e47b59a173386421:

  bitbake: bb/cooker: BBCooker stops notifier at shutdown (2017-01-06 00:01:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-yocto-bug-7984
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-yocto-bug-7984

Dengke Du (1):
  Fix RPM backend does not honor package overrides for PACKAGE_ARCH

 meta/classes/package_rpm.bbclass | 202 ++++++++++++++++++++++++++-------------
 1 file changed, 134 insertions(+), 68 deletions(-)

-- 
2.8.1


