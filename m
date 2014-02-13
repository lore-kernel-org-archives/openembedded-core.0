Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82E966E8C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 02:56:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D2uVLU021799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Feb 2014 18:56:32 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 12 Feb 2014 18:54:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2014 10:54:04 +0800
Message-ID: <cover.1392259689.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/2] socat: upgrade to 1.7.2.3 and enable ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2014 02:56:34 -0000
Content-Type: text/plain

Test Steps:

1. vim local.conf
...
IMAGE_INSTALL_append = " socat"
DISTRO_FEATURES_append = " ptest"
IMAGE_FEATURES += "ptest-pkgs"
...

2. build core-image-minimal and runqemu
bitbake core-image-minimal
runqemu qemux86

3. start test

/usr/lib/socat/ptest/run-ptest

4. test result
...
summary: 314 tests; 255 ok, 25 failed, 31 could not be performed
...

//Hongxu

The following changes since commit 095bb006c3dbbfbdfa05f13d8d7b50e2a5ab2af0:

  bitbake: bitbake: build.py: create separate function for shell trap creation code (2014-02-09 10:01:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/socat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/socat

Hongxu Jia (2):
  socat: upgrade to 1.7.2.3
  socat: enable ptest

 .../socat/{files => socat}/compile.patch                 |  0
 .../{files => socat}/fix-xxx_SHIFT-autoheader.patch      |  0
 meta/recipes-connectivity/socat/socat/run-ptest          |  5 +++++
 .../socat/{socat_1.7.2.2.bb => socat_1.7.2.3.bb}         | 16 ++++++++++++----
 4 files changed, 17 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/socat/{files => socat}/compile.patch (100%)
 rename meta/recipes-connectivity/socat/{files => socat}/fix-xxx_SHIFT-autoheader.patch (100%)
 create mode 100644 meta/recipes-connectivity/socat/socat/run-ptest
 rename meta/recipes-connectivity/socat/{socat_1.7.2.2.bb => socat_1.7.2.3.bb} (77%)

-- 
1.8.1.2


