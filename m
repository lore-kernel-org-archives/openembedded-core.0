Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UBN1Z-0002KZ-HK
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 11:17:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r21A0jRV018652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Mar 2013 02:00:45 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 1 Mar 2013 02:00:44 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 18:02:12 +0800
Message-ID: <cover.1362123438.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Name rpm package postinstll files with their package names
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
X-List-Received-Date: Fri, 01 Mar 2013 10:17:18 -0000
Content-Type: text/plain

[YOCTO #3218]

The following changes since commit 0bedc0b80d9b46cbbf4a2c5e120a6aa52cbc7c2e:

  sudo : upgrade to 1.8.6p6 (2013-02-28 23:15:52 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kaikang/name-rpm-postinst
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kaikang/name-rpm-postinst

Kang Kai (2):
  package_rpm.bbclass: add more description for pre/post scriptlets
  package_rpm.bbclass: name postinst files with package name

 meta/classes/package_rpm.bbclass |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

-- 
1.7.5.4



