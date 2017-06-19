Return-Path: <yin.thong.choong@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BA68C60806
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 02:47:41 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2017 19:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,363,1493708400"; d="scan'208";a="115144361"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga005.jf.intel.com with ESMTP; 19 Jun 2017 19:47:41 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 12:36:43 -0700
Message-Id: <1497901004-140599-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: otc-pg-team@eclists.intel.com, paul.eggleton@intel.com,
	core-dev@eclists.intel.com, saul.wold@intel.com
Subject: [PATCH v3] Prompt error message on missing setting for UBI and UBIFS
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
X-List-Received-Date: Tue, 20 Jun 2017 02:47:42 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Prompt error message on missing setting in UBI and UBIFS image creation.

Choong YinThong (1):
  image_types.bbclass: Prompt error message on missing setting     in
    UBI and UBIFS

 meta/classes/image_types.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.7.4


