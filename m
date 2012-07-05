Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Smi3D-0005bo-AR
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 11:08:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q658vYsd021343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2012 01:57:34 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 5 Jul 2012 01:57:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2012 16:57:32 +0800
Message-ID: <cover.1341462182.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] sanity.bbclass: the tmpdir can't be longer than 410
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
X-List-Received-Date: Thu, 05 Jul 2012 09:08:39 -0000
Content-Type: text/plain

The following changes since commit 0b79c730f3e5c3c5329e439dffd137f2605b6cba:

  prexport.bbclass: Fix typo in warning: "AUROPR" -> "AUTOPR". (2012-07-04 15:00:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/tmpdir
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tmpdir

Robert Yang (1):
  sanity.bbclass: the tmpdir can't be longer than 410

 meta/classes/sanity.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)



