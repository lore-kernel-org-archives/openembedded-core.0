Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9BC7857D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:55:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 11:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,398,1511856000"; d="scan'208";a="13241387"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.255.228.22])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2018 11:56:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 22 Jan 2018 11:55:52 -0800
Message-Id: <20180122195554.13809-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 0/2 v2] Add f2fs support
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
X-List-Received-Date: Mon, 22 Jan 2018 19:55:59 -0000

This second series adds a patch to disable the testing f2fs as
part of the image features testing.  The ordering is important
since we want to disable the test and then enable the functionality.

Sau!



Saul Wold (2):
  imagefeatures: disable f2fs from test_image_features by default
  image_types: add support for modern f2fs flash filesystem

 meta/classes/image_types.bbclass              | 20 ++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.14.3


