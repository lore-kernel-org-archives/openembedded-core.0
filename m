Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UK4lp-0000lW-8V
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 11:36:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2PAJqCQ005764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 03:19:52 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Mar 2013 03:19:53 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 18:21:34 +0800
Message-ID: <cover.1364204199.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 0/2] Add libraries to lsb image
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
X-List-Received-Date: Mon, 25 Mar 2013 10:37:02 -0000
Content-Type: text/plain

[YOCTO #4015]

The following changes since commit 3c5f4d54d01887a117bf659fc9af6b2b892c2b08:

  separatebuilddir.inc: mxsldr should never have been added to this list, remove (2013-03-24 14:03:19 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/lsb-libs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb-libs

Kang Kai (2):
  libpng: add version 1.2 back
  packagegroup-core-lsb: add nspr

 meta/conf/distro/include/default-versions.inc      |    3 ++
 .../packagegroups/packagegroup-core-lsb.bb         |    1 +
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb    |   21 ++++++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb

-- 
1.7.5.4



