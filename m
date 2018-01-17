Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49E58601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:46:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0H5kejf001678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 21:46:40 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 16 Jan 2018 21:46:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 13:44:17 +0800
Message-ID: <cover.1516167783.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] features_backfill: fix for multilib
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
X-List-Received-Date: Wed, 17 Jan 2018 05:46:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
Rebase the patch

--
The following changes since commit d7cf7d6d032158690d6503ddc2c20bc5cd614264:

  bitbake: bitbake-user-manual: Removed stray parenthesis (2018-01-16 20:38:58 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_feature_backfill_180117_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_feature_backfill_180117_0

Jackie Huang (1):
  features_backfill: fix for multilib

 meta/classes/multilib.bbclass | 4 ++++
 meta/lib/oe/utils.py          | 9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.11.0


