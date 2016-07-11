Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0293260797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:17:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6BFHafP009045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:17:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jul 2016 08:17:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2016 08:17:30 -0700
Message-ID: <cover.1468249600.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/6] packagefeed-stability: add class to help reduce package feed churn
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
X-List-Received-Date: Mon, 11 Jul 2016 15:17:37 -0000
Content-Type: text/plain

* This work is based on Paul's packagefeed-stability, thanks Paul. It is
  aimed for reducing PR bumps for binary packages when use PRServer. 
* It works well for rpm:
  - Afer bumped rpm-native's PR and rebuild world, less than 20 recipes'
    Packages bumped PR, they are because of pseudo, I had sent email
    before:
    http://lists.openembedded.org/pipermail/openembedded-core/2016-July/123511.html
  - When elf files are rebuilt, it will bump the PR.

* I've sent build-compare' patches to upstream.

TODO:
* pkg-diff.sh can't work well with ipk or deb, we need work with upstream
  to make them work as better as rpm.

// Robert

The following changes since commit b17f91ed06a604e3d356fe17756bfe2ca61594b7:

  tune-ppce500mc.inc: pass -mcpu=e500mc for ppce500mc kernel compile (2016-07-10 14:12:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/feed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/feed

Paul Eggleton (1):
  packagefeed-stability: add class to help reduce package feed churn

Robert Yang (5):
  rpm: make --nosignature work
  build-compare: remove space at head
  build-compare: make pkg-diff.sh 75% faster
  packagefeed-stability.bbclass: minor fixes
  packagefeed-stability.bbclass: copy all packages of a recipe

 meta/classes/packagefeed-stability.bbclass         | 239 ++++++++++++++
 .../build-compare/build-compare_git.bb             |   2 +
 .../files/functions.sh-remove-space-at-head.patch  |  41 +++
 ...nctions.sh-run-rpm-once-to-make-it-faster.patch | 361 +++++++++++++++++++++
 ...0001-system.h-query.c-support-nosignature.patch |  64 ++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   1 +
 6 files changed, 708 insertions(+)
 create mode 100644 meta/classes/packagefeed-stability.bbclass
 create mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-run-rpm-once-to-make-it-faster.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch

-- 
2.9.0


