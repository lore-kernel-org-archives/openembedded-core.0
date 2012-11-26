Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TcvKc-00057Y-8G
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 10:50:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAQ9aDNk018647
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 01:36:13 -0800 (PST)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 26 Nov 2012 01:36:13 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Nov 2012 17:36:29 +0800
Message-ID: <cover.1353582422.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/4] Add pkgconfig support to four packages
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
X-List-Received-Date: Mon, 26 Nov 2012 09:50:26 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

We have 26 recipes / packages that deliver *-config tools for development,
these packages should deliver pkgconfig (.pc) files instead. Among these 26
recipes / packages, only four of them don't deliver pkgconfig (.pc) files.
So we add pkgconfig support for these four packages.

The following changes since commit 0d7d413d64bab8d3c758414c6c8c653ccc325653:

  build-appliance-image: Update to dee77eca39f406f90e60d9c5ef7a66fcc8f57dbf commit (2012-11-21 20:40:43 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/pkgconfig
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/pkgconfig

Chen Qi (4):
  libksba: add pkgconfig support
  icu: add pkgconfig support
  pth: add pkgconfig support
  libassuan: add pkgconfig support

 .../icu/files/icu-add-pkgconfig-support.patch      |   40 ++++++++++++++++++
 meta/recipes-support/icu/icu-3.6.inc               |   11 +++++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 .../files/libassuan-add-pkgconfig-support.patch    |   33 +++++++++++++++
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |   10 ++++-
 .../libksba/ksba-add-pkgconfig-support.patch       |   40 ++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.3.0.bb      |   13 ++++--
 .../pth/files/pth-add-pkgconfig-support.patch      |   44 ++++++++++++++++++++
 meta/recipes-support/pth/pth_2.0.7.bb              |   12 ++++--
 9 files changed, 196 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch

-- 
1.7.9.5



