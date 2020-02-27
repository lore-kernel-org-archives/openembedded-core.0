Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1496D61141
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:06:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2020 16:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="256519650"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 16:06:12 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 16:05:59 -0800
Message-Id: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade accessibility (a11y) atk packages
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
X-List-Received-Date: Thu, 27 Feb 2020 00:06:12 -0000
Content-Transfer-Encoding: 8bit

This series updates to the latest stable (even) release of the
accessibility (a11y) toolkit and related. These are one of the
ways we can automated GUI testing in gtk and Qt applications.

One notable improvement in this release is that accessibility
is launched automatically in a GUI environment.

Tested on core-image-sato-sdk for qemux86_64 and qemux86-musl.

[PATCH 1/4] atk: upgrade 2.32.0 -> 2.34.1
[PATCH 2/4] at-spi2-core: upgrade 2.32.1 -> 2.34.0
[PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
[PATCH 4/4] maintainers.inc: add self for atk, at-spi2-core,


