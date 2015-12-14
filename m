Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9424073182
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 23:05:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 14 Dec 2015 14:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,429,1444719600"; d="scan'208";a="841133910"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.48])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2015 14:56:08 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 16:57:07 -0600
Message-Id: <1450133829-17751-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, Nathan_Lynch@mentor.com
Subject: [PATCHv2 0/2] ptest-runner 2.0
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
X-List-Received-Date: Mon, 14 Dec 2015 23:05:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This v2 fixes default timeout to 5minutes also add support for wait indefinitely
when specify -1 in timeout option.

The changes can be reviewed at,

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/ptest-runner

Aníbal Limón (2):
  ptest-runner: Add version 2.0 re-implementation in python.
  ptest-runner: Add a recipe for install ptest-runner 2.0.

 .../ptest-runner/files/ptest-runner_2.0.py         | 162 +++++++++++++++++++++
 .../ptest-runner/ptest-runner_2.0.bb               |  28 ++++
 2 files changed, 190 insertions(+)
 create mode 100755 meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb

-- 
2.1.4


