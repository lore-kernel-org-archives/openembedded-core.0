Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qm0Zz-0004i2-4w
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:39:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6R9Yg8g003703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2011 02:34:42 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 27 Jul 2011 02:34:42 -0700
Message-ID: <cover.1311758282.git.kai.kang@windriver.com>
Old-Date: Wed, 27 Jul 2011 17:18:02 +0800
Date: Wed, 27 Jul 2011 17:34:40 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: Kang, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] ghostscript: fix parallel build issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2011 09:39:03 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Hi Saul,

This commit is for Yocto #1202: ghostscript do_compile fail on autobuilder
for crownbay-noemgd and qemux86-64.

As you told, I use 'cp -f' instead of cp. But I didn't have environment to test,
just check that build log is fine. 

So Jiajun could you please help to test? Thank you!

Regards,

The following changes since commit 860a41bae6b863a289b06a9684d9cf6c58a307bd:

  arch-ia32.inc: Fix up TUNE_ARCH variable conflicts (2011-07-26 22:39:59 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/gs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gs

Kang Kai (1):
  ghostscript: fix parallel build issue

 .../ghostscript-9.02-parallel-make.patch           |   17 +++++++++++++++++
 .../ghostscript/ghostscript_9.02.bb                |    3 ++-
 2 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch

-- 
1.7.5.1.300.gc565c



