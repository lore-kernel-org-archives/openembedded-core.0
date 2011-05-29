Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QQTsp-0001T1-NY
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 02:29:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 May 2011 17:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,287,1304319600"; 
   d="scan'208";a="9008205"
Received: from unknown (HELO [10.255.13.47]) ([10.255.13.47])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2011 17:26:24 -0700
Message-ID: <4DE192AF.2040103@intel.com>
Date: Sat, 28 May 2011 17:26:23 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] license.bbclass: Fix for infinite recursion and bad license_type
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
X-List-Received-Date: Sun, 29 May 2011 00:29:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


- Fixing LicenseVisitor so it forks at a BitOr instead of infinitely checking the node.
- Fixing the bad license_type syntax by lstriping it so it's valid python.
- Moved the bb.warn that we're using a SPDXLICENSEMAP to a note.

The following changes since commit 1169f1b066d0028bd2ef7915440450bd42ef165e:

   license.bbclass: Sane Parsing of licenses (2011-05-27 23:36:24 +0100)

are available in the git repository at:
   git://git.pokylinux.org/poky-contrib eflanagan/common-licenses
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/common-licenses

Beth Flanagan (1):
   license.bbclass: Infinite recursion of or nodes

  meta/classes/license.bbclass |   15 ++++++++-------
  1 files changed, 8 insertions(+), 7 deletions(-)


