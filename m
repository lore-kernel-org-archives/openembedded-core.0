Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 51D4C71A92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:27:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1148906300"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2017 06:27:55 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 84AD06A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:27:39 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:27:47 +0000
Message-Id: <cover.1495027402.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/2] fix create-pull-request
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
X-List-Received-Date: Wed, 17 May 2017 13:27:55 -0000

Hi,

Reverted previous patch as it breaks the script if used without '-t'.
Replaced its functionality with more generic approach: -- <format-patch options>

The following changes since commit 324f7993e6dfc3b2c7849aee6c525605cc19f223:

  isoimage-isohybrid: don't use TRANSLATED_TARGET_ARCH (2017-05-17 13:21:34 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (2):
  Revert "create-pull-request: add "-t in-reply-to" option"
  create-pull-request: support format-patch options

 scripts/create-pull-request | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

--
Regards,
Ed


