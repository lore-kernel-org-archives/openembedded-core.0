Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UBikx-0008Os-9z
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 10:29:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r229D1SM012981
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Mar 2013 01:13:01 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sat, 2 Mar 2013 01:13:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Mar 2013 17:12:57 +0800
Message-ID: <cover.1362215186.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] fix deb image creation issues
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
X-List-Received-Date: Sat, 02 Mar 2013 09:29:29 -0000
X-List-Received-Date: Sat, 02 Mar 2013 09:29:29 -0000
Content-Type: text/plain

[YOCTO #3721]
[YOCTO #3720]

The following changes since commit 0bedc0b80d9b46cbbf4a2c5e120a6aa52cbc7c2e:

  sudo : upgrade to 1.8.6p6 (2013-02-28 23:15:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-deb-image
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-deb-image

Hongxu Jia (2):
  package_deb.bbclass:fix the arch (replace "_" with "-") in deb
    package control
  package_deb.bbclass:fix meta-toolchain-sdk fail on do_populate_sdk

 meta/classes/package_deb.bbclass |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

-- 
1.7.10.4



