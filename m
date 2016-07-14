Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 227876067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 13:36:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 06:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,362,1464678000"; d="scan'208";a="995194026"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.42.195])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 06:36:38 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 14:36:31 +0100
Message-Id: <cover.1468503047.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC PATCH v2 0/1] Add mechanism to run QA checks on the image once it's built
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
X-List-Received-Date: Thu, 14 Jul 2016 13:36:39 -0000

Here's v2 of a patch to add a mechanism to call a series of functions to
validate a constructed image.

Changes since v1:
* support shell functions
* don't abuse NotImplementedError

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit b17f91ed06a604e3d356fe17756bfe2ca61594b7:

  tune-ppce500mc.inc: pass -mcpu=e500mc for ppce500mc kernel compile (2016-07-10 14:12:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/imageqa
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/imageqa

Joshua Lock (1):
  image: add do_image_qa task to run QA checks on the constructed image

 meta/classes/image.bbclass | 30 ++++++++++++++++++++++++++++++
 meta/lib/oe/utils.py       | 13 +++++++++++++
 2 files changed, 43 insertions(+)

--
2.7.4

