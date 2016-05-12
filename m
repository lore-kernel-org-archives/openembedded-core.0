Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 036B16057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 12:06:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2016 05:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="951742619"
Received: from jxu11-mobl2.amr.corp.intel.com (HELO
	jlock-mobl2.ger.corp.intel.com) ([10.255.3.247])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2016 05:06:48 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 13:06:33 +0100
Message-Id: <cover.1463054447.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [fido][PATCH 0/1] Undo ABI breakage in OpenSSL
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
X-List-Received-Date: Thu, 12 May 2016 12:06:48 -0000

The backported upgrade to OpenSSL 1.0.2h introduced a newer version of
Debian's linker version-script which breaks the OpenSSL ABI.
This isn't desirable for a stable release, thus the attached patch reverts
the linker-version changes and simply adds the 2 new symbols required by
1.0.2h.

Thanks to Martin Jansa for spotting the issue and suggesting a fix.

The following changes since commit e7c46ce3e59cb4fd770e76ae006c0166d0dd5265:

  build-appliance-image: Update to fido head revision (2016-05-11 18:00:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Joshua Lock (1):
  openssl: prevent ABI break from earlier fido releases

 .../openssl/debian1.0.2/version-script.patch       | 31 +++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

-- 
2.5.5


