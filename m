Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UctKa-0001qK-94
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 10:14:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4G7uJSk000419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 00:56:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 16 May 2013 00:56:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2013 15:56:13 +0800
Message-ID: <cover.1368690819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/4] Postinst logging reimplementation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 08:15:18 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Goal:
1. Enable postinst logging if 'debug-tweaks' is in IMAGE_FEATURES
2. Make rpm, opkg and dpkg not depend on IMAGE_FEATURES and POSTLOG

Implementation:
1. The run-postinst scripts will log outputs and errors if /etc/.enable_postinst_logging is present.
2. The log location is always /var/log/postinstall.log. Do not allow configuration, because this is
   mainly for debugging purpose and /var/log/postinstall.log is a good place. Making it configurable is not necessary.

The following changes since commit a9f5bf0ed398bf9cb861feaa8b6fefd8645b1d09:

  sanity.bbclass: Attach the missing value to a format string. (2013-05-13 21:54:40 +0300)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/postinst-logging-reimplementation
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/postinst-logging-reimplementation

Chen Qi (4):
  image.bbclass: add postinst_enable_logging
  dpkg: modify the run-postinst script to enable postinst logging
  opkg: modify the run-postinst script to enable postinst logging
  rpm-postinsts.bb: enable postinst logging

 meta/classes/image.bbclass                 |    7 +++++++
 meta/recipes-devtools/dpkg/dpkg.inc        |   10 +++++-----
 meta/recipes-devtools/opkg/opkg.inc        |   10 +++++-----
 meta/recipes-devtools/rpm/rpm-postinsts.bb |   11 ++++++-----
 4 files changed, 23 insertions(+), 15 deletions(-)

-- 
1.7.9.5



