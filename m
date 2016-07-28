Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 14420606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 23:17:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jul 2016 16:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="1003825001"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2016 16:17:00 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 19:14:19 -0700
Message-Id: <1469672061-11406-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH RFC 0/2] Update SERIAL_CONSOLES_CHECK to allow aliasing
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
X-List-Received-Date: Wed, 27 Jul 2016 23:17:02 -0000

This patch set fixes the corner case described in [YOCTO #9440] and
updates its documentation. I am a bit concerned with how I handled
things, though, since the documentation was a ways off on how the
variable worked in the first place. I'm not sure if the proper thing to
do is update the docs to fit the functionality or update the
functionality to fit what the docs have been claiming. I'm also not sure
if I described the current functionality adequetly, so a look over this
and some feedback would be appreciated.

Thanks,
Cal Sullivan

California Sullivan (2):
  sysvinit-inittab_2.88dsf.bb: Allow aliasing with SERIAL_CONSOLES_CHECK
  documentation/ref-manual: Update SERIAL_CONSOLES_CHECK description

 documentation/ref-manual/ref-variables.xml             | 12 ++++++++----
 meta/conf/documentation.conf                           |  2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb |  7 +++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.5.5


