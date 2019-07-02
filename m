Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AE3FC7E94C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 02:36:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 19:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,441,1557212400"; d="scan'208";a="163872269"
Received: from jsun24-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.151.80])
	by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2019 19:36:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 14:35:54 +1200
Message-Id: <cover.1562034933.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libcap-ng: do not use symlink to share files with libcap-ng-python
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
X-List-Received-Date: Tue, 02 Jul 2019 02:36:10 -0000
Content-Transfer-Encoding: 8bit

The following changes since commit 1f8a73261c7a134821c40845da27d8edbb0763b6:

  Revert "pigz: Add debug for autobuilder errors" (2019-06-30 23:33:12 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/libcap-ng-symlink-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/libcap-ng-symlink-fix

Paul Eggleton (1):
  libcap-ng: do not use symlink to share files with libcap-ng-python

 meta/recipes-support/libcap-ng/libcap-ng                        | 1 -
 meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb        | 2 ++
 .../libcap-ng/{libcap-ng-python => libcap-ng}/python.patch      | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 delete mode 120000 meta/recipes-support/libcap-ng/libcap-ng
 rename meta/recipes-support/libcap-ng/{libcap-ng-python => libcap-ng}/python.patch (100%)

-- 
2.20.1


