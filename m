Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E023E607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 01:20:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBF1KTbu013701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:20:29 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 14 Dec 2017 17:20:28 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <qi.chen@windriver.com>
Date: Fri, 15 Dec 2017 09:18:36 +0800
Message-ID: <1513300719-10186-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH 0/3] remove stat recipe
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
X-List-Received-Date: Fri, 15 Dec 2017 01:20:30 -0000
Content-Type: text/plain


Yi Zhao (3):
  hdparm: replace stat with coreutils as runtime dependency
  stat: remove the recipe
  maintainers.inc: remove stat recipe

 meta/conf/distro/include/maintainers.inc           |  1 -
 .../hdparm/hdparm/wiper.sh-fix-stat-path.patch     | 38 ++++++++++++
 meta/recipes-extended/hdparm/hdparm_9.52.bb        |  6 +-
 .../stat/stat-3.3/fix-error-return.patch           | 16 -----
 .../stat/stat-3.3/fix-security-format.patch        | 68 ----------------------
 meta/recipes-extended/stat/stat_3.3.bb             | 35 -----------
 6 files changed, 42 insertions(+), 122 deletions(-)
 create mode 100644 meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
 delete mode 100644 meta/recipes-extended/stat/stat-3.3/fix-error-return.patch
 delete mode 100644 meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
 delete mode 100644 meta/recipes-extended/stat/stat_3.3.bb

-- 
2.7.4


