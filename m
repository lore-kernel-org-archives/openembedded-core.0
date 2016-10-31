Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 684656007A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 13:40:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 31 Oct 2016 06:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,575,1473145200"; d="scan'208";a="185894900"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 31 Oct 2016 06:40:15 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6C87D6A4080;
	Mon, 31 Oct 2016 06:39:38 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 15:40:05 +0200
Message-Id: <cover.1477914497.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Recipe bug fixes
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
X-List-Received-Date: Mon, 31 Oct 2016 13:40:13 -0000

avahi,distcc: Don't remove users/groups on postrm
e2fsprogs: Fix a build issue noticed on autobuilder

Thanks,
 Jussi


The following changes since commit 927ed6cbefbaea2905919e158ceda9546e3e710e:

  maintainers.inc: remove SGML recipes (2016-10-28 16:32:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/fixes

Jussi Kukkonen (3):
  e2fsprogs: Depend on attr
  avahi: Don't remove users/groups in postrm
  distcc: Don't remove users/groups in postrm

 meta/recipes-connectivity/avahi/avahi.inc     | 10 ----------
 meta/recipes-devtools/distcc/distcc_3.2.bb    |  4 ----
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 3 files changed, 1 insertion(+), 15 deletions(-)

-- 
2.1.4


