Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QQ58b-0008EL-Hr
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 00:04:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2011 14:59:58 -0700
X-ExtLoop1: 1
Received: from eflanaga-mobl.jf.intel.com (HELO [10.7.198.66]) ([10.7.198.66])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2011 14:59:58 -0700
Message-ID: <4DE01EDC.60107@intel.com>
Date: Fri, 27 May 2011 14:59:56 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1][v2] license.bbclass parsing changes rebased
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
X-List-Received-Date: Fri, 27 May 2011 22:04:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Using python abstract syntax trees as a parser and an ast visitor class, I've
begun the first steps to being able to put some sanity to license selection.

One note. License modifiers have traditionally been limited to the "or greater"
modifier "+". I've added another modifier "with exceptions" for licenses that
have no generic ie common-licenses/GPL-2,0-with-GCC-exception

The modifiers are ignored for now, but I'll be looking at the logic for them
next.

The following changes since commit 62e3f0ff7b27d8beb21b4b226051c3db654ea4e4:

   License Field Cleanup: Non-standard field names (2011-05-27 18:27:22 +0100)

are available in the git repository at:
   git://git.pokylinux.org/poky-contrib eflanagan/common-licenses
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/common-licenses

Beth Flanagan (1):
   license.bbclass: Sane Parsing of licenses

  meta/classes/license.bbclass |  155 +++++++++++++++++++++++++++++++----------
  1 files changed, 117 insertions(+), 38 deletions(-)


