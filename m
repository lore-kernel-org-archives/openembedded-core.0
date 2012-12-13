Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Tiyaz-0004fT-7z
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 03:32:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBD2HkbF020834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 18:17:46 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 18:17:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 10:17:42 +0800
Message-ID: <cover.1355363862.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]ghostscript-native:fix host underlinking issues
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
X-List-Received-Date: Thu, 13 Dec 2012 02:32:39 -0000
Content-Type: text/plain

The following changes since commit d3154aa9f8b111066a4e2f5287f8d49075ed6253:

  sstate: fix typo (2012-12-06 22:59:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/ghostscript-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/ghostscript-native

Hongxu Jia (1):
  ghostscript-native:fix host underlinking issues

 ...tscript-native-fix-disable-system-libtiff.patch |   51 ++++++++++++++++++++
 .../ghostscript/ghostscript_9.05.bb                |   15 ++++--
 2 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch

-- 
1.7.10.4



