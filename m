Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TgrBI-0003HH-3T
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 07:13:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB75wbE3016520
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 21:58:38 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 6 Dec 2012 21:58:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2012 13:58:33 +0800
Message-ID: <cover.1354840928.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] mkelfimage-native:make failed if libz not in host
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
X-List-Received-Date: Fri, 07 Dec 2012 06:13:04 -0000
Content-Type: text/plain

The following changes since commit 381c4b69c7e8b452f4d3de2f8214e6e5f6a9abe7:

  sstate.bbclass: fix detection of owners matching sstate files (2012-12-05 15:34:07 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/mkelfimage-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/mkelfimage-native

Hongxu Jia (1):
  mkelfimage-native:make failed if libz not in host

 .../mkelfimage/fix-makefile-to-find-libz.patch     |   30 ++++++++++++++++++++
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |    3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch

-- 
1.7.10.4



