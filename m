Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 743147040D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 15:39:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s68FdLT7021475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jul 2014 08:39:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 8 Jul 2014 08:39:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jul 2014 08:39:19 -0700
Message-ID: <cover.1404833184.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] rpm: disable -Wno-override-ini
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
X-List-Received-Date: Tue, 08 Jul 2014 15:39:22 -0000
Content-Type: text/plain

The following changes since commit a5776ae532d6af1e880ab1a712dc768c900f88db:

  sanity.bbclass: Update minimum git version to 1.7.8 (2014-07-08 11:19:50 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rpm_cent
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rpm_cent

Robert Yang (1):
  rpm: disable -Wno-override-init

 .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
 3 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch

-- 
1.7.9.5


