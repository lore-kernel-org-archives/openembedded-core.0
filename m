Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4329978E72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 02:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7T2pnAZ009077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 19:51:49 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 19:51:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 10:56:28 +0800
Message-ID: <cover.1535511291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Fixes regarding oeqa/sdk
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
X-List-Received-Date: Wed, 29 Aug 2018 02:51:48 -0000
Content-Type: text/plain

The following changes since commit a8368651ffed1bd6c4715a37dfe9f40c48ca23c4:

  bitbake: fetcher: Fixed remote removal not throwing exception. (2018-08-28 10:32:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/oeqa-sdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/oeqa-sdk

Chen Qi (3):
  sdk/context.py: add ability to check for multilib version of target
    package
  sdk/buldgalculator.py: check against multilib for gtk+3
  oeqa/sdk: fixes related to hasPackage semantics

 meta/lib/oeqa/sdk/cases/buildgalculator.py |  4 ++--
 meta/lib/oeqa/sdk/cases/buildlzip.py       |  4 ++--
 meta/lib/oeqa/sdk/cases/gcc.py             |  4 ++--
 meta/lib/oeqa/sdk/context.py               | 29 +++++++++++++++++++++--------
 4 files changed, 27 insertions(+), 14 deletions(-)

-- 
1.9.1


