Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SUa7w-0004GL-0Q
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 11:02:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4G8qXZD009609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 01:52:33 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 16 May 2012 01:52:33 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2012 16:59:44 +0800
Message-ID: <cover.1337157396.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] archiver.bbclass: Add two default set for avoiding error when missing assignment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 09:02:36 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This is V2.

Add two default set(SOURCE_ARCHIVE_LOG_WITH_SCRIPTS, SOURCE_ARCHIVE_PACKAGE_TYPE) to archiver.bbclass for avoiding building error when forgetting to assign to them.
Make some modification according to clarson's suggestion. Thank him correct my fault.

The following changes since commit d4e265661517f8dd4e1648fdc56bac5973f986f6:
  Saul Wold (1):
        poky.conf: Change WARNS -> ERRORS

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/archiver
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/archiver

Xiaofeng Yan (1):
  archiver.bbclass: Add two default set for avoiding error when missing
    assignment

 meta/classes/archiver.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)



