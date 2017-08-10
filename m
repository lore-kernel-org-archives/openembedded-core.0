Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D03478151
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:41:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7A1fYnr007418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Aug 2017 18:41:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 9 Aug 2017 18:41:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Aug 2017 09:46:03 +0800
Message-ID: <cover.1502329494.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sysstat: fix creating configuration file for /var/log/sa
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
X-List-Received-Date: Thu, 10 Aug 2017 01:41:33 -0000
Content-Type: text/plain

The following changes since commit 5e4bd86130866d4a92fa7b0fa6d3628126dfdf91:

  libinput: Upgrade 1.7.3 -> 1.8.1 (2017-08-09 09:38:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sysstat_conf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sysstat_conf

Chen Qi (1):
  sysstat: fix creating configuration file for /var/log/sa

 meta/recipes-extended/sysstat/sysstat.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
1.9.1


