Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TbRru-0004N7-On
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 09:10:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAM7uYKv026288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 23:56:34 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 21 Nov 2012 23:56:34 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 15:56:31 +0800
Message-ID: <cover.1353570517.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, saul.wold@intel.com
Subject: [PATCH 0/1] libpam: QA issue: installed in the base_prefix, requires a shared library under exec_prefix
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
X-List-Received-Date: Thu, 22 Nov 2012 08:10:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We added the fix for zlib 1.2.6 and cracklib 2.8.18 as bbappends in our own layer and worked well,
but when they are updated in oe-core, the bbappends became dangling, so if the fix is
accepted in or-core, we don't have to mantain and update the bbappends and clean them up,
thanks!

Also added the author of the fix in CC list.

* Test info:
1) MACHINE=qemux86-64/qemux86/qemuppc
$ bitbake core-image-sato 
$ bitbake libpam

The following changes since commit 654d5816f8ff696d42d72cfb881d5e51330a79b6:

  build-appliance-image: Update to dee77eca39f406f90e60d9c5ef7a66fcc8f57dbf commit (2012-11-21 20:38:47 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_zlib_1122_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_zlib_1122_1

Jackie Huang (1):
  libpam: QA Issue: installed in the base_prefix, requires a shared
    library under exec_prefix

 meta/recipes-core/zlib/zlib_1.2.7.bb              |   11 +++++++++++
 meta/recipes-extended/cracklib/cracklib_2.8.19.bb |    9 +++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

-- 
1.7.4



