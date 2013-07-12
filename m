Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 972B96ADA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 03:10:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6C3AZjI024425
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 20:10:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Jul 2013 20:10:34 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 11:10:34 +0800
Message-ID: <cover.1373598236.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V4 0/3] Add a method for image level user/group configuration
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
X-List-Received-Date: Fri, 12 Jul 2013 03:10:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes from V3:
1. naming changes
   rename userbase.bbclass to useradd_base.bbclass
   rename usersettings.bbclass to extrausers.bbclass
   rename USER_GROUP_SETTINGS to EXTRA_USERS_PARAMS
2. Add an example in the extrauser.bbclass to show how to use this bbclass
3. Report the incorrect setting in EXTRA_USERS_PARAMS.

Note the branch has also changed from ChenQi/user_group_settings to ChenQi/extrausers.

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


