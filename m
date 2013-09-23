Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ED983610D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 18:31:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Sep 2013 11:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,964,1371106800"; d="scan'208";a="405975705"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2013 11:31:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 11:31:53 -0700
Message-Id: <1379961116-29929-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] Fix patches including po.m4
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
X-List-Received-Date: Mon, 23 Sep 2013 18:32:00 -0000

This series fixes a patching issue I saw recently, it seems to occur
when you have an already configured ${S}, which causes the po.m4 to
be removed.  Since the autotools.bbclass removed the bad version of po.m4
let's just remove the patches for them here also

Saul Wold (3):
  texi2html: remove po.m4 patch
  wget: remove po.m4 patch
  gnutls: remove po.m4 patch

 .../texi2html/texi2html-5.0/fix_gettext_version.patch       | 13 -------------
 meta/recipes-extended/wget/wget-1.14/fix_makefile.patch     | 13 -------------
 .../recipes-support/gnutls/gnutls/fix-gettext-version.patch | 13 -------------
 3 files changed, 39 deletions(-)

-- 
1.8.3.1


