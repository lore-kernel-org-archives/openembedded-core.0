Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TjLFB-0004VQ-AA
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 03:43:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBE2Sk79010947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 18:28:46 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 13 Dec 2012 18:28:44 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 10:28:56 +0800
Message-ID: <cover.1355388935.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] coreutils: make coreutils work with long TMPDIR
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
X-List-Received-Date: Fri, 14 Dec 2012 02:43:22 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit c607095894cab60493ddfc4b967b0325e1c313b4:

  bitbake: Revert "BBHandler: Ensure parser state engine is correctly reset for new parsing" (2012-12-07 18:09:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/coreutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/coreutils

Chen Qi (1):
  coreutils: make coreutils work with long TMPDIR

 meta/recipes-core/coreutils/coreutils_8.14.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.9.5



