Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE7376093C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:11:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5U5Bluf015197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 22:11:47 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 22:11:46 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jun 2017 01:11:44 -0400
Message-ID: <cover.1498799447.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] openssh: Restore TCP wrappers support
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
X-List-Received-Date: Fri, 30 Jun 2017 05:11:47 -0000
Content-Type: text/plain

The following changes since commit 98099349e358a9caaec8ec81f0d4abe588909cfe:

  bitbake: npm fetcher: fix unknown variable name. (2017-06-29 14:33:42 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/openssh-restore-tcp-wrappers-support
  https://github.com//tree/dengke/openssh-restore-tcp-wrappers-support

Wenzong Fan (1):
  openssh: Restore TCP wrappers support

 .../openssh/openssh/restore-tcp-wrappers.patch     | 183 +++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |   4 +
 2 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch

-- 
2.8.1


