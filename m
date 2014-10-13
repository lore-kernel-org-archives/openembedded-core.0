Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16E9F6ACB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 10:46:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9DAkfRb019112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Oct 2014 03:46:41 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 13 Oct 2014 03:46:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<tom.zanussi@linux.intel.com>
Date: Mon, 13 Oct 2014 18:46:33 +0800
Message-ID: <cover.1413196789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] wic/bootimg-pcbios.py: checking the existance of syslinux
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
X-List-Received-Date: Mon, 13 Oct 2014 10:46:43 -0000
Content-Type: text/plain

Test Steps:

1. build core-image-minimal
$ bitbake core-image-minimal

2. run wic failed
$ wic create directdisk -e core-image-minimal
...
Creating image(s)...

Error: Please build syslinux first
...

3. build syslinux
$ bitbake syslinux

4. run wic success
$ wic create directdisk -e core-image-minimal
...
Creating image(s)...
..
The image(s) were created using OE kickstart file:
  /home/jiahongxu/yocto/poky/scripts/lib/image/canned-wks/directdisk.wks
...

//Hongxu

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-wic-syslinux
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-wic-syslinux

Hongxu Jia (1):
  wic/bootimg-pcbios.py: checking the existance of syslinux

 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
1.9.1


