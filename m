Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD7E78704
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:15:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1M9FWTG021848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:15:32 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 22 Feb 2018 01:15:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 17:19:41 +0800
Message-ID: <cover.1519291029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2 V2] Packages upgrade
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
X-List-Received-Date: Thu, 22 Feb 2018 09:15:31 -0000
Content-Type: text/plain

* V2:
  * Merge time.inc into time_1.8.bb
  * Sent time_1.7.bb to meta-gplv2
  * Drop nfs-utils upgrading since it can't be built with musl, and I can't
    fix it atm.
  * Drop already merged recipe ccache.

* V1:
  Initial version

// Robert

The following changes since commit 709b60a5e34a22aadb6dca7b888c010de8e6e4a4:

  documentation.conf: Remove references to tasks which were removed (2018-02-20 22:21:35 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (2):
  git: 2.15.0 -> 2.16.1
  time: 1.7 -> 1.8

 meta/recipes-devtools/git/git.inc                  |    2 +
 meta/recipes-devtools/git/git_2.15.0.bb            |   11 -
 meta/recipes-devtools/git/git_2.16.1.bb            |   11 +
 meta/recipes-extended/time/time-1.7/debian.patch   | 1301 --------------------
 meta/recipes-extended/time/time_1.7.bb             |   11 -
 .../time/{time.inc => time_1.8.bb}                 |   11 +-
 6 files changed, 22 insertions(+), 1325 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.15.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.16.1.bb
 delete mode 100644 meta/recipes-extended/time/time-1.7/debian.patch
 delete mode 100644 meta/recipes-extended/time/time_1.7.bb
 rename meta/recipes-extended/time/{time.inc => time_1.8.bb} (53%)

-- 
2.7.4


