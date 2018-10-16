Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64D0879974
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 09:11:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9G9AgM0024242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Oct 2018 02:10:52 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 16 Oct 2018 02:10:31 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Oct 2018 16:29:13 +0800
Message-ID: <cover.1539678147.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] wic: search nonarch STAGING_DATADIR for multilib
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
X-List-Received-Date: Tue, 16 Oct 2018 09:11:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Build lib32-core-image-minimal with wic successfully by following config:

  MACHINE = "qemux86-64"
  require conf/multilib.conf
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

  IMAGE_FSTYPES = "wic"


The following changes since commit b02f3bfe2fee291a9db85094e5f31b1933acf871:

  local.conf.sample.extended: add another warning to comment about GLIBC_GENERATE_LOCALES (2018-10-14 23:45:40 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/wic
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/wic

Kai Kang (1):
  wic: search nonarch STAGING_DATADIR for multilib

 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--
2.18.0


