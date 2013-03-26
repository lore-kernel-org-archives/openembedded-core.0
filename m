Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UKN8u-0001Z0-GW
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 07:14:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q5urRi027877
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Mar 2013 22:56:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Mar 2013 22:56:53 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Mar 2013 13:58:33 +0800
Message-ID: <cover.1364277284.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V2: Add libraries to lsb image
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
X-List-Received-Date: Tue, 26 Mar 2013 06:14:33 -0000
Content-Type: text/plain

V2: put libpng_1.2.50.bb to meta-lsb4

The following changes since commit f36926a264190e6202830e8520b41b30ae77ea43:

  docbook-utils-native: Unbreak the build after source and build dir split (2013-03-25 20:51:19 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/lsb-libs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb-libs

Kang Kai (1):
  libpng: add version 1.2 back

 meta/conf/distro/include/default-versions.inc |    3 +++
 meta/recipes-lsb4/libpng/libpng_1.2.50.bb     |   21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-lsb4/libpng/libpng_1.2.50.bb

-- 
1.7.5.4



