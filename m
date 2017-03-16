Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A85BB60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655390; x=1521191390; h=from:to:subject:date:message-id;
	bh=IqX9dcmtAZPH2EdP5mcsobHyJoUgBxVQ0Bq+QUhmjSU=;
	b=RGnl1Uey4EUl1/gxcPl9vg84c38WF0WmxjL4ORg/6fWbMl+6BA1la7GE
	sbB6+Y+RSRbO0EaNzUXQVIuzBP3u/g==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="236881400"
Received: from klim10-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.172.61])
	by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2017 02:09:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 22:09:41 +1300
Message-Id: <cover.1489655348.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/2] A couple of minor fixes
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
X-List-Received-Date: Thu, 16 Mar 2017 09:09:49 -0000

The following changes since commit 477805b913a6c4b4b630e42f08cd9e59f1e4e254:

  wic: selftest: account for occasional newline in debugfs file names (2017-03-14 14:39:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/fixes1

Paul Eggleton (2):
  classes/base: reformat HOSTTOOLS error
  packagegroup-core-lsb: avoid rebuilding when changing layer config

 meta/classes/base.bbclass                                    | 2 +-
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.9.3


