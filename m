Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfThK-0005eo-Du
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 11:56:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB3Ag5AB027896
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2012 02:42:05 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 3 Dec 2012 02:42:03 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Dec 2012 18:42:31 +0800
Message-ID: <cover.1354531187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/4] [V2] Add pkgconfig support to four packages
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
X-List-Received-Date: Mon, 03 Dec 2012 10:56:28 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Among the 26 recipes / packages that deliver their own bin-config tools, only
four of them don't deliver pkgconfig (.pc) files. 
This series of patches add pkgconfig support to them.

[YOCTO #2453]

The following changes since commit 247b6a3754c2c50318e2a73d79981ba0e9cb560b:

  gstreamer, gst-plugins*: fix localdata (2012-11-28 15:25:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/pkgconfig2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/pkgconfig2

Chen Qi (4):
  libksba: add pkgconfig support
  ICU: add pkgconfig support
  pth: add pkgconfig support
  libassuan: add pkgconfig support

 .../icu/files/icu-add-pkgconfig-support.patch      |   43 ++++++++
 meta/recipes-support/icu/icu-3.6.inc               |   11 ++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 .../files/libassuan-add-pkgconfig-support.patch    |   57 +++++++++++
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |    5 +-
 .../libksba/ksba-add-pkgconfig-support.patch       |   57 +++++++++++
 meta/recipes-support/libksba/libksba_1.3.0.bb      |    8 +-
 .../pth/files/pth-add-pkgconfig-support.patch      |  105 ++++++++++++++++++++
 meta/recipes-support/pth/pth_2.0.7.bb              |    7 +-
 9 files changed, 286 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch

-- 
1.7.9.5



