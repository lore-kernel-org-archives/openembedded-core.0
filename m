Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6EB6FFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:30:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 29 Feb 2016 08:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="56897921"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.185])
	by fmsmga004.fm.intel.com with ESMTP; 29 Feb 2016 08:30:25 -0800
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 18:37:14 +0200
Message-Id: <1456763835-21515-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v3 0/1] libarchive: Set xattrs after setting times
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
X-List-Received-Date: Mon, 29 Feb 2016 16:30:27 -0000

Sorry, I misred patch header as commit message: fixed the header to contain the tag lines.

Dmitry Rozhkov (1):
  libarchive: Set xattrs after setting times

 .../0001-Set-xattrs-after-setting-times.patch      | 59 ++++++++++++++++++++++
 .../libarchive/libarchive_3.1.2.bb                 |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch

-- 
2.5.0


