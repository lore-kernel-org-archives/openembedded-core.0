Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QugWO-000278-3D
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 10:03:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7K7wSQH021703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2011 00:58:28 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 20 Aug 2011 00:58:27 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Aug 2011 15:58:39 +0800
Message-ID: <cover.1313826618.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] libpam: Setting suid bit for unix_chkpwd
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
X-List-Received-Date: Sat, 20 Aug 2011 08:03:12 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix for [yocto #1252]

The crontab can't be run by a normal user while pam enabled for it, the real
issue is unix_chkpwd can't access shadow file with normal permission on lsb
images, set suid bit for unix_chkpwd would be fix this issue.

The following changes since commit 36396b6ecb0c84c6752cdc8118c496e8ec05a388:
  Richard Purdie (1):
        xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/1252
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1252

Wenzong Fan (1):
  libpam: Setting suid bit for unix_chkpwd

 meta/recipes-extended/pam/libpam_1.1.4.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)



