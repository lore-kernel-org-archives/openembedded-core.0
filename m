Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 880056B251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 06:08:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6H689ht026286
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 23:08:09 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 23:08:08 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 14:08:16 +0800
Message-ID: <cover.1374041180.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V6 0/3] Add a mechanism for image level user/group configuration
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
X-List-Received-Date: Wed, 17 Jul 2013 06:08:08 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes from V5:
1. Change the configuration format of EXTRA_USERS_PARAMS

The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/extrausers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/extrausers

Chen Qi (3):
  useradd_base.bbclass: add a new bbclass
  useradd.bbclass: code refactor
  extrausers.bbclass: add a new bbclass

 meta/classes/extrausers.bbclass   |   61 ++++++++++
 meta/classes/useradd.bbclass      |   99 ++--------------
 meta/classes/useradd_base.bbclass |  230 +++++++++++++++++++++++++++++++++++++
 3 files changed, 299 insertions(+), 91 deletions(-)
 create mode 100644 meta/classes/extrausers.bbclass
 create mode 100644 meta/classes/useradd_base.bbclass

-- 
1.7.9.5


