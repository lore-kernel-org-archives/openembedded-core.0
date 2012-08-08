Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Syyjc-0001gd-Cq
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 07:23:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q785BK8k027768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 22:11:20 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 7 Aug 2012 22:11:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Aug 2012 13:11:16 +0800
Message-ID: <cover.1344402403.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Liezhi.Yang@windriver.com
Subject: [PATCH 0/1] tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir
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
X-List-Received-Date: Wed, 08 Aug 2012 05:23:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The line 'sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh'
is commented somehow in previous commit, so that TCL_SRC_DIR
point to the tcl workdir which will cause package that use it
fail to configure or compile when the tcl workdir is removed,
so uncomment it back.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
The following changes since commit 1e873271362b770381903098d46c4aec164d81de:

  automake: Fix version reference in path substitutions (2012-08-07 23:35:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/expect_failed_0808
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/expect_failed_0808

Jackie Huang (1):
  tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir.

 meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4



