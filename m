Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UP8MZ-0006xd-GF
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 11:27:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r389ANk5025690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 02:10:23 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 8 Apr 2013 02:10:23 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Apr 2013 17:12:06 +0800
Message-ID: <cover.1365401439.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 0/2] rename libpng_1.2.50 to libpng12
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
X-List-Received-Date: Mon, 08 Apr 2013 09:27:51 -0000
Content-Type: text/plain

Rename libpng_1.2.50 to libpng12 that multi-versions libpng could coexist.

The following changes since commit 6d4d42d63db4c3fcffd831ce359599f3ee1d710e:

  qemuimage-tests/sanity/boot: Increase timeout (2013-04-06 17:22:21 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/libpng12
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/libpng12

Kang Kai (2):
  libpng12: rename libpng_1.2.50 to libpng12
  libpng12: remove prefer version and add it to lsb packagegroup

 meta/conf/distro/include/default-versions.inc      |    3 ---
 .../packagegroups/packagegroup-core-lsb.bb         |    1 +
 .../{libpng_1.2.50.bb => libpng12_1.2.50.bb}       |   18 +++++++++++++++---
 3 files changed, 16 insertions(+), 6 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng_1.2.50.bb => libpng12_1.2.50.bb} (62%)

-- 
1.7.5.4



