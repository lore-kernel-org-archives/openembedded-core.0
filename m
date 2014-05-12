Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A41DD66035
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:06:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4CB6Yov000844
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 May 2014 04:06:34 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 04:06:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 May 2014 19:06:29 +0800
Message-ID: <cover.1399892554.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/2]socat: upgrade to 1.7.2.4
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
X-List-Received-Date: Mon, 12 May 2014 11:06:37 -0000
Content-Type: text/plain

The following changes since commit 50067e069c8cbc0d339819494f22ae7623d47aa6:

  bitbake: fetch2/perforce: Ensure command has a default (2014-05-11 15:26:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/socat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/socat

Hongxu Jia (2):
  socat: upgrade to 1.7.2.4
  socat: fix do_configure/do_compile failed

 .../recipes-connectivity/socat/socat/compile.patch | 163 +++++++++++----------
 .../socat/socat/fix-cross-compiling-failed.patch   |  25 ++++
 .../socat/fix-linux-errqueue.h-not-found.patch     |  27 ++++
 .../socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb}   |  14 +-
 4 files changed, 144 insertions(+), 85 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb} (70%)

-- 
1.8.1.2


