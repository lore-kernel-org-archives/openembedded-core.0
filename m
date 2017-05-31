Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55917600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 08:27:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4V8RKpo029239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 01:27:24 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 31 May 2017 01:27:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 16:27:15 +0800
Message-ID: <cover.1496218782.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/2] siteinfo: fix siteinfo_get_files to work with RSS
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
X-List-Received-Date: Wed, 31 May 2017 08:27:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 4aa6cdfe9f069ecd976c1257702fe8ff28c57f07:

  tune-mips32*.inc: use consistent comments across all three .inc files (2017-05-30 10:14:33 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_siteinfo_170531_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_siteinfo_170531_0

Jackie Huang (2):
  ncurses: add SYSROOT_DESTDIR for siteconfig_gencache
  siteinfo: fix siteinfo_get_files to work with RSS

 meta/classes/autotools.bbclass        |  2 +-
 meta/classes/siteinfo.bbclass         | 15 ++++-----------
 meta/recipes-core/ncurses/ncurses.inc |  2 ++
 3 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.11.0


