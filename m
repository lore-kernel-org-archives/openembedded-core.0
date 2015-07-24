Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F82460962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 09:06:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O96xH6021994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 02:07:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 24 Jul 2015 02:06:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jul 2015 17:08:00 +0800
Message-ID: <cover.1437728803.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/3] Package Upgrade -- 20150723
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
X-List-Received-Date: Fri, 24 Jul 2015 09:07:01 -0000
Content-Type: text/plain

The following changes since commit 6be698b7270f73f40d38713ecf13f12aec0ced61:

  dpkg: Fix for Fedora22 and new versions of tar (2015-07-13 13:46:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20150723
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20150723

Chen Qi (3):
  diffstat: upgrade to 1.60
  byacc: upgrade to 20150711
  sudo: upgrade to 1.8.14p2

 .../diffstat/{diffstat_1.59.bb => diffstat_1.60.bb}                 | 4 ++--
 .../recipes-extended/byacc/{byacc_20141128.bb => byacc_20150711.bb} | 6 +++---
 meta/recipes-extended/sudo/sudo.inc                                 | 3 ++-
 meta/recipes-extended/sudo/{sudo_1.8.13.bb => sudo_1.8.14p2.bb}     | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.59.bb => diffstat_1.60.bb} (84%)
 rename meta/recipes-extended/byacc/{byacc_20141128.bb => byacc_20150711.bb} (58%)
 rename meta/recipes-extended/sudo/{sudo_1.8.13.bb => sudo_1.8.14p2.bb} (87%)

-- 
1.9.1


