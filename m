Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACF770E45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:43:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7T8hke7013660
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:43:46 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 01:43:45 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 16:38:35 +0800
Message-ID: <cover.1409301362.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] perf: add libunwind support
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
X-List-Received-Date: Fri, 29 Aug 2014 08:43:46 -0000
Content-Type: text/plain

The following changes since commit 669c07d6022174d01fe5a95b7b0faa9ef86da1e2:

  bitbake: build/data: Write out more complete python run files (2014-08-28 15:12:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/libunwind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libunwind

Chong Lu (2):
  libunwind: add recipes
  perf: add libunwind support

 meta/recipes-kernel/perf/perf-features.inc      |  2 +-
 meta/recipes-kernel/perf/perf.bb                |  5 ++++-
 meta/recipes-support/libunwind/libunwind.inc    | 30 +++++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb |  4 ++++
 4 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libunwind/libunwind.inc
 create mode 100644 meta/recipes-support/libunwind/libunwind_1.1.bb

-- 
1.9.1


