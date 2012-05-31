Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Sa0af-0005wk-SV
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 10:18:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4V88L0V027655
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 01:08:21 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 31 May 2012 01:08:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 16:08:49 +0800
Message-ID: <cover.1338429495.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] generate-manifest-2.7.py: replace os.popen with os.unlink
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
X-List-Received-Date: Thu, 31 May 2012 08:18:42 -0000
Content-Type: text/plain

The following changes since commit 348da93e283b2b8454fd9cde80d4b17378e2a168:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:38:02 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/gen_man_py
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gen_man_py

Robert Yang (1):
  generate-manifest-2.7.py: replace os.popen with os.unlink

 scripts/contrib/python/generate-manifest-2.7.py |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)



