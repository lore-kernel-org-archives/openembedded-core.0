Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1T3IL9-0008Rx-AP
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 05:07:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7K2te3w025892
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 19:55:40 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sun, 19 Aug 2012 19:55:40 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 10:55:35 +0800
Message-ID: <cover.1345431102.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] coreutils: fix do_configure error with long TMPDIR
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
X-List-Received-Date: Mon, 20 Aug 2012 03:07:43 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

By default the 'm4/*' files will be extended with absolute path while
autoreconf running, if the length of TMPDIR is too long such as 410
which is the maximum value allowed by 'sanity.bbclass', autoreconf
will fail with error:
    
    Can't exec "/bin/sh": Argument list too long ...
    
Fix this issue by specific the 'acpaths' to '-I ./m4'.

The following changes since commit 91ece5d5668ee1adb5c5e3d757426a0d5187bd84:

  libpam: Fix missing DESTDIR for a mkdir causing build failures (2012-08-19 13:32:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/2766
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2766

Wenzong Fan (1):
  coreutils: fix do_configure error with long TMPDIR

 meta/recipes-core/coreutils/coreutils_8.14.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.9.5



