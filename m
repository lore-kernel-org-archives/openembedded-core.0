Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ubp2f-0006oI-Hk
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:27:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4D99NAp011944
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:09:23 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 13 May 2013 02:09:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2013 05:09:18 -0400
Message-ID: <cover.1368425946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/3] insane/package: refactor packaging sanity tests
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
X-List-Received-Date: Mon, 13 May 2013 09:27:41 -0000
Content-Type: text/plain

The following changes since commit c5c1517726aa103a3cdb60abda95e28997cac7c4:

  image-vmdk.bbclass: disable the NOISO = "1" (2013-05-12 09:37:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/qa
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/qa

Robert Yang (3):
  insane/package: let package.bbclass inherit insane.bbclass
  defaultsetup.conf: remove INHERIT_INSANE
  insane/package: refactor packaging sanity tests

 meta/classes/insane.bbclass        |   39 ++++++++++++++++++++++------------
 meta/classes/package.bbclass       |   41 ++++++++++++++++++++++++------------
 meta/conf/distro/defaultsetup.conf |    3 +--
 3 files changed, 54 insertions(+), 29 deletions(-)

-- 
1.7.10.4



