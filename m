Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D07166023F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 02:02:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5I22LNY028907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 19:02:21 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 19:02:19 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 22:02:16 -0400
Message-ID: <cover.1371519710.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] ghostscript: resolve the gconfig.h conflict
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
X-List-Received-Date: Tue, 18 Jun 2013 02:02:18 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Both base/lib.mak and psi/int.mak will create file gconfig.h:
    lib.mak: $(CP_) $(gconfig_h) $(GLGEN)gconfig.h
    int.mak: $(CP_) $(gconfig_h) $(PSGEN)gconfig.h

If $(GLGEN) is same with $(PSGEN), the $(GLGEN)gconfig.h will be
overridden by $(PSGEN)gconfig.h in a parallel build, and this
maybe cause build errors.

Upstream has fixed this issue, just portback its fixes from:
    http://downloads.ghostscript.com/public/ghostscript-9.06.tar.gz

The following changes since commit 1dd643b142c69ac9035e29bff11d02201638dc65:

  licences: Add SGI license (2013-06-17 16:45:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ghostscript
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ghostscript

Wenzong Fan (1):
  ghostscript: resolve the gconfig.h conflict

 .../resolve-the-gconfig.h-conflict.patch           |   84 ++++++++++++++++++++
 .../ghostscript/ghostscript_9.05.bb                |    1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/resolve-the-gconfig.h-conflict.patch

-- 
1.7.9.5


