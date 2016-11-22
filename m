Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61CEE6FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 10:09:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMA9efu011847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 02:09:45 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 22 Nov 2016 02:09:39 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 18:10:29 +0800
Message-ID: <cover.1479809328.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Persistent /var/log support
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
X-List-Received-Date: Tue, 22 Nov 2016 10:09:46 -0000
Content-Type: text/plain

The following changes since commit a675b2c89e477af088faee9b3be96eae19a85f0b:

  sanity.bbclass: fix logging of an error (2016-11-15 15:18:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/persistent-var-log
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/persistent-var-log

Chen Qi (4):
  bitbake.conf: add VOLATILE_LOG_DIR variable
  base-files: respect VOLATILE_LOG_DIR
  initscripts: support persistent /var/log
  package.bbclass: support persistent /var/log

 meta/classes/package.bbclass                       |  2 +-
 meta/conf/bitbake.conf                             |  3 +
 meta/files/fs-perms-persistent-log.txt             | 69 ++++++++++++++++++++++
 meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
 .../initscripts/initscripts-1.0/volatiles          |  1 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
 6 files changed, 78 insertions(+), 4 deletions(-)
 create mode 100644 meta/files/fs-perms-persistent-log.txt

-- 
1.9.1


