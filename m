Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50F07772E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:59:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1HAxAJC020310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 02:59:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 17 Feb 2017 02:59:09 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Feb 2017 18:59:21 +0800
Message-ID: <cover.1487329062.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Package Upgrade -- cups, sysstat, sudo, util-linux
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
X-List-Received-Date: Fri, 17 Feb 2017 10:59:11 -0000
Content-Type: text/plain

The following changes since commit e98757e267389267d96778a1b443293eae12799e:

  bitbake: cooker.py: run sanity checks for multiconfig (2017-02-15 20:08:15 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20170217
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20170217

Chen Qi (4):
  cups: upgrade to 2.2.2
  sysstat: upgrade to 11.5.4
  sudo: upgrade to 1.8.19p2
  util-linux: upgrade to 2.29.1

 .../util-linux/{util-linux_2.29.bb => util-linux_2.29.1.bb}           | 4 ++--
 meta/recipes-extended/cups/{cups_2.2.1.bb => cups_2.2.2.bb}           | 4 ++--
 meta/recipes-extended/sudo/sudo.inc                                   | 2 +-
 meta/recipes-extended/sudo/{sudo_1.8.18p1.bb => sudo_1.8.19p2.bb}     | 4 ++--
 .../recipes-extended/sysstat/{sysstat_11.5.3.bb => sysstat_11.5.4.bb} | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.29.bb => util-linux_2.29.1.bb} (86%)
 rename meta/recipes-extended/cups/{cups_2.2.1.bb => cups_2.2.2.bb} (40%)
 rename meta/recipes-extended/sudo/{sudo_1.8.18p1.bb => sudo_1.8.19p2.bb} (90%)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.3.bb => sysstat_11.5.4.bb} (53%)

-- 
1.9.1


