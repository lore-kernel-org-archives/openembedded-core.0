Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC3BE65CDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 11:36:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9KBaUIe005973
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Oct 2014 04:36:30 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 20 Oct 2014 04:36:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 19:36:27 +0800
Message-ID: <cover.1413804737.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] default-versions.inc: match version of db and db-native while "AGPL-3.0" in ${INCOMPATIBLE_LICENSE}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Oct 2014 11:36:35 -0000
Content-Type: text/plain

Test Steps:

1. vim local.conf
...
IMAGE_FEATURES += "package-management ssh-server-dropbear"
INCOMPATIBLE_LICENSE="AGPL-3.0"
...

2. build core-image-minimal
bitbake core-image-minimal

3. run qemu and execute 'rpm -qa' succeed
...
root@qemux86-64:~# rpm -qa
update-alternatives-opkg-0.1.8+git0+eae0d8fa44-r0.core2_64
openssl-conf-1.0.1j-r0.core2_64
ncurses-terminfo-base-5.9-r15.1.core2_64
base-files-3.0.14-r89.qemux86_64
netbase-5.2-r0.core2_64
busybox-1.22.1-r32.core2_64
update-rc.d-0.7-r5.all
...

//Hongxu

The following changes since commit 924da20c6f2f183fa7e930e4c3c6b14c090acbe5:

  build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:38 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-db-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-db-native

Hongxu Jia (1):
  default-versions.inc: match version of db and db-native while
    "AGPL-3.0" in ${INCOMPATIBLE_LICENSE}

 meta/conf/distro/include/default-versions.inc | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1


