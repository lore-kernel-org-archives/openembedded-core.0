Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C5E8C719C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 14:47:32 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 07:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="97069091"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.140.209])
	by orsmga005.jf.intel.com with ESMTP; 08 May 2017 07:47:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  8 May 2017 22:47:22 +0800
Message-Id: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] Packages updates
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
X-List-Received-Date: Mon, 08 May 2017 14:47:32 -0000

Ross, Richard:

Here is a small set of tested package updates

Sau!

Chin Huat Ang (1):
  nspr: upgrade recipe to version 4.14

Choong YinThong (1):
  gnupg: upgrade from 2.1.18 to 2.1.20

Gan, Yau Wai (1):
  mc: Upgrade from 4.8.18 to 4.8.19

Yeoh Ee Peng (1):
  man-pages: upgrade from 4.09 to 4.10

 .../man-pages/{man-pages_4.09.bb => man-pages_4.10.bb}                | 4 ++--
 meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb}               | 4 ++--
 meta/recipes-support/gnupg/{gnupg_2.1.18.bb => gnupg_2.1.20.bb}       | 4 ++--
 meta/recipes-support/nspr/{nspr_4.13.1.bb => nspr_4.14.bb}            | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.09.bb => man-pages_4.10.bb} (86%)
 rename meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb} (94%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.18.bb => gnupg_2.1.20.bb} (90%)
 rename meta/recipes-support/nspr/{nspr_4.13.1.bb => nspr_4.14.bb} (96%)

-- 
2.7.4


