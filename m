Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6BF978217
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:08:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 02:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="97846320"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 14 Jun 2017 02:08:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DD6D45804B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 02:08:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:07:03 +0300
Message-Id: <cover.1497430965.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] 11372: allow to set varflags in image_* classes
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
X-List-Received-Date: Wed, 14 Jun 2017 09:08:30 -0000

Hi,

This patchset fixes Bug 11372 - image.bbclass forces some flags for do_image_X tasks
by replacing setVarFlag calls with appendVarFlag for prefuncs, postfuncs and subimages
flags. This should allow to modify these flags in image_* classes.

The patchset contains a little bit of code cleanup and a small fix for setting
vardeps flag.

The following changes since commit 7aae19322ad34fa471550b70e223a702449320a2:

  buildhistory-diff: exclude paths from the output (2017-06-13 17:28:07 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (3):
  image.bbclass: cleanup: add new variable "task"
  image.bbclass: improve setup of flags
  image.bbclass: fix setting of vardeps flag

 meta/classes/image.bbclass | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

--
Regards,
Ed


