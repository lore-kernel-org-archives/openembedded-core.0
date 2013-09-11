Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46A616BB80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 05:01:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B51E4u007840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 22:01:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 10 Sep 2013 22:01:14 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 13:01:54 +0800
Message-ID: <cover.1378875647.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] init-live.sh: distinguish between a read-only image and a read-write one
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
X-List-Received-Date: Wed, 11 Sep 2013 05:01:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit e15dc0911656d4fe44025e71ed3b6763841b05db:

  mount.sh: automount cdrom device even if no ID_FS_TYPE available (2013-09-10 21:19:17 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/init-live-iso-hddimg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/init-live-iso-hddimg

Chen Qi (1):
  init-live.sh: distinguish between a read-only image and a read-write
    image

 meta/recipes-core/initrdscripts/files/init-live.sh |   29 ++++++++++++--------
 1 file changed, 18 insertions(+), 11 deletions(-)

-- 
1.7.9.5


