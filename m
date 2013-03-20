Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UI7Ad-0006wN-7m
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 01:46:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2K0TVfo008087
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 17:29:31 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 19 Mar 2013 17:29:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 08:29:21 +0800
Message-ID: <cover.1363676392.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]package_rpm.bbclass: fix build multilib image failed when PR Server enabled
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
X-List-Received-Date: Wed, 20 Mar 2013 00:46:25 -0000
X-List-Received-Date: Wed, 20 Mar 2013 00:46:25 -0000
Content-Type: text/plain

The following changes since commit 87cfde2559daec564731c5c25df04eec27eaf7d5:

  syslinux.bbclass: Add a default serial console option and real boot menu support (2013-03-18 21:42:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-multilib-rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-multilib-rpm

Hongxu Jia (1):
  package_rpm.bbclass: fix build multilib image failed when PR Server
    enabled

 meta/classes/package_rpm.bbclass |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
1.7.10.4



