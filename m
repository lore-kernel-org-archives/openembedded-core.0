Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2546AA20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:16:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V8GU7K022345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:16:30 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 31 Oct 2013 01:16:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2013 16:16:27 +0800
Message-ID: <cover.1383207241.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH 0/1] busybox: fix sed auto insert newline and clusternewline failure
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
X-List-Received-Date: Thu, 31 Oct 2013 08:16:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 154ecc40c289b15fe9cbb33befb20dd10112e788:

  cross-canadian: Improve comment (2013-10-30 18:00:56 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_busybox-sed_1031_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_busybox-sed_1031_1

Jackie Huang (1):
  busybox: fix sed auto insert newline testcase

 ...sybox-sed-fix-sed-clusternewline-testcase.patch |  262 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |    4 +-
 2 files changed, 265 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch

-- 
1.7.4.1


