Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TxCVv-0002gL-A3
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 09:14:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0L7wRuR028234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 23:58:27 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Sun, 20 Jan 2013 23:58:25 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2013 15:59:36 +0800
Message-ID: <cover.1358754984.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] Refactor external-python-tarball
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
X-List-Received-Date: Mon, 21 Jan 2013 08:14:02 -0000
Content-Type: text/plain

The following changes since commit be2a1508b16b3afc89521b3fa1eb195a0c6970fe:

  oprofile: set correct kernel path (2013-01-20 13:14:08 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/external-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/external-python

Kang Kai (2):
  createrepo-native: update dependency
  external-python-tarball: code refactoring

 meta/classes/populate_python_deb.bbclass           |   42 +++++++++++++
 meta/classes/populate_python_ipk.bbclass           |   43 ++++++++++++++
 meta/classes/populate_python_rpm.bbclass           |   59 +++++++++++++++++++
 meta/recipes-core/meta/external-python-tarball.bb  |   61 ++++----------------
 .../createrepo/createrepo_0.4.11.bb                |    4 +-
 5 files changed, 157 insertions(+), 52 deletions(-)
 create mode 100644 meta/classes/populate_python_deb.bbclass
 create mode 100644 meta/classes/populate_python_ipk.bbclass
 create mode 100644 meta/classes/populate_python_rpm.bbclass

-- 
1.7.5.4



