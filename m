Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Sf99G-00047C-5x
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 14:27:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5ECGxX6017073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 05:16:59 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 14 Jun 2012 05:16:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 20:18:11 +0800
Message-ID: <cover.1339643088.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] V2 gcc-cross: argument list too long when do_install
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
X-List-Received-Date: Thu, 14 Jun 2012 12:27:38 -0000
Content-Type: text/plain

Changes of V2:
* Use the patch rather than sed command as Khem suggested.

// Robert

The following changes since commit 7f017cab0b3e4d5a4fc356eccd8eb8429b0531d0:

  connman: bump PR and add some comments (2012-06-13 13:11:23 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/too_long
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/too_long

Robert Yang (1):
  gcc-cross: argument list too long when do_install

 meta/recipes-devtools/gcc/gcc-4.6.inc              |    1 +
 .../gcc/gcc-4.6/gcc-argument-list-too-long.patch   |   33 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/gcc-argument-list-too-long.patch   |   33 ++++++++++++++++++++
 4 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch



