Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A2D446C490
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:27:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2018 07:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,257,1539673200"; d="scan'208";a="87365211"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.31.112])
	by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2018 07:27:22 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 16:27:01 +0100
Message-Id: <20181120152704.71151-1-raphael.kubo.da.costa@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [rocko][PATCH 0/3] elfutils: Backport gcc alignment error fix
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
X-List-Received-Date: Tue, 20 Nov 2018 15:27:21 -0000
Content-Transfer-Encoding: 8bit

This became a patch series because there are two intermediate commits that
were not part of rocko but are needed for a painless cherry-pick of the
commit I'm really interested in.

Without these commits, I am unable to build elfutils-native on Fedora 29.



