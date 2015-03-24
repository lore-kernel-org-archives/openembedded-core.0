Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 224D660034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 08:42:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2O8gf5L019491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 01:42:41 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 01:42:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Mar 2015 16:42:43 +0800
Message-ID: <cover.1427186518.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Support persistent /var/log
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
X-List-Received-Date: Tue, 24 Mar 2015 08:42:41 -0000
Content-Type: text/plain

The following changes since commit d3fcfe346b3472170641d9194243c4bbe06b8585:

  systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/persistent-var-log
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/persistent-var-log

Chen Qi (4):
  bitbake.conf: add VOLATILE_LOG_DIR variable
  base-files: respect VOLATILE_LOG_DIR
  initscripts: support persistent /var/log
  package.bbclass: support persistent /var/log

 meta/classes/package.bbclass                       |  2 +-
 meta/conf/bitbake.conf                             |  4 ++
 meta/files/fs-perms-persistent-log.txt             | 66 ++++++++++++++++++++++
 meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
 .../initscripts/initscripts-1.0/volatiles          |  1 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
 6 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 meta/files/fs-perms-persistent-log.txt

-- 
1.9.1


