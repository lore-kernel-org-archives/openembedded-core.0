Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TQeUb-00084c-3V
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 15:26:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9NDCZZd019321
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 06:12:35 -0700 (PDT)
Received: from usp-ub10.wrs.com (128.224.163.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 23 Oct 2012 06:12:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2012 21:12:44 +0800
Message-ID: <cover.1350996778.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] nativesdk-ncurses 5.9: files were installed but not shipped
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
X-List-Received-Date: Tue, 23 Oct 2012 13:26:01 -0000
Content-Type: text/plain

Test info:
$ bitbake core-image-sato meta-toolchain-sdk

There is no warning about "nativesdk-ncurses: files were installed but
not shipped"

// Robert

The following changes since commit b0187d2ba864a5a218effa01e4ddb23ade40c7e2:

  oe-buildenv-internal: break BB_ENV_EXTRAWHITE into small pieces (2012-10-23 14:00:14 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/ncurses
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ncurses

Robert Yang (1):
  nativesdk-ncurses 5.9: files were installed but not shipped

 meta/recipes-core/ncurses/ncurses.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



