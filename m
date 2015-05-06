Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D29FD73D90
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:52:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2015 07:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,379,1427785200"; d="scan'208";a="724674992"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2015 07:52:16 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 14:52:15 +0000
Message-Id: <cover.1430923708.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Add support to handle INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Wed, 06 May 2015 14:52:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next changes are to add support for handle INCOMPATIBLE_LICENSE in 
manifest creation, in order to do it the license_create_manifest was 
reimplemented in python and also added some tweaks for save disk space
during build.

The following changes since commit b2b59b14ecfe13ba794d92f97d1403d6503c7407:

  poky.conf: remove SVK mirror (2015-05-05 22:18:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/license-v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/license-v2

Aníbal Limón (3):
  license_class: Reimplemented manifest creation in python
  license_class: Generalize license_ok function
  license: Add support for handle INCOMPATIBLE_LICENSE in manifest    
    creation

 meta/classes/license.bbclass | 205 +++++++++++++++++++++++--------------------
 meta/lib/oe/license.py       |  84 ++++++++++++++++++
 2 files changed, 192 insertions(+), 97 deletions(-)

-- 
1.8.4.5


