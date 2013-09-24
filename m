Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7AACF6CA09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 15:09:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Sep 2013 08:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,971,1371106800"; d="scan'208";a="382857685"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by orsmga001.jf.intel.com with ESMTP; 24 Sep 2013 08:09:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 08:09:56 -0700
Message-Id: <1380035398-32760-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/2] remove unused po.m4 patches
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
X-List-Received-Date: Tue, 24 Sep 2013 15:09:57 -0000

Since the po.m4 file is removed by the autotools do_configure() there
is no need to patch it anymore.

Saul Wold (2):
  texi2html: remove po.m4 patch
  wget: remove po.m4 patch

 .../texi2html/texi2html-5.0/fix_gettext_version.patch       | 13 -------------
 meta/recipes-extended/wget/wget-1.14/fix_makefile.patch     | 13 -------------
 2 files changed, 26 deletions(-)

-- 
1.8.3.1


