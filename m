Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E3F8873DF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:38:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2015 14:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="545648668"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 14:38:22 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 22:38:19 +0100
Message-Id: <1440106702-23272-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH V2 0/3] Better defaults for extensible toolchain extraction and checks for invalid paths
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
X-List-Received-Date: Thu, 20 Aug 2015 21:38:23 -0000

You can now set SDKEXTPATH which will change the default extensible SDK install
path, as feedback from Christopher and change the error message as suggest by
Randy.


