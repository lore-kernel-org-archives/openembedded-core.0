Return-Path: <brian.avery@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 970F8719E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 00:22:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 05 Oct 2016 17:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,451,1473145200"; d="scan'208";a="16729329"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga005.jf.intel.com with ESMTP; 05 Oct 2016 17:22:12 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 17:23:37 -0700
Message-Id: <cover.1475713184.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] yocto-uninative: allow URL override
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
X-List-Received-Date: Thu, 06 Oct 2016 00:22:14 -0000

This changes the
UNINATIVE_URL =
to a
UNINATIVE_URL ?=

so we can override it in the local.conf file.  This matches the form of the CHECKSUMS and is useful
in the case that you have a special uninative or can't reach downloads.yoctoproject.org.

-bavery

The following changes since commit 4189a1977e65f71ddb8fc0498bcef91754c673d8:

  bitbake: toaster: add Font Awesome license (2016-10-05 10:28:53 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/uninative-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/uninative-oe

bavery (1):
  uninative:  users can override download site

 conf/distro/include/yocto-uninative.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
1.9.1

