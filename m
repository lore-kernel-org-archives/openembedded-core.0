Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TgWqq-0001JT-Id
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 09:30:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB68G9AX010174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 00:16:10 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 6 Dec 2012 00:16:07 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Dec 2012 16:16:50 +0800
Message-ID: <cover.1354781375.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] Enable python support for libnewt and libuser
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
X-List-Received-Date: Thu, 06 Dec 2012 08:30:36 -0000
Content-Type: text/plain

Other packages may need libnewt and libuser's python extension, so enable python support for them.

The following changes since commit 5b027d041ae994d02e22302dbbf3685484aa9b48:

  gst-meta-base: pull in X11 plugins when using X11 (2012-12-05 15:26:42 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/libuser_newt-with-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/libuser_newt-with-python

Kang Kai (2):
  newt: enable python support
  libuser: enable python support

 meta/recipes-extended/libuser/libuser_0.57.1.bb    |   12 ++++++++--
 .../newt/files/fix_python_fpic.patch               |   11 ++++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      |   22 +++++++++++++++----
 3 files changed, 37 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/fix_python_fpic.patch

-- 
1.7.5.4



