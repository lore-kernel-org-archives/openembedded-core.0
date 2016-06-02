Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5783577473
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 20:23:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2016 13:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,408,1459839600"; d="scan'208";a="979746795"
Received: from ahmadjaz-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.128])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2016 13:23:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 08:22:45 +1200
Message-Id: <cover.1464898710.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/1] Fix ca-certificates-native missing dependency
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
X-List-Received-Date: Thu, 02 Jun 2016 20:23:14 -0000

The following changes since commit 6c8d1876f5a2d53fa89531e4a5f414d5d5da77be:

  distro_check.py: Don't mix tabs and spaces (2016-06-02 08:36:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/ca-certificates-native
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/ca-certificates-native

Paul Eggleton (1):
  ca-certificates: add dependency for native/nativesdk on openssl-native

 meta/recipes-support/ca-certificates/ca-certificates_20160104.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.5.5


