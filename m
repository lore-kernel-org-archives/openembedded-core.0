Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U8Pnc-00088F-1x
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 07:38:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1L6MKft020772
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 22:22:20 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 20 Feb 2013 22:22:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2013 14:22:15 +0800
Message-ID: <cover.1361427542.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]base-passwd.preinst:fix creating passwd and group error
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
X-List-Received-Date: Thu, 21 Feb 2013 06:38:35 -0000
Content-Type: text/plain

The following changes since commit c7b23ab68aafc04d9830ef318015912e5d4f0672:

  maintainers.inc: update ownership of recipes (2013-02-17 22:33:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-base-passwd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-base-passwd

Hongxu Jia (1):
  base-passwd.preinst:fix creating passwd and group error

 meta/recipes-core/base-passwd/base-passwd_3.5.26.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.10.4



