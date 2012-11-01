Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TTozc-0005OZ-EW
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 08:15:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA16lSoh020988
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 23:47:29 -0700 (PDT)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 31 Oct 2012 23:47:26 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Nov 2012 14:47:45 +0800
Message-ID: <cover.1351749303.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] *** Improve hwclock.sh script ***
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
X-List-Received-Date: Thu, 01 Nov 2012 07:15:08 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

*** BLURB HERE ***
The following changes since commit e9e3285e1397cfd2d34f4eb7b5aa59311eea861d:

  openssl: Use ${CFLAGS} not ${FULL_OPTIMIZATION} (2012-10-30 11:06:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/hwclock
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/hwclock

Chen Qi (1):
  hwclock.sh: improve hwclock.sh script to use UTC variable

 meta/recipes-core/busybox/busybox_1.20.2.bb     |    2 +-
 meta/recipes-core/busybox/files/hwclock.sh      |    9 +++++----
 meta/recipes-core/sysvinit/sysvinit/rcS-default |    4 ++--
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb  |    2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

-- 
1.7.9.5



