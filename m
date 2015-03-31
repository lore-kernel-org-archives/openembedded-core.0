Return-Path: <elizabeth.flanagan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 70B4D6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:11:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 31 Mar 2015 13:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,503,1422950400"; d="scan'208";a="688479654"
Received: from hsolver-mobl.ger.corp.intel.com (HELO fuath.ger.corp.intel.com)
	([10.252.22.169])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2015 13:11:33 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Mar 2015 21:11:03 +0100
Message-Id: <cover.1427832505.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] distrodata.bbclass/distro_check.py: Fix PN mapping
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
X-List-Received-Date: Tue, 31 Mar 2015 20:11:37 -0000

Last night while running distrodata, I noticed some incorrect results that had
to do with how we were trying to get the mapping to the base PN name of
packages.

Part of this is due to how distrodata was splitting PNs to remove nativesdk-,
cross-, crosssdk-, etc. This occurred on packages that had the need to strip out
multiple of these strings (nativesdk-cross- for example).

The first patch ensures that in these cases we grab the distrodate from
the base PN.

The final two patches support -dummy and buildtools- packages, so that they 
also map.

Beth Flanagan (3):
  distrodata.bbclass/distro_check.py: Fix splits
  distrodata.bbclass/distro_check.py: Support -dummy mapping of PN
  distrodata.bbclass/distro_check.py: Support buildtools PN mapping

 meta/classes/distrodata.bbclass | 127 ++++++++++++++++++++++------------------
 meta/lib/oe/distro_check.py     |  54 +++++++++--------
 2 files changed, 98 insertions(+), 83 deletions(-)

-- 
1.9.1

-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


