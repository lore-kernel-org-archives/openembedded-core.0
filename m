Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U16lR-0005MT-W5
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 03:54:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r112cM3N004936
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 18:38:22 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 31 Jan 2013 18:38:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 10:38:16 +0800
Message-ID: <cover.1359686157.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]dpkg-native:fix dpkg-scanpackages error at deb image creation time on Fedora 17
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
X-List-Received-Date: Fri, 01 Feb 2013 02:54:14 -0000
Content-Type: text/plain

The following changes since commit 27c8af1e3a9092caa19bd813c4dd0747de766dc5:

  module.bbclass: Don't add pkg_postinst/pkg_prerm to all packages in recipe (2013-01-30 00:03:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-dpkg-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-dpkg-native

Hongxu Jia (1):
  dpkg-native:fix dpkg-scanpackages error at deb image creation time on
    Fedora 17

 meta/recipes-devtools/dpkg/dpkg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4



