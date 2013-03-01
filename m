Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UBMzS-00028z-Ih
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 11:14:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r219wXVO018142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 01:58:33 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Fri, 1 Mar 2013 01:58:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2013 17:58:29 +0800
Message-ID: <cover.1362131239.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] fix toolchain relocation issues
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
X-List-Received-Date: Fri, 01 Mar 2013 10:14:59 -0000
Content-Type: text/plain

[YOCTO #3338]

The following changes since commit d7b248e715d99766bf8602ff9f038f8b0afa5e78:

  augeas: change SRC_URI (2013-02-26 08:02:29 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-toolchain-relocation
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-toolchain-relocation

Hongxu Jia (2):
  perl-nativesdk:fix toolchain relocation issues
  populate_sdk_base.bbclass:fix toolchain relocation issues

 meta/classes/populate_sdk_base.bbclass    |    7 +++++++
 meta/recipes-devtools/perl/perl_5.14.3.bb |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
1.7.10.4



