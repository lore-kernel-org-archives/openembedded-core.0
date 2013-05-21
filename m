Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D997860653
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 08:12:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4L8C4V7027895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 01:12:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 21 May 2013 01:12:03 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 May 2013 16:12:07 +0800
Message-ID: <cover.1369123754.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V3 0/4] Postinst logging reimplementation
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
X-List-Received-Date: Tue, 21 May 2013 08:12:04 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Goal:
1. Enable postinst logging if 'debug-tweaks' is in IMAGE_FEATURES
2. Make rpm, opkg and dpkg not depend on IMAGE_FEATURES and POSTLOG

Implementation:
1. The run-postinst scripts will log outputs by checking the configuration in /etc/default/postinst.
2. The log location is by default /var/log/postinstall.log. 
   But it could be configured to a different location.

The following changes since commit 6271ac326d08fb3e9b4c2008b796233ee11a83e4:

  zlib: put shared libraries in base_libdir (2013-05-21 00:18:46 +0100)

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
 meta/recipes-devtools/rpm/rpm-postinsts.bb |   13 +++++++------
 4 files changed, 30 insertions(+), 12 deletions(-)

-- 
1.7.9.5


