Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UD6hK-0007gr-Hd
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 06:15:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r264wtZT000470
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 20:58:55 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 5 Mar 2013 20:58:54 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 12:58:45 +0800
Message-ID: <cover.1362545190.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [danny][PATCH 0/2]fix toolchain relocation issues
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
X-List-Received-Date: Wed, 06 Mar 2013 05:15:28 -0000
Content-Type: text/plain

Rebase to danny.

[YOCTO #3984]

The following changes since commit e89f812a0af56beda951c1dce6113a61d6db8cda:

  bitbake: knotty.py: fix unknown event bb.event.DiskFull (2013-03-04 10:17:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-toolchain-relocation-danny
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-toolchain-relocation-danny

Hongxu Jia (2):
  perl-nativesdk:fix toolchain relocation issues
  populate_sdk_base.bbclass:fix toolchain relocation issues

 meta/classes/populate_sdk_base.bbclass    |    7 +++++++
 meta/recipes-devtools/perl/perl_5.14.2.bb |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
1.7.10.4



