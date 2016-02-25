Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EFC6677338
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:29:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2016 06:29:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="911117093"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2016 06:29:48 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:29:46 +0200
Message-Id: <1456410587-7337-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH v2] Improve externalsrc task dependency tracking
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
X-List-Received-Date: Thu, 25 Feb 2016 14:29:50 -0000

This refines the first version of the patch by utilizing (or abusing) inline
Python variable expansion: if the source tree is a git repository the python
function uses a custom git index file to track any changes in the source tree
and only returns this one index file for bitbake to hash. If the source tree is
not a git repository it works like the first version of this patch: all files
in the source tree are added as a task dependency (and thus hashed by bitbake).

[YOCTO #8853]

The following changes since commit 205b446f3fc4a9885179a66a8dab9d81bcc63dca:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/fixes


Markus Lehtonen (1):
  externalsrc.bbclas: remove nostamp from do_configure

 meta/classes/externalsrc.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

-- 
2.6.2


