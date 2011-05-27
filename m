Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QQ5Lu-0008SZ-TK
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 00:17:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 May 2011 15:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,282,1304319600"; 
   d="scan'208";a="6034718"
Received: from eflanaga-mobl.jf.intel.com (HELO [10.7.198.66]) ([10.7.198.66])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2011 15:13:44 -0700
Message-ID: <4DE02216.1010003@intel.com>
Date: Fri, 27 May 2011 15:13:42 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1][v3] license.bbclass parsing changes rebased sans debug
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
X-List-Received-Date: Fri, 27 May 2011 22:17:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Using python abstract syntax trees as a parser and an ast visitor class, I've
begun the first steps to being able to put some sanity to license selection.

One note. License modifiers have traditionally been limited to the "or greater"
modifier "+". I've added another modifier "with exceptions" for licenses that
have no generic ie common-licenses/GPL-2,0-with-GCC-exception

The following changes since commit 62e3f0ff7b27d8beb21b4b226051c3db654ea4e4:

   License Field Cleanup: Non-standard field names (2011-05-27 18:27:22 +0100)

are available in the git repository at:
   git://git.pokylinux.org/poky-contrib eflanagan/common-licenses
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/common-licenses

Beth Flanagan (1):
   license.bbclass: Sane Parsing of licenses

  meta/classes/license.bbclass |  152 +++++++++++++++++++++++++++++++-----------
  1 files changed, 114 insertions(+), 38 deletions(-)



