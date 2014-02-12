Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B991E6E903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 08:49:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1C8nWPn020668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 00:49:32 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 12 Feb 2014 00:49:31 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Feb 2014 16:49:29 +0800
Message-ID: <cover.1392194903.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] diffutils: enable ptest support
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
X-List-Received-Date: Wed, 12 Feb 2014 08:49:32 -0000
Content-Type: text/plain

The following changes since commit b70a10ca3ee4a0add90d387e2c8288e531aaa47c:

  systemd-serialgetty: Update to match version in recent systemd (2014-02-11 22:59:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/diffutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/diffutils

Chong Lu (1):
  diffutils: enable ptest support

 .../diffutils/diffutils-3.3/Makefile               | 284 +++++++++++++++++++++
 .../diffutils/diffutils-3.3/run-ptest              |   3 +
 meta/recipes-extended/diffutils/diffutils_3.3.bb   |  15 +-
 3 files changed, 301 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/Makefile
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/run-ptest

-- 
1.8.1.2


