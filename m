Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QPNbJ-0007EQ-El
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:34:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2011 16:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,270,1304319600"; 
   d="scan'208";a="7714045"
Received: from unknown (HELO [10.255.12.84]) ([10.255.12.84])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 16:30:46 -0700
Message-ID: <4DDD9125.7020602@intel.com>
Date: Wed, 25 May 2011 16:30:45 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] license.bbclass: Fixing X-MIT SPDX license mapping
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2011 23:34:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


MIT-X mapped to the incorrect license.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
  meta/classes/license.bbclass |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 988c682..6a2998a 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -41,7 +41,7 @@ SPDXLICENSEMAP[MPLv1] = "MPL-1"
  SPDXLICENSEMAP[MPLv1.1] = "MPL-1"

  #MIT variations
-SPDXLICENSEMAP[MIT-X] = "MPL-1"
+SPDXLICENSEMAP[MIT-X] = "MIT"

  #Openssl variations
  SPDXLICENSEMAP[openssl] = "Openssl"
-- 
1.7.1


