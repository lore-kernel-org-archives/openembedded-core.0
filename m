Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 554BD61883
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 11:11:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6BBBdeZ011329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 04:11:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Jul 2013 04:11:37 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2013 19:11:36 +0800
Message-ID: <cover.1373540849.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V3 0/3] Add a method for image level user/group configuration
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
X-List-Received-Date: Thu, 11 Jul 2013 11:11:37 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patchset mainly does two things:
1. code refactor to avoid code duplication
2. add a method for image level user/group configuration

The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/user_group_settings
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/user_group_settings

Chen Qi (3):
  userbase.bbclass: add a new bbclass
  useradd.bbclass: code refactor
  usersettings.bbclass: add a new bbclass

 meta/classes/useradd.bbclass      |  103 ++---------------
 meta/classes/userbase.bbclass     |  230 +++++++++++++++++++++++++++++++++++++
 meta/classes/usersettings.bbclass |   48 ++++++++
 3 files changed, 290 insertions(+), 91 deletions(-)
 create mode 100644 meta/classes/userbase.bbclass
 create mode 100644 meta/classes/usersettings.bbclass

-- 
1.7.9.5


