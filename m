Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0188277D03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:46:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 07:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171152215"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 07:46:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A67D05804B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:46:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 17:34:22 +0300
Message-Id: <cover.1499783283.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] runqemu: rework of exception handling
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
X-List-Received-Date: Tue, 11 Jul 2017 14:46:58 -0000

Hi,

Reorganized exception handling code in a way that script raises RunQemuError
for all known errors. runqemu will not produce tracebacks for known errors.
It will only print error messages, which is hopefully more user friendly than
current approach.

Fixed 11719 - Unneeded stack trace is printed when ruunqemu fails

The following changes since commit 05e28a9c3462c8987a44e534bc6d08d26b4c41fb:

  imagefutures: add test_image_fstypes test case (2017-07-10 14:14:37 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (2):
  runqemu: reworked exception handling
  runqemu: check exit code of 'ls -t'

 scripts/runqemu | 118 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 60 insertions(+), 58 deletions(-)

--
Regards,
Ed

