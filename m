Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ua02Y-0004YK-EJ
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:48:23 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r488Tu2q004960
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 01:29:56 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 01:29:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 16:29:47 +0800
Message-ID: <cover.1367993762.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] python: remove the default optimization
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
X-List-Received-Date: Wed, 08 May 2013 08:48:26 -0000
Content-Type: text/plain

The following changes since commit 9895d2c074156fee338d91aed7cfb0800477c622:

  maintainers.inc: update sbc pkg maintainer (2013-05-07 13:58:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/python

Robert Yang (1):
  python: remove the default optimization

 .../python-native/04-default-is-optimized.patch    | 20 --------
 .../recipes-devtools/python/python-native_2.7.3.bb |  2 +-
 .../python/python/04-default-is-optimized.patch    | 60 ----------------------
 .../python/99-ignore-optimization-flag.patch       | 21 --------
 meta/recipes-devtools/python/python_2.7.3.bb       |  2 -
 5 files changed, 1 insertion(+), 104 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-native/04-default-is-optimized.patch
 delete mode 100644 meta/recipes-devtools/python/python/04-default-is-optimized.patch
 delete mode 100644 meta/recipes-devtools/python/python/99-ignore-optimization-flag.patch

-- 
1.8.1.2



