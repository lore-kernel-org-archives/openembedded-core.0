Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68F386086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 04:43:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4N4hQaZ028162
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 21:43:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 22 May 2013 21:43:25 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 May 2013 12:43:32 +0800
Message-ID: <cover.1369284008.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V4 0/4] Postinst logging reimplementation
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
X-List-Received-Date: Thu, 23 May 2013 04:43:25 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Goal:
1. Enable postinst logging if 'debug-tweaks' is in IMAGE_FEATURES
2. Make rpm, opkg and dpkg not depend on IMAGE_FEATURES and POSTLOG

Implementation:
1. The run-postinst scripts will log outputs by checking the configuration in ${sysconfdir}/default/postinst.
2. The log location is by default ${localstatedir}/log/postinstall.log. 
   But it could be configured to a different location.

The following changes since commit 21089515bd18ba18e86ec8f72ff8141b9fb1dea8:

  ref-manual: Added xmlto and dblatex packages for docs (2013-05-22 17:23:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/postinst-logging-reimplementation
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/postinst-logging-reimplementation

Chen Qi (4):
  image.bbclass: add postinst_enable_logging
  dpkg: modify the run-postinst script to enable postinst logging
  opkg: modify the run-postinst script to enable postinst logging
  rpm-postinsts.bb: enable postinst logging

 meta/classes/image.bbclass                 |   11 +++++++++++
 meta/recipes-devtools/dpkg/dpkg.inc        |   11 ++++++-----
 meta/recipes-devtools/opkg/opkg.inc        |    7 ++++++-
 meta/recipes-devtools/rpm/rpm-postinsts.bb |   17 +++++++++--------
 4 files changed, 32 insertions(+), 14 deletions(-)

-- 
1.7.9.5


