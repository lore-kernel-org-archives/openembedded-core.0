Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7BEC6FF25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U7NDYm006290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:23:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:23:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:23:08 -0700
Message-ID: <cover.1459322435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] V2 Remove bootimg.bbclass and boot-directdisk.bbclass
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
X-List-Received-Date: Wed, 30 Mar 2016 07:23:15 -0000
Content-Type: text/plain

* V2:
  - populate() -> populate_kernel()
  - Put the common code in live-vm-common.bbclass rather than image.bbclass.
  - Remove invalid code in image-vm.bbclass

// Robert

The following changes since commit b3f80743cd1b9a15a8ee4d20c2a54c2f6cbcd13c:

  gcc: Backport fixes for musl ssp configuration (2016-03-29 23:19:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 95c58580b5700d138d32ba21cb1e488296ff5282
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=95c58580b5700d138d32ba21cb1e488296ff5282

Robert Yang (4):
  boot-directdisk.bbclass: merge it into image-vm.bbclass
  bootimg.bbclass: merge it into image-live.bbclass
  image-live.bbclass/image-vm.bbclass: remove duplicated code
  image-vm.bbclass: remove invalid code

 meta/classes/boot-directdisk.bbclass | 190 ----------------------
 meta/classes/bootimg.bbclass         | 304 -----------------------------------
 meta/classes/gummiboot.bbclass       |   2 +-
 meta/classes/image-live.bbclass      | 268 +++++++++++++++++++++++++++++-
 meta/classes/image-vm.bbclass        | 162 ++++++++++++++++---
 meta/classes/image.bbclass           |  12 --
 meta/classes/live-vm-common.bbclass  |  58 +++++++
 7 files changed, 465 insertions(+), 531 deletions(-)
 delete mode 100644 meta/classes/boot-directdisk.bbclass
 delete mode 100644 meta/classes/bootimg.bbclass
 create mode 100644 meta/classes/live-vm-common.bbclass

-- 
2.7.4


