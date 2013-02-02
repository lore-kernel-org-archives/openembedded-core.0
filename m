Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U1YY7-0006AE-Jg
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Feb 2013 09:34:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r128IPWc003018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Feb 2013 00:18:25 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sat, 2 Feb 2013 00:18:24 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Feb 2013 16:18:21 +0800
Message-ID: <cover.1359791689.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] tcp-wrappers: remove size_t.patch
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
X-List-Received-Date: Sat, 02 Feb 2013 08:34:29 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 82602d2c55f5d233bd8351e95a84a65b792786e5:

  qt4: Add space for _appends (2013-02-01 22:49:27 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib tcp_wrapper_remove_size_t_patch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=tcp_wrapper_remove_size_t_patch

Roy.Li (1):
  tcp-wrappers: remove size_t.patch

 .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44 --------------------
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    3 +-
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch

-- 
1.7.10.4



