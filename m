Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SUbEm-0005PE-Dj
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 12:13:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4GA3gpc008541
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 03:03:42 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 16 May 2012 03:03:41 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2012 18:10:53 +0800
Message-ID: <cover.1337162056.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] ncurses: Disable parallel make
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
X-List-Received-Date: Wed, 16 May 2012 10:13:44 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I can't reproduce bug 2298 after building ncurses successfully many time because Richard said "Its a race issue and sometimes occurs with high values of PARALLEL_MAKE. This means it will sometimes appear and sometimes not appear". I didn't know whether this patch is appropriate or not? I will appreciate him very much if anyone has the resolution.

The following changes since commit d4e265661517f8dd4e1648fdc56bac5973f986f6:
  Saul Wold (1):
        poky.conf: Change WARNS -> ERRORS

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/2298
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2298

Xiaofeng Yan (1):
  ncurses: Disable parallel make

 meta/recipes-core/ncurses/ncurses.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



