Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2776FA42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 01:59:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R1x70n026760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 May 2014 18:59:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 18:59:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 09:59:00 +0800
Message-ID: <cover.1401155797.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V2 0/3] socat: upgrade to 1.7.2.4
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
X-List-Received-Date: Tue, 27 May 2014 01:59:09 -0000
Content-Type: text/plain

Change in V2:
- Add descriptions about what was the problem that was encountered
  while upgrading to 1.7.2.4.

The following changes since commit 894df445fa71a170397c6e0b4960a89ef20a4230:

  guile: Update to 2.0.11 version (2014-05-21 19:50:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/socat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/socat

Hongxu Jia (3):
  socat: upgrade to 1.7.2.4
  socat: fix supporting cross compiling
  socat: fix linux/errqueue.h not found

 .../recipes-connectivity/socat/socat/compile.patch | 163 +++++++++++----------
 .../socat/socat/fix-cross-compiling-failed.patch   |  34 +++++
 .../socat/fix-linux-errqueue.h-not-found.patch     |  40 +++++
 .../socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb}   |  14 +-
 4 files changed, 166 insertions(+), 85 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb} (70%)

-- 
1.8.1.2


